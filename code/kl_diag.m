%  /Processing data
cd '..\data'\wiod_sea\
k_ict_temp= permute(kict, [1,3,2]);
k_nict_temp= permute(knict, [1,3,2]);
for i=1:13
    k_ict(:,i)=reshape(k_ict_temp(:,:,i),[1230,1]);
end

for i=1:13
    k_nict(:,i)=reshape(k_nict_temp(:,:,i),[1230,1]);
end
go_p=xlsread(['go.xlsx'],'go_p','E2:Q1441');
go_real=go./go_p*100;
go_real_tr=transpose(go_real);
go_real_temp=zeros(13,1230);
for i=0:39
go_real_temp(:,30*i+1:30*i+30)=[go_real_tr(:,36*i+2:36*i+4) sum(go_real_tr(:,36*i+5:36*i+6),2) go_real_tr(:,36*i+7:36*i+23) sum(go_real_tr(:,36*i+24:36*i+27),2) go_real_tr(:,36*i+28:36*i+35)];
end
go_real_new=transpose(go_real_temp);
go_real_new(1201:1230,:)=row_output_new;
% get the factor input used per unit of gross output
kict_panel_unit(:,:)=bsxfun(@rdivide, k_ict(:,:), go_real_new(:,:));
knict_panel_unit(:,:)=bsxfun(@rdivide, k_nict(:,:), go_real_new(:,:));
l_panel_unit(:,:)=bsxfun(@rdivide, l_panel(:,:), go_real_new(:,:));

% put the factor input per unit of gross output in the diagnal of a square
% matrix
kict_diag=zeros(1230,1230,13);
knict_diag=zeros(1230,1230,13);
l_diag=zeros(1230,1230,13);

for m =1:13
kict_diag(:,:,m)=diag(kict_panel_unit(:,m));
end

for m =1:13
knict_diag(:,:,m)=diag(knict_panel_unit(:,m));
end

for m =1:13
l_diag(:,:,m)=diag(l_panel_unit(:,m));
end