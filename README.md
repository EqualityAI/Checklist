<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible AI Checklist
[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community! 

We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI Checklist.

## What is Responsible AI?
Responsible AI is a governance framework that guides how organizations address challenges around AI from an ethical and legal perspective. 

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br />

## What does the AI Checklist do?

This dashboard is designed to provide a clean, accessible, hyper-focused interface to explore and monitor tweets sent during a conference, event, or gathering (IRL or online).

Currently, the dashboard includes the following tabs and features:

- &#x1F4C8; **Frame ML Problems** 

    The opening page show a few statistics about the current volume of tweeting about the conference. If the conference is part of a larger Twitter community, you can also display overall statistics about tweeting in that community. For example, **rstudio::conf** tweets are from members of the broader **#rstats** Twitter community.
    
    The front page also includes the top retweeted and liked tweets from a configurable time window, such as 12 hours, and the most recent tweet sent.
    
- **Acquire & Explore Data** 

    The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
    
- &#x1F3C6; **Architect & Train** 

    The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
    
- &#x1F3C6; **Staged Deployment** 

    The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
        
## Try the AI Checklist for yourself

You can find our post in the RStudio Community [here](https://community.rstudio.com/t/shiny-contest-submission-isee-interactive-and-reproducible-exploration-and-visualization-of-genomics-data/25136).
From there, you can reach all the related links:

- Live app: https://kevinrue.shinyapps.io/isee-shiny-contest/ 

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
