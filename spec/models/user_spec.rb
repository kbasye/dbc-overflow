require 'spec_helper'

describe User  do



  # Authentication tests


  describe "#create" do
    let (:username) {"Gavin"}
    let (:password_digest) {"password_digest"}
    let (:email) {"kbasye@gmail.com"}
    let (:params) {{:username => username, :password_digest => password_digest, :email => email}}
    let (:user) {User.new(params)}
    subject { User.new(params) }

    # Validation tests
    it { should validate_uniqueness_of(:email) }

    it { should validate_uniqueness_of(:username) }

    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }

    it { should_not allow_value('blah!').for(:email) }
    it { should allow_value('katey@gmail.com').for(:email) }

    it "downcases email addresses" do
      saved = User.create(:username => "kbasye", :password_digest => "password_digest", :email => "GAVIN@gavin.com")
      saved.email.should eq "gavin@gavin.com"
    end

    
    it "increases user count by 1" do
      expect { user.save }.to change(User, :count).by(1)
    end


  end

  

end
