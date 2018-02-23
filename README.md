# Detection-of-hard-exudates

In this, a method is devised to detect hard exudates from fundus image using principal component analysis to extract the features,
and these are detected using surf feature detection technique.

Initially the fundus images are preprocessed to localise the optic disk, which has same brightness, contrast as hard exudates using morphological operations.

Then these pre processed images are used as the inputs for principal component analysis which detects the features such as blood veins,
hard exudates and soft exudates. Mainly hard exudates characteristics are present in the green layer of the fundus image.

After that using surf feature detection technique the hard exudates are detected.

Advantages of this method:
1) computation time is approx 10-14 sec for 2848 * 4288 image size.
2) preprocessing is used only to localise optic disk.

Disadvantges:
1) the accuracy is satisfactory.
