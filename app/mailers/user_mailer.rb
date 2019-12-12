class UserMailer < ApplicationMailer
	default from: 'no-reply-helpnet@yopmail.com'
 
  def welcome_email(user)
    @user = user 
    @url  = 'https://helpnet-dev.herokuapp.com/' 
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def new_publication_email(follower,organization,article)
  	@user=follower
  	@organization=organization
  	@article=article
  	@url_article = "https://helpnet-dev.herokuapp.com/articles/#{@article.id}"
  	@url  = 'https://helpnet-dev.herokuapp.com/' 
  	mail(to: @user.email, subject: "Nouvel article publié par #{@organization.name}")
  end
end
