# COVID-19 Track n Visualize
Source Code COVID-19 Tracking and Visualization Project for SEPM 2020. 

# How to contribute #
- Use : git clone https://github.com/nobodyn0se/SEPM_NCoV.git to initialize the repository in your local machine. 
- Check that the repo is added as remote using : git remote -v 
- If not, add the repo as remote using : git remote add original https://github.com/nobodyn0se/SEPM_NCoV.git
- Create a new branch as : git checkout -b launchpad_mod 
- Start adding changes to the code 
- When functional code is tested, stage and commit the changes using : git add -A or git add . followed by git commit -m "<Commit Message>" 
- Before pushing any changes, use : git pull original main and then git push -u original launchpad_mod 
- Once done, create a pull request on the main branch, add concise PR message/description. 

### All final changes go into the main branch. ### 

## TO DO ## 
1. Create a Bottom Navigation Bar to show different pages using tabs. 
2. Display a list of countries with clickable detailed list of countrywide stats separately. 
3. Display Visualization page for India that includes testing data. 
4. Show a pie chart on the main tab for worldwide statistics. 
5. Create a search bar for countries on the countries page. 
6. Make the navigation bar dynamic with different material colors and animations. 
7. Show top 5 countries in new detections, deaths and recoveries on the main page. 
8. Create a loading screen until data is fetched. 
9. Refresh data on all tabs when the refresh button is pressed from any page. 

### Changelog ### 
v1.0.0 : 
  Functional bottom navigation bar created with accurate tab switching. 
