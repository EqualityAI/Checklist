<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible AI Checklist
[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community! 

We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI Checklist.

## What is Responsible AI?
Responsible AI is a governance framework that guides how organizations address challenges around AI from an ethical and legal perspective. 

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br />

## What does the AI Checklist do?

In brief, **iSEE** can be your best friend for interactive and reproducible exploration and visualization of genomics data.

**iSEE** (interactive SummarizedExperiment Explorer) is designed for interactive exploration of high-throughput biological data sets stored in the SummarizedExperiment S4 class. 
It enables simultaneous visualisation of experimental data, associated metadata and analysis results, empowering users to discover new relationships in their data. 
**iSEE** combines shiny with other packages designed for interactive user interfaces (e.g., shinydashboard, shinjs, shinyAce, colourpicker, htmltools), with further extensions to deliver a full-featured application accessible to both novice users and experienced developers.

## Installation

As this package is not currently on CRAN, install it via devtools:

```r
devtools::install_github("")
```

## Access Apps

There are two ways to run these apps:

- access the [Apps.Physiol](http://physiol-seafile.uzh.ch) RStudio Connect server and selected the relevant app
- from the package (see below)

```r
library(CaPO4Sim)
# entry level app
run_CaPO4Sim(context = "introduction")
# virtual patient Bootstrap 4
run_CaPO4Sim(context = "virtual-patient")
```

## Development

Contributions are welcome\! This application uses the
[`renv`](https://rstudio.github.io/renv/) package to manage the versions
of dependencies. After cloning the repository, launch a new session in
the repository root directory and execute `renv::restore()` to download
the package library.

## Contributors

- Kevin Rue-Albrecht (https://github.com/kevinrue)
- Charlotte Soneson (https://github.com/csoneson)
- Federico Marini (https://github.com/federicomarini)
- Aaron Lun (https://github.com/LTLA)
