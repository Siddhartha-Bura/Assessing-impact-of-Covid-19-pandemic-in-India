**USING PYTHON 3.9.6 IS RECOMMENDED**
**INSTALL JUPYTER NOTEBOOK**
**KINDLY RE-RUN THE ENTIRE NOTEBOOK IF YOU FACE DIFFICULTIES, ALL AT ONCE UNLIKE CELL BY CELL EXECUTION, BECAUSE RUNNING A CELL TWICE AT
SOME POINT OF TIME MAY CAUSE INCONSISTENCIES**
**INSTALL JUPYTER NBCONVERT APP BY EXECUTING "sudo apt install jupyter-nbconvert"**
**BEFORE EXECUTING ANY SHELL SCRIPT, FIRST MAKE IT EXECUTABLE BY COMMAND "chmod +x <file_name>.sh"**
**FOR MORE SPECIFIC INFORMATION OF A QUESTION,PLEASE REFER THE COMMENTS IN 'QUESTION.ipynb' FILE**
**THE PATTERN OF IPYNB FILES FOR EVERY QUESTION GOES LIKE 'Q1.ipynb','Q2.ipynb' ... 'Q9.ipynb'** 

REQUIREMENTS:
You are requested to install below packages before executing scripts
	1.numpy
	2.pandas
	3.matplotlib
	4.csv
	5.json
	6.datetime
	7.math
	
ASSUMPTIONS:
	Week is from [Sunday to Saturday].{ Overlapping weeks in QUESTION 4 is an exception }
	Cases on a particular date/day come at the end of that date/day.
	Given the data is cumulative, Then, "Cases in a week = Cases in this week's Saturday - Cases in last week's Saturday".
	Wherever, division is Not Applicable, 'NA' is the output.

QUESTION 1:
	'neighbor-districts-script.sh' invokes question 1.
	Dependency with other questions : No 
	Required Input files: 'neighbor-districts.json','cowin_vaccine_data_districtwise.csv','district_wise.csv'
	Data Preprossing happens
	Lots of Correction has done to the data
	Since most of the data matches with 'cowin_vaccine_data_districtwise.csv', used same file to assign state codes
	Ignored 'noklak' and 'konkan division' districts
	Merged parts of Delhi into one single district
	Output files: 'neighbor-districts-modified.json'
	
