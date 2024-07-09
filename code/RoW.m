% \Processing data\matlab
cd '..\data\wiod'
% get the value added of RoW from the WIOT
row =zeros(35,13);
for j=1995:2007
row(:,j-1994)=xlsread(['',num2str(j),'.xlsx'], 'BBA1447:BCI1447');    
end

% get the gross output of RoW from the WIOT
row_output =zeros(35,13);
for j=1995:2007
row_output(:,j-1994)=xlsread(['',num2str(j),'.xlsx'], 'BBA1449:BCI1449');    
end

row_output_new=zeros(30,13);
row_output_transpose=transpose(row_output);
for m=1:13
    row_output_temp(m,:)=[row_output_transpose(m,1:3) sum(row_output_transpose(m,4:5),2) row_output_transpose(m,6:22) sum(row_output_transpose(m,23:26),2) row_output_transpose(m,27:34)];
end
row_output_new=transpose(row_output_temp);

row_new=zeros(30,13);
row_transpose=transpose(row);
for m=1:13
    row_temp(m,:)=[row_transpose(m,1:3) sum(row_transpose(m,4:5),2) row_transpose(m,6:22) sum(row_transpose(m,23:26),2) row_transpose(m,27:34)];
end
row_new=transpose(row_temp);

% clear the unnecessary data
clear row row_output row_output_temp row_output_transpose row_temp row_transpose

