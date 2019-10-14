function ret=sph_tr(img)
    img=imread(img);
    op=zeros(size(img,1),size(img,2),5,'uint8');
    
    if(size(size(img),2)>2)
        img=rgb2gray(img);
    end
    
    subplot(3,3,1);
    %figure
    imshow(img);
    title('Input image');
    
    c=[2,2.5,3,3.5,4];

    for q=1:5
        ax=floor(size(img,1)/c(q));
        ay=floor(size(img,2)/c(q));
        r=floor(min(size(img,1)/c(q),size(img,2)/c(q)));
        h=2;
        sx=size(img,1);
        sy=size(img,2);

        for i=1:sx
            bx=i-ax;
            for j=1:sy
                by=j-ay;

                t=sqrt(bx*bx+by*by);
                t=sqrt(max(r*r-t*t,0));

                tx=(1-1/h)*asin(bx/sqrt(bx*bx+t*t));
                ty=(1-1/h)*asin(by/sqrt(by*by+t*t));

                a=int64(i-t*tan(tx));
                b=int64(j-t*tan(ty));

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