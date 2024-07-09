for i=1:12
   ict_contribution_matrix(:,:,i)=((cs_kit_gvc_newnew(:,:,i)+cs_kit_gvc_newnew(:,:,i+1))/2).*kict_gvc_growth_log(:,:,i);
end

for i=1:12
   nict_contribution_matrix(:,:,i)=((cs_knit_gvc_newnew(:,:,i)+cs_knit_gvc_newnew(:,:,i+1))/2).*knict_gvc_growth_log(:,:,i);
end

for i=1:12
   l_contribution_matrix(:,:,i)=((cs_l_gvc_newnew(:,:,i)+cs_l_gvc_newnew(:,:,i+1))/2).*(l_gvc_growth_log(:,:,i));
end

tfp_matrix=-ict_contribution_matrix-nict_contribution_matrix-l_contribution_matrix;
for i=1:12
    for m=0:40
        icthardware_matrix(m+1,:,i)=tfp_matrix(30*m+13,:,i);
        posttelecomm_matrix(m+1,:,i)=tfp_matrix(30*m+23,:,i);
    end
end


ict_matrix_selected=icthardware_matrix+posttelecomm_matrix;
ict_matrix_selected_9500= (ict_matrix_selected(:,:,1)+ ict_matrix_selected(:,:,2)+ ict_matrix_selected(:,:,3)+ ict_matrix_selected(:,:,4)+ ict_matrix_selected(:,:,5))/5;
ict_matrix_selected_0007= (ict_matrix_selected(:,:,6)+ ict_matrix_selected(:,:,7)+ ict_matrix_selected(:,:,8)+ ict_matrix_selected(:,:,9)+ ict_matrix_selected(:,:,10)+ ict_matrix_selected(:,:,11)+ ict_matrix_selected(:,:,12))/7;
ict_matrix_selected_9500(isnan(ict_matrix_selected_9500))=0;
ict_matrix_selected_9500(~isfinite(ict_matrix_selected_9500))=0;
ict_matrix_selected_0007(isnan(ict_matrix_selected_0007))=0;
ict_matrix_selected_0007(~isfinite(ict_matrix_selected_0007))=0;

