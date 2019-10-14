function ret=rip_tr(img)
    img=imread(img);
    op=zeros(size(img,1),size(img,2),5,'uint8');
    if size(size(img),2)>2
        img=rgb2gray(img);
    end
    ax=[5,10,15,20,25];
    ay=[10,15,20,25,30];
    tx=[-160,170,-190,180,190];
    ty=[-150,180,-180,180,190];
    sx=size(img,1);
    sy=size(img,2);
    subplot(3,3,1);
    %figure
    imshow(img);
    title('input image');
    for q=1:5
        for i=1:sx
            for j=1:sy
                a=int64(i+ax(q)*sin(2*pi*j/tx(q)));
                b=int64(j+ay(q)*sin(2*pi*i/ty(q)));
                op(min(max(a,1),sx),min(max(b,1),sy),q)=img(i,j);
            end
        end
        subplot(3,3,q+1);
        %figure
        imshow(op(:,:,q));
        title(['Using parameter set ',int2str(q)]);
    end
    ret=1;
end