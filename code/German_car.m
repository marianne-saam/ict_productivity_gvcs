for i=1:12
nict_deepening_matrix(:,:,i)=((cs_knit_gvc_newnew(:,:,i)+cs_knit_gvc_newnew(:,:,i+1))/2).*knict_gvc_2_growth_log(:,:,i);
end

nict_deepening_matrix(isnan(nict_deepening_matrix))=0.00000000000000000001;
nict_deepening_matrix(~isfinite(nict_deepening_matrix))=0.00000000000000000001;
nict_deepening_matrix_9500_new=(nict_deepening_matrix(:,:,1)+nict_deepening_matrix(:,:,2)+nict_deepening_matrix(:,:,3)+nict_deepening_matrix(:,:,4)+nict_deepening_matrix(:,:,5))/5;
nict_deepening_matrix_0007_new=(nict_deepening_matrix(:,:,6)+nict_deepening_matrix(:,:,7)+nict_deepening_matrix(:,:,8)+nict_deepening_matrix(:,:,9)+nict_deepening_matrix(:,:,10)+nict_deepening_matrix(:,:,11)+nict_deepening_matrix(:,:,12))/7;

nict_deepening_9500_domestic=zeros(1230,1230);

for k=0:40
nict_deepening_9500_domestic(30*k+1:30*k+30,30*k+1:30*k+30)=nict_deepening_matrix_9500_new(30*k+1:30*k+30,30*k+1:30*k+30);
end

nict_deepening_0007_domestic=zeros(1230,1230);

for k=0:40
nict_deepening_0007_domestic(30*k+1:30*k+30,30*k+1:30*k+30)=nict_deepening_matrix_0007_new(30*k+1:30*k+30,30*k+1:30*k+30);
end

nict_deepening_9500_foreign=nict_deepening_matrix_9500_new-nict_deepening_9500_domestic;
nict_deepening_0007_foreign=nict_deepening_matrix_0007_new-nict_deepening_0007_domestic;

nict_deepening_9500_foreign_new_tr=nict_deepening_9500_foreign';
nict_deepening_0007_foreign_new_tr=nict_deepening_0007_foreign';

nict_deepening_9500_foreign_new_new=zeros(1230,4);
nict_deepening_0007_foreign_new_new=zeros(1230,4);
temp_9500=zeros(1230,4,41);

