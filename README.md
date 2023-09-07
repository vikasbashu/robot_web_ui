flags:

-i tag_name : to include a specific tag
-e tag_name : to exclude a specific tag
-i tag_name1ANDtag_name2 : to include a task having both the tags
-i tag_name1ORtag_name2 : to include a task having any of the 2 tags
-d dir_path : to add all reports in a specific folder
Parallel Run:

robot testCases: default execution mode. will run one test at a time.
pabot --processes 4 testCases: will start 4 threads to run test cases.
pabot --testlevelsplit testCases: will start one thread for each test cases.
markers:

--outputdir dir_path : to add all reports in a specific folder
--randomize ALL : to run test in random order
--loglevel INFO : default option to show log file
--loglevel DEBUG : show log file in detailed mode of each task
--loglevel TRACE : highest level of details in log file


command to run test case with allure and html report : robot --listener allure_robotframework:output/Reports/Allure -d output/Reports/HTML --loglevel TRACE tests/TC2.robot
