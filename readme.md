## Slicing of STL file and display

The following code reads an stl file, slice it at a height 'z' provided by the user and display the 2D profile of the model at that height.

stlread.m file source - https://in.mathworks.com/matlabcentral/fileexchange/22409-stl-file-reader

## Instructions -

* Put this file along with 'stlread.m' and your stl files in the same folder.
* Change the name of the stl file below with the name of the desired stl file.
* Run the code. It will ask for Z values (height) at which you want to slice the model.
* The code also shows the min. and max. Z values for the entire model. For proper display, enter the height which is in between these two values. Otherwise it throws a warning.