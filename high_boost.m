function ret=high_boost(img)
    img=imread(img);
    g3=zeros(3,3);
    g5=zeros(5,5);
    g8=zeros(8,8);
    sig=3;
    for i=1:8
        for j=1:8
            if ((i<=3)&&(j<=3))
                g3(i,j)=exp(((i-2)*(i-2))/(2*sig*sig)+((j-2)*(j-2))/2*sig*sig);
            end
            if ((i<=5)&&(j<=5))
                g5(i,j)=exp(((i-3)*(i-3))/(2*sig*sig)+((j-3)*(j-3))/2*sig*sig);
            end
            g8(i,j)=exp(((i-5)*(i-5))/(2*sig*sig)+((j-5)*(j-5))/2*sig*sig);
        end
    end
    g3=g3/sum(sum(g3));
    g5=g5/sum(sum(g5));
    g8=g8/sum(sum(g8));
    img_g3=uint8(imfilter(img,g3));
    img_g5=uint8(imfilter(img,g5));
    img_g8=uint8(imfilter(img,g8));
    sub3=img_g3-img;
    sub5=img_g5-img;
    sub8=img_g8-img;
    m=4;
    op3=img+m*sub3;
    op5=img+m*sub5;
    op8=img+m*sub8;
    subplot(2,2,1);
    imshow(img);
    title('Input image');
    subplot(2,2,2);
    imshow(op3);
    title('Using 3X3 guassian filter');
    subplot(2,2,3);
    imshow(op5);
    title('Using 5X5 guassian filter');
    subplot(2,2,4);
    imshow(op8);
    title('Using 8X8 guassian filter');
end