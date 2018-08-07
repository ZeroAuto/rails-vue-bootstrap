# README

if you do not have postgres running locally you can follow the instructions here:
https://coderwall.com/p/dovmsg/how-to-make-your-rails-app-start-talking-to-a-postgres-database

clone repo and create a .env file in the root folder with database username and password in like such:

 ```
POSTGRES_USER=<postgres_username>
POSTGRES_PASSWORD=<password>
 ```


run the following commands to start the app
```
bundle install
yarn install
rake db:create db:migrate db:seed
foreman start

```
