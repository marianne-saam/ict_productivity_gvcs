%% master code file
clear
% set the working directory as the one where the scripts are located
tmp = matlab.desktop.editor.getActive;
cd(fileparts(tmp.Filename));
addpath '.\function'

%% code list for different computation stages
code = {
    'ICT_nonICT_compensationsharemapping.m';
    'labourinput.m';
    'RoW.m';
    'capitalstock_ictnict.m';
    'realoutputforfactorcost.m';
    'Leontief_nominal.m';
    'Leontief_real.m';
    'kl_diag.m';
    'klgvc_log.m';
    'cost_share_beforegvcadjust.m';
    'eq15_production.m';
    'aggregation_log.m';
    'ict_decomp_6sectors.m';
    'German_car.m';
    'tfp_decompostion_6sectors.m';
    };

for i=13:15
   cd(fileparts(tmp.Filename))
   run(code{(i)})
end