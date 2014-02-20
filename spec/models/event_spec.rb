require 'spec_helper'

describe Event do
  
  it 'is valid' do 
    event = create(:event)
    expect(event).to be_valid
  end

  it 'does not convert date before save' do 
    event = build(:event_date)
    expect(event.time).to eq("2014-05-04 00:00:00")
  end

  it 'converts date' do 
    event = create(:event_date)
    expect(event.time).to eq("05-04-2014") 
  end
end
