function multi_land_classify(mtc,hsc,fsc,brc,arc)

%pass five different land images ie. forest, barren land, houses,
%mountains, aggricultaral land.

[val,d] = texture_properties(mtc);
[val1,d1] = texture_properties(hsc);
[val2,d2] = texture_properties(fsc);
[val3,d3] = texture_properties(brc);
[val4,d4] = texture_properties(arc);

%for mountains Contrast observed to be highest
contrast = [val(1),val1(1),val2(1),val3(1),val4(1)];
[~,id] = max(contrast);

%for houses correlation observed to be higher
correlatn = [val(2),val1(2),val2(2),val3(2),val4(2)];
[~,id1] = max(correlatn);

%For Barren land as there is less variation homogeneity is highest
homog = [val(4),val1(4),val2(4),val3(4),val4(4)]
[~,id3] = max(homog);

%From color analysis For forest Dominant will be green color
domval = [d d1 d2 d3 d4];
id2 = find(domval == 'G');

%resizing images to stack
ids = [id id1 id2 id3];
img = imresize_cust(mtc);
img1 = imresize_cust(hsc);
img2 = imresize_cust(fsc);
img3 = imresize_cust(brc);
img4 = imresize_cust(arc);
images = cat(4,img,img1,img2,img3,img4);

%the remaining land type
p = 1:5;
id4 = setdiff(p,ids);

%id -> Mountains
%id1 -> Houses
%id2 -> Forest
%id3 -> Barren land
%id4 -> Aggricultural land

%Showing classified output
subplot 231
imshow(images(:,:,:,id))
title("Mountains")
subplot 232
imshow(images(:,:,:,id1))
title("Houses")
subplot 233
imshow(images(:,:,:,id2))
title("Forest")
subplot 234
imshow(images(:,:,:,id3))
title("barren land")
subplot 235
imshow(images(:,:,:,id4))
title("Aggricultural land")

%function to calculate different texture properties and dominant color in
%image
function [Val, dominant] = texture_properties(img)
    %converting to gray for texture analysis
    mt = im2gray(img);
    %finding dominant color values for color analysis
    colors = 'RGB';
    [~,idx] = max(sum(sum(img,1),2),[],3);
    dominant = colors(idx);
    
    %finding Gray level co-occurence matrix 
    glcm1 = graycomatrix(mt);
    
    %finding texture properties[Contrast(sum(|i-j|^2*p(i,j))),
    %Correlation(sum((i-Ui)*(j-Uj)*p(i,j)/sigma(i)*sigma(j))),
    %Energy(sum(p(i,j)^2)), Homogeneity(sum(p(i,j)/(1+|i-j|)))] 
    %for evaluating pattern in image
    prop1 = graycoprops(glcm1);
    
    %extracting individual properties
    MyFieldNames = fieldnames(prop1);
    for i=1:4
    Val(i,1) = getfield(prop1,MyFieldNames{i});
    end
end
%function to resize image in order to stack along 4-D 
function img = imresize_cust(imag)
    targetSize = [340 340];
    r = centerCropWindow2d(size(imag),targetSize);
    img = imcrop(imag,r);
end
end