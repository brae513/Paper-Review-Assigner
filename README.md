# README

Link: https://infinite-harbor-68851.herokuapp.com/welcome/index

This is for Ubuntu on cloud9!

How to run:

1. $ git clone https://github.com/brae513/Paper-Review-Assigner

2. Navigate to project folder: $ cd Peer-Review-Assigner/

3. $ sudo apt-get install libpq-dev

4. $ bundle install --without production

5. $ npm install --global yarn (((Go to the bottom of this readme if you have problems)))

6. $ rake db:create

7. $ rake db:migrate

8. $ git commit -m postgres

9. $ rake db:seed


Run Locally:

10. $ RAILS_ENV=production rake db:create db:migrate db:seed

11. $ rake secret

12. $ export SECRET_KEY_BASE=output-of-rake-secret

13. $ rake assets:precompile

14. $ RAILS_ENV=production rails s

Get it on Heroku: 

10. $ ssh-keygen -t rsa

11. $ nvm i v8

12. $ npm install -g heroku

13. $ heroku login

14. $ heroku keys:add

15. $ git init

16. $ git add .

17. $ git commit -m "first commit"

18. $ heroku create

19. $ git push heroku master

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
