# README

Link: https://infinite-harbor-68851.herokuapp.com/welcome/index

How to run:

1. $ git clone https://github.com/brae513/Paper-Review-Assigner

2. Navigate to project folder: $ cd Peer-Review-Assigner

3. $ sudo apt-get install libpq-dev

4. $ bundle install --without production

5. $ rake db:create

6. $ rake db:migrate

7. $ git commit -m postgres

8. $ rake db:seed

Run Locally:

9. RAILS_ENV=production rake db:create db:migrate db:seed

10. rake secret

11. export SECRET_KEY_BASE=output-of-rake-secret

12. rake assets:precompile

13. RAILS_ENV=production rails s

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
