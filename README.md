# Weatherbet

wbet.us

### Requirements:
- Ruby version 2.3
- Rails version 5.0.0.1

To Do:
- Migrate DB to PostgreSQL from SQLite
- Host site (AWS, Digital Ocean, or Heroku)
- Use vagrant to set up dev env and keep envs consistent with prod
- Set up CD/CI
- Remove C++ component(?)
	- Could deploy with heroku if removed

## How to set up development environment: 
1. Enter the ```WeatherBet``` directory and, in a terminal, type 
```$ bundle install --path vendor/bundle```          

- You might need to install sqlite on your machine

```apt-get install libsqlite3-dev``` or ```brew install sqlite``` (if on mac)

2. Next, enter to run the server locally 
``` 
$ bin/rails server 
```

3. Finally, open up a web browser and got to ```http://localhost:3000``` to see the site 

	- While it might not be necessary, you may need to migrate the database. If so, simply ```cd``` the ```Weatherbet``` directory and, in a terminal, type
```
bin/rails db:migrate RAILS_ENV=development
```


## Git Workflow (for contributors)
### Getting started
- Fork the repository
- Clone your fork
- Add the original [repository](https://github.com/Abeyy/WeatherBet) as a remote by typing ```git remote add upstream git@github.com:Abeyy/WeatherBet.git```
```
$ git remote -v
origin	git@github.com:MahmoudDolah/WeatherBet.git (fetch)
origin	git@github.com:MahmoudDolah/WeatherBet.git (push)
upstream	git@github.com:Abeyy/WeatherBet.git (fetch)
upstream	git@github.com:Abeyy/WeatherBet.git (push)
```

### Development workflow
- Create a new branch for each feature from a story on PivitolTracker (don't forget to branch off of the master of this repo)
```
	git checkout -b [BranchName] upstream/master
	git checkout -b [WorkType_TaskName] upstream/master
	ex: 
		git checkout -b Feature_LogIn upstream/master
		git checkout -b Bug_IncorrectHomepageStyleSheet upstream/master
```
- Complete the task
- Stage the changes you've made
	- Recommend using ```git add -p``` to systematically go through all changes of modified files in chunks so you don't accidentally merge something not needed (like debug code, etc)

- Commit changes   
```git commit -m "commit message"```
	- While not always necessary, try to make commit messages meaningful and a 2-3 sentences long (considered best practice)

	ex:
		git commit -m "Implement Login for Members using Devise PT#123456"
- Push changes to github   
```git push -f origin [BranchName]```

- Create pull request to merge your branch to upstream master
	- Navigate to https://github.com/Abeyy/WeatherBet/pulls
	- OBSERVE AND CHECK YOUR CHANGES!!!
	- Click button to "Create New Pull Request" (Add description of what your PR does, include images if front end changes)
	- Paste pull request link into Slack #PR,
	Group has 60 mins to respond + 3hr grace period (within reason),
	After 60 person who innitiated PR should @everyone in Slack
	- Once approval is recieved via Slack, click "Merge Pull Request" and delete branch if prudent (don't forget to delete locally)
