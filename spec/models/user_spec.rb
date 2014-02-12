require 'spec_helper'

describe User do 

  it 'is valid' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'requires an email' do 
    user = build(:user)
    user.email = nil
    expect(user).to be_invalid
  end

  it 'requires a uid' do
    user = build(:user)
    user.uid = nil
    expect(user).to be_invalid
  end

  it 'requires a provider' do 
    user = create(:user)
    expect(user).to be_valid
  end


  describe 'initialize from omniauth' do 
    let(:user) { User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:twitter]) }

    context 'when user is valid' do 
      it 'creates a valid user' do 
        expect(user).to be_valid
      end
    end

    context 'when user is invalid' do 
      it 'does not save user' do 
        new_user = User.find_or_create_from_omniauth({"uid" => "123", "info" => {}})
        expect(new_user).to be_invalid
      end
    end
  end
end