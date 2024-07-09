% replace NaN and infinite with 0
kict_diag(isnan(kict_diag))=0;
knict_diag(isnan(knict_diag))=0;
l_diag(isnan(l_diag))=0.0000000001;
wiot_new_unit(isnan(wiot_new_unit))=0;

kict_diag(~isfinite(kict_diag))=0;
knict_diag(~isfinite(knict_diag))=0;
l_diag(~isfinite(l_diag))=0.0000000001;
wiot_new_unit(~isfinite(wiot_new_unit))=0;
wiot_new_unit_real(isnan(wiot_new_unit_real))=0;
wiot_new_unit_real(~isfinite(wiot_new_unit_real))=0;
% follow the equation 4-6 in the document
I=eye(1230);
kict_gvc=zeros(1230,1230,12);
for i=1:12
    kict_gvc(:,:,i) =   kict_diag(:,:,i) * inv(I-wiot_new_unit(:,:,i));
end

knict_gvc=zeros(1230,1230,12);
for i=1:12
    knict_gvc(:,:,i) =  knict_diag(:,:,i)* inv(I-wiot_new_unit(:,:,i));
end

%  don't need to read data
l_gvc=zeros(1230,1230,12);
for i=1:12
    l_gvc(:,:,i) =  l_diag(:,:,i)* inv(I-wiot_new_unit(:,:,i)) ;
end

kict_gvc_real=zeros(1230,1230,12);
for i=1:12
    kict_gvc_real(:,:,i) =   kict_diag(:,:,i+1) * inv(I-wiot_new_unit_real(:,:,i));
end

knict_gvc_real=zeros(1230,1230,12);
for i=1:12
    knict_gvc_real(:,:,i) =  knict_diag(:,:,i+1)* inv(I-wiot_new_unit_real(:,:,i));
end

l_gvc_real=zeros(1230,1230,12);
for i=1:12
    l_gvc_real(:,:,i) =  l_diag(:,:,i+1)* inv(I-wiot_new_unit_real(:,:,i)) ;
end


kict_gvc_growth=zeros(1230,1230,12);
for i=1:12
    kict_gvc_growth_log(:,:,i)=log(kict_gvc_real(:,:,i))-log(kict_gvc(:,:,i));
end

knict_gvc_growth=zeros(1230,1230,12);
for i=1:12
    knict_gvc_growth_log(:,:,i)=log(knict_gvc_real(:,:,i))-log(knict_gvc(:,:,i));
end

l_gvc_growth=zeros(1230,1230,12);
for i=1:12
    l_gvc_growth_log(:,:,i)=log(l_gvc_real(:,:,i))-log(l_gvc(:,:,i));
end