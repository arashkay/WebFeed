module FeedReader
  
  require 'open-uri'
  require 'nokogiri'

  class Reader
    
    attr_accessor :list

    def initialize(uri)
      @doc = Nokogiri::XML(open(uri))
      @list = []
      @doc.css('item').each do |item|
        @list << [ item.at_css('title').text, ActionController::Base.helpers.sanitize(item.at_css('description').text,:tags=>[]), Nokogiri::HTML(item.css('description').text).at_css('img').attributes['src'].value, item.at_css('link').text ] # title, description, image, link
      end
    end

    def filter( inc_words, exc_words=[] )
      template = '\W(?)\W'
      inc = template.gsub '?', inc_words.join('|')
      exc = template.gsub '?', exc_words.join('|')
      list = []
      @list.each do |item|
        str = " #{item[0]} #{item[1]} "
        if inc_words.empty? || !(str =~ Regexp.new(inc,'i')).nil?
          if exc_words.empty? || (str =~ Regexp.new(inc,'i')).nil?
            list<<item
          end
        end
      end
      list
    end
    
  end

end
