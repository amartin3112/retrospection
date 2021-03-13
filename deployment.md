# Deploying updates to Heroku

The follwoing instructions assume that the repository is mastered in GitHub.

## Instructions

Clone repository form GitHub:
```
git clone https://github.com/amartin3112/retrospection.git
```

Make changes and then push to GitHub:
```
git add .

git commit -m '<description>'

git push origin master
```

Install heroku using Brew if required:
```
brew tap heroku/brew && brew install heroku
```

Login to Heroku:
```
heroku login
```

Add Heroku as a remote repository:
```
heroku git:remote -a protected-cove-98149
```

Push changes to Heroku:
```
git push heroku master
```
This will redeploy the application to Heroku.

## PostgreSQL specific commands

Help with postgreSQL:
```
heroku pg --help
```
Make a dump of the server and push it to Heroku:

```
heroku pg:push database_name DATABASE_URL
```

Delete the DB:
```
heroku pg:reset - deletes the DB
```

## Other Heroku commands

Open the app in the browser:
```
heroku open
```

Create a new heroku app for the files based in your current directory:
```
heroku create app_name
```

Error logs:
```
heroku logs --tail
```
