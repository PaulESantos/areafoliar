
<!-- README.md is generated from README.Rmd. Please edit that file -->

# areafoliar

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/areafoliar)](https://CRAN.R-project.org/package=areafoliar)
<!-- badges: end -->

The goal of areafoliar is to …

## Installation

You can install the development version of areafoliar like so:

``` r
<<<<<<< HEAD
pak::pak("PaulESantos/areafoliar")
=======
# pak::pak("PaulESantos/areafoliar")
>>>>>>> 4befe4c1f5335e270c9e53cb02a37f26187f129d
```

## Example

This is a basic example which shows you how to use `areafoliar`:

``` r
library(areafoliar)
```

- List leaves scans images

``` r
areafoliar::read_img_scans("img")
[1] ".\\img\\adz4221.jpg" ".\\img\\AEK3200.jpg"
[3] ".\\img\\age5100.jpg" ".\\img\\agi6847.jpg"
[5] ".\\img\\agm9169.jpg" ".\\img\\AGO3356.jpg"
[7] ".\\img\\agq6243.jpg" ".\\img\\AGS2215.jpg"
```

- Leaf area calculation

``` r
areafoliar::read_img_scans("img") |> 
areafoliar::map_leaf_area(output.folder = "output")

C:\Program Files\ImageJ>exit
                       id leaf_area_cm2
1   adz4221.jpg.txt.Area1         0.148
2   adz4221.jpg.txt.Area2         0.309
3   adz4221.jpg.txt.Area3         0.055
4   adz4221.jpg.txt.Area4         0.351
5   adz4221.jpg.txt.Area5         0.432
6   adz4221.jpg.txt.Area6         0.016
7   adz4221.jpg.txt.Area7         0.346
8   adz4221.jpg.txt.Area8         0.094
9   adz4221.jpg.txt.Area9         0.102
10 adz4221.jpg.txt.Area10         0.359
11 adz4221.jpg.txt.Area11         0.279
12 adz4221.jpg.txt.Area12         0.245
13 adz4221.jpg.txt.Area13         0.112
14  AEK3200.jpg.txt.Area1         1.140
15  AEK3200.jpg.txt.Area2         0.666
16  AEK3200.jpg.txt.Area3         0.097
17  age5100.jpg.txt.Area1         0.112
18  age5100.jpg.txt.Area2         0.089
19  agi6847.jpg.txt.Area1         1.171
20  agi6847.jpg.txt.Area2         1.019
21  agm9169.jpg.txt.Area1         0.967
22  agm9169.jpg.txt.Area2         1.192
23  agm9169.jpg.txt.Area3         0.645
24  agm9169.jpg.txt.Area4         0.637
25  AGO3356.jpg.txt.Area1         0.172
26  AGO3356.jpg.txt.Area2         0.269
27  AGO3356.jpg.txt.Area3         0.239
28  AGO3356.jpg.txt.Area4         0.316
29  AGO3356.jpg.txt.Area5         0.211
30  agq6243.jpg.txt.Area1         0.007
31  agq6243.jpg.txt.Area2         0.282
32  agq6243.jpg.txt.Area3         0.331
33  AGS2215.jpg.txt.Area1         0.190
34  AGS2215.jpg.txt.Area2         0.458
35  AGS2215.jpg.txt.Area3         0.432
36  AGS2215.jpg.txt.Area4         0.440
37  AGS2215.jpg.txt.Area5         0.358
38  AGS2215.jpg.txt.Area6         0.364
```

- Summarise leaf area data

``` r

areafoliar::read_img_scans("img") |> 
areafoliar::map_leaf_area(output.folder = "output") |> 
areafoliar::summarise_leaf_area()


       id numb_part leaf_area_cm2
1 adz4221        13         2.848
2 AEK3200         3         1.903
3 age5100         2         0.201
4 agi6847         2         2.190
5 agm9169         4         3.441
6 AGO3356         5         1.207
7 agq6243         3         0.620
8 AGS2215         6         2.242
```
