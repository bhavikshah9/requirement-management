# Requirement Management
Batch Script for Requirement management

## Scenario
I am Software Engineer. So, as a part of my job, I have to analyze requirements. Eventually, the documents for one requirement grows. So, I prefer to make one folder for each requirement. So, if I need any of the relevant document in future, I can easily find it. As time passes, this folder grown too big. So, I thought to categorize them by year and month of arrival. And this worked well.

- 2017
  - 01-Jan
  - .
  - 12-Dec
- 2018
  - 01-Jan
  - .
  - 12-Dec
- 2019
  - 01-Jan
  - .

## Problem
Whenever I get new requirement, I have to navigate to directory structure, create new folder where I can collect all relevant documents. For sometime, I didn't mind it. But, then it became pain.

## Solution
So, I created this batch script.

This Script has three modes:
1. If you pass 'y' as an argument, it will open current year directory. 'y' stands for Year.
2. If you pass 'm' as an argument, it will open current month directory under current year directory. 'm' stands for month.
3. If you don't pass any argument, it will ask for the name of the requirement and create folder with same name and open that folder.

## Setup
1. Download batch file.
2. Make sure that you save the file in the directory which exists in PATH environment variable. If it is not, you will have to add it.
3. That's it. Start using it.

Please note, this script is localization dependent.

Suggestions are welcomed. If you notice any issues, please raise them [here](https://github.com/bhavikshah9/requirement-management/issues)
