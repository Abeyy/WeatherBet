Weatherbet


wbet.us


Git Stratagy:

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
			git commit -m"[commit message PT# 000000]"

			ex:
				git commit -m"Implement Login for Members using Devise PT#123456"
		6.
			git push

		7.
			go to github.com/Abeyy/WeatherBet-Rails-/tree/[BranchName]
			ex. 
