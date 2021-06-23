# COVID-19 Track n Visualize
Source Code for COVInfo - RealTime COVID-19 Tracker. 

![image](https://user-images.githubusercontent.com/48710616/123158075-f4a49680-d488-11eb-93be-3f6150a4e999.png) ![image](https://user-images.githubusercontent.com/48710616/123157900-c2933480-d488-11eb-8027-e398f51b1e42.png)

![image](https://user-images.githubusercontent.com/48710616/123158147-0a19c080-d489-11eb-8451-bada52c6f2c6.png) ![image](https://user-images.githubusercontent.com/48710616/123158180-156cec00-d489-11eb-8505-02804c0ecda4.png)

![image](https://user-images.githubusercontent.com/48710616/123159195-59142580-d48a-11eb-94f5-0035901accfc.png) ![image](https://user-images.githubusercontent.com/48710616/123159214-5f0a0680-d48a-11eb-97ba-ee33cdecda4f.png)

### All final changes go into the main branch. ### 
Workflow: Changes in feature branch to be rebased on top of the main branch. 
- All PRs will be merged with the main branch. 

### Sync your local main branch and test PRs ###
- To test a PR yourself, keep the main branch on your local repo INTACT. Use git pull --rebase original main to bring the local main branch in sync with the remote. 
- Then test a PR using : git pull original pull/PR_ID/head:new_prbranchname, which will automatically checkout to the new branch. 

- Ensure that the changes are correct. If you merge the PR via Git UI, you need to sync your local main using git pull -rebase original main otherwise, you can perform git merge new_prbranchname on your local main. 
- Push these changes on the main branch: git push original main, if the push is rejected, use git push original main --force-with-lease. 

## Do not use git push --force under any circumstances ##
## Do not make changes to your main branch. Always ensure that you're working on your mod branch using git branch or git branch --show-current ## 

## TO DO ## 
- [x] Create a Bottom Navigation Bar to show different pages using tabs. 
- [x] Display a list of countries with clickable detailed list of countrywide stats separately. 
- [x] Display Visualization page for India that includes testing data. 
- [x] Show a pie chart on the main tab for worldwide statistics. 
- [ ] Create a search bar for countries on the countries page. 
- [x] Make the navigation bar dynamic with different material colors and animations. 
- [x] Show top 5 countries in new detections, deaths and recoveries on the main page. 
- [x] Create a loading screen until data is fetched. 
- [x] Refresh data on all tabs when the refresh button is pressed from any page. 
