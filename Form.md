The eforms is a new table with an integer "UIN" and a text field "picked_preference"

The *eforms_controller* gets the students' UIN and paper preferences and stores them in the data table.

Then from those params, the *create method* in eforms also searches the students table with the same UIN,

then it updates the student's paper_preference.

The statement looks like this:

@matched_student = Student.where({uin: "#{@eform.form_uin}"}).update_all({paper_preference: "Preference Array Goes Here"})

I did not have time to make the paper_preference into an actual array.

------

Usage:

1. Login -> Go to the student's page (find a UIN or create one)

2. Got to the professor overview page (I temporarily have the form as a menu item there)

3. Put in a UIN and the paper_preference column for students should change to: "Preference Array Goes Here"

------

Notes:

1. paper_preference for forms and students are not arrays

2. the update statement does not change the student's paper_preference to the forms, just random text

3. I added uin and paper_preference to the students table

4. Haven't touched the papers table

5. I made it so you can create a student with a UIN, but did not put it in the edit function

------

I can run it fine locally, but I cannot migrate to Heroku because of some error messages from

past iterations, which needs to be fixed. In order to run it locally, you might have to 

rake db:reset and rake db:drop, then recreate the databases.

------

All changes:

Creation of form schema, controller, model, and view. General function of form. Some new columns in the 
students table...
