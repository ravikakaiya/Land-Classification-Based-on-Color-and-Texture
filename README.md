# Land-Classification-Based-on-Color-and-Texture
We are analyzing and classifying the Land type using texture and color analysis. 

# Color analysis
From different images we can observe the color intensity mean values. and Can find the dominant color present.
This will help to separate between some class like barren land vs. Forest.
Here shown the Mean values of intensities for Different type of land images:

| Color\Land  | Agricultural | Barren | Forest | Houses | Mountains|
| ------------- | ------------- |---------|-----|-----|------|
| Blue | 86 | 145 | 49 | 123 | 116 |
| Green  | 81 | 158 | 53 | 126 | 132 |
|Red|64|180|38|133|138|

As from above table we observe that Genrally for forest land the Green part is dominant. 

# Texture Analysis 

|Properties\Land type|Mountains|Houses|Forest|Barren|Agricultura|
|---------|-------|---------|---------|-------|--------|
|Contras|0.56|0.25|0.25|0.059|0.114|
|Correlation|0.92|0.96|0.38|0.92|0.904|
|Energy|0.05|0.08|0.478|0.44|0.32|
|Homogeneity|0.78|0.88|0.876|0.97|0.94|

# Entropy value
|Land type|Mountains|Houses|Forest|Barren|Agricultura|
|---------|-------|---------|---------|-------|--------|
|Entropy|7.91|7.77|5.71|6.17|6.41|

# Approach 1(Individual image):

-> Here we start with if the value for entropy is higher than some threshold we can say there are higher 
probability of the land containing Mountains.<br />
-> Than Secondly we find the highest present color in the image ,if the comes out to be Green than we can say the land 
have forest.<br />
-> We calculated Gray level co occurrence matrix(GLCM) and from that we found different properties(Contras,Correlation,Energy,Homogeneity)<br />
-> Now we see that the lowest value occurs for contrast than there equal likely chances for Barren land or aggricultural land. <br />
-> Than we see if the dominant value of color is red than very likely the land is barren land. Else it is aggricultural land.<br />
-> The Rest land can be treated as land containg Houses.<br />

# Approch 2(Multi image):

-> Here we pass the images having different type of land view.<br />
-> Than we Find the Gray level co occurrence matrix(GLCM).<br />
-> Using GLCM we Found the properties of the Texture (Contras,Correlation,Energy,Homogeneity)<br />
-> Here as we have values for all type of aggricultural land than we can compare in between them which 
can give a better result.<br />
-> Here as for Mountains the shadows and bright parts form a drastic change in intesity so it have highest value of contrast.<br />
-> For the Houses we observe that correlation is very high because it show the inter relation between pixel to pixel.<br />
-> Now For Barren land as there will be uniformity in the image so we observe high value of Homogeneity.<br /> 
-> The remaining land we classify as Aggricultiral land because it can contain properties of Barren land as well as Forest . <br />

<img src="cEdDG.png">
