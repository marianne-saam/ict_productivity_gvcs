data_folder = '..\data\wiod_sea';
total_years = 2007 - 1995 + 1; %counting the number of years (i.e. 13)

% Load data, get to know where I got the excel CAP
cd(data_folder);
capshare=xlsread(['CAP.xlsx'],'A1:M1476');


% change here to get the data directly from a matlab variable
ictincapshare=xlsread(['ICT.xlsx'],'A1:M1435');

capshare_tr=capshare';
capshare_temp=zeros(13,1435);

for i = 0:40
    capshare_temp(:,35*i+1:35*i+35)=capshare_tr(:,36*i+2:36*i+36);
end

capshare_new = capshare_temp';
ictshare = ictincapshare .* capshare_new;
nictshare = capshare_new - ictshare;
L_all=ones(1435, 13) - capshare_new;

CSKIT_all=ictshare;
CSKNIT_all=nictshare;

A_new = cell(total_years, 1);
va_new = cell(total_years, 1);
x_new = cell(total_years, 1);


cs_kit_gvc_newnew = zeros(1230, 1230, total_years);
cs_knit_gvc_newnew = zeros(1230, 1230, total_years);
cs_l_gvc_newnew = zeros(1230, 1230, total_years);

for m=1:13
    CSKIT_all_tm=transpose(CSKIT_all(:,m));
    for i= 0:40;
    CSKIT_all_tm_temp1 = [CSKIT_all_tm(35*i+1:35*i+3) sum(CSKIT_all_tm(35*i+4:35*i+5),2)/2 CSKIT_all_tm(35*i+6:35*i+22) sum(CSKIT_all_tm(35*i+23:35*i+26),2)/4 CSKIT_all_tm(35*i+27:35*i+34)];
    CSKIT_all_temp2(30*i+1:30*i+30) =  CSKIT_all_tm_temp1;
    clear wiot_tm_temp1;
    end
    CSKIT_all_new(:,m) = CSKIT_all_temp2 ;
end

for m=1:13
    CSKNIT_all_tm=transpose(CSKNIT_all(:,m));
    for i= 0:40;
    CSKNIT_all_tm_temp1 = [CSKNIT_all_tm(35*i+1:35*i+3) sum(CSKNIT_all_tm(35*i+4:35*i+5),2)/2 CSKNIT_all_tm(35*i+6:35*i+22) sum(CSKNIT_all_tm(35*i+23:35*i+26),2)/4 CSKNIT_all_tm(35*i+27:35*i+34)];
    CSKNIT_all_temp2(30*i+1:30*i+30) =  CSKNIT_all_tm_temp1;
    clear wiot_tm_temp1;
    end
    CSKNIT_all_new(:,m) = CSKNIT_all_temp2 ;
    clear CSKNIT_all_temp2;
end

for m=1:13
    L_all_tm=transpose(L_all(:,m));
    for i= 0:40;
    L_all_tm_temp1 = [L_all_tm(35*i+1:35*i+3) sum(L_all_tm(35*i+4:35*i+5),2)/2 L_all_tm(35*i+6:35*i+22) sum(L_all_tm(35*i+23:35*i+26),2)/4 L_all_tm(35*i+27:35*i+34)];
    L_all_temp2(30*i+1:30*i+30) =  L_all_tm_temp1;
    clear wiot_tm_temp1;
    end
    L_all_new(:,m) = L_all_temp2 ;
    clear L_all_temp2;
end

cd ..\wiod\
for year=1:total_years
    WholeFile=xlsread(['',num2str(year+1994),'.xlsx'], 'E7:BKF1449');  %Read the I-O table 
    A=WholeFile(1:1435,1:1435); %select the intermediate input block
   
    x=WholeFile(1443:1443,1:1435)'; %vector of gross output
    nettax=WholeFile(1437:1437,1:1435)' ;%vector of net tax
    transport=WholeFile(1442:1442,1:1435)' ;%vector of internatinal transport margin
    va=WholeFile(1441:1441,1:1435)'+nettax+transport; %vector of value added
    clear WholeFile;
    
    for i= 0:40;
    A_tm=A(:,:);
    A_tm_temp1 = [A_tm(:,35*i+1:35*i+3) sum(A_tm(:,35*i+4:35*i+5),2) A_tm(:,35*i+6:35*i+22) sum(A_tm(:,35*i+23:35*i+26),2) A_tm(:,35*i+27:35*i+34)];
    A_tm_n_temp(:,30*i+1:30*i+30) =  A_tm_temp1;
    clear A_tm_temp1;
    end
    A_tm_n = zeros(1230) ;
    A_tr_n_temp2 = zeros(1230) ;
    A_tr=transpose(A_tm_n_temp);
    for i =0:40;
    A_tr_temp1=[A_tr(:,35*i+1:35*i+3) sum(A_tr(:,35*i+4:35*i+5),2) A_tr(:,35*i+6:35*i+22) sum(A_tr(:,35*i+23:35*i+26),2) A_tr(:,35*i+27:35*i+34)];
    A_tr_n_temp2(:,30*i+1:30*i+30) =  A_tr_temp1;
    clear A_tm_temp1;
    end
    A_tm_n = transpose(A_tr_n_temp2);
    A_new=A_tm_n ;
    
    va_temp=transpose(va);
    for i= 0:40;
    va_tm_temp1 = [va_temp(:,35*i+1:35*i+3) sum(va_temp(:,35*i+4:35*i+5),2) va_temp(:,35*i+6:35*i+22) sum(va_temp(:,35*i+23:35*i+26),2) va_temp(:,35*i+27:35*i+34)];
    va_temp2(:,30*i+1:30*i+30) =  va_tm_temp1;
    end
    va_new = va_temp2 ;
    
    x_temp=transpose(x)
    for i= 0:40;
    x_tm_temp1 = [x_temp(:,35*i+1:35*i+3) sum(x_temp(:,35*i+4:35*i+5),2) x_temp(:,35*i+6:35*i+22) sum(x_temp(:,35*i+23:35*i+26),2) x_temp(:,35*i+27:35*i+34)];
    x_temp2(:,30*i+1:30*i+30) =  x_tm_temp1;
    end
    x_new= x_temp2 ;
    
    VAS=div(va_new,x_new); %value-added coefficient
    coef=A_new*invd(x_new); %intermediate input coefficient
    L=inv(eye(1230)-coef); %Leontief inverse
    x_output(:,year)=x_new
    cs_kit_gvc_newnew(:,:,year)=(diag(CSKIT_all_new(:,year)))* (diag(VAS)*L);
    cs_knit_gvc_newnew(:,:,year)=(diag(CSKNIT_all_new(:,year)))* (diag(VAS)*L);
    cs_l_gvc_newnew(:,:,year)=(diag(L_all_new(:,year)))* (diag(VAS)*L);
end
