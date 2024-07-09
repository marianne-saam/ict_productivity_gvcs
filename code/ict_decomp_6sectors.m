for i=1:12
ict_deepening_matrix(:,:,i)=((cs_kit_gvc_newnew(:,:,i)+cs_kit_gvc_newnew(:,:,i+1))/2).*(kict_gvc_2_growth_log(:,:,i)-l_gvc_2_growth_log(:,:,i));
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



% country level

for m=0:40
  selected_country_deepening_9500_foreign_new_new(27*m+1:27*m+27,:)= ict_deepening_9500_foreign_new_new([30*m+1,   30*m+3:30*m+4,    30*m+6:30*m+9,    30*m+11:30*m+30]  ,:)
  selected_country_deepening_0007_foreign_new_new(27*m+1:27*m+27,:)= ict_deepening_0007_foreign_new_new([30*m+1,   30*m+3:30*m+4,    30*m+6:30*m+9,    30*m+11:30*m+30]  ,:) 
end

selected_country_ict_deepening_9500_foreign_new_new_component=selected_country_deepening_9500_foreign_new_new.*repmat(selected_fd_9500,1,4)
selected_country_ict_deepening_0007_foreign_new_new_component=selected_country_deepening_0007_foreign_new_new.*repmat(selected_fd_0007,1,4)

for m=0:40
selected_country_ict_deepening_9500_foreign_temp(m+1,:)=sum(selected_country_ict_deepening_9500_foreign_new_new_component(27*m+1:27*m+27,:))
selected_country_ict_deepening_0007_foreign_temp(m+1,:)=sum(selected_country_ict_deepening_0007_foreign_new_new_component(27*m+1:27*m+27,:))
end


country_country_deepening_9500_foreign_new_new=selected_country_ict_deepening_9500_foreign_temp./repmat(selected_fd_9500_sum,1,4)
country_country_deepening_0007_foreign_new_new=selected_country_ict_deepening_0007_foreign_temp./repmat(selected_fd_0007_sum,1,4)


% ict sector
for m=0:40
  selected_ict_deepening_9500_foreign_new_new(2*m+1:2*m+2,:)= ict_deepening_9500_foreign_new_new([30*m+13,30*m+23],:)
  selected_ict_deepening_0007_foreign_new_new(2*m+1:2*m+2,:)= ict_deepening_0007_foreign_new_new([30*m+13,30*m+23],:) 
end

selected_ict_ict_deepening_9500_foreign_new_new_component=selected_ict_deepening_9500_foreign_new_new.*repmat(selected_fd_ict_9500,1,4)
selected_ict_ict_deepening_0007_foreign_new_new_component=selected_ict_deepening_0007_foreign_new_new.*repmat(selected_fd_ict_0007,1,4)

for m=0:40
selected_ict_ict_deepening_9500_foreign_new_new_component_temp(m+1,:)=sum(selected_ict_ict_deepening_9500_foreign_new_new_component(2*m+1:2*m+2,:))
selected_ict_ict_deepening_0007_foreign_new_new_component_temp(m+1,:)=sum(selected_ict_ict_deepening_0007_foreign_new_new_component(2*m+1:2*m+2,:))
end

ict_ict_deepening_9500_foreign_new_new=selected_ict_ict_deepening_9500_foreign_new_new_component_temp./repmat(selected_fd_ict_9500_sum,1,4)
ict_ict_deepening_0007_foreign_new_new=selected_ict_ict_deepening_0007_foreign_new_new_component_temp./repmat(selected_fd_ict_0007_sum,1,4)

% non-ict good

for m=0:40
  selected_nictgoods_ict_deepening_9500_foreign_new_new(11*m+1:11*m+11,:)= ict_deepening_9500_foreign_new_new([30*m+1,30*m+3:30*m+4,30*m+6:30*m+9,30*m+11:30*m+12,30*m+14:30*m+15],:)
  selected_nictgoods_ict_deepening_0007_foreign_new_new(11*m+1:11*m+11,:)= ict_deepening_0007_foreign_new_new([30*m+1,30*m+3:30*m+4,30*m+6:30*m+9,30*m+11:30*m+12,30*m+14:30*m+15],:) 