QUESTION 2:
	'edge-generator.sh' invokes question 2.
	Dependency with other questions : Yes (QUESTION 1's output)
	Required Input files: 'neighbor-districts-modified.json'
	Built undirected graph using edge list format
	No repetition of edges { If (a,b) present, (b,a) will not present }
	Output files: 'edge-graph.csv'
	
QUESTION 3:
	'case-generator.sh' invokes question 3.
	Dependency with other questions : No
	Required Input files: 'districts.csv'
	Dropped dates greater than 14 Aug 2021
	Data Preprossing happens
	Set start date as 15 Mar 2020 with zeros in dataframe
	Cosumes more time to complete execution
	Output files: 'cases-week.csv','cases-month.csv','cases-overall.csv'

QUESTION 4:
	'peaks-generator.sh' invokes question 4.
	Dependency with other questions : No
	Required Input files: 'districts.csv'
	Dropped dates greater than 14 Aug 2021
	active cases = confirmed - recovered - deceased
	Set start date as 15 Mar 2020 with zeros in dataframe
	Overlapping for weeks is implemented
	Merged districts of one state into one, thus obtained the information for states
	With respect to information provided (Roughly, wave-1 was in the summer of 2020, while wave-2 was in April-May of 2021.),
	Used 81st overlapped week as separator in order to obtain 2 peaks 
	Used 9th month as separator in order to obtain 2 peaks
	Cosumes more time to complete execution
	Output files: 'district-peaks.csv','state-peaks.csv'
	
QUESTION 5:
	'vaccinated-count-generator.sh' invokes question 5.
	Dependency with other questions : No
	Required Input files: 'cowin_vaccine_data_districtwise.csv'
	Renamed date columns to calculable date column format
	Dropped dates greater than 14 Aug 2021
	Preprossed dataframe
	Converted required date columns into integer format
	Cosumes more time to complete execution
	Output files: 'district-vaccinated-count-week.csv','district-vaccinated-count-month.csv','state-vaccinated-count-week.csv',
					'state-vaccinated-count-month.csv','district-vaccinated-count-overall.csv','state-vaccinated-count-overall.csv'
					
QUESTION 6:
	'vaccination-population-ratio-generator.sh' invokes question 6.
	Dependency with other questions : No
	Required Input files: 'cowin_vaccine_data_districtwise.csv','DDW_PCA0000_2011_Indiastatedist.csv'				
	Renamed and Extracted only useful columns
	vaccination ratio = females vaccinated / males vaccinated
	Merged districts of one state into one, thus obtained the information for states
	Appended state codes to the districts in census data
	Changes are made in census data to match with the vaccination data
	Since, information about 'Telangana' is not present in census data, took sum of all districts in 'Telangana'
	Merged 'Dadra and Nagar Haveli' and 'Daman and Diu' into one state to match vaccination data
	Merged dataframes consisting vaccination ratio and population ratio to find ratioofratios
	Sorted dataframes based on ratioofratios in all output files
	Output files: district-vaccination-population-ratio.csv','state-vaccination-population-ratio.csv','overall-vaccination-population-ratio.csv'
	
QUESTION 7:
	'vaccine-type-ratio-generator.sh' invokes question 7.
	Dependency with other questions : No
	Required Input files: 'cowin_vaccine_data_districtwise.csv'
	Renamed and Extracted only useful columns
	Converted required date columns into integer format
	vaccine ratio = covishield / covaxin
	Merged districts of one state into one, thus obtained the information for states
	Sorted dataframes based on vaccineratio in all output files
	Output files: vaccine-district-ratio.csv','vaccine-state-ratio.csv','vaccine-overall-ratio.csv'
	
QUESTION 8:
	'vaccinated-ratio-generator.sh' invokes question 8.
	Dependency with other questions : No
	Required Input files: 'cowin_vaccine_data_districtwise.csv','DDW_PCA0000_2011_Indiastatedist.csv'
	Renamed and Extracted only useful columns
	Converted required date columns into integer format
	Merged districts of one state into one, thus obtained the information for states
	Appended state codes to the districts in census data
	Changes are made in census data to match with the vaccination data
	Since, information about 'Telangana' is not present in census data, took sum of all districts in 'Telangana'
	Merged 'Dadra and Nagar Haveli' and 'Daman and Diu' into one state to match vaccination data
	vaccinated dose 1 ratio = First Dose Administered / Total Population
	vaccinated dose 2 ratio = Second Dose Administered / Total Population
	Sorted dataframes based on vaccinateddose1ratio in all output files
	Output files: 'district-vaccinated-dose-ratio.csv','state-vaccinated-dose-ratio.csv','overall-vaccinated-dose-ratio.csv'

QUESTION 9:
	'complete-vaccination-generator.sh' invokes question 9.
	Dependency with other questions : No
	Required Input files: 'cowin_vaccine_data_districtwise.csv','DDW_PCA0000_2011_Indiastatedist.csv'
	Renamed and Extracted only useful columns
	Converted required date columns into integer format
	Merged districts of one state into one, thus obtained the information for states
	rate per day = no of cases in a week / 7 { Here, no of cases is referred in the last week ['2021-08-08' to '2021-08-14']}
	Appended state codes to the districts in census data
	Changes are made in census data to match with the vaccination data
	Since, information about 'Telangana' is not present in census data, took sum of all districts in 'Telangana'
	Merged 'Dadra and Nagar Haveli' and 'Daman and Diu' into one state to match vaccination data
	Merged both vaccination and population dataframes
	No of days required to vaccinate population left = ceil of ( population left / rate per day )
	Taking "ceil" because a day can't be fragmented
	Now, the date on which vaccination will be completed = last date { '2021-08-14' } + No of days required to vaccinate population left
	Output files: 'complete-vaccination.csv'
	
QUESTION 10:
	Writing a readme file... this one tho :)
	
*** THE END ****