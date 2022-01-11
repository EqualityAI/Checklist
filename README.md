<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible AI Checklist
1. [Frame ML problems](#frame-ml-problems)
    1. [Project title or objective](#project-title-or-objective)
    2. [Expected stakeholders](#expected-stakeholders)
    3. [Types of harm](#types-of-harm)
    4. [Trade offs](#trade-offs)
    5. [Team members](#team-members)
2. [Acquire & Explore Data](#acquire-&-explore-data)
    1. [Population](#population)
    2. [Study setting](#study-setting)
    3. [Data source](#data-source)
    4. [Cohort selection](#cohort-selection)
3. [Data bias scanner](#data-bias-scanner)
    1. 
4. [Architect & train](#architect-&-train)
    1. [Model output](#model-output)
    2. [Target user](#target-user)
    3. [Data splitting](#data-splitting)
    4. [Gold standard](#gold-standard)
    5. [Model task](#model-task)
    6. [Model architecture](#model-architecture)
    7. [Features](#features)
    8. [Missingness](#missingness)
5. [Staged Deployment](#staged-deployment)
    1. [Optimization](#optimization)
    2. [Internal model validation](#internal-model-validation)
    3. [External model validation](#external-model-validation)
    4. [Transparency](#transparency)

## What is Responsible AI?
Responsible AI is a governance framework that guides how organizations address challenges around AI from an ethical and legal perspective. 

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br />

## What does the AI Checklist do?

### Frame ML Problems<a name="frame-ml-problems" />
#### Project title or objective<a name="project-title-or-objective"></a> | Expected Stakeholders <a name="expected-stakeholders"></a> | Types of harm <a name="types-of-harm"></a> | Trade offs <a name="trade-offs"></a> | Team members <a name="team-members"></a> 

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/CodeCogsEqn.svg" align="left" alt="" width="120" /><br />

The opening page show a few statistics about the current volume of tweeting about the conference. If the conference is part of a larger Twitter community, you can also display overall statistics about tweeting in that community. For example, **rstudio::conf** tweets are from members of the broader **#rstats** Twitter community.
The front page also includes the top retweeted and liked tweets from a configurable time window, such as 12 hours, and the most recent tweet sent.
    
### Acquire & Explore Data<a name="acquire-&-explore-data" />
#### Population <a name="population"></a> | Study setting <a name="study-setting"></a> | Data source <a name="data-source"></a> | Cohort selection <a name="cohort-selection"></a>

The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.

### Data bias scanner <a name="data-bias-scanner" />

### Architect & Train<a name="architect-&-train" />
#### Model output<a name="model-output"></a> | Target user <a name="target-user"></a> | Data splitting <a name="data-splitting"></a> | Gold standard <a name="gold-standard"></a> | Model task <a name="model-task"></a> | Model architecture <a name="model-architecture"></a> | Features <a name="features"></a> | Missingness <a name="missingness"></a> 

The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
    
### Staged Deployment <a name="staged-deployment" />
#### Optimization<a name="optimization"></a> | Internal model validation <a name="internal-model-validation"></a> | External model validation <a name="external-model-validation"></a> | Transparency <a name="transparency"></a> 

The high score tab gives a "leaderboard" for users, hashtags, words, and emojis for tweets about the conference. This can be a fun way to gauge topics of disucssion, attendee or participant experiences, or to motivate users to participate.
    
## Try the checklist for yourself
There are two ways to run these apps:

- Live app: https://kevinrue.shinyapps.io/isee-shiny-contest/ 
- Download and run app

## Save & use data

### What questions can you answer, if you save the data?
1. **Suggest metrics from the description text alone.** From the description, use NLP AI to suggest the metrics that suit the situation (is a positive model prediction assistive? Then we should use a metric focusing on false negative parity. With NLP we can suggest this from just the text).<br /><br />
2. **Predict model deployment probability bias.** If we collect information about the models that are actually deployed. We can predict the probability that a model will be deployed, using the checklist contents as covariates.<br /> 
3. **Forecast the model deployment bias.** We can also use that same checklist information to forecast the model deployment bias.<br /> 
4. **Suggest the impact of the model on the real world.** If a model is likely to be deployed, based on the metrics selected, we can determine the real world impact. (We can do this for incorrectly selected metrics as well).<br /> 
5. **Determine what metrics are most likely to be successfully deployed.** Maybe some model metrics are associated with successful deployment (low deployment bias), and others are not.  We can learn this from the data.<br /> 
6. **Determine what the "true" barriers are to model success.** Generic scientific questions can be answered using this data. Someone may answer the question "What models are most likely to be deployed successfully?"

### Connect to a database

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

### Save to .txt

```r
Add code
```


## Development

Contributions are welcome\! This application uses the
[`renv`](https://rstudio.github.io/renv/) package to manage the versions
of dependencies. After cloning the repository, launch a new session in
the repository root directory and execute `renv::restore()` to download
the package library.

### Enterprise version in development

The enterprise version ... 

```r
Add code
```

## Citations
1. 

## Contributors

- Equality AI (https://equality-ai.com/)

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="left" alt="" width="120" />

[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community!  We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI checklist and Data bias scanner.

