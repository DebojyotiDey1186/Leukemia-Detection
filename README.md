# Leukemia-Detection
## PROCESS OVERVIEW

### Image Acquisition

For our research, we collected multiple microscopic images of blood smears from both healthy individuals and leukemia affected individuals. This formed the reference for computing the results for the implementation. Then we ran several image segmentation and other image preprocessing methods to remove the background noise and extract out the WBCs and RBCs. 

### Image Preprocessing and Feature Extraction

First, the image is resized to better suit our algorithm. Then we extract the “saturation” component of the image. This gives us a 2-D matrix to work with. When k-means segmentation is performed on this 2-D matrix, using 3 clusters, the WBCs are highlighted in a color that separates it from the RBCs and other background components. The resulting image is converted to HSV color model. The components of the resultant image, hue, saturation and intensity, are then subtracted from each other. Upon performing several permutations of this process, we found that the difference between the intensity and saturation components provides greater distinction of WBCs. The resultant image is then filtered out for noise and is used as a mask to extract and count the WBCs.
To extract the RBCs, a different approach was carried out as their overlapping nature and color prevented them from being picked up properly by k-means. To overcome this issue, we converted the image to a binary image and cleared up the background noise. The white portions were then dilated and any ring-shaped or deformed portions were filled up to turn them into disks. The image was passed through a circle finding algorithm to count the number of circular objects. This gives us an estimate of the number of the total cells in the blood smear. We can get the number of RBCs by subtracting the number of WBCs from the number of total cells.
We calculated the ratio of WBCs to RBCs of the images in our dataset to get an estimate of the threshold of healthy and leukemia affected cells. Using that data, we applied a check on the ratio of WBC to RBC of the sample to determine whether the sample shows signs of acute lymphocytic leukemia or not.
 
 ![image](https://user-images.githubusercontent.com/66461197/229375958-0d94279e-4553-4daa-b6c5-8e7533ca99b1.png)

![image](https://user-images.githubusercontent.com/66461197/229375969-094aea6e-a95d-448c-8126-b0543aec997a.png)

Figure 1 – Original image vs k-means segmented image

 ![image](https://user-images.githubusercontent.com/66461197/229375978-0173178e-7bbc-40e5-86b6-54449efeb7c6.png) 
 
Figure 2 – Mask for WBCs                                                   

![image](https://user-images.githubusercontent.com/66461197/229375988-a95ac071-d9a4-417d-9b79-dbd38a9baccb.png)

Figure 3 – WBCs extracted out

 ![image](https://user-images.githubusercontent.com/66461197/229376001-ca755db9-cc64-431b-983a-16f03c8ecd8e.png)
 
Figure 4 – Total cells

 
