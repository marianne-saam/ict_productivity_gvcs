
% \Processing data\matlab
cd '..\data\wiod'
wiot =zeros(1435,1435,13);
% import the wiod data
for j=1995:2007
wiot(:,:,j-1994)=xlsread(['',num2str(j),'.xlsx'], 'E7:BCI1441');
end

wiot_output =zeros(1,1435,13);
for j=1995:2007
wiot_output(:,:,j-1994)=xlsread(['',num2str(j),'.xlsx'], 'E1449:BCI1449');
end

% classification adjustment for the indermediate input matrix 
for m=1:13
    wiot_tm=wiot(:,:,m);
for i= 0:40;
    wiot_tm_temp1 = [wiot_tm(:,35*i+1:35*i+3) sum(wiot_tm(:,35*i+4:35*i+5),2) wiot_tm(:,35*i+6:35*i+22) sum(wiot_tm(:,35*i+23:35*i+26),2) wiot_tm(:,35*i+27:35*i+34)];
    wiot_tm_n_temp(:,30*i+1:30*i+30) =  wiot_tm_temp1;
    clear wiot_tm_temp1;
end
wiot_tm_n = zeros(1230) ;
wiot_tr_n_temp2 = zeros(1230) ;
wiot_tr=transpose(wiot_tm_n_temp);
for i =0:40;
    wiot_tr_temp1=[wiot_tr(:,35*i+1:35*i+3) sum(wiot_tr(:,35*i+4:35*i+5),2) wiot_tr(:,35*i+6:35*i+22) sum(wiot_tr(:,35*i+23:35*i+26),2) wiot_tr(:,35*i+27:35*i+34)];
    wiot_tr_n_temp2(:,30*i+1:30*i+30) =  wiot_tr_temp1;
    clear wiot_tm_temp1;
end
wiot_tm_n = transpose(wiot_tr_n_temp2);
wiot_new(:,:,m)=wiot_tm_n ;
clear wiot_tr_n_temp2 wiot_tm_n ;
end

wiot_output_permute=permute(wiot_output, [2,3,1]);
for m=1:13
    wiot_output_permute_tm=transpose(wiot_output_permute(:,m));
    for i= 0:40;
    wiot_output_permute_tm_temp1 = [wiot_output_permute_tm(:,35*i+1:35*i+3) sum(wiot_output_permute_tm(:,35*i+4:35*i+5),2) wiot_output_permute_tm(:,35*i+6:35*i+22) sum(wiot_output_permute_tm(:,35*i+23:35*i+26),2) wiot_output_permute_tm(:,35*i+27:35*i+34)];
    wiot_output_permute_temp2(:,30*i+1:30*i+30) =  wiot_output_permute_tm_temp1;
    end
    wiot_output_permute_new(:,m) = transpose(wiot_output_permute_temp2) ;
end

wiot_new_unit=zeros(1230,1230,13);
for m=1:13
    wiot_new_unit(:,:,m)=wiot_new(:,:,m)./transpose(wiot_output_permute_new(:,m));
end

clear wiot_output_permute wiot_output_permute_new wiot_output_permute_temp2 wiot_output_permute_tm wiot_output_permute_tm_temp1 wiot_tm wiot_tm_n_temp wiot_tr wiot_tr_temp1
