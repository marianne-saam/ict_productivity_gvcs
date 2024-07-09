% This script is to create the compensation shares for the ICT and non-ICT
% capital input. Combining the industry level data from EUKLEMS and
% Conference Board TED database country level data of Italy to inputate the
% industry level data of the countries outside the EUKLEMS database.

cd '..\data\euklems\basic'
for i=[1,2,3,9,10,11,12,14,15,16,18,21,22,30,36,37,40]
    str = [ '',num2str(i),'.xls'];
    CAPIT_temp =xlsread(str,'CAPIT','AB3:AN39');  
    CAPIT_temp([3,8,20,25,28,30,33],:) = [];  % get rid of the aggregated industries(one-digit
    CAPIT(:,:,i)=CAPIT_temp;  
    clear CAPIT_temp CAPNIT_temp;
end

% get the country level ICT/non-ICT compensation share from TED of
% Conference Board
% \Processing data
cd '..\..'

CBTED2=xlsread("cb_ted\CB_TED2.xlsx","Tabelle1",'C1:O200');
NonICTCapshare_overGDP=CBTED2(121:160,:);
ICTCapshare_overGDP=CBTED2(161:200,:);
NonICTCapshare=NonICTCapshare_overGDP./(ICTCapshare_overGDP+NonICTCapshare_overGDP);
ICTCapshare=ICTCapshare_overGDP./(ICTCapshare_overGDP+NonICTCapshare_overGDP);

% obtain the correction factor with the benchmark of Italy from country
% level data from TED and write them in industry level variable
correctionfactor=bsxfun(@rdivide, ICTCapshare(:,:),ICTCapshare(22,:) );
ItalyICTshare=CAPIT(:,:,22)
for i=[ 4,5,6,7,8,13,17,19,20,23,24,25,26,27,28,29,31,32,33,34,35,38,39  ]
CAPIT(:,:,i)=repmat(correctionfactor(i,:),30,1).*ItalyICTshare(:,:);
end
CAPNIT=ones(30,13,40)-CAPIT;

% duplicate some indudstries for sub-categories to be campataible with the
% dataset provided by Wen
CAPIT_new=zeros(35,13,40)
for i=1:40
    CAPIT_tanspose=transpose(CAPIT(:,:,i))
temp = [CAPIT_tanspose(:,1:3) repmat(CAPIT_tanspose(:,4),1,2) CAPIT_tanspose(:,5:21) repmat(CAPIT_tanspose(:,22),1,4) CAPIT_tanspose(:,23:30) zeros(13,1)];
CAPIT_new(:,:,i)=transpose(temp);
clear CAPIT_tanspose temp
end

CAPNIT_new=zeros(35,13,40)
for i=1:40
    CAPNIT_tanspose=transpose(CAPNIT(:,:,i))
temp = [CAPNIT_tanspose(:,1:3) repmat(CAPNIT_tanspose(:,4),1,2) CAPNIT_tanspose(:,5:21) repmat(CAPNIT_tanspose(:,22),1,4) CAPNIT_tanspose(:,23:30) zeros(13,1)];
CAPNIT_new(:,:,i) = transpose(temp);
clear CAPNIT_tanspose temp
end

CAPIT_final = permute(CAPIT_new,[1 3 2]);
CAPIT_final = reshape(CAPIT_final,[],size(CAPIT_new,2),1);
CAPNIT_final = permute(CAPNIT_new,[1 3 2]);
CAPNIT_final = reshape(CAPNIT_final,[],size(CAPNIT_new,2),1);

% CAPIT_final is the compensation share of the IT capital in the
% compensation for the capital input.