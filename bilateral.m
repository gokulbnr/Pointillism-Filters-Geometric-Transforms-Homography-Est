function ret=bilateral(img)
    img=imread(img);
    
    if (size(size(img),2))>2
        img=rgb2gray(img);
    end
    
    w=[3,5,8];
    sig1=16;
    sig2=0.05;
    
    subplot(2,2,1);
    imshow(img);
    title('Input image');
        
    for q=1:3
       [x,y]=meshgrid(-w(q):w(q),-w(q):w(q));
       wei=exp(-(x.^2+y.^2)/(2*sig1^2));
       sx=size(img,1);
       sy=size(img,2);
       op=zeros(sx,sy);
       for i=1:sx
            for j=1:sy
                minx=max(i-w(q),1);
                maxx=min(i+w(q),sx);
                miny=max(j-w(q),1);
                maxy=min(j+w(q),sy);
                mat=img(minx:maxx,miny:maxy);

                p=double(mat-img(i,j));
                mat=double(mat);

                h=exp(-(p.^2)/2*sig2^2);

                f=h.*wei((minx:maxx)-i+w(q)+1,(miny:maxy)-j+w(q)+1);
                op(i,j)=sum(f(:).*mat(:))/sum(f(:));
                op=uint8(op);
            end
        end
        subplot(2,2,q+1);
        imshow(op);
        title(['Using ',int2str(q),' sized window']);
    end
end