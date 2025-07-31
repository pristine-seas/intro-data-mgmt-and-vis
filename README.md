# EVR 528 / 628

## What will you learn?

You will learn how to access, work with, and visualize many different types of environmental data. For example:

- Access hurricane tracks and [build animated visualizations](./hurricane_milton_track.gif)
- Track fishing vessels form space [and build maps of fishing activity](gom_fishing_effort_2024_total.png)
- Develop [interactive web-based apps]( https://682wxr-juan0carlos-villasenor0derbez.shinyapps.io/gom_fishing/) to allow others explore your data
- Create [slides with interactive content](https://jcvdav.github.io/EVR_662/slides/02_data_models_vector#/example-rosenstiel) for effective communication
- And much more!

## Course description

“_Introduction to Data Management and Visualization for Environmental Scientists_"
is designed for students looking to gain basic data management and visualization
skills relevant to careers in environmental science and policy. The course provides
an introduction to using R and RStudio to interact with environmental data; No
coding experience is required. Students will learn highly marketable skills like
visualizing tabular and geospatial data, data management, and reproducibility.
All concepts will be introduced using real-world environmental data sets and
questions. In-class exercises and homework assignments will mimic the types of
tasks and questions that students will encounter in the workforce. 
By the end of the course, students will be comfortable working in R.

## Reading resources
- [R for data science](https://r4ds.hadley.nz/) by Hadley Wickham et al
- [Visual Style Guide](https://www.ipcc.ch/site/assets/uploads/2022/09/IPCC_AR6_WGI_VisualStyleGuide_2022.pdf) by the IPCC
- [Geocomputation with R](https://r.geocompx.org/) by Robin Lovelace et al
- Software documentation and vignettes (examples below):
    - Wikham et al., [Welcome to the Tidyverse](https://cran.r-project.org/web/packages/tidyverse/vignettes/paper.html)
    - Rudis, Ross, & Garnier. [Introduction to the viridis colormaps](https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html)
    - Wikham et al., [Introduction to ggplot2](https://cloud.r-project.org/web/packages/ggplot2/vignettes/ggplot2.html)
- Ad hoc peer review literature and blog posts (examples below)
    - Brett et al., "[Ocean data need a sea change to help navigate the warming world](https://doi.org/10.1038/d41586-020-01668-z)." Nature 582, no. 7811 (2020): 181-183.
    - Jambor, H.K. [A checklist for designing and improving the visualization of scientific data.](https://doi.org/10.1038/s41556-025-01684-z) Nat Cell Biol 27, 879–883 (2025).
    - Englander, G. [“Timeless principles for better figure design”](https://blogs.worldbank.org/en/impactevaluations/timeless-principles-for-better-figure-design). The World Bank. (2024).
- Other relevant sources:
    - [The Visual Display of Quantitative Information](https://www.edwardtufte.com/book/the-visual-display-of-quantitative-information/) by Edward Tufte

# Course schedule

Students must complete any assigned readings and software tests before class. Note that content, and timing of the content, is subject to change. Any changes will be clearly communicated via Canvas. (* Week contains holiday)

The latest official academic calendar is [here](https://registrar.miami.edu/_assets/pdf/academic-calendar-fall-2025.pdf).

## Week 1 (Aug 18-22)
**Introduction to Data Science and RStudio IDE**
- Software installation and testing
- Overview of R Studio IDE
- R Studio Projects and project organization
- R scripts
- R packages: [`tidyverse`](https://www.tidyverse.org/), [`EVR628`](https://jcvdav.github.io/EVR628tools/)

**Relevant links for the week**
- [Instructions to install R and RStudio](https://jcvdav.github.io/EVR_628/docs/01_installing_R_RStudio.html)
- [Slide deck](https://jcvdav.github.io/EVR_628/slides/01_intro.html)

## Week 2 (Aug 25-29)
**Data visualization**
- The grammar of graphics and the [`ggplot2`](https://github.com/tidyverse/ggplot2) package
- Types of visualization
- Visualization principles
- Colorblindness, IPCC’s visual style guide, and the [`viridis`](https://github.com/sjmgarnier/viridis/) package

## *Week3 (Sep 1-5)
**Keeping track of your code with Git and GitHub**
- Reproducible research
- Introduction to file structure
- Version control with [Git](https://git-scm.com/downloads) and [GitHub](https://github.com/)
- Building your first repository (hello world!)

---

**First assignment:** _Setting up your portfolio in GitHub_

---

## Week 4 (Sep 9-12)
**Good coding principles**
- Code style and documentation
- File structure and organization
- Classes, objects, variables, values
- Indexing and subsetting vectors and data frames
- Useful functions in base and stats

## Week 5 (Sep 15-19)
**Scaling up your code and visualizations**
- Layers, geometries, and aesthetics in ggplot2
- Themes with ggplot2
- Other plotting packages (cowplot, GGally)
- Creating documents and presentations with Quarto

---

**Second assignment:** _Data visualization_

---

## Week 6 (Sep 22-26)
**Data management**
- Reading and writing tabular data with here
- Metadata and documentation
- Retrieving environmental datasets from the Internet
- Raw data vs processed data

## Week 7, Sept 29-Oct 3
**Data transformation**
- data.frames and tibbles in the tidyverse
- Rows (filter, arrange, distinct) in dplyr
- Columns (select, rename) in dplyr
- The pipe (native and magrittr)
- Grouping and summarizing data

## Week 8 (Oct 6-10)
**Data tidying and wrangling**
- Principles of tidy data
- Lengthening data with tidyr
- Widening data with tidyr
- Combining multiple sources of data (*_joins)

## Week 9 (Oct 13-17)
**Dealing with text, dates, and factors**
- Managing dates and times with lubridate
- Regular expressions with stringr
- Ordering factors with forcats

---

**Third assignment:** _Data wrangling_

---

## Week 10 (Oct 20-24)
**Working with spatial data in R**
- Vector data and sf
- Raster data and terra
- Exploratory visualizations with plot and mapview

## Week 11 (Oct 27-31)
**Visualizing spatial data**
- Attribute operations
- Building maps with ggplot2 and tmap

---

**Fourth assignment:** _Visualizing spatial data_

---

## Week 12 (Nov 3-7)
**Extensions**
- Connecting to external databases with DBI
- Animating with the `gganimate` package
- Interactive maps with leaflet

## Week 13, (Nov 10-14):
**Programming**
- User-defined functions
- Iteration with loops
- Functional programming with the purrr package
- Background jobs
- Standardizing the environment with .Rprofile

## Week 14, (Nov 17-21)
**Shiny Apps Framework**
- Reactive programming
- UI / UX
- Front-end _vs_ back-end

## *Week 15, (Nov 24-28)
**Thanksgiving recess**

## Week 16: (Dec 4-10)
**FINAL EXAMS WEEK**

---

Final presentations (egg timers)

---