end

selected_ngoods_ict_deepening_9500_foreign_new_new_component=selected_nictgoods_ict_deepening_9500_foreign_new_new.*repmat(selected_fd_nonictgood_9500,1,4)
selected_ngoods_ict_deepening_0007_foreign_new_new_component=selected_nictgoods_ict_deepening_0007_foreign_new_new.*repmat(selected_fd_nonictgood_0007,1,4)

for m=0:40
selected_ngoods_ict_deepening_9500_component_temp_new(m+1,:)=sum(selected_ngoods_ict_deepening_9500_foreign_new_new_component(11*m+1:11*m+11,:))
selected_ngoods_ict_deepening_0007_component_temp_new(m+1,:)=sum(selected_ngoods_ict_deepening_0007_foreign_new_new_component(11*m+1:11*m+11,:))
end

nictgoods_ict_deepening_9500_foreign_new_new=selected_ngoods_ict_deepening_9500_component_temp_new./repmat(selected_fd_nonictgood_9500_sum,1,4)
nictgoods_ict_deepening_0007_foreign_new_new=selected_ngoods_ict_deepening_0007_component_temp_new./repmat(selected_fd_nonictgood_0007_sum,1,4)

% d. and b. services

for m=0:40
  selected_businessservice_ict_deepening_9500_foreign_new_new(6*m+1:6*m+6,:)= ict_deepening_9500_foreign_new_new([30*m+18:30*m+20,30*m+22,30*m+24,30*m+26],:)
  selected_businessservice_ict_deepening_0007_foreign_new_new(6*m+1:6*m+6,:)= ict_deepening_0007_foreign_new_new([30*m+18:30*m+20,30*m+22,30*m+24,30*m+26],:)
end

selected_businessservice_ict_deepening_9500_foreign_component=selected_businessservice_ict_deepening_9500_foreign_new_new.*repmat(selected_fd_businessservice_9500,1,4)
selected_businessservice_ict_deepening_0007_foreign_component=selected_businessservice_ict_deepening_0007_foreign_new_new.*repmat(selected_fd_businessservice_0007,1,4)

for m=0:40
selected_businessservice_ict_deepening_9500_component_temp_new(m+1,:)=sum(selected_businessservice_ict_deepening_9500_foreign_component(6*m+1:6*m+6,:))
selected_businessservice_ict_deepening_0007_component_temp_new(m+1,:)=sum(selected_businessservice_ict_deepening_0007_foreign_component(6*m+1:6*m+6,:))
end

businessservice_ict_deepening_9500_foreign_new_new=selected_businessservice_ict_deepening_9500_component_temp_new./repmat(selected_fd_businessservice_9500_sum,1,4)
businessservice_ict_deepening_0007_foreign_new_new=selected_businessservice_ict_deepening_0007_component_temp_new./repmat(selected_fd_businessservice_0007_sum,1,4)


% other services

for m=0:40
  selected_otherservicesict_deepening_9500_foreign_new_new(8*m+1:8*m+8,:)= ict_deepening_9500_foreign_new_new([30*m+16:30*m+17,30*m+21,30*m+25,30*m+27:30*m+30],:)
  selected_otherservicesict_deepening_0007_foreign_new_new(8*m+1:8*m+8,:)= ict_deepening_0007_foreign_new_new([30*m+16:30*m+17,30*m+21,30*m+25,30*m+27:30*m+30],:)
end

selected_otherservicesict_deepening_9500_foreigncomponent=selected_otherservicesict_deepening_9500_foreign_new_new.*repmat(selected_fd_othersservice_9500,1,4)
selected_otherservicesict_deepening_0007_foreigncomponent=selected_otherservicesict_deepening_0007_foreign_new_new.*repmat(selected_fd_othersservice_0007,1,4)

