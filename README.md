Weatherbet

wbet.us

Requirements:
- Ruby version 2.3
- Rails version 5.0.0.1

To Do:
1) Migrate DB to PostgreSQL from SQLite
2) Host site (AWS, Digital Ocean, or Heroku)

How to run locally:                       
1) Enter the ```Weatherbet``` directory and, in a terminal, type 
```
bundle install
```

2) Next, enter 
``` 
bin/rails server 
```

3) Finally, open up a web browser and got to ``` http://localhost:3000 ``` to see the site       

3a) While it might not be necessary, you may need to migrate the database. If so, simply ``` cd ``` the ``` Weatherbet ``` directory and, in a terminal, type
```
bin/rails db:migrate RAILS_ENV=development
```


Git Strategy (for contributors):

	Branching:
		Create a new branch for each feature from a story on PivitolTracker
		1.
			git checkout -b [BranchName]		
			git checkout -b [WorkType_TaskName]		
			ex: 
				git checkout -b Feature_LogIn
				git checkout -b Bug_IncorrectHomepageStyleSheet

		2.
			git push origin [BranchName]
			ex:
				git push origin Feature_LogIn
		3.
			//do some work

		4.
			git add [fileName]

		5.
			git commit -m "[commit message PT# 000000]"

			ex:
				git commit -m "Implement Login for Members using Devise PT#123456"
		6.
			git push

		7. merge TO master
			i. 
				go to github.com/Abeyy/WeatherBet-Rails-/tree/[BranchName]
				ex. 

			ii. 
				OBSERVE AND CHECK YOUR CHANGES!!!

			iii. 
				Click button to "Create New Pull Request"

			iv.
				Paste pull request link into Slack #PR
					Group has 60 mins to respond + 3hr grace period (within reason)
					After 60 person who innitiated PR should @everyone in Slack
			v.
				Once approval is recieved via Slack, click "Merge Pull Request" and delete branch if prudent. (don't forget to delete locally)





			
