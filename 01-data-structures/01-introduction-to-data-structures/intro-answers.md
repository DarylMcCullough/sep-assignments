# Questions about my data structures:

## Q1. How does your data structure allow developers to access and manipulate the data?

### Line

#### Manipulating data
In my implementation of lines, I provided the following operations for manipulating lines:
1. Creating a new line.
2. Adding a member to the end of the line.
3. Removing something from the middle of the line.

#### Accessing data
In addition, I provided the following operations for inspecting lines:
1. Check what members are at the front, middle and end of the line.
2. Check whether a member is in the line, and if so, at what index.

These operations cover all the normal cases where one would like to operate on 
or inspect a line representing someone waiting their turn for something. The one
thing that isn't directly supported, because it doesn't come up in normal use,
is the capability to get a listing of every one in line.

### Screen and pixels

#### Manipulating data
In my implementation of screens, I provided the following operations for manipulating 
screen data:
1. Creating screens of various widths and heights.
2. Creating pixels of various combinations of R, G, B values
3. Insert a pixel to a particular (x,y) location on a screen.

#### Accessing data
For this application, there is a limited type of access that is needed:
1. Return the pixel at a particular (x,y) location on the screen.
2. Return the R, G, B values for a pixel.

## Q2. If a developer wanted to find a specific element in your data structure, 
how would you search for it?

### Lines
For my implementation of lines, the elements are members (represented by their 
names). There are two operations to find a particular member:

1. search, which tells whether a particular person is in the line.
2. index, which returns the person's place in line, if he is on the line.

### Screens and pixels
For my implementation of screens, the elements are pixels. There is one operation
to find out the pixel at a particular location, which is the 'at' method. at(x,y)
returns the pixel at location (x,y).

There is no method to search for a particular pixel, because pixels really have 
no identity other than their RGB value. You could loop over all locations to look
for a pixel of a particular RGB value, if there was someone reason to want to do
that.

## Q3. What other real-world data can each structure represent?

### Lines
The line can be used to represent any situation in which there is a linear ordering
of objects, and where there are notions of moving up in line. 
* It could represent the line of succession for some position, such King or President.
* It could represent  the order of customers to be served:
    * waiting to get into a movie
    * waiting to get a table at a restaurant
    * waiting to get a haircut, etc.

### Screens and pixels
The idea of a screen could be used to represent the state of any two-dimensional
region, if the elements were changed from pixels to other types of values. For
example
* the current position of a chess board
* the seat assignments in a theater
* the elevation at different latitude and longitude values