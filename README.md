# EVR 528 / 628

**Course description**

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

**Resources**

- [Syllabus](docs/syllabus.pdf)
- **Cheat sheets**
  - [RStudio IDE](https://rstudio.github.io/cheatsheets/html/rstudio-ide.html)
  - [Base R](https://rstudio.github.io/cheatsheets/base-r.pdf)
  - [`{ggplot2}`](https://rstudio.github.io/cheatsheets/data-visualization.pdf)
  - [Git and GitHub](https://rstudio.github.io/cheatsheets/git-github.pdf)
  - [`{readr}`](https://rstudio.github.io/cheatsheets/data-import.pdf)
  - [`{dplyr}`](https://rstudio.github.io/cheatsheets/data-transformation.pdf)
  - [`{tidyr}`](https://rstudio.github.io/cheatsheets/tidyr.pdf)
  - [`{forcats}`](https://rstudio.github.io/cheatsheets/factors.pdf)
  - [`{lubridate}`](https://rstudio.github.io/cheatsheets/lubridate.pdf)
  - [`{stringr}`](https://rstudio.github.io/cheatsheets/html/strings.html)
  - [`{quarto}`](https://rstudio.github.io/cheatsheets/quarto.pdf)
  - [`{sf}`](https://github.com/rstudio/cheatsheets/blob/main/sf.pdf)
  - [Some available in Spanish](https://rstudio.github.io/cheatsheets/translations.html#spanish)
- **My code snippets**
  - [Code documentation](https://gist.github.com/jcvdav/1093d757bf1773751e951d009de4d857)
- **Others**
  - [I accidentally committed a file > 100 MB to git](docs/git_large_file.html)

# Course schedule

Students must complete any assigned readings and software tests before class. Note that content, and timing of the content, is subject to change. Any changes will be clearly communicated via Canvas. The latest official academic calendar is [here](https://registrar.miami.edu/_assets/pdf/academic-calendar-fall-2025.pdf)  (* Week contains holiday).

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
- [Link](https://jcvdav.github.io/EVR_628/docs/02_live.html) to document from live coding session

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
- [Link](https://jcvdav.github.io/EVR_628/docs/03_live.html) to document from live coding session

---

**First assignment:** _Setting up your portfolio in GitHub_

---

## Week 4 (Sep 8-12)
**Good coding principles** | [slides](slides/04_coding_principles.html)
- Code style and documentation
- Classes, objects, variables, values
- Indexing and subsetting vectors
- Useful functions in `{base}` and `{stats}`

**Relevant links for the week**
- Assigned readings: 
  - R4DS [CH2: Worflow: basics](https://r4ds.hadley.nz/workflow-basics.html)
  - R4DS [CH4: Workflow: code style](https://r4ds.hadley.nz/workflow-style.html)
- [Link](https://jcvdav.github.io/EVR_628/docs/04_live.html) to document from live coding session


## Week 5 (Sep 15-19)
**data.frames** | [slides](slides/04_coding_principles.html)
- Indexing and subsetting data.frames
- Useful functions in `{base}` and `{stats}`
- Other links:
  - [Villaseñor-Derbez et al (2018)](https://doi.org/10.1371/journal.pone.0191821). A user-friendly tool to evaluate the effectiveness of no-take marine reserves. PLoS One, 13(1), e0191821.
  - [Lynham & Villaseñor-Derbez (2024)](https://www.science.org/doi/10.1126/science.adn1146). Evidence of spillover benefits from large-scale marine protected areas to purse seine fisheries. Science, 386(6727), 1276-1281.
- [Link](https://jcvdav.github.io/EVR_628/docs/04_live.html) to document from live coding session


## Week 6 (Sep 22-26)
**Data management and transformation** | [slides](slides/06_data_management.html)
- Relative vs. absolute paths
- Reading and writing tabular data (`*csv` and `*.rds`)
- Modifying rows (filter, arrange, distinct) with `{dplyr}`
- Modifying columns (select, rename) with `{dplyr}`
- Grouping and summarizing data with `{dplyr}`

**Relevant links for the week:**
- Assigned readings:
  - R4DS [CH7: Data import](https://r4ds.hadley.nz/data-import.html)
  - R4DS [CH3: Data transformation](https://r4ds.hadley.nz/data-transform.html)
- [Link](https://jcvdav.github.io/EVR_628/docs/06_live.html) to document from live coding session

## Week 7 Sept 29-Oct 3
**Data tidying and wrangling** | [slides](slides/07_data_wrangling.html)
- Lengthening data with `tidyr`
- Widening data with `tidyr`
- Combining multiple sources of data (`*_joins`)

**Relevant links for the week:**
- Assigned readings:
  - R4DS [CH5: Data tidying](https://r4ds.hadley.nz/data-tidy.html)
  - R4DS [CH19: Joins (sections 19.1 - 19.4 only)](https://r4ds.hadley.nz/joins.html)
- Other readings:
  - Wickham, Hadley. 2014. “Tidy Data.” The Journal of Statistical Software 59. [http://www.jstatsoft.org/v59/i10/](http://www.jstatsoft.org/v59/i10/)
- [Link](https://jcvdav.github.io/EVR_628/docs/07_live.html) to document from live coding session

## Week 8 (Oct 6-10)
**Scaling up your code and visualizations** | [slides](slides/08_scale_up_viz.html)
- Refresh on layers: aesthetics and geometries
- Themes with ggplot2
- Position adjustments (`jitter` and `dodge`)
- Summarizing data on the fly (`stat_summary`, `geom_smooth`)
- Plot extensions (`{ggridges}` and `{cowplot}`)
- quarto markdown

**Relevant links for the week:**
- Assigned readings:
  - R4DS [CH9: Layers](https://r4ds.hadley.nz/layers.html)
  - R4DS [CH11: Communication](https://r4ds.hadley.nz/communication.html)

---

**Second assignment:** [_Data wrangling_](docs/assig_2.html) due Oct 19

---


## *Week 9 (Oct 13-17)
**Scaling up your code and visualizations 2** | [slides](slides/08_scale_up_viz.html)
- Facetting
- Summarizing data on the fly (`stat_summary`, `geom_smooth`)
- Plot extensions (`{ggridges}` and `{cowplot}`)
- quarto markdown


## Week 10 (Oct 20-24)
**Dealing with text, dates, and factors** | [slides](slides/10_factors_dates_text.html)
- Ordering factors with `forcats`
- Managing dates and times with `lubridate`
- Regular expressions with `stringr`

**Relevant links for the week:**
- Assigned readings:
  - R4DS [CH14: Strings](https://r4ds.hadley.nz/strings.html)
  - R4DS [CH15: Regular expressions](https://r4ds.hadley.nz/regexps.html)
  - R4DS [CH16: Factors](https://r4ds.hadley.nz/factors.html)
  - R4DS [CH17: Dates and times](https://r4ds.hadley.nz/datetimes.html)
- [Link](https://jcvdav.github.io/EVR_628/docs/10_live.html) to document from live coding session

---

**Third assignment:** [_Data visualization_](docs/assig_3.html) due Nov 2

---

## Week 11 (Oct 27-31)
**Working with spatial data in R** | [slides](slides/11_spat_data_1.html)
- Vector data and `sf`
- Exploratory visualizations with `plot` and `mapview`

**Relevant links for the week:**
- Assigned readings:
  - Geocomputation with R [CH1 - Introduction](https://r.geocompx.org/intro)
  - Geocomputation with R [CH2 - Geographic data in R (stop at 2.2)](https://r.geocompx.org/spatial-class)
- Additional reading:
  - [Towards Data Science: Why you need to use Geopackage files instead of shapefile or GeoJSON](https://towardsdatascience.com/why-you-need-to-use-geopackage-files-instead-of-shapefile-or-geojson-7cb24fe56416/)
- [Link](docs/11_live.html) to document for live coding session


## Week 12 (Nov 3-7)
**Visualizing spatial data** | [slides](slides/12_spat_data_2.html)
- Raster data and `terra`
- Attribute operations
- Building maps with `ggspatial` and `tidyterra`

**Relevant links for the week:**
- Assigned readings:
  - Geocomputation with R [CH2 - Geographic data in R (2.3-2.5)](https://r.geocompx.org/spatial-class)
- [Link](docs/12_live.html) to document for live coding session

---

**Fourth assignment:** [_Visualizing spatial data_](docs/assig_4.html)

---

## Week 13, (Nov 10-14):
**Quarto markdown** | [slides](slides/13_quarto.html)
- Intro to quarto markdown
- Slides
- Documents (html and pdf)
- Build your website

- [Link](slides/sample_slides.html) to sample slide deck we'll build
- [Link](docs/sample_doc.html) to sample doc we'll build

## Week 14, (Nov 17-21)
**Programming** | slides
- Background jobs
- User-defined functions
- Iteration with loops

**Extensions** | slides
- Standardizing the environment with `.Rprofile`
- Shiny Apps Framework
- Connecting to external databases with DBI
- Animating with the `gganimate` package
- Interactive maps with leaflet
- Retrieving environmental datasets from the Internet (`gfwr`, `rerddap`)

---

**FINAL PROJECT:** _From cleaning to communicating_

---

## *Week 15, (Nov 24-28)
**Thanksgiving recess**

- No class

## Week 16: (Dec 1-5)
[**Final Exams week Dec 4 - Dec 10**](https://registrar.miami.edu/_assets/pdf/academic-calendar-fall-2025.pdf)

- No class, final projects due online

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
