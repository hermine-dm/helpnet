# Shine README

## The Project

The SLA, well known by the name of charcot disease, is among all rare sicknesses the more common one...

Just in France charcot disease is responsible of :
- 3 new diagnostics per day
- 6 000 persons are living with this unhealing disease
- 1 200 death per year

We've created a webapp that gathers patients, their friends, family and companions. Also associations that can help, write articles and gather people around events to fight all together around illness. 

## How does it work

This app is run on rails 5.2.4 and ruby 2.5.1

Check the Gemfile for more. 

### For locals only : 
Clone the repository : 
```
git clone https://github.com/hermine-dm/helpnet/
```
Install gems and versions : 
```
bundle install
```
Create the PostgreSQL Database : 
```
rails db:create
```
You're not a Zebra but I know you're always up for some nice migrations : 
```
rails db:migrate
```
Fullfill the database (this will send a lot of emails - you can comment them in user model and article model) : 
```
rails db:seed
```
Now you can run your server for locals only : 
```
rails s
```
Enjoy and peace out man ! 

### In production
Yes, you're right it's a hard work to make it work on your local machine, that why it's for locals only. We have a solution for you...guess what it's also available online using Heroku.

Go on https://helpnet-prod.herokuapp.com

### Technical stuff

Models :
- a user Model
- an organization Model
- an article Model
- an events Model
- an all the models that are needed for the relations between join table, admin... (11 in total - what a big number mate).

The forum and all private messages are generated by the thredded gem.

## Access

Acces user : You can access create an account or sign_in to the association admin user above : 
- justine56@yopmail.com for Espoir SLA charity
- manon42@yopmail.com  for Esopir Charcot charity
- noa45@yopmail.com for Momome Extreme charity
- lou8@yopmail.com for ARSLA charity


Accès admin :

Login : admin_shine@yopmail.com 
mdp : password

With the admin access you have an overview dashboard, you can edit and delete associations/users/messages and many other objects.

## Team

This website is made in 2 weeks with love by a team of students at The Hacking Project for their final project. 
The team include : 
- Hermine S. De Menthière, ajax and back-end magician
- Jordan Pedro, front-end genius
- Philippe Gatti, who know's that even grand-pa can became a magnificent back-end architect ? 
- Benjamin Bertrand, README lover

Enjoy ! 

