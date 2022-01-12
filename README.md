<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible AI checklist & Data bias scanner
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
(generic explanation of what is responsible AI)

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br />

## What does the AI Checklist do?
The EAI checklist provides an easy to use Responsible GUI tool for executives and ML developers to select a fairness metric, run a bias data scanner, and promote transparency (i.e. reproducibility, generalizability, and interpretability of a proposed model) (1), and provide documentation to learn from historically deployed models.

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/independence.svg" align="left" alt="" width="120" /><br />
<img src="https://github.com/EqualityAI/Checklist/blob/main/img/seperation.svg" align="left" alt="" width="120" /><br />

### Fairness 

### Bias detection

### Transparency
A lack of transparency regarding the training data used for model development directly affects the reproducibility, generalizability, and interpretability of a proposed model. (1) Therefore, we need transparency in the reporting of the design, development, evaluation, and validation of AI models in health care to achieve and retain confidence and trust for all the stakeholders. (1) Transparency is needed across 3 main categories: the population from which the data were acquired; model design and development, including training data; and model evaluation and validation. (1)

The Acquire & Explore Data, Data bias scanner (specifically the patient demographic characteristics), Architect & train, and Staged deployment sections of the checklist are anchored in MINIMAR (MINimum Information for Medical AI Reporting) feeding into ongoing initiatives such as CONSORT, SPIRIT (11), and TRIPOD-ML(1) to include an ML or AI component.

## Checklist components
### Frame ML Problems<a name="frame-ml-problems" />
- **Expected Stakeholders** <a name="expected-stakeholders"></a> : 
- **Types of harm** <a name="types-of-harm"></a> : 
- **Trade offs** <a name="trade-offs"></a> : 
- **Cohort selection** <a name="team-members"></a> : 

### Acquire & Explore Data<a name="acquire-&-explore-data" />
- **Population** <a name="population"></a> : Population from which study sample was drawn
- **Study setting** <a name="study-setting"></a> : The setting in which the study was conducted (e.g., academic medical left, community healthcare system, rural healthcare clinic)
- **Data source** <a name="data-source"></a> : The source from which data were collected
- **Cohort selection** <a name="cohort-selection"></a> : Exclusion/inclusion criteria

### Data bias scanner <a name="data-bias-scanner" />
- **Age** <a name="age"></a> : Age of patients included in the study
- **Sex** <a name="sex"></a> : Sex breakdown of study cohort
- **Race** <a name="race"></a> : Race characteristics of patients included in the study
- **Ethnicity** <a name="ethnicity"></a> : Ethnicity breakdown of patients included in the study
- **Socioeconomic status** <a name="socioeconomic-status"></a> : A measure or proxy measure of the socioeconomic status of patients included in the study

### Architect & Train<a name="architect-&-train" />
- **Model output** <a name="model-output"></a> : The computed result of the model
- **Target user** <a name="target-user"></a> :  The indented user of the model output (eg, clinician, hospital management team, insurance company)
- **Data splitting** <a name="data-splitting"></a> : How data were split for training, testing, and validation
- **Gold standard** <a name="gold-standard"></a> : Labeled data used to train and test the model
- **Model task** <a name="model-task"></a> : Classification or prediction
- **Model architecture** <a name="model-architecture"></a> : Algorithm type (eg, machine learning, deep learning, etc.)
- **Features** <a name="features"></a> : List of variables used in the model and how they were used in the model in terms of categories or transformation
- **Missingness** <a name="missingness"></a> : How missingness was addressed: reported, imputed, or corrected


### Staged Deployment <a name="staged-deployment" />
- **Optimization** <a name="optimization"></a> : Model or parameter tuning applied
- **Internal model validation** <a name="internal-model-validation"></a> : Study internal validation
- **External model validation** <a name="external-model-validation"></a> : External validation using data from another setting
- **Transparency** <a name="transparency"></a> : How code and data are shared with the community

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

