This repository provides the data and code for clearing data, computing results, and plotting graphs in the paper Liu, Chuan, and Saam, Marianne (2021). ICT and Productivity Growth Within Value Chains. Review of Income and Wealth, Vol. 68, Issue 3, pp. 711-737. The code is implemented in Matlab and consists of 16 scripts. The master program runs all the other scripts to produce the results used to create the tables and figures in the paper.

### Data Availability Statements:
EUKLEMS data in the folder "data\euklems" provides the data for output, capital input, labor input, and corresponding price index. The data set consists of 32 industries for 30 countries. The Excel spreadsheets are indexed based on the country index, identical to the WIOD database.
Data in the folder "data\wiod" provides the world input-output tables from 1995 to 2007 for 40 major economies and an aggregated virtual economy called Rest of Worlds. The folder "data/wiod/wiot_pyp" consists of the world input-output tables in the previous price.
Data in the folder "data\wiod_sea" provides the extracted dataset from the Socio Economic Accounts of WIOD and Socio Economic Accounts source data "WIOD_SEA_Feb12".
The Conference Board Total Economy Database in the Excel sheet "data\CB_TED2" provides the Growth of Capital Services provided by ICT and non-ICT Assets and the split share of ICT/non-ICT capital compensation at the country level. The selected data covers the countries in the WIOD database, and the original dataset is stored in the Excel sheet data\TED_2_NOV20171.

### Output:
Result tables are stored in the \output folder. Figures 1-5 are based on the results in those tables.

### Directory setting:
The first section of the master program's code automatically sets the local working directory. It also adds the path for two functions written to the MATLAB system environment to allow their usability.

### Software requirement:
Matlab (code was run with Matlab Release 2020a)

### Memory and Runtime Requirements:
The code last ran on a 4-core Intel-8-gen-based laptop with 16 GB memory.

### Reference
Liu, C., and Saam, M. (2021). ICT and Productivity Growth Within Value Chains. Review of Income and Wealth, Vol. 68, Issue 3, 711-737. https://doi.org/10.1111/roiw.12533

O'Mahony, M. & Timmer, M. P. (2009). Output, Input and Productivity Measures at the Industry Level: the EU KLEMS Database, Economic Journal, 119(538), F374-F403 https://doi.org/10.1111/j.1468-0297.2009.02280.x

Timmer, M. P., Dietzenbacher, E., Los, B., Stehrer, R. and de Vries, G. J. (2015). An Illustrated User Guide to the World Input–Output Database: the Case of Global Automotive Production, Review of International Economics, 23, 75–605 https://doi.org/10.1111/roie.12178

The Conference Board Total Economy Database (Adjusted version), November 2017 https://www.conference-board.org/data/economydatabase/total-economy-database-archive




