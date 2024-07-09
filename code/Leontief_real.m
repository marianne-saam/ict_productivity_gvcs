
cd '..\data\wiod\wiot_pyp'
wiot_real =zeros(1435,1435,12);
% import the wiod data
for j=1996:2007
wiot_real(:,:,j-1995)=xlsread(['',num2str(j),'.xlsx'], 'E7:BCI1441');
end

wiot_output_real =zeros(1,1435,12);
for j=1996:2007
wiot_output_real(:,:,j-1995)=xlsread(['',num2str(j),'.xlsx'], 'E1449:BCI1449');
end

% classification adjustment for the indermediate input matrix 
for m=1:12
    wiot_real_tm=wiot_real(:,:,m);
for i= 0:40;
    wiot_real_tm_temp1 = [wiot_real_tm(:,35*i+1:35*i+3) sum(wiot_real_tm(:,35*i+4:35*i+5),2) wiot_real_tm(:,35*i+6:35*i+22) sum(wiot_real_tm(:,35*i+23:35*i+26),2) wiot_real_tm(:,35*i+27:35*i+34)];
    wiot_real_tm_n_temp(:,30*i+1:30*i+30) =  wiot_real_tm_temp1;
    clear wiot_real_tm_temp1;
end
wiot_real_tm_n = zeros(1230) ;
wiot_real_tr_n_temp2 = zeros(1230) ;
wiot_real_tr=transpose(wiot_real_tm_n_temp);
for i =0:40;
    wiot_real_tr_temp1=[wiot_real_tr(:,35*i+1:35*i+3) sum(wiot_real_tr(:,35*i+4:35*i+5),2) wiot_real_tr(:,35*i+6:35*i+22) sum(wiot_real_tr(:,35*i+23:35*i+26),2) wiot_real_tr(:,35*i+27:35*i+34)];
    wiot_real_tr_n_temp2(:,30*i+1:30*i+30) =  wiot_real_tr_temp1;
    clear wiot_real_tm_temp1;
end
wiot_real_tm_n = transpose(wiot_real_tr_n_temp2);
wiot_real_new(:,:,m)=wiot_real_tm_n ;
clear wiot_real_tr_n_temp2 wiot_real_tm_n ;
end

wiot_output_permute_real=permute(wiot_output_real, [2,3,1]);
for m=1:12
    wiot_output_permute_real_tm=transpose(wiot_output_permute_real(:,m));
    for i= 0:40;
    wiot_output_permute_real_tm_temp1 = [wiot_output_permute_real_tm(:,35*i+1:35*i+3) sum(wiot_output_permute_real_tm(:,35*i+4:35*i+5),2) wiot_output_permute_real_tm(:,35*i+6:35*i+22) sum(wiot_output_permute_real_tm(:,35*i+23:35*i+26),2) wiot_output_permute_real_tm(:,35*i+27:35*i+34)];
    wiot_output_permute_real_temp2(:,30*i+1:30*i+30) =  wiot_output_permute_real_tm_temp1;
    end
    wiot_output_permute_real_new(:,m) = transpose(wiot_output_permute_real_temp2) ;
end

wiot_new_unit_real=zeros(1230,1230,12);
for m=1:12
    wiot_new_unit_real(:,:,m)=wiot_real_new(:,:,m)./transpose(wiot_output_permute_real_new(:,m));
end

clear wiot_output_permute_real wiot_output_permute_real_new wiot_output_permute_real_temp2 wiot_output_permute_real_tm wiot_output_permute_real_tm_temp1 wiot_real_tm wiot_real_tm_n_temp wiot_real_tr wiot_real_tr_temp1