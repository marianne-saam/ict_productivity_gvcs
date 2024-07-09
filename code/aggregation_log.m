cd '..\data\wiod'
for year=1:13
    WholeFile=xlsread(['',num2str(year+1994),'.xlsx'], 'E7:BKF1449');  %Read the I-O table 
    FinalDemand_detail=WholeFile(1:1435,1436:1640); %select the final demand matrix
    fd_v_1(:,year)=FinalDemand_detail*ones(205,1);  %sum over the final demand categorie
    fc_v_1(:,year)=FinalDemand_detail(:,1:5:end)*ones(41,1); 
end

for m=1:13
fd_v_1_tm=transpose(fd_v_1(:,m));
for i= 0:40;
fd_v_1_tm_temp1 = [fd_v_1_tm(1,35*i+1:35*i+3) sum(fd_v_1_tm(1,35*i+4:35*i+5)) fd_v_1_tm(1,35*i+6:35*i+22) sum(fd_v_1_tm(1,35*i+23:35*i+26)) fd_v_1_tm(1,35*i+27:35*i+34)];
fd_v_1_temp2(1,30*i+1:30*i+30) =  fd_v_1_tm_temp1;
clear wiot_tm_temp1;
end
fd_v_1_new(:,m) = transpose(fd_v_1_temp2) ;
clear fd_v_1_temp2;
end

tfp_2_selected=zeros(1107,12);

