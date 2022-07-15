# README

* Ruby version :- ruby-2.7.1
* Database :- postgres
* Rails Version :- rails 6


Steps for Project setup :-

1) Take Clone
2) Install ruby-2.7.1 and use it
3) Run bundle by :- bundle install
4) config database.yml file and run following commands
	
	a) rake db:create
	b) rake db:migrate
	c) rake db:seed


5) Start the server by :- rails s


***Note*** :- "seed.rb" File will be creating all the users and there bank accounts with $1000.00 balance for each user. Then you can login by using below credentials and start your payment transaction.


List of User and their credentials :-

1) sbi@gmail.com , password is "test123", Account Number is "test00001"
2) axis@gmail.com, password is "test123", Account Number is "test00002"
3) pnb@gmail.com, password is  "test123", Account Number is "test00003"

For Login, Email and password will be needed and To send Money, Account number will be needed. 

For Testing Team Convenience, I have deployed the application on Heroku which is on below url.
 ->  https://banking-app555.herokuapp.com/payment_transactions
 
 One can directly go to above URL, Use above user's credentials and use the app. Enjoy !!
