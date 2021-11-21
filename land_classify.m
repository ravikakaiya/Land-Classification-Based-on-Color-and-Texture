function land_classify(img)

%pass an image containing land image of any type among mountains, houses,
%forest,aggricultural, barren. 

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

%finding entropy(-sum(p.*log2(p))) to observe the variation of intensity in image
s = entropy(mt);

%extracting individual properties
MyFieldNames = fieldnames(prop1);
for i=1:4
Val(i,1) = getfield(prop1,MyFieldNames{i});
end
[~,id] = min(Val);
imshow(img)

%highest entropy leads to higher probability of Mountains 
if s>7.8
    title('Mountains')
%if the green part is highest than it is most likely to have forest
elseif dominant == 'G'
    title('Forest')
%for barren and agricultural land we observe lowest value to be of contrast
elseif id == 1
    %then For barren land red is observed more present
    if dominant == 'R'
        title('Barren land')
    %otherwise for lower value of contrast agricultural land is likely to
    %present
    else        
        title('agriculteral land')
    end
    
%vary random 
else
    title('Houses')
end