for i=1:41
temp_9500(:,:,i)=[nict_deepening_9500_foreign_new_tr(:,30*(i-1)+13)+nict_deepening_9500_foreign_new_tr(:,30*(i-1)+23)    sum(nict_deepening_9500_foreign_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(nict_deepening_9500_foreign_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(nict_deepening_9500_foreign_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+nict_deepening_9500_foreign_new_tr(:,30*(i-1)+22)+sum(nict_deepening_9500_foreign_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(nict_deepening_9500_foreign_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+nict_deepening_9500_foreign_new_tr(:,30*(i-1)+21)+sum(nict_deepening_9500_foreign_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
nict_deepening_9500_foreign_new_new=nict_deepening_9500_foreign_new_new+temp_9500(:,:,i);
i=i+1 ;
end

temp_0007=zeros(1230,4,41);
for i=1:41
temp_0007(:,:,i)=[nict_deepening_0007_foreign_new_tr(:,30*(i-1)+13)+nict_deepening_0007_foreign_new_tr(:,30*(i-1)+23)    sum(nict_deepening_0007_foreign_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(nict_deepening_0007_foreign_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(nict_deepening_0007_foreign_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+nict_deepening_0007_foreign_new_tr(:,30*(i-1)+22)+sum(nict_deepening_0007_foreign_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(nict_deepening_0007_foreign_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+nict_deepening_0007_foreign_new_tr(:,30*(i-1)+21)+sum(nict_deepening_0007_foreign_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
nict_deepening_0007_foreign_new_new=nict_deepening_0007_foreign_new_new+temp_0007(:,:,i);
i=i+1 ;
end

nict_deepening_9500_domestic_new_tr=nict_deepening_9500_domestic';
nict_deepening_0007_domestic_new_tr=nict_deepening_0007_domestic';
nict_deepening_9500_domestic_new_new=zeros(1230,4);
nict_deepening_0007_domestic_new_new=zeros(1230,4);

temp_d_9500=zeros(1230,4,41);
for i=1:41
temp_d_9500(:,:,i)=[nict_deepening_9500_domestic_new_tr(:,30*(i-1)+13)+nict_deepening_9500_domestic_new_tr(:,30*(i-1)+23)    sum(nict_deepening_9500_domestic_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(nict_deepening_9500_domestic_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(nict_deepening_9500_domestic_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+nict_deepening_9500_domestic_new_tr(:,30*(i-1)+22)+sum(nict_deepening_9500_domestic_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(nict_deepening_9500_domestic_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+nict_deepening_9500_domestic_new_tr(:,30*(i-1)+21)+sum(nict_deepening_9500_domestic_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
nict_deepening_9500_domestic_new_new=nict_deepening_9500_domestic_new_new+temp_d_9500(:,:,i);
i=i+1;
end
temp_d_0007=zeros(1230,4,41);
for i=1:41
temp_d_0007(:,:,i)=[nict_deepening_0007_domestic_new_tr(:,30*(i-1)+13)+nict_deepening_0007_domestic_new_tr(:,30*(i-1)+23)    sum(nict_deepening_0007_domestic_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(nict_deepening_0007_domestic_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(nict_deepening_0007_domestic_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+nict_deepening_0007_domestic_new_tr(:,30*(i-1)+22)+sum(nict_deepening_0007_domestic_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(nict_deepening_0007_domestic_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+nict_deepening_0007_domestic_new_tr(:,30*(i-1)+21)+sum(nict_deepening_0007_domestic_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
nict_deepening_0007_domestic_new_new=nict_deepening_0007_domestic_new_new+temp_d_0007(:,:,i);
i=i+1;
end



for i=1:12
ict_deepening_matrix(:,:,i)=((cs_kit_gvc_newnew(:,:,i)+cs_kit_gvc_newnew(:,:,i+1))/2).*kict_gvc_2_growth_log(:,:,i);
end

ict_deepening_matrix(isnan(ict_deepening_matrix))=0.00000000000000000001;
ict_deepening_matrix(~isfinite(ict_deepening_matrix))=0.00000000000000000001;
ict_deepening_matrix_9500_new=(ict_deepening_matrix(:,:,1)+ict_deepening_matrix(:,:,2)+ict_deepening_matrix(:,:,3)+ict_deepening_matrix(:,:,4)+ict_deepening_matrix(:,:,5))/5;
ict_deepening_matrix_0007_new=(ict_deepening_matrix(:,:,6)+ict_deepening_matrix(:,:,7)+ict_deepening_matrix(:,:,8)+ict_deepening_matrix(:,:,9)+ict_deepening_matrix(:,:,10)+ict_deepening_matrix(:,:,11)+ict_deepening_matrix(:,:,12))/7;

ict_deepening_9500_domestic=zeros(1230,1230);

for k=0:40
ict_deepening_9500_domestic(30*k+1:30*k+30,30*k+1:30*k+30)=ict_deepening_matrix_9500_new(30*k+1:30*k+30,30*k+1:30*k+30);
end

ict_deepening_0007_domestic=zeros(1230,1230);

for k=0:40
ict_deepening_0007_domestic(30*k+1:30*k+30,30*k+1:30*k+30)=ict_deepening_matrix_0007_new(30*k+1:30*k+30,30*k+1:30*k+30);
end

ict_deepening_9500_foreign=ict_deepening_matrix_9500_new-ict_deepening_9500_domestic;
ict_deepening_0007_foreign=ict_deepening_matrix_0007_new-ict_deepening_0007_domestic;

ict_deepening_9500_foreign_new_tr=ict_deepening_9500_foreign';
ict_deepening_0007_foreign_new_tr=ict_deepening_0007_foreign';

ict_deepening_9500_foreign_new_new=zeros(1230,4);
ict_deepening_0007_foreign_new_new=zeros(1230,4);
temp_9500=zeros(1230,4,41);



for i=1:41
temp_9500(:,:,i)=[ict_deepening_9500_foreign_new_tr(:,30*(i-1)+13)+ict_deepening_9500_foreign_new_tr(:,30*(i-1)+23)    sum(ict_deepening_9500_foreign_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(ict_deepening_9500_foreign_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(ict_deepening_9500_foreign_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+ict_deepening_9500_foreign_new_tr(:,30*(i-1)+22)+sum(ict_deepening_9500_foreign_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(ict_deepening_9500_foreign_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+ict_deepening_9500_foreign_new_tr(:,30*(i-1)+21)+sum(ict_deepening_9500_foreign_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
ict_deepening_9500_foreign_new_new=ict_deepening_9500_foreign_new_new+temp_9500(:,:,i);
i=i+1 ;
end

temp_0007=zeros(1230,4,41);
for i=1:41
temp_0007(:,:,i)=[ict_deepening_0007_foreign_new_tr(:,30*(i-1)+13)+ict_deepening_0007_foreign_new_tr(:,30*(i-1)+23)    sum(ict_deepening_0007_foreign_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(ict_deepening_0007_foreign_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(ict_deepening_0007_foreign_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+ict_deepening_0007_foreign_new_tr(:,30*(i-1)+22)+sum(ict_deepening_0007_foreign_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(ict_deepening_0007_foreign_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+ict_deepening_0007_foreign_new_tr(:,30*(i-1)+21)+sum(ict_deepening_0007_foreign_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
ict_deepening_0007_foreign_new_new=ict_deepening_0007_foreign_new_new+temp_0007(:,:,i);
i=i+1 ;
end

ict_deepening_9500_domestic_new_tr=ict_deepening_9500_domestic';
ict_deepening_0007_domestic_new_tr=ict_deepening_0007_domestic';
ict_deepening_9500_domestic_new_new=zeros(1230,4);
ict_deepening_0007_domestic_new_new=zeros(1230,4);

temp_d_9500=zeros(1230,4,41);
for i=1:41
temp_d_9500(:,:,i)=[ict_deepening_9500_domestic_new_tr(:,30*(i-1)+13)+ict_deepening_9500_domestic_new_tr(:,30*(i-1)+23)    sum(ict_deepening_9500_domestic_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(ict_deepening_9500_domestic_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(ict_deepening_9500_domestic_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+ict_deepening_9500_domestic_new_tr(:,30*(i-1)+22)+sum(ict_deepening_9500_domestic_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(ict_deepening_9500_domestic_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+ict_deepening_9500_domestic_new_tr(:,30*(i-1)+21)+sum(ict_deepening_9500_domestic_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
ict_deepening_9500_domestic_new_new=ict_deepening_9500_domestic_new_new+temp_d_9500(:,:,i);
i=i+1;
end
temp_d_0007=zeros(1230,4,41);
for i=1:41
temp_d_0007(:,:,i)=[ict_deepening_0007_domestic_new_tr(:,30*(i-1)+13)+ict_deepening_0007_domestic_new_tr(:,30*(i-1)+23)    sum(ict_deepening_0007_domestic_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(ict_deepening_0007_domestic_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(ict_deepening_0007_domestic_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+ict_deepening_0007_domestic_new_tr(:,30*(i-1)+22)+sum(ict_deepening_0007_domestic_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(ict_deepening_0007_domestic_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+ict_deepening_0007_domestic_new_tr(:,30*(i-1)+21)+sum(ict_deepening_0007_domestic_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
ict_deepening_0007_domestic_new_new=ict_deepening_0007_domestic_new_new+temp_d_0007(:,:,i);
i=i+1;
end





for i=1:12
l_2_log_matrix(:,:,i)=(cs_l_gvc_newnew(:,:,i)+cs_l_gvc_newnew(:,:,i+1))/2.*l_gvc_2_growth_log(:,:,i);
end

l_2_log_matrix(isnan(l_2_log_matrix))=0.00000000000000000001;
l_2_log_matrix(~isfinite(l_2_log_matrix))=0.00000000000000000001;
l_2_log_matrix_9500_new=(l_2_log_matrix(:,:,1)+l_2_log_matrix(:,:,2)+l_2_log_matrix(:,:,3)+l_2_log_matrix(:,:,4)+l_2_log_matrix(:,:,5))/5;
l_2_log_matrix_0007_new=(l_2_log_matrix(:,:,6)+l_2_log_matrix(:,:,7)+l_2_log_matrix(:,:,8)+l_2_log_matrix(:,:,9)+l_2_log_matrix(:,:,10)+l_2_log_matrix(:,:,11)+l_2_log_matrix(:,:,12))/7;

l_2_log_9500_domestic=zeros(1230,1230);

for k=0:40
l_2_log_9500_domestic(30*k+1:30*k+30,30*k+1:30*k+30)=l_2_log_matrix_9500_new(30*k+1:30*k+30,30*k+1:30*k+30);
end

l_2_log_0007_domestic=zeros(1230,1230);

for k=0:40
l_2_log_0007_domestic(30*k+1:30*k+30,30*k+1:30*k+30)=l_2_log_matrix_0007_new(30*k+1:30*k+30,30*k+1:30*k+30);
end

l_2_log_9500_foreign=l_2_log_matrix_9500_new-l_2_log_9500_domestic;
l_2_log_0007_foreign=l_2_log_matrix_0007_new-l_2_log_0007_domestic;

l_2_log_9500_foreign_new_tr=l_2_log_9500_foreign';
l_2_log_0007_foreign_new_tr=l_2_log_0007_foreign';

l_2_log_9500_foreign_new_new=zeros(1230,4);
l_2_log_0007_foreign_new_new=zeros(1230,4);
temp_9500=zeros(1230,4,41);



for i=1:41
temp_9500(:,:,i)=[l_2_log_9500_foreign_new_tr(:,30*(i-1)+13)+l_2_log_9500_foreign_new_tr(:,30*(i-1)+23)    sum(l_2_log_9500_foreign_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(l_2_log_9500_foreign_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(l_2_log_9500_foreign_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+l_2_log_9500_foreign_new_tr(:,30*(i-1)+22)+sum(l_2_log_9500_foreign_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(l_2_log_9500_foreign_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+l_2_log_9500_foreign_new_tr(:,30*(i-1)+21)+sum(l_2_log_9500_foreign_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
l_2_log_9500_foreign_new_new=l_2_log_9500_foreign_new_new+temp_9500(:,:,i);
i=i+1 ;
end

temp_0007=zeros(1230,4,41);
for i=1:41
temp_0007(:,:,i)=[l_2_log_0007_foreign_new_tr(:,30*(i-1)+13)+l_2_log_0007_foreign_new_tr(:,30*(i-1)+23)    sum(l_2_log_0007_foreign_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(l_2_log_0007_foreign_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(l_2_log_0007_foreign_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+l_2_log_0007_foreign_new_tr(:,30*(i-1)+22)+sum(l_2_log_0007_foreign_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(l_2_log_0007_foreign_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+l_2_log_0007_foreign_new_tr(:,30*(i-1)+21)+sum(l_2_log_0007_foreign_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
l_2_log_0007_foreign_new_new=l_2_log_0007_foreign_new_new+temp_0007(:,:,i);
i=i+1 ;
end

l_2_log_9500_domestic_new_tr=l_2_log_9500_domestic';
l_2_log_0007_domestic_new_tr=l_2_log_0007_domestic';
l_2_log_9500_domestic_new_new=zeros(1230,4);
l_2_log_0007_domestic_new_new=zeros(1230,4);

temp_d_9500=zeros(1230,4,41);
for i=1:41
temp_d_9500(:,:,i)=[l_2_log_9500_domestic_new_tr(:,30*(i-1)+13)+l_2_log_9500_domestic_new_tr(:,30*(i-1)+23)    sum(l_2_log_9500_domestic_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(l_2_log_9500_domestic_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(l_2_log_9500_domestic_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+l_2_log_9500_domestic_new_tr(:,30*(i-1)+22)+sum(l_2_log_9500_domestic_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(l_2_log_9500_domestic_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+l_2_log_9500_domestic_new_tr(:,30*(i-1)+21)+sum(l_2_log_9500_domestic_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
l_2_log_9500_domestic_new_new=l_2_log_9500_domestic_new_new+temp_d_9500(:,:,i);
i=i+1;
end
temp_d_0007=zeros(1230,4,41);
for i=1:41
temp_d_0007(:,:,i)=[l_2_log_0007_domestic_new_tr(:,30*(i-1)+13)+l_2_log_0007_domestic_new_tr(:,30*(i-1)+23)    sum(l_2_log_0007_domestic_new_tr(:,30*(i-1)+1:30*(i-1)+12),2)+sum(l_2_log_0007_domestic_new_tr(:,30*(i-1)+14:30*(i-1)+15),2)   sum(l_2_log_0007_domestic_new_tr(:,30*(i-1)+18:30*(i-1)+20),2)+l_2_log_0007_domestic_new_tr(:,30*(i-1)+22)+sum(l_2_log_0007_domestic_new_tr(:,30*(i-1)+24:30*(i-1)+26),2)      sum(l_2_log_0007_domestic_new_tr(:,30*(i-1)+27:30*(i-1)+30),2)+l_2_log_0007_domestic_new_tr(:,30*(i-1)+21)+sum(l_2_log_0007_domestic_new_tr(:,30*(i-1)+16:30*(i-1)+17),2) ];
l_2_log_0007_domestic_new_new=l_2_log_0007_domestic_new_new+temp_d_0007(:,:,i);
i=i+1;
end

cd ..\output
xlswrite('nict_deepening_9500_domestic.xlsx',nict_deepening_9500_domestic_new_new)
xlswrite('nict_deepening_0007_domestic.xlsx',nict_deepening_0007_domestic_new_new)
xlswrite('nict_deepening_0007_foreign.xlsx',nict_deepening_0007_foreign_new_new)
xlswrite('nict_deepening_9500_foreign.xlsx',nict_deepening_9500_foreign_new_new)

xlswrite('ict_deepening_9500_domestic.xlsx',ict_deepening_9500_domestic_new_new)
xlswrite('ict_deepening_0007_domestic.xlsx',ict_deepening_0007_domestic_new_new)
xlswrite('ict_deepening_0007_foreign.xlsx',ict_deepening_0007_foreign_new_new)
xlswrite('ict_deepening_9500_foreign.xlsx',ict_deepening_9500_foreign_new_new)

xlswrite('l_2_log_9500_domestic.xlsx',l_2_log_9500_domestic_new_new)
xlswrite('l_2_log_0007_domestic.xlsx',l_2_log_0007_domestic_new_new)
xlswrite('l_2_log_9500_foreign.xlsx',l_2_log_9500_foreign_new_new)
xlswrite('l_2_log_0007_foreign.xlsx',l_2_log_0007_foreign_new_new)