for m=0:40
selected_otherservicesict_deepening_9500_component_temp_new(m+1,:)=sum(selected_otherservicesict_deepening_9500_foreigncomponent(8*m+1:8*m+8,:))
selected_otherservicesict_deepening_0007_component_temp_new(m+1,:)=sum(selected_otherservicesict_deepening_0007_foreigncomponent(8*m+1:8*m+8,:))
end
otherservicesict_deepening_9500_foreign_new_new=selected_otherservicesict_deepening_9500_component_temp_new./repmat(selected_fd_othersservice_9500_sum,1,4)
otherservicesict_deepening_0007_foreign_new_new=selected_otherservicesict_deepening_0007_component_temp_new./repmat(selected_fd_othersservice_0007_sum,1,4)


result_ict_deepening_9500_foreign=zeros(205,4)
for i=1:41
     result_ict_deepening_9500_foreign(5*(i-1)+1,:)=ict_ict_deepening_9500_foreign_new_new(i,:);
    result_ict_deepening_9500_foreign(5*(i-1)+2,:)=nictgoods_ict_deepening_9500_foreign_new_new(i,:);
    result_ict_deepening_9500_foreign(5*(i-1)+3,:)=businessservice_ict_deepening_9500_foreign_new_new(i,:);
    result_ict_deepening_9500_foreign(5*(i-1)+4,:)=otherservicesict_deepening_9500_foreign_new_new(i,:);
     result_ict_deepening_9500_foreign(5*(i-1)+5,:)=country_country_deepening_9500_foreign_new_new(i,:);
end

result_ict_deepening_0007_foreign=zeros(205,4)
for i=1:41
     result_ict_deepening_0007_foreign(5*(i-1)+1,:)=ict_ict_deepening_0007_foreign_new_new(i,:);
     result_ict_deepening_0007_foreign(5*(i-1)+2,:)=nictgoods_ict_deepening_0007_foreign_new_new(i,:);
     result_ict_deepening_0007_foreign(5*(i-1)+3,:)=businessservice_ict_deepening_0007_foreign_new_new(i,:);
     result_ict_deepening_0007_foreign(5*(i-1)+4,:)=otherservicesict_deepening_0007_foreign_new_new(i,:);
     result_ict_deepening_0007_foreign(5*(i-1)+5,:)=country_country_deepening_0007_foreign_new_new(i,:);
end

cd ..\output
xlswrite('result_ict_deepening_9500_foreign.xlsx',result_ict_deepening_9500_foreign)
xlswrite('result_ict_deepening_0007_foreign.xlsx',result_ict_deepening_0007_foreign)



