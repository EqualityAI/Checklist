<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible AI Checklist
<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />
1. [Frame ML Problems](#frame-ml-problems)
2. [Acquire & Explore Data](#acquire-&-explore-data)
3. [Architect & Train](#architect-&-train)
4. [Staged Deployment](#staged-deployment)

[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community! 

We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI Checklist.

## What is Responsible AI?
Responsible AI is a governance framework that guides how organizations address challenges around AI from an ethical and legal perspective. 

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br />

## What does the AI Checklist do?

### Frame ML Problems<a name="frame-ml-problems" />
The opening page show a few statistics about the current volume of tweeting about the conference. If the conference is part of a larger Twitter community, you can also display overall statistics about tweeting in that community. For example, **rstudio::conf** tweets are from members of the broader **#rstats** Twitter community.
The front page also includes the top retweeted and liked tweets from a configurable time window, such as 12 hours, and the most recent tweet sent.
    
### Acquire & Explore Data<a name="acquire-&-explore-data" />
The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
    
### Architect & Train<a name="architect-&-train" />

    The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
    
- **Staged Deployment** <a name="staged-deployment" />

    The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
        
## What questions can you answer, if you save the data?
1. **Suggest metrics from the description text alone.** From the description, use NLP AI to suggest the metrics that suit the situation (is a positive model prediction assistive? Then we should use a metric focusing on false negative parity. With NLP we can suggest this from just the text).<br /><br />
2. **Predict model deployment probability bias.** If we collect information about the models that are actually deployed. We can predict the probability that a model will be deployed, using the checklist contents as covariates.<br /> 
3. **Forecast the model deployment bias.** We can also use that same checklist information to forecast the model deployment bias.<br /> 
4. **Suggest the impact of the model on the real world.** If a model is likely to be deployed, based on the metrics selected, we can determine the real world impact. (We can do this for incorrectly selected metrics as well).<br /> 
5. **Determine what metrics are most likely to be successfully deployed.** Maybe some model metrics are associated with successful deployment (low deployment bias), and others are not.  We can learn this from the data.<br /> 
6. **Determine what the "true" barriers are to model success.** Generic scientific questions can be answered using this data. Someone may answer the question "What models are most likely to be deployed successfully?"


        
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

## Connect to a database

Edit this in the global.R

```r
options(mysql = list(
  "host" = "127.0.0.1",
  "port" = 3306,
  "user" = "myuser",
  "password" = "mypassword"
))
databaseName <- "myshinydatabase"
table <- "responses"
```

Specify which inputs, the table, and structure of the data in the server.R

```r
query <- sprintf(
      "INSERT INTO %s (%s) VALUES ('%s')",
      table, 
      paste(names(data), collapse = ", "),
      paste(data, collapse = "', '")
    )
```


## Development

Contributions are welcome\! This application uses the
[`renv`](https://rstudio.github.io/renv/) package to manage the versions
of dependencies. After cloning the repository, launch a new session in
the repository root directory and execute `renv::restore()` to download
the package library.

## Contributors

- Equality AI (https://equality-ai.com/)