for i=0: 40
   tfp_2_selected(27*i+1:27*i+27,:)=tfp_2_log([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
end

fd_v_real_new_growth_selected=zeros(1107,12);

for i=0: 40
   fd_v_real_new_growth_selected(27*i+1:27*i+27,:)=fd_v_real_new_growth_log([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
end

l_1_selected=zeros(1107,12);

for i=0: 40
   l_1_selected(27*i+1:27*i+27,:)=l_1_log([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
end

ict_contribution_2_selected=zeros(1107,12);

for i=0: 40
   ict_contribution_2_selected(27*i+1:27*i+27,:)=ict_contribution_2_log([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
end

nict_contribution_2_selected=zeros(1107,12);

for i=0: 40
   nict_contribution_2_selected(27*i+1:27*i+27,:)=nict_contribution_2_log([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
end

l_3_selected=zeros(1107,12);

for i=0: 40
   l_3_selected(27*i+1:27*i+27,:)=l_3_log([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
end


tfp_2_9500=transpose(sum(transpose(tfp_2_selected(:,1:5))))/5;
fd_v_real_new_growth_9500=transpose(sum(transpose(fd_v_real_new_growth_selected(:,1:5))))/5;
l_1_9500=transpose(sum(transpose(l_1_selected(:,1:5))))/5;
ict_contribution_2_9500=transpose(sum(transpose(  ict_contribution_2_selected(:,1:5))))/5;
nict_contribution_2_9500=transpose(sum(transpose(nict_contribution_2_selected(:,1:5))))/5;
l_3_9500=transpose(sum(transpose(l_3_selected(:,1:5))))/5;

tfp_2_0007=transpose(sum(transpose(tfp_2_selected(:,6:12))))/7;
fd_v_real_new_growth_0007=transpose(sum(transpose(fd_v_real_new_growth_selected(:,6:12))))/7;
l_1_0007=transpose(sum(transpose(l_1_selected(:,6:12))))/7;
ict_contribution_2_0007=transpose(sum(transpose(ict_contribution_2_selected(:,6:12))))/7;
nict_contribution_2_0007=transpose(sum(transpose(nict_contribution_2_selected(:,6:12))))/7;
l_3_0007=transpose(sum(transpose(l_3_selected(:,6:12))))/7;

selected_average_9500=[fd_v_real_new_growth_9500 l_1_9500 tfp_2_9500 ict_contribution_2_9500 nict_contribution_2_9500 l_3_9500];
selected_average_0007=[fd_v_real_new_growth_0007 l_1_0007 tfp_2_0007 ict_contribution_2_0007 nict_contribution_2_0007 l_3_0007];

fd_new_new_9500=(fd_v_1_new(:,1)+fd_v_1_new(:,6))/2;
fd_new_new_0007=(fd_v_1_new(:,6)+fd_v_1_new(:,13))/2;
for i=0: 40
   selected_fd_9500(27*i+1:27*i+27,:)=fd_new_new_9500([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
   selected_fd_0007(27*i+1:27*i+27,:)=fd_new_new_0007([30*i+1,30*i+3:30*i+4,30*i+6:30*i+9,30*i+11:30*i+30],:);
end



% country level

for m=0: 40
   selected_fd_9500_sum(m+1,:)=sum(selected_fd_9500(27*m+1:27*m+27,:));
   selected_fd_0007_sum(m+1,:)=sum(selected_fd_0007(27*m+1:27*m+27,:));
end

selected_average_9500_component=selected_average_9500.*repmat(selected_fd_9500,1,6);
selected_average_0007_component=selected_average_0007.*repmat(selected_fd_0007,1,6);

for m=0: 40
selected_9500_temp(m+1,:)=sum(selected_average_9500_component(27*m+1:27*m+27,:));
selected_0007_temp(m+1,:)=sum(selected_average_0007_component(27*m+1:27*m+27,:));
end

country_average_9500=selected_9500_temp./repmat(selected_fd_9500_sum,1, 6);
country_average_0007=selected_0007_temp./repmat(selected_fd_0007_sum,1, 6);


% ict sector
for m=0: 40
  selected_average_ict_9500(2*m+1:2*m+2,:)= selected_average_9500([27*m+10,27*m+20],:);
  selected_average_ict_0007(2*m+1:2*m+2,:)= selected_average_0007([27*m+10,27*m+20],:) ;
end

for m=0: 40
  selected_fd_ict_9500(2*m+1:2*m+2,:)= selected_fd_9500([27*m+10,27*m+20],:);
  selected_fd_ict_0007(2*m+1:2*m+2,:)= selected_fd_0007([27*m+10,27*m+20],:) ;
end

selected_average_ict_9500_component=selected_average_ict_9500.*repmat(selected_fd_ict_9500,1, 6);
selected_average_ict_0007_component=selected_average_ict_0007.*repmat(selected_fd_ict_0007,1, 6);

for m=0: 40
selected_9500_ict_temp(m+1,:)=sum(selected_average_ict_9500_component(2*m+1:2*m+2,:));
selected_0007_ict_temp(m+1,:)=sum(selected_average_ict_0007_component(2*m+1:2*m+2,:));
end

for m=0: 40
   selected_fd_ict_9500_sum(m+1,:)=sum(selected_fd_ict_9500(2*m+1:2*m+2,:));
   selected_fd_ict_0007_sum(m+1,:)=sum(selected_fd_ict_0007(2*m+1:2*m+2,:));
end

ict_average_9500=selected_9500_ict_temp./repmat(selected_fd_ict_9500_sum,1, 6);
ict_average_0007=selected_0007_ict_temp./repmat(selected_fd_ict_0007_sum,1, 6);

% non-ict good

for m=0: 40
  selected_average_nonictgood_9500(11*m+1:11*m+11,:)= selected_average_9500([27*m+1:27*m+9,27*m+11:27*m+12],:);
  selected_average_nonictgood_0007(11*m+1:11*m+11,:)= selected_average_0007([27*m+1:27*m+9,27*m+11:27*m+12],:) ;
end

for m=0: 40
  selected_fd_nonictgood_9500(11*m+1:11*m+11,:)= selected_fd_9500([27*m+1:27*m+9,27*m+11:27*m+12],:);
  selected_fd_nonictgood_0007(11*m+1:11*m+11,:)= selected_fd_0007([27*m+1:27*m+9,27*m+11:27*m+12],:) ;
end

selected_average_nonictgood_9500_component=selected_average_nonictgood_9500.*repmat(selected_fd_nonictgood_9500,1, 6);
selected_average_nonictgood_0007_component=selected_average_nonictgood_0007.*repmat(selected_fd_nonictgood_0007,1, 6);

for m=0: 40
selected_9500_nonictgood_temp(m+1,:)=sum(selected_average_nonictgood_9500_component(11*m+1:11*m+11,:));
selected_0007_nonictgood_temp(m+1,:)=sum(selected_average_nonictgood_0007_component(11*m+1:11*m+11,:));
end

for m=0: 40
   selected_fd_nonictgood_9500_sum(m+1,:)=sum(selected_fd_nonictgood_9500(11*m+1:11*m+11,:));
   selected_fd_nonictgood_0007_sum(m+1,:)=sum(selected_fd_nonictgood_0007(11*m+1:11*m+11,:));
end

nonictgood_average_9500=selected_9500_nonictgood_temp./repmat(selected_fd_nonictgood_9500_sum,1, 6);
nonictgood_average_0007=selected_0007_nonictgood_temp./repmat(selected_fd_nonictgood_0007_sum,1, 6);

% Distribution and Business Services

for m=0: 40
  selected_average_businessservice_9500(6*m+1:6*m+6,:)= selected_average_9500([27*m+15:27*m+17,27*m+19,27*m+21,27*m+23],:);
  selected_average_businessservice_0007(6*m+1:6*m+6,:)= selected_average_0007([27*m+15:27*m+17,27*m+19,27*m+21,27*m+23],:) ;
end

for m=0: 40
  selected_fd_businessservice_9500(6*m+1:6*m+6,:)= selected_fd_9500([27*m+15:27*m+17,27*m+19,27*m+21,27*m+23],:);
  selected_fd_businessservice_0007(6*m+1:6*m+6,:)= selected_fd_0007([27*m+15:27*m+17,27*m+19,27*m+21,27*m+23],:);
end

selected_average_businessservice_9500_component=selected_average_businessservice_9500.*repmat(selected_fd_businessservice_9500,1, 6);
selected_average_businessservice_0007_component= selected_average_businessservice_0007.*repmat(selected_fd_businessservice_0007,1, 6);

for m=0: 40
selected_9500_businessservice_temp(m+1,:)=sum(selected_average_businessservice_9500_component(6*m+1:6*m+6,:));
selected_0007_businessservice_temp(m+1,:)=sum(selected_average_businessservice_0007_component(6*m+1:6*m+6,:));
end

for m=0: 40
   selected_fd_businessservice_9500_sum(m+1,:)=sum(selected_fd_businessservice_9500(6*m+1:6*m+6,:));
   selected_fd_businessservice_0007_sum(m+1,:)=sum(selected_fd_businessservice_0007(6*m+1:6*m+6,:));
end

businessservice_average_9500=selected_9500_businessservice_temp./repmat(selected_fd_businessservice_9500_sum,1, 6);
businessservice_average_0007=selected_0007_businessservice_temp./repmat(selected_fd_businessservice_0007_sum,1, 6);


% Other Services

for m=0: 40
  selected_average_othersservice_9500(8*m+1:8*m+8,:)= selected_average_9500([27*m+13:27*m+14,27*m+18,27*m+22,27*m+24:27*m+27],:);
  selected_average_othersservice_0007(8*m+1:8*m+8,:)= selected_average_0007([27*m+13:27*m+14,27*m+18,27*m+22,27*m+24:27*m+27],:) ;
end

for m=0: 40
  selected_fd_othersservice_9500(8*m+1:8*m+8,:)= selected_fd_9500([27*m+13:27*m+14,27*m+18,27*m+22,27*m+24:27*m+27],:);
  selected_fd_othersservice_0007(8*m+1:8*m+8,:)= selected_fd_0007([27*m+13:27*m+14,27*m+18,27*m+22,27*m+24:27*m+27],:);
end


selected_average_othersservice_9500_component=selected_average_othersservice_9500.*repmat(selected_fd_othersservice_9500,1, 6);
selected_average_othersservice_0007_component= selected_average_othersservice_0007.*repmat(selected_fd_othersservice_0007,1, 6);

for m=0: 40
selected_9500_othersservice_temp(m+1,:)=sum(selected_average_othersservice_9500_component(8*m+1:8*m+8,:));
selected_0007_othersservice_temp(m+1,:)=sum(selected_average_othersservice_0007_component(8*m+1:8*m+8,:));
end

for m=0: 40
   selected_fd_othersservice_9500_sum(m+1,:)=sum(selected_fd_othersservice_9500(8*m+1:8*m+8,:));
   selected_fd_othersservice_0007_sum(m+1,:)=sum(selected_fd_othersservice_0007(8*m+1:8*m+8,:));
end

othersservice_average_9500=selected_9500_othersservice_temp./repmat(selected_fd_othersservice_9500_sum,1, 6);
othersservice_average_0007=selected_0007_othersservice_temp./repmat(selected_fd_othersservice_0007_sum,1, 6);




result_9500=zeros(205, 6)
for i=1:41
    result_9500(5*(i-1)+1,:)=ict_average_9500(i,:);
    result_9500(5*(i-1)+2,:)=nonictgood_average_9500(i,:);
    result_9500(5*(i-1)+3,:)=businessservice_average_9500(i,:);
    result_9500(5*(i-1)+4,:)=othersservice_average_9500(i,:);
    result_9500(5*(i-1)+5,:)=country_average_9500(i,:);
end

result_0007=zeros(205, 6)
for i=1:41
    result_0007(5*(i-1)+1,:)=ict_average_0007(i,:);
    result_0007(5*(i-1)+2,:)=nonictgood_average_0007(i,:);
    result_0007(5*(i-1)+3,:)=businessservice_average_0007(i,:);
    result_0007(5*(i-1)+4,:)=othersservice_average_0007(i,:);
    result_0007(5*(i-1)+5,:)=country_average_0007(i,:);
end

cd ..\..\output\
xlswrite('result_selection_9500.xlsx',result_9500)
xlswrite('result_selection_0007.xlsx',result_0007)




% final output share table
fd_ict_share_9500=selected_fd_ict_9500_sum./selected_fd_9500_sum
fd_ict_share_0007=selected_fd_ict_0007_sum./selected_fd_0007_sum

fd_nonictgood_share_9500=selected_fd_nonictgood_9500_sum./selected_fd_9500_sum
fd_nonictgood_share_0007=selected_fd_nonictgood_0007_sum./selected_fd_0007_sum

fd_businessservice_share_9500=selected_fd_businessservice_9500_sum./selected_fd_9500_sum
fd_businessservice_share_0007=selected_fd_businessservice_0007_sum./selected_fd_0007_sum

fd_othersservice_share_9500=selected_fd_othersservice_9500_sum./selected_fd_9500_sum
fd_othersservice_share_0007=selected_fd_othersservice_0007_sum./selected_fd_0007_sum

fd_share_9500=zeros(41,4)
fd_share_0007=zeros(41,4)


fd_share_9500(:,1)=fd_ict_share_9500
fd_share_9500(:,2)=fd_nonictgood_share_9500
fd_share_9500(:,3)=fd_businessservice_share_9500
fd_share_9500(:,4)=fd_othersservice_share_9500

fd_share_0007(:,1)=fd_ict_share_0007
fd_share_0007(:,2)=fd_nonictgood_share_0007
fd_share_0007(:,3)=fd_businessservice_share_0007
fd_share_0007(:,4)=fd_othersservice_share_0007


xlswrite('finaloutput_share_9500.xlsx',fd_share_9500)
xlswrite('finaloutput_share_0007.xlsx',fd_share_0007)


