function ret=med(img)
    img=imread(img);
    [xs,ys]=size(img);
    img_m3=img;
    img_m5=img;
    img_m8=img;
    
    for i=2:xs-1
        for j=2:ys-1
            img_m3(i,j)=median(reshape(img(i-1:i+1,j-1:j+1)',1,9));
            if (i>=3&&i<=xs-2)&&(j>=3&&j<=ys-2)
                img_m5(i,j)=median(reshape(img(i-2:i+2,j-2:j+2)',1,25));
            end
            if (i>=4&&i<=xs-4)&&(j>=4&&j<=ys-4)
                img_m8(i,j)=median(reshape(img(i-3:i+4,j-3:j+4)',1,64));
            end
        end
    end
    
    subplot(2,2,1)
    imshow(img);
    title('Input image');
    subplot(2,2,2)
    imshow(img_m3);
    title('After using 3X3 window');
    subplot(2,2,3)
    imshow(img_m5);
    title('After using 5X5 window');
    subplot(2,2,4)
    imshow(img_m8);
    title('After using 8X8 window');
end