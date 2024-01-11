# README

* Ruby version: 3.2.2p53

* Rails version: 7.0.8

* BUNDLED WITH: 2.4.10

* Environment variable:
1. You need an environment variable called flexhire_url which will be the Developer API url of flexhire.
2. You need an environment variable called flexhire_api_key which will be the api of the user.

* after cloning the repository:

3. Run bundle install

4. Make sure you have the pg gem configured correctly

5. In postgresql create a new user called flex_hire_test, with the Attribute "Create DB" and uses the password of this user to create an environment variable called FLEX_HIRE_TEST_DATABASE_PASSWORD

6. Run rails db:create

7. Run rails s

8. Go to your browser and enter localhost:3000/