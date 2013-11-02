require 'spec_helper'

describe User do

  before do
    DatabaseCleaner.start
    User.skip_callback(:validation, :after, :hash_password)
  end

  after do
    DatabaseCleaner.clean
    User.set_callback(:validation, :after, :hash_password)
  end

  before(:each) do
    @user = User.new password: "12345678"
  end

  context "When initialize" do
    it "should be a User" do
      expect(@user).to be_a User
    end
  end

  it { should have_many :questions }

  context "before save" do
    it { should validate_presence_of :password }
    it { should ensure_length_of(:password).is_at_least(8) }
    it { should ensure_length_of(:first_name).is_at_most(60) }
    it { should validate_presence_of :first_name }
    it { should ensure_length_of(:last_name).is_at_most(50) }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :last_name }
    it { should validate_uniqueness_of :email }
    it { should ensure_length_of(:email).is_at_most(100) }
  end

  it "should provide an encrypted salt value" do

    @user.send(:generate_salt)
    expect(@user.salt).not_to be_nil
    expect(@user.salt.length).to eql(40)
  end

  it "encrypts the password" do
 
    raw_password = "12345678"
    @user.email = "ejay@onquiry.com"
    @user.password = raw_password
    @user.send(:hash_password)

    expect(@user.password.length).to eql(40)
    expect(@user.password).not_to eql(raw_password)
  end

  it "retrieve user information using valid email address" do

    @user.first_name = "Ejay"
    @user.last_name = "Canaria"
    @user.email = "ejay@onquiry.com"
    @user.password = "12345678"
    @user.save

    @authorized_user = User.find_by_email(@user.email).to_a[0]
 
    expect(@authorized_user).not_to be_nil
    expect(@authorized_user.first_name).not_to be_nil

  end
  
  it "Should encrypt raw password and matched encrypted password in the database" do
    raw_password = "12345678"
    @user.email = "ejay@onquiry.com"
    @user.password = raw_password
    @user.send(:hash_password)
    
    expect(@user.password).to eql(User.encrypt(raw_password, @user.salt))
  end
  
  it "should not retrieve user information if email address is not valid" do
    invalid_user = User.find_by_email("invalid@email.com").to_a[0]
    expect(invalid_user).to be_nil
  end

end