# COVID-19 Track n Visualize
Source Code COVID-19 Tracking and Visualization Project for SEPM 2020. 

# How to contribute #
- Use : git clone https://github.com/nobodyn0se/SEPM_NCoV.git to initialize the repository in your local machine [conventional way] OR 
- Press Ctrl + Shift + P on VSCode, select Flutter: New Project and then follow these steps below.  
- Check that the repo is added as remote using : git remote -v 
- If not, add the repo as remote using : git remote add original https://github.com/nobodyn0se/SEPM_NCoV.git
- Create a new branch as : git checkout -b launchpad_mod 
- Start adding changes to the code 
- When functional code is tested, stage and commit the changes using : git add . followed by git commit -m "_Commit Message Here_" 
- Before pushing any changes through your username_mod branch, use : git pull --rebase original main and then git push -u original username_mod 
- Once done, create a pull request on the main branch, add concise PR message/description. 

### All final changes go into the main branch. ### 
Workflow: Changes in your feature branch (username_mod) will be rebased on top of the main branch. 
- All PRs will be merged with the main branch. 

### Sync your local main branch and test PRs ###
- To test a PR yourself, keep the main branch on your local repo INTACT. Use git pull -rebase original main to bring the local main branch in sync with the remote. 
- Then test a PR using : git pull original pull/PR_ID/head:new_prbranchname, which will automatically checkout to the new branch. 

- Ensure that the changes are correct. If you merge the PR via Git UI, you need to sync your local main using git pull -rebase original main otherwise, you can perform git merge new_prbranchname on your local main. 
- Push these changes on the main branch: git push original main, if push is rejected, use git push original main --force-with-lease. 

## Do not use git push --force under any circumstances ##
## Do not make changes to your main branch. Always ensure that you're working on your mod branch using git branch or git branch --show-current ## 
## Do not push changes to your mod branch remote unless your previous PR is merged to avoid the commits from appearing in the open PR ##  

## TO DO ## 
1. [x] Create a Bottom Navigation Bar to show different pages using tabs. 
2. [ ] Display a list of countries with clickable detailed list of countrywide stats separately. (Not clickable yet, routing TBA)
3. [ ] Display Visualization page for India that includes testing data. (Partially done, vaccine data added) 
4. [ ] Show a pie chart on the main tab for worldwide statistics. 
5. [ ] Create a search bar for countries on the countries page. 
6. [x] Make the navigation bar dynamic with different material colors and animations. 
7. [x] Show top 5 countries in new detections, deaths and recoveries on the main page. 
8. [x] Create a loading screen until data is fetched. 
9. [x] Refresh data on all tabs when the refresh button is pressed from any page. 
