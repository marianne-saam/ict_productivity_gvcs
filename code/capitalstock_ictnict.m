
% get the ict and non-ict stock frrom euklems for the countries whose data
% are available

% \Processing data\euklems\capital
cd '..\data\euklems\capital'
country_number = 41;
kict =zeros(30,13,country_number);
for i=[1,2,4,9,10,11,12,14,22,23,30,36,37,40]
    str = [ '',num2str(i),'.xls'];
    kict_temp =xlsread(str,'K_ICT','AB3:AN39');
    kict_temp([3,8,20,25,28,30,33],:) = []; % get rid of the aggregated industries(one-digit) that is not compatible with WIOD in the euklems dataset
    kict(:,:,i)=kict_temp;
    clear kict_temp
end
clear i str
knict =zeros(30,13,country_number);
for i=[1,2,4,9,10,11,12,14,22,23,30,36,37,40]
    str = [ '',num2str(i),'.xls'];
    knict_temp =xlsread(str,'K_NonICT','AB3:AN39');
    knict_temp([3,8,20,25,28,30,33],:) = []; % get rid of the aggregated industries(one-digit) that is not compatible with WIOD in the euklems dataset
    knict(:,:,i)=knict_temp;
    clear knict_temp
end
clear i str

kict_share=kict./(kict+knict);
kict_share_Italy=kict_share(:,:,22);
knict_share_Italy=ones(30,13)-kict_share_Italy;
cd '..\..'\wiod_sea\

% get the total capital stock for the countries which EUKLEMS does not provide ICT capital stock data
wiod_k_old = xlsread('k_gfcf.xlsx','E2:Q1441');
wiod_k_index = WIODSEAFeb12S1.Variable == "K_GFCF";
wiod_k_table = WIODSEAFeb12S1(wiod_k_index,:);
wiod_k= double(table2array(wiod_k_table(:,5:17)));

k_other=zeros(30,13,country_number);
for j=[3,5,6,7,8,13,15,16,17,18,19,20,21,24,25,26,27,28,29,31,32,33,34,35,38,39];
    k_temp_t = transpose(wiod_k(36*(j-1)+2:36*(j-1)+35,:));
    k_firstpart = [k_temp_t(:,1:4) sum(k_temp_t(:,5:6),2) k_temp_t(:,7:23) sum(k_temp_t(:,24:27),2) k_temp_t(:,28:34)];
    k_temp_t_2=transpose(k_firstpart);
    k_other(:,:,j)=k_temp_t_2 ;
end

cd ..\cb_ted\

CBTED2=xlsread("CB_TED2.xlsx","Tabelle1",'C1:O200');
ICTCap_growth=CBTED2(1:40,:);
NonICTCap_growth=CBTED2(41:80,:);
Cap_growth=CBTED2(81:120,:);
ICTCapstock_share=(Cap_growth-NonICTCap_growth)./(ICTCap_growth-NonICTCap_growth);
correctionfactor_capitalstock=bsxfun(@rdivide, ICTCapstock_share(:,:),ICTCapstock_share(22,:) );

for i=[3,5,6,7,8,13,15,16,17,18,19,20,21,24,25,26,27,28,29,31,32,33,34,35,38,39]
     kict(:,:,i)=kict_share_Italy.*repmat(correctionfactor_capitalstock(i,:),30,1).*k_other(:,:,i);
     knict(:,:,i)=k_other(:,:,i)-kict(:,:,i);
end

% get the kict and knict for Row
kict(:,:,41)=row_new.*(0.5.*kict_share_Italy);
knict(:,:,41)=row_new.*(1-0.5.*kict_share_Italy);

% replace NAN with 0 
kict(isnan(kict))=0;
knict(isnan(knict))=0;
% clear the unnecessary data
clear i j k_firstpart k_other k_temp_t k_temp_t_2 kict_share kict_share_Italy knict_share_Italy m NonICTCap_growth wiod_k 
clear ICTCap_growth ICTCapstock_share 

