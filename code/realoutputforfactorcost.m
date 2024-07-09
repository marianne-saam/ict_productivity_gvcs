% get the nominal gross output and price level for output and then get the
% real output value 

% \Processing data
cd '..\data'\wiod_sea\
go=xlsread(['go.xlsx'],'go','E2:Q1441');
go_tr=transpose(go);
go_temp=zeros(13,1230);
for i=0:39
go_temp(:,30*i+1:30*i+30)=[go_tr(:,36*i+2:36*i+4) sum(go_tr(:,36*i+5:36*i+6),2) go_tr(:,36*i+7:36*i+23) sum(go_tr(:,36*i+24:36*i+27),2) go_tr(:,36*i+28:36*i+35)];
end
go_new=transpose(go_temp);


l_temp= permute(l, [1,3,2]);
for i=1:13
    l_panel(:,i)=reshape(l_temp(:,:,i),[1230,1]);
end

go_new(1201:1230,:)=row_output_new;

clear go_temp italy_lp l_temp