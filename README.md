# JAGridView (Beta)

**A Masonry-style image gallery wrapper on UITableView.**

![image](http://iamjo.sh/github-images/jagridview/1.png)

## Overview
This is a fast, performant library to easily create a Masonry-style image gallery while leveraging the speed, caching, and feel of a `UITableView` control.

## Discussion

This is an **early public beta** and, therefore, some aspects of the library are still rough, but it is fully functional.

This was developed for an in-house project, so much of the current implementation was tailored to my specific, time-constrained needs. A project roadmap has been developed to eventually make this library more useful to everyone.

At its core, `JAGridView` is an implementation on top of `UITableView`. This enables `JAGridView` to leverage many aspects of the `UITableView` control. Moving forward, it will be the goal of this project to develop the `JAGridViewDelegate` protocol to closely follow `UITableView` conventions.

`JAGridView` uses `UIViewContentModeScaleAspectFill` scaling of source images to fit them within elements in the grid. This may lead to some slight clipping around the outer regions of source images.

Inspiration for `JAGridView` comes from Picasa photo galleries ([example](https://plus.google.com/photos/105067663123386047324/albums/5682401004199004193)).

A sample app is included to demonstrate how to use `JAGridView`.

## Project Roadmap
* Add left-oriented and right-oriented 'hero' image layouts (`kJAGridTableViewCellHeroLeft` and `kJAGridTableViewCellHeroRight`).

* After the hero layouts are implemented, add support for a random selection of row layout by `JAGridView` whenever it draws each row.

* Implement interaction feedback in the custom `JAGridImageControl`s to notify a delegate when the user interacts with an image.
 
* Add support to the `JAGridViewDelegate` protocol for using a `UIImage` collection as a data source.

* Reimplement the sorted model array logic using `NSSortDescriptor`s.


## Dependencies
* [AFNetworking](http://afnetworking.org)


**Contributions, corrections, and improvements are always appreciated!**

## Created By
Josh Avant

## License
This is licensed under a MIT/Beerware License:

    Copyright (c) 2012 Josh Avant

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.

    If we meet some day, and you think this stuff is worth it, you can buy me a
    beer in return.