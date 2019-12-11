require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe", name: "Johndoe", email: "test@yopmail.com", password: "password", password_confirmation: "password")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#email" do
      it "should not be valid without an email" do
        bad_user = User.create(last_name: "Doe", password: "password", password_confirmation: "password")
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
    end

    describe "#password" do
      it "should not be valid without password" do
        bad_user = User.create(last_name: "Doe", email: "test@yopmail.com")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:password)).to eq(true)
      end
    end

  end

  context "associations" do

    describe "articles" do
      it "should have_many articles" do
        article = Article.create(user: @user, title: "test", content:"coucou")
        expect(@user.articles.include?(article)).to eq(true)
      end
    end

  end



  context "public instance methods" do

    describe "#name" do

      it "should return a string" do
        expect(@user.name).to be_a(String)
      end
    end

  end




end
