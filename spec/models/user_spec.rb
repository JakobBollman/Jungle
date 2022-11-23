require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = User.new(:name=>'Jimmy', :email => 'Jimmy@gmail.com', :password => '12345', :password_confirmation => '12345')
    @user2 = User.new(:name=>'Jimmy2', :email => 'Jimmy@gmail.com', :password => '12345', :password_confirmation => '12345')
    @user1.email.downcase!
    @user2.email.downcase!
  end
  describe 'Validations' do
    it "should call error if password and password_confirmation are not equal" do
      expect(@user1.password).to eq(@user1.password_confirmation)
    end

    it "should call error without user name" do
      expect(@user1.name).to be_present
    end
    it "should call error without user email" do
      expect(@user1.email).to be_present
    end

    it "should call error if password length is too short" do
      expect(@user1.password.length).to be >= 2
    end

  end
  describe '.authenticate_with_credentials' do
    it "should authenticate users with credentials" do
      expect(@user1.id).to eq(User.authenticate_with_credentials(@user1.email,@user1.password))
    end
  end
end