% country level
for i=0:40
  selected_country_deepening_9500_domestic_new_new(27*i+1:27*i+27,:)= ict_deepening_9500_domestic_new_new([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:)
  selected_country_deepening_0007_domestic_new_new(27*i+1:27*i+27,:)= ict_deepening_0007_domestic_new_new([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:) 
end

selected_country_ict_deepening_9500_domestic_new_new_component=selected_country_deepening_9500_domestic_new_new.*repmat(selected_fd_9500,1,4)
selected_country_ict_deepening_0007_domestic_new_new_component=selected_country_deepening_0007_domestic_new_new.*repmat(selected_fd_0007,1,4)

for m=0:40
selected_country_ict_deepening_9500_domestic_temp(m+1,:)=sum(selected_country_ict_deepening_9500_domestic_new_new_component(27*m+1:27*m+27,:))
selected_country_ict_deepening_0007_domestic_temp(m+1,:)=sum(selected_country_ict_deepening_0007_domestic_new_new_component(27*m+1:27*m+27,:))
end
country_country_deepening_9500_domestic_new_new=selected_country_ict_deepening_9500_domestic_temp./repmat(selected_fd_9500_sum,1,4)
country_country_deepening_0007_domestic_new_new=selected_country_ict_deepening_0007_domestic_temp./repmat(selected_fd_0007_sum,1,4)



% ict sector
for m=0:40
  selected_ict_deepening_9500_domestic_new_new(2*m+1:2*m+2,:)= ict_deepening_9500_domestic_new_new([30*m+13,30*m+23],:)
  selected_ict_deepening_0007_domestic_new_new(2*m+1:2*m+2,:)= ict_deepening_0007_domestic_new_new([30*m+13,30*m+23],:) 
end

selected_ict_ict_deepening_9500_domestic_new_new_component=selected_ict_deepening_9500_domestic_new_new.*repmat(selected_fd_ict_9500,1,4)
selected_ict_ict_deepening_0007_domestic_new_new_component=selected_ict_deepening_0007_domestic_new_new.*repmat(selected_fd_ict_0007,1,4)

for m=0:40
selected_ict_ict_deepening_9500_domestic_new_new_component_temp(m+1,:)=sum(selected_ict_ict_deepening_9500_domestic_new_new_component(2*m+1:2*m+2,:))
selected_ict_ict_deepening_0007_domestic_new_new_component_temp(m+1,:)=sum(selected_ict_ict_deepening_0007_domestic_new_new_component(2*m+1:2*m+2,:))
end

ict_ict_deepening_9500_domestic_new_new=selected_ict_ict_deepening_9500_domestic_new_new_component_temp./repmat(selected_fd_ict_9500_sum,1,4)
ict_ict_deepening_0007_domestic_new_new=selected_ict_ict_deepening_0007_domestic_new_new_component_temp./repmat(selected_fd_ict_0007_sum,1,4)

% non-ict good
for m=0:40
  selected_nictgoods_ict_deepening_9500_domestic_new_new(11*m+1:11*m+11,:)= ict_deepening_9500_domestic_new_new([30*m+1,30*m+3:30*m+4,30*m+6:30*m+9,30*m+11:30*m+12,30*m+14:30*m+15],:)
  selected_nictgoods_ict_deepening_0007_domestic_new_new(11*m+1:11*m+11,:)= ict_deepening_0007_domestic_new_new([30*m+1,30*m+3:30*m+4,30*m+6:30*m+9,30*m+11:30*m+12,30*m+14:30*m+15],:) 
end

selected_ngoods_ict_deepening_9500_domestic_new_new_component=selected_nictgoods_ict_deepening_9500_domestic_new_new.*repmat(selected_fd_nonictgood_9500,1,4)
selected_ngoods_ict_deepening_0007_domestic_new_new_component=selected_nictgoods_ict_deepening_0007_domestic_new_new.*repmat(selected_fd_nonictgood_0007,1,4)

for m=0:40
selected_ngoods_ict_deepening_9500_component_temp_new(m+1,:)=sum(selected_ngoods_ict_deepening_9500_domestic_new_new_component(11*m+1:11*m+11,:))
selected_ngoods_ict_deepening_0007_component_temp_new(m+1,:)=sum(selected_ngoods_ict_deepening_0007_domestic_new_new_component(11*m+1:11*m+11,:))
end

nictgoods_ict_deepening_9500_domestic_new_new=selected_ngoods_ict_deepening_9500_component_temp_new./repmat(selected_fd_nonictgood_9500_sum,1,4)
nictgoods_ict_deepening_0007_domestic_new_new=selected_ngoods_ict_deepening_0007_component_temp_new./repmat(selected_fd_nonictgood_0007_sum,1,4)

% d. and b. services

for m=0:40
  selected_businessservice_ict_deepening_9500_domestic_new_new(6*m+1:6*m+6,:)= ict_deepening_9500_domestic_new_new([30*m+18:30*m+20,30*m+22,30*m+24,30*m+26],:)
  selected_businessservice_ict_deepening_0007_domestic_new_new(6*m+1:6*m+6,:)= ict_deepening_0007_domestic_new_new([30*m+18:30*m+20,30*m+22,30*m+24,30*m+26],:)
end

selected_businessservice_ict_deepening_9500_domestic_component=selected_businessservice_ict_deepening_9500_domestic_new_new.*repmat(selected_fd_businessservice_9500,1,4)
selected_businessservice_ict_deepening_0007_domestic_component=selected_businessservice_ict_deepening_0007_domestic_new_new.*repmat(selected_fd_businessservice_0007,1,4)

for m=0:40
selected_businessservice_ict_deepening_9500_component_temp_new(m+1,:)=sum(selected_businessservice_ict_deepening_9500_domestic_component(6*m+1:6*m+6,:))
selected_businessservice_ict_deepening_0007_component_temp_new(m+1,:)=sum(selected_businessservice_ict_deepening_0007_domestic_component(6*m+1:6*m+6,:))
end

businessservice_ict_deepening_9500_domestic_new_new=selected_businessservice_ict_deepening_9500_component_temp_new./repmat(selected_fd_businessservice_9500_sum,1,4)
businessservice_ict_deepening_0007_domestic_new_new=selected_businessservice_ict_deepening_0007_component_temp_new./repmat(selected_fd_businessservice_0007_sum,1,4)


% other services

for m=0:40
  selected_otherservicesict_deepening_9500_domestic_new_new(8*m+1:8*m+8,:)= ict_deepening_9500_domestic_new_new([30*m+16:30*m+17,30*m+21,30*m+25,30*m+27:30*m+30],:)
  selected_otherservicesict_deepening_0007_domestic_new_new(8*m+1:8*m+8,:)= ict_deepening_0007_domestic_new_new([30*m+16:30*m+17,30*m+21,30*m+25,30*m+27:30*m+30],:)
end

selected_otherservicesict_deepening_9500_domesticcomponent=selected_otherservicesict_deepening_9500_domestic_new_new.*repmat(selected_fd_othersservice_9500,1,4)
selected_otherservicesict_deepening_0007_domesticcomponent=selected_otherservicesict_deepening_0007_domestic_new_new.*repmat(selected_fd_othersservice_0007,1,4)

for m=0:40
selected_otherservicesict_deepening_9500_component_temp_new(m+1,:)=sum(selected_otherservicesict_deepening_9500_domesticcomponent(8*m+1:8*m+8,:))
selected_otherservicesict_deepening_0007_component_temp_new(m+1,:)=sum(selected_otherservicesict_deepening_0007_domesticcomponent(8*m+1:8*m+8,:))
end
otherservicesict_deepening_9500_domestic_new_new=selected_otherservicesict_deepening_9500_component_temp_new./repmat(selected_fd_othersservice_9500_sum,1,4)
otherservicesict_deepening_0007_domestic_new_new=selected_otherservicesict_deepening_0007_component_temp_new./repmat(selected_fd_othersservice_0007_sum,1,4)


result_ict_deepening_9500_domestic=zeros(205,4)
for i=1:41
    result_ict_deepening_9500_domestic(5*(i-1)+1,:)=ict_ict_deepening_9500_domestic_new_new(i,:);
    result_ict_deepening_9500_domestic(5*(i-1)+2,:)=nictgoods_ict_deepening_9500_domestic_new_new(i,:);
    result_ict_deepening_9500_domestic(5*(i-1)+3,:)=businessservice_ict_deepening_9500_domestic_new_new(i,:);
    result_ict_deepening_9500_domestic(5*(i-1)+4,:)=otherservicesict_deepening_9500_domestic_new_new(i,:);
    result_ict_deepening_9500_domestic(5*(i-1)+5,:)=country_country_deepening_9500_domestic_new_new(i,:);
end

result_ict_deepening_0007_domestic=zeros(205,4)
for i=1:41
    result_ict_deepening_0007_domestic(5*(i-1)+1,:)=ict_ict_deepening_0007_domestic_new_new(i,:);
    result_ict_deepening_0007_domestic(5*(i-1)+2,:)=nictgoods_ict_deepening_0007_domestic_new_new(i,:);
    result_ict_deepening_0007_domestic(5*(i-1)+3,:)=businessservice_ict_deepening_0007_domestic_new_new(i,:);
    result_ict_deepening_0007_domestic(5*(i-1)+4,:)=otherservicesict_deepening_0007_domestic_new_new(i,:);
    result_ict_deepening_0007_domestic(5*(i-1)+5,:)=country_country_deepening_0007_domestic_new_new(i,:);
end


xlswrite('result_ict_deepening_9500_domestic.xlsx',result_ict_deepening_9500_domestic)
xlswrite('result_ict_deepening_0007_domestic.xlsx',result_ict_deepening_0007_domestic)


















































