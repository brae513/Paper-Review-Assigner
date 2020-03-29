# README

Link: https://shrouded-beach-66812.herokuapp.com/

This is for Ubuntu on cloud9!

How to run:

1. $ git clone https://github.com/brae513/Paper-Review-Assigner

2. Navigate to project folder: $ cd Peer-Review-Assigner/

3. $ sudo apt-get install libpq-dev

4. $ bundle install --without production

5. $ npm install --global yarn (((Go to the bottom of this readme if you have problems)))

6. $ rake db:create

7. $ rake db:migrate

8. $ rake db:seed


Run Locally:

9. $ RAILS_ENV=production rake db:create db:migrate db:seed

10. $ rake secret

11. $ export SECRET_KEY_BASE=output-of-rake-secret

12. $ rake assets:precompile (((It might look like it froze at 'sass-rails'. Just wait. It's slow.)))

13. $ RAILS_ENV=production rails s

Get it on Heroku: 

9. $ ssh-keygen -t rsa

10. $ nvm i v8

11. $ npm install -g heroku

12. $ heroku login

13. $ heroku keys:add

14. $ git init

15. $ git add .

16. $ git commit -m "first commit"

17. $ heroku create

18. $ git push heroku master

*If you can run the app locally but have errors on heroku, remember:*

$ heroku run rake db:migrate

-------------------------------------------------------------------

Initializing Cucumber test database:
1. Run after every change to database before testing:
   $ rake db:test:prepare
   
-------------------------------------------------------------------

Problems with Yarn:
1. Run update:
   $ sudo apt-get update

2. Install apt-transport-https:
   $ sudo apt-get install apt-transport-https

3. Configure the repository (from Yarn installation):
   $ curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
   $ echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

4. Run update again and install Yarn:
   $ sudo apt-get update && sudo apt-get install yarn

5. Then run:
   $ yarn install --check-files
