# README

Iteration 2 Link: https://shrouded-beach-66812.herokuapp.com/

Current Link 4/2/2020: https://enigmatic-crag-69698.herokuapp.com/

Current Link 4/10/2020: https://stormy-sands-43449.herokuapp.com/

REMINDER:: YOU **MUST** TRY RUNNING ON HEROKU BEFORE PUSHING TO MASTER.

The app may work locally but not on Heroku. 

This is for Ubuntu on cloud9!

How to run:

1. $ git clone https://github.com/brae513/Paper-Review-Assigner

2. Navigate to project folder: $ cd Paper-Review-Assigner/

3. $ sudo apt-get install libpq-dev

4. $ bundle install --without production (((might look like it froze. Just wait. It's slow.)))

5. $ npm install --global yarn

6. $ rake db:create (((If you get an integrity fails error, do $ yarn install --check-files)))

7. $ rake db:migrate

8. $ rake db:seed


Run Locally:

9. $ RAILS_ENV=production rake db:create db:migrate db:seed

10. $ rake secret

11. $ export SECRET_KEY_BASE=output-of-rake-secret

12. $ rake assets:precompile (((might look like it froze. Just wait. It's slow.)))

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

19. $ heroku run rake db:migrate

-------------------------------------------------------------------

Initializing Cucumber test database:
1. Run after every change to database before testing:
   $ rake db:test:prepare
   
--------------------------------------------------------------------

Common Not-Obvious Errors:

*After changing files/pushing/merging, if you can run the app locally but get this message on Heroku:*

"We're sorry, but something went wrong."

*You most probably have a database issue (or an issue in routes.rb) so make sure you've done the db commands*

*To fix the database issue:*

1. Make sure yarn is up to date with $ yarn install --check-files

2. Click the db folder and delete db/development.sqlite3, db/production.sqlite3, and db/test.sqlite3

3. Delete all temp cache with $ git rm tmp -r

4. Now try deploying again from step 4 and make sure you $ heroku run rake db:migrate

5. If this doesn't work, make sure your .rb files are up to date. (Check: schema.rb, seeds.rb, links in routes.rb)

6. If all fails, click on the page that says: "We're sorry, but something went wrong."
   Type in $ heroku logs -t (((to check the logs and look up the error if there is one)))
