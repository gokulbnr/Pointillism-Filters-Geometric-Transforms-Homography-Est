function ret=hist_match(img1,img2)
    img1=rgb2gray(imread(img1));
    img2=rgb2gray(imread(img2));
    
    h1=imhist(uint8(img1));
    h2=imhist(uint8(img2));
    
    cdf1=cumsum(h1)/numel(img1);
    cdf2=cumsum(h2)/numel(img2);
    
    map=zeros(256,1,'uint8');
    for i=1:256
        [~,ind]=min(abs(cdf2 - cdf1(i)));
        map(i)=ind-1;
    end
    op=map(img1+1);
    
    subplot(3,2,1);
    imshow(img1);
    title('Image to be transformed');
    subplot(3,2,2);
    imhist(img1);
    subplot(3,2,3);
    imshow(img2);
    title('Image whose histogram is used for matching');
    subplot(3,2,4);
    imhist(img2);
    subplot(3,2,5);
    imshow(op);
    title('Output image and histogram');
    subplot(3,2,6);
    imhist(op);
    ret=1;
end