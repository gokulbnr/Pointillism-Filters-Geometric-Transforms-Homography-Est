function ret=hist_equal(img)
    img=imread(img);
    if size(size(img),2)>2
        img=rgb2gray(img);
    end
    op=zeros(size(img,1),'uint8');
    sx=size(img,1);
    sy=size(img,2);
    k1=floor(sx/8);
    k2=floor(sy/8);
    for i=1:k1-1:sx
        for j=1:k2-1:sy
            if((i+k1>sx)||(j+k2>sy))
                continue;
            end
            im=img(i:i+k1,j:j+k2);
            h=imhist(im);
            cdf=cumsum(h)/numel(im);
            k=255*cdf+0.5;
            s=zeros(256,1,'uint8');
            for l=1:256
                s(l,1)=floor(k(l));
            end
            op(i:i+k1,j:j+k2)=s(im+1);
        end
    end
    subplot(2,2,1);
    imshow(img);
    title('Input image and histogram')
    subplot(2,2,2);
    imshow(op);
    title('Output image and histogram')
    subplot(2,2,3);
    imhist(img);
    subplot(2,2,4);
    imhist(op);
    ret=1;
end