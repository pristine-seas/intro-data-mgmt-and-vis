# EVR 528 / 628

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

## Resources

- [Syllabus](docs/syllabus.pdf)

**Cheat sheets**

- [RStudio IDE](https://rstudio.github.io/cheatsheets/html/rstudio-ide.html)
- [Base R](https://rstudio.github.io/cheatsheets/base-r.pdf)
- [`{ggplot2}`](https://rstudio.github.io/cheatsheets/html/data-visualization.html)
- [Git and GitHub](https://rstudio.github.io/cheatsheets/git-github.pdf)
- [Some available in Spanish](https://rstudio.github.io/cheatsheets/translations.html#spanish)

**My code snippets**
- [Code documentation](https://gist.github.com/jcvdav/1093d757bf1773751e951d009de4d857)

# Course schedule

Students must complete any assigned readings and software tests before class. Note that content, and timing of the content, is subject to change. Any changes will be clearly communicated via Canvas. (* Week contains holiday)

The latest official academic calendar is [here](https://registrar.miami.edu/_assets/pdf/academic-calendar-fall-2025.pdf).

## Week 1 (Aug 18-22)
**Introduction to Data Science and RStudio IDE** | [slides](slides/01_intro.html)
- Software installation and testing
- Overview of R Studio IDE
- R Studio Projects and project organization
- R scripts
- R packages: [`{tidyverse}` package](https://www.tidyverse.org/), [`{EVR628tools}` package](https://jcvdav.github.io/EVR628tools/)

**Relevant links for the week**
- [Instructions to install R and RStudio](docs/01_installing_R_RStudio.html)

## Week 2 (Aug 25-29)
**Data visualization** | [slides](slides/02_data_vis.html)
- Types of visualization
- Visualization principles
- The grammar of graphics and the [`{ggplot2}` package](https://github.com/tidyverse/ggplot2)

**Relevant links for the week**
- Assigned readings: 
  - Jambor, H.K. ["A checklist for designing and improving the visualization of scientific data."](https://doi.org/10.1038/s41556-025-01684-z) Nat Cell Biol 27, 879–883 (2025).
  - R4DS [CH1: Data visualization](https://r4ds.hadley.nz/data-visualize.html)
- Other links: 
  - Englander, G. [“Timeless principles for better figure design”](https://blogs.worldbank.org/en/impactevaluations/timeless-principles-for-better-figure-design). The World Bank
  - IPCC [Visual Style Guide](https://www.ipcc.ch/site/assets/uploads/2022/09/IPCC_AR6_WGI_VisualStyleGuide_2022.pdf) by the IPCC
  - The [R Graph Gallery](https://r-graph-gallery.com/)
  - [Data-to-viz](https://www.data-to-viz.com/)
- [Link](https://jcvdav.github.io/EVR_628/docs/02_live.html) to document from live coding sessions

## *Week3 (Sep 1-5)
**Keeping track of your code with Git and GitHub** | [slides](slides/03_git_and_github.html)
- Reproducible research
- Introduction to file structure
- Version control with [Git](https://git-scm.com/downloads) and [GitHub](https://github.com/)
- Building your first repository (hello world!)

**Relevant links for the week**
- [Instructions to install git and create GitHub account](docs/03_installing_git.html)
- Other links: 
  - Pereira-Braga et al ["Not just for programmers: How GitHub can accelerate collaborative and reproducible research in ecology and evolution"](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.14108) Methods in Ecology and Evolution
  - [Happy Git with R](https://happygitwithr.com/)
- [Link](https://jcvdav.github.io/EVR_628/docs/03_live.html) to document from live coding sessions

---

**First assignment:** _Setting up your portfolio in GitHub_

---

## Week 4 (Sep 8-12)
**Good coding principles** | [slides](slides/04_coding_principles.html)
- Code style and documentation
- Classes, objects, variables, values
- Indexing and subsetting vectors and data frames
- Useful functions in `{base}` and `{stats}`

**Relevant links for the week**
- Assigned readings: 
  - R4DS [CH2: Worflow: basics](https://r4ds.hadley.nz/workflow-basics.html)
  - R4DS [CH4: Workflow: code style](https://r4ds.hadley.nz/workflow-style.html)
- [Link](https://jcvdav.github.io/EVR_628/docs/04_live.html) to document from live coding sessions


## Week 5 (Sep 15-19)
**Data management** | slides
- data.frames
- Raw data vs processed data
- Relative vs absolute paths and the [`{here}` package](https://here.r-lib.org/)
- Reading and writing tabular data (`*csv` and `*.rds`)
- Metadata and documentation

**Relevant links for the week:**
- Assigned readings:
  - R4DS [CH5: Data tidying](https://r4ds.hadley.nz/data-tidy.html)
- Other links:
  - [Villaseñor-Derbez et al (2018)](https://doi.org/10.1371/journal.pone.0191821). A user-friendly tool to evaluate the effectiveness of no-take marine reserves. PLoS One, 13(1), e0191821.
  - [Lynham & Villaseñor-Derbez (2024)](https://www.science.org/doi/10.1126/science.adn1146). Evidence of spillover benefits from large-scale marine protected areas to purse seine fisheries. Science, 386(6727), 1276-1281.

## Week 6 (Sep 22-26)
**Data transformation** | slides
- data frames and tibbles in the `tidyverse`
- Rows (filter, arrange, distinct) in `dplyr`
- Columns (select, rename) in `dplyr`
- The pipe (native and magrittr)
- Grouping and summarizing data

## Week 7 Sept 29-Oct 3
**Data tidying and wrangling** | slides
- Principles of tidy data
- Lengthening data with `tidyr`
- Widening data with `tidyr`
- Combining multiple sources of data (`*_joins`)

---

**Third assignment:** _Data wrangling_

---

## Week 8 (Oct 6-10)
**Scaling up your code and visualizations** | slides
- Refresh on layers: aesthetics and geometries
- Themes with ggplot2
- Statistical transformations
- Position adjustments
- Coordinate systems
- Colorblindness, IPCC’s visual style guide, and the [`viridis`](https://github.com/sjmgarnier/viridis/) package
- Summarizing data on the fly (`stat_summary`, `geom_smooth`)
- Plot extensions (`{cowplot}`, `{GGally}`, `{ggrepel}`)
- Animated plots (`{ggplotly}`)
- Creating documents and presentations with Quarto

## Week 9 (Oct 13-17)
**Dealing with text, dates, and factors** | slides
- Managing dates and times with `lubridate`
- Regular expressions with `stringr`
- Ordering factors with `forcats`

---

**Second assignment:** _Data visualization_

---

## Week 10 (Oct 20-24)
**Working with spatial data in R** | slides
- Vector data and `sf`
- Exploratory visualizations with `plot` and `mapview`

## Week 11 (Oct 27-31)
**Visualizing spatial data** | slides
- Raster data and `terra`
- Attribute operations
- Building maps with `ggplot2` and `tmap`

---

**Fourth assignment:** _Visualizing spatial data_

---

## Week 12 (Nov 3-7)
**Extensions** | slides
- Connecting to external databases with DBI
- Animating with the `gganimate` package
- Interactive maps with leaflet
- Retrieving environmental datasets from the Internet (`gfwr`, `rerddap`)

## Week 13, (Nov 10-14):
**Programming** | slides
- User-defined functions
- Iteration with loops
- Functional programming with the purrr package
- Background jobs
- Standardizing the environment with .Rprofile

## Week 14, (Nov 17-21)
**Shiny Apps Framework** | slides
- Reactive programming
- UI / UX
- Front-end _vs_ back-end

## *Week 15, (Nov 24-28)
**Thanksgiving recess**

## Week 16: (Dec 1-5)
[**FINAL EXAMS Dec 4 - Dec 10**](https://registrar.miami.edu/_assets/pdf/academic-calendar-fall-2025.pdf)

---

Final presentations (egg timers)

---

## What will you learn?

You will learn how to access, work with, and visualize many different types of environmental data. For example:

- Access hurricane tracks and [build animated visualizations](./hurricane_milton_track.gif)
- Track fishing vessels form space [and build maps of fishing activity](gom_fishing_effort_2024_total.png)
- Develop [interactive web-based apps]( https://682wxr-juan0carlos-villasenor0derbez.shinyapps.io/gom_fishing/) to allow others explore your data
- Create [slides with interactive content](https://jcvdav.github.io/EVR_662/slides/02_data_models_vector#/example-rosenstiel) for effective communication
- And much more!

## Reading resources
- Books and manuals:
    - [R for data science](https://r4ds.hadley.nz/) by Hadley Wickham et al
    - [Geocomputation with R](https://r.geocompx.org/) by Robin Lovelace et al
- Ad hoc peer review literature and blog posts:
    - Brett et al., ["Ocean data need a sea change to help navigate the warming world"](https://doi.org/10.1038/d41586-020-01668-z). Nature 582, no. 7811 (2020): 181-183.
    - Jambor, H.K. ["A checklist for designing and improving the visualization of scientific data."](https://doi.org/10.1038/s41556-025-01684-z) Nat Cell Biol 27, 879–883 (2025).
    - Englander, G. [“Timeless principles for better figure design”](https://blogs.worldbank.org/en/impactevaluations/timeless-principles-for-better-figure-design). The World Bank. (2024).
- Other relevant sources:
    - [The Visual Display of Quantitative Information](https://www.edwardtufte.com/book/the-visual-display-of-quantitative-information/) by Edward Tufte
