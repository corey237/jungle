require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.new(name: "John Smith", email: "jsmith@hotmail.com", password: "password123", password_confirmation: "password123")
    end
    it "Should create a valid user" do
      expect(@user).to be_valid
    end
    it "Should return an error if the name is blank" do
      @user.name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "Should return an error if the email is blank" do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "Should return an error if the password is blank" do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "Should return an error if password_confirmation is blank" do
      @user.password_confirmation = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(name: "John Smith", email: "jsmith@hotmail.com", password: "password123", password_confirmation: "password123")
    end
    it "Should login with valid email and password" do
      @user.save
      login = User.authenticate_with_credentials("jsmith@hotmail.com", "password123")
      expect(login.email).to eql('jsmith@hotmail.com')
    end
    it "Should login with valid email and password (Case insensitive)" do
      @user.save
      login = User.authenticate_with_credentials("jSmIth@HotmaIl.com", "password123")
      expect(login.email).to eql('jsmith@hotmail.com')
    end
    it "Should login with valid email and password (Remove whitespace)" do
      @user.save
      login = User.authenticate_with_credentials("    jSmIth@HotmaIl.com      ", "password123")
      expect(login.email).to eql('jsmith@hotmail.com')
    end
    it "Should produce error if password does not match record" do
      @user.save
      login = User.authenticate_with_credentials("jsmith@hotmail.com", "password123456")
      expect(login).to eql(false)
    end
    it "Should produce error if the email does not exist" do
      @user.save
      login = User.authenticate_with_credentials("jsmith@gmail.com", "password123")
      expect(login).to eql(nil)
    end
      
      
  end

end
