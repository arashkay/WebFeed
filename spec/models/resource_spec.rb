describe Resource do
  
  describe '.expired' do
    it 'includes resources checked with time gap more than frequency time' do
      resource = Resource.create! :url => 'http://techcrunch.com/feed/', :name => 'Tech Crunch', :frequency => 3.hours/60, :checked_at => DateTime.now-3.hours-5.minutes
      Resource.expired.should eq([resource])
    end

    it 'excludes resources checked recently with time gap less than frequency time' do
      resource = Resource.create! :url => 'http://techcrunch.com/feed/', :name => 'Tech Crunch', :frequency => 3.hours/60, :checked_at => DateTime.now-3.hours+5.minutes
      Resource.expired.should be_empty
    end
  end

end
