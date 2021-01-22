# Basic-MPEG-Implementation
Basic MPEG Implementation

# Build
- Compile "MPEG_part1.pde" in the **MPEG_part1** or "MPEG_part2.pde" **MPEG_part2**

- Compile with [Processing](https://processing.org).

# Screenshots with explanations

There is the image 1 (on the left) and image 2 (on the right)
<img src = "MPEG_part1\image.jpg" title = part1 >

1- In the part 1 we focus on finding the similar blocks in the 2 nd image using MSE and inserting them in the original image.
<img src = "MPEG_part1\Screenshot_1.png" title = part1 >

2- In the part 2 we re build the image by using the similar blocks found in the second image summed up with the residue.
<img src = "MPEG_part2\Screenshot_2.png" title = part2 >

**Note:** if you want to change the images using the code just change the two lines below by specifying your images path.
```processing
26 img1 = loadImage("image072.png");
28 img2 = loadImage("image092.png");
```