ict_matrix_selected_9500_new=sum(ict_matrix_selected_9500',2);
ict_matrix_selected_0007_new=sum(ict_matrix_selected_0007',2);

% country level

selected_country_ict_matrix_selected_9500_new_component=ict_matrix_selected_9500_new.*repmat(fd_new_new_9500,1,1);
selected_country_ict_matrix_selected_0007_new_component=ict_matrix_selected_0007_new.*repmat(fd_new_new_0007,1,1);

for m=0: 40
   selected_fd_9500_sum_full(m+1,:)=sum(fd_new_new_9500(30*m+1:30*m+30,:));
   selected_fd_0007_sum_full(m+1,:)=sum(fd_new_new_0007(30*m+1:30*m+30,:));
end

for m=0:40
selected_country_ict_matrix_selected_9500_new_temp(m+1,:)=sum(selected_country_ict_matrix_selected_9500_new_component(30*m+1:30*m+30,:));
selected_country_ict_matrix_selected_0007_new_temp(m+1,:)=sum(selected_country_ict_matrix_selected_0007_new_component(30*m+1:30*m+30,:));
end
%
country_ict_matrix_selected_9500_new=selected_country_ict_matrix_selected_9500_new_temp./repmat(selected_fd_9500_sum_full,1,1);
country_ict_matrix_selected_0007_new=selected_country_ict_matrix_selected_0007_new_temp./repmat(selected_fd_0007_sum_full,1,1);


country_ict_matrix_selected_9500_new_sum=sum(country_ict_matrix_selected_9500_new,2)
country_ict_matrix_selected_0007_new_sum=sum(country_ict_matrix_selected_0007_new,2)


% ict sector
for m=0:40
  selected_ict_matrix_selected_9500_new(2*m+1:2*m+2,:)= ict_matrix_selected_9500_new([30*m+13,30*m+23],:)
  selected_ict_matrix_selected_0007_new(2*m+1:2*m+2,:)= ict_matrix_selected_0007_new([30*m+13,30*m+23],:) 
end

selected_ict_ict_matrix_selected_9500_new_component=selected_ict_matrix_selected_9500_new.*repmat(selected_fd_ict_9500,1,1);
selected_ict_ict_matrix_selected_0007_new_component=selected_ict_matrix_selected_0007_new.*repmat(selected_fd_ict_0007,1,1);

for m=0:40
selected_ict_ict_matrix_selected_9500_new_component_temp(m+1,:)=sum(selected_ict_ict_matrix_selected_9500_new_component(2*m+1:2*m+2,:));
selected_ict_ict_matrix_selected_0007_new_component_temp(m+1,:)=sum(selected_ict_ict_matrix_selected_0007_new_component(2*m+1:2*m+2,:));
end

ict_ict_matrix_selected_9500_new=selected_ict_ict_matrix_selected_9500_new_component_temp./repmat(selected_fd_ict_9500_sum,1,1)
ict_ict_matrix_selected_0007_new=selected_ict_ict_matrix_selected_0007_new_component_temp./repmat(selected_fd_ict_0007_sum,1,1)




% non-ict good

for m=0:40
  selected_nonictgoods_ict_matrix_selected_9500_new(11*m+1:11*m+11,:)= ict_matrix_selected_9500_new([30*m+1,30*m+3:30*m+4,30*m+6:30*m+9,30*m+11:30*m+12,30*m+14:30*m+15],:);
  selected_nonictgoods_ict_matrix_selected_0007_new(11*m+1:11*m+11,:)= ict_matrix_selected_0007_new([30*m+1,30*m+3:30*m+4,30*m+6:30*m+9,30*m+11:30*m+12,30*m+14:30*m+15],:);
end

selected_nonictgoods_ict_matrix_selected_9500_new_component=selected_nonictgoods_ict_matrix_selected_9500_new.*repmat(selected_fd_nonictgood_9500,1,1);
selected_nonictgoods_ict_matrix_selected_0007_new_component=selected_nonictgoods_ict_matrix_selected_0007_new.*repmat(selected_fd_nonictgood_0007,1,1);

for m=0:40
selected_nonictgoods_ictindustry_9500_component_temp_new(m+1,:)=sum(selected_nonictgoods_ict_matrix_selected_9500_new_component(11*m+1:11*m+11,:));
selected_nonictgoods_ictindustry_0007_component_temp_new(m+1,:)=sum(selected_nonictgoods_ict_matrix_selected_0007_new_component(11*m+1:11*m+11,:));
end

nonictgoods_ict_matrix_selected_9500_new=selected_nonictgoods_ictindustry_9500_component_temp_new./repmat(selected_fd_nonictgood_9500_sum,1,1);
nonictgoods_ict_matrix_selected_0007_new=selected_nonictgoods_ictindustry_0007_component_temp_new./repmat(selected_fd_nonictgood_0007_sum,1,1);


% d. and b. services

for m=0:40
  selected_businessservice_ict_matrix_selected_9500_new(6*m+1:6*m+6,:)= ict_matrix_selected_9500_new([30*m+18:30*m+20,30*m+22,30*m+24,30*m+26],:);
  selected_businessservice_ict_matrix_selected_0007_new(6*m+1:6*m+6,:)= ict_matrix_selected_0007_new([30*m+18:30*m+20,30*m+22,30*m+24,30*m+26],:);
end

clear selected_fd_businessservice_9500
clear selected_fd_businessservice_0007
for m=0: 40
  selected_fd_businessservice_9500(6*m+1:6*m+6,:)= selected_fd_9500([27*m+15:27*m+17,27*m+19,27*m+21,27*m+23],:);
  selected_fd_businessservice_0007(6*m+1:6*m+6,:)= selected_fd_0007([27*m+15:27*m+17,27*m+19,27*m+21,27*m+23],:);
end

selected_businessservice_ict_matrix_selected_9500_new_component=selected_businessservice_ict_matrix_selected_9500_new.*repmat(selected_fd_businessservice_9500,1,1);
selected_businessservice_ict_matrix_selected_0007_new_component=selected_businessservice_ict_matrix_selected_0007_new.*repmat(selected_fd_businessservice_0007,1,1);

for m=0:40
selected_businessservice_ictindustry_9500_component_temp_new(m+1,:)=sum(selected_businessservice_ict_matrix_selected_9500_new_component(6*m+1:6*m+6,:))
selected_businessservice_ictindustry_0007_component_temp_new(m+1,:)=sum(selected_businessservice_ict_matrix_selected_0007_new_component(6*m+1:6*m+6,:))
end
businessservice_ict_matrix_selected_9500_new=selected_businessservice_ictindustry_9500_component_temp_new./repmat(selected_fd_businessservice_9500_sum,1,1)
businessservice_ict_matrix_selected_0007_new=selected_businessservice_ictindustry_0007_component_temp_new./repmat(selected_fd_businessservice_0007_sum,1,1)


%  other services

for m=0:40
  selected_otherservices_ict_matrix_selected_9500_new(8*m+1:8*m+8,:)= ict_matrix_selected_9500_new([30*m+16:30*m+17,30*m+21,30*m+25,30*m+27:30*m+30],:);
  selected_otherservices_ict_matrix_selected_0007_new(8*m+1:8*m+8,:)= ict_matrix_selected_0007_new([30*m+16:30*m+17,30*m+21,30*m+25,30*m+27:30*m+30],:);
end
clear selected_fd_othersservice_9500
clear selected_fd_othersservice_0007
for m=0: 40
  selected_fd_othersservice_9500(8*m+1:8*m+8,:)= selected_fd_9500([27*m+13:27*m+14,27*m+18,27*m+22,27*m+24:27*m+27],:);
  selected_fd_othersservice_0007(8*m+1:8*m+8,:)= selected_fd_0007([27*m+13:27*m+14,27*m+18,27*m+22,27*m+24:27*m+27],:);
end
selected_otherservices_ict_matrix_selected_9500_new_component=selected_otherservices_ict_matrix_selected_9500_new.*repmat(selected_fd_othersservice_9500,1,1);
selected_otherservices_ict_matrix_selected_0007_new_component=selected_otherservices_ict_matrix_selected_0007_new.*repmat(selected_fd_othersservice_0007,1,1);

for m=0:40
selected_otherservices_ictindustry_9500_component_temp_new(m+1,:)=sum(selected_otherservices_ict_matrix_selected_9500_new_component(8*m+1:8*m+8,:));
selected_otherservices_ictindustry_0007_component_temp_new(m+1,:)=sum(selected_otherservices_ict_matrix_selected_0007_new_component(8*m+1:8*m+8,:));
end
otherservices_ict_matrix_selected_9500_new=selected_otherservices_ictindustry_9500_component_temp_new./repmat(selected_fd_othersservice_9500_sum,1,1);
otherservices_ict_matrix_selected_0007_new=selected_otherservices_ictindustry_0007_component_temp_new./repmat(selected_fd_othersservice_0007_sum,1,1);


result_ict_matrix_selected_9500_new_new=zeros(41,5)
result_ict_matrix_selected_9500_new_new(:,1)=ict_ict_matrix_selected_9500_new
result_ict_matrix_selected_9500_new_new(:,2)=nonictgoods_ict_matrix_selected_9500_new
result_ict_matrix_selected_9500_new_new(:,3)=businessservice_ict_matrix_selected_9500_new
result_ict_matrix_selected_9500_new_new(:,4)=otherservices_ict_matrix_selected_9500_new
result_ict_matrix_selected_9500_new_new(:,5)=country_ict_matrix_selected_9500_new
result_ict_matrix_selected_0007_new_new=zeros(41,5)
result_ict_matrix_selected_0007_new_new(:,1)=ict_ict_matrix_selected_0007_new
result_ict_matrix_selected_0007_new_new(:,2)=nonictgoods_ict_matrix_selected_0007_new
result_ict_matrix_selected_0007_new_new(:,3)=businessservice_ict_matrix_selected_0007_new
result_ict_matrix_selected_0007_new_new(:,4)=otherservices_ict_matrix_selected_0007_new
result_ict_matrix_selected_0007_new_new(:,5)=country_ict_matrix_selected_0007_new

cd ..\output
xlswrite('tfp_9500_new.xlsx',result_ict_matrix_selected_9500_new_new)
xlswrite('tfp_0007_new.xlsx',result_ict_matrix_selected_0007_new_new)
