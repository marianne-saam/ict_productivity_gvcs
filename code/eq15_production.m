% don't need to read data, for running this file it is needed to run the
% code 11a first until line 93
% \Processing data\matlab
% get the vector of final output
cd '..\data\wiod'

for year=1:12
    WholeFile=xlsread(['',num2str(year+1994),'.xlsx'], 'E7:BKF1449');  %Read the I-O table 
    FinalDemand_detail=WholeFile(1:1435,1436:1640); %select the final demand matrix
    fd_v(:,year)=FinalDemand_detail*ones(205,1);  %sum over the final demand categorie
end

% \Processing data\matlab\wiot_pyp
% get the vector of final output
cd 'wiot_pyp'
for year=1:12
    WholeFile=xlsread(['',num2str(year+1995),'.xlsx'], 'E7:BKF1449');  %Read the I-O table 
    FinalDemand_detail=WholeFile(1:1435,1436:1640); %select the final demand matrix
    fd_v_real(:,year)=FinalDemand_detail*ones(205,1);  %sum over the final demand categorie
end

for m=1:12
fd_v_tm=transpose(fd_v(:,m));
for i= 0:40;
fd_v_tm_temp1 = [fd_v_tm(1,35*i+1:35*i+3) sum(fd_v_tm(1,35*i+4:35*i+5)) fd_v_tm(1,35*i+6:35*i+22) sum(fd_v_tm(1,35*i+23:35*i+26)) fd_v_tm(1,35*i+27:35*i+34)];
fd_v_temp2(1,30*i+1:30*i+30) =  fd_v_tm_temp1;
clear wiot_tm_temp1;
end
fd_v_new(:,m) = transpose(fd_v_temp2) ;
clear fd_v_temp2;
end

for m=1:12
fd_v_real_tm=transpose(fd_v_real(:,m));
for i= 0:40;
fd_v_real_tm_temp1 = [fd_v_real_tm(1,35*i+1:35*i+3) sum(fd_v_real_tm(1,35*i+4:35*i+5)) fd_v_real_tm(1,35*i+6:35*i+22) sum(fd_v_real_tm(1,35*i+23:35*i+26)) fd_v_real_tm(1,35*i+27:35*i+34)];
fd_v_real_temp2(1,30*i+1:30*i+30) =  fd_v_real_tm_temp1;
clear wiot_tm_temp1;
end
fd_v_real_new(:,m) = transpose(fd_v_real_temp2) ;
clear fd_v_real_temp2;
end

% equation 12-14
for i=1:12
for m=1:1230
l_gvc_2_real(:,m,i)=fd_v_real_new(m,i).*l_gvc_real(:,m,i);
end
end

for i=1:12
for m=1:1230
kict_gvc_2_real(:,m,i)=fd_v_real_new(m,i).*kict_gvc_real(:,m,i);
end
end

for i=1:12
for m=1:1230
knict_gvc_2_real(:,m,i)=fd_v_real_new(m,i).*knict_gvc_real(:,m,i);
end
end

for i=1:12
for m=1:1230
l_gvc_2(:,m,i)=fd_v_new(m,i).*l_gvc(:,m,i);
end
end

for i=1:12
for m=1:1230
kict_gvc_2(:,m,i)=fd_v_new(m,i).*kict_gvc(:,m,i);
end
end

for i=1:12
for m=1:1230
knict_gvc_2(:,m,i)=fd_v_new(m,i).*knict_gvc(:,m,i);
end
end

% growth rate(log differnce) of the factor input
kict_gvc_2_growth_log=zeros(1230,1230,12);
for i=1:12
kict_gvc_2_growth_log(:,:,i)=log(kict_gvc_2_real(:,:,i))-log(kict_gvc_2(:,:,i));
end

knict_gvc_2_growth_log=zeros(1230,1230,12);
for i=1:12
knict_gvc_2_growth_log(:,:,i)=log(knict_gvc_2_real(:,:,i))-log(knict_gvc_2(:,:,i));
end

l_gvc_2_growth_log=zeros(1230,1230,12);
for i=1:12
l_gvc_2_growth_log(:,:,i)=log(l_gvc_2_real(:,:,i))-log(l_gvc_2(:,:,i));
end

fd_v_real_new_growth_log=zeros(1230,12);
for i=1:12
fd_v_real_new_growth_log(:,i)=log(fd_v_real_new(:,i))-log(fd_v_new(:,i));
end


kict_gvc_2_growth_log(isnan( kict_gvc_2_growth_log))=0.0000000001;
knict_gvc_2_growth_log(isnan( knict_gvc_2_growth_log))=0.0000000001;
l_gvc_2_growth_log(isnan( l_gvc_2_growth_log))=0.0000000001;
kict_gvc_2_growth_log(~isfinite(kict_gvc_2_growth_log))=0.0000000001;
knict_gvc_2_growth_log(~isfinite(knict_gvc_2_growth_log))=0.0000000001;
l_gvc_2_growth_log(~isfinite(l_gvc_2_growth_log))=0.0000000001;
% replace NaN and infinite with 0
cs_kit_gvc_newnew(isnan(cs_kit_gvc_newnew))=0.0000000001;
cs_knit_gvc_newnew(isnan(cs_knit_gvc_newnew))=0.0000000001;
cs_l_gvc_newnew(isnan(cs_l_gvc_newnew))=0.0000000001;
cs_kit_gvc_newnew(~isfinite(cs_kit_gvc_newnew))=0.0000000001;
cs_knit_gvc_newnew(~isfinite(cs_knit_gvc_newnew))=0.0000000001;
cs_l_gvc_newnew(~isfinite(cs_l_gvc_newnew))=0.0000000001;

for i=1:12
for   m=1:1230
     ict_contribution_2_log(m,i)=transpose((cs_kit_gvc_newnew(:,m,i)+cs_kit_gvc_newnew(:,m,i+1))/2) *(kict_gvc_2_growth_log(:,m,i)-l_gvc_2_growth_log(:,m,i));
end
end

for i=1:12
for   m=1:1230
     nict_contribution_2_log(m,i)=transpose((cs_knit_gvc_newnew(:,m,i)+cs_knit_gvc_newnew(:,m,i+1))/2) *(knict_gvc_2_growth_log(:,m,i)-l_gvc_2_growth_log(:,m,i));
end
end

% labour reallocation factor
for i=1:12
for   m=1:1230
     l_2_log(m,i)=transpose((cs_kit_gvc_newnew(:,m,i)+cs_kit_gvc_newnew(:,m,i+1))/2+(cs_knit_gvc_newnew(:,m,i)+cs_knit_gvc_newnew(:,m,i+1))/2+(cs_l_gvc_newnew(:,m,i)+cs_l_gvc_newnew(:,m,i+1))/2) *l_gvc_2_growth_log(:,m,i);
end
end

for i=1:12
for   m=1:1230
     l_1_log(m,i)=transpose((1/(ones(1,1230)*l_gvc_2(:,m,i))).*l_gvc_2(:,m,i)) *l_gvc_2_growth_log(:,m,i);
end
end

l_3_log=l_2_log-l_1_log
tfp_2_log=fd_v_real_new_growth_log-l_1_log-ict_contribution_2_log-nict_contribution_2_log-l_3_log
