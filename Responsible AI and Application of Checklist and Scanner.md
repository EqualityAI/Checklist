<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible AI checklist & Data bias scanner
1. [What is Resposible AI?](#frame-ml-problems)
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

## Development

Contributions are welcome\! This application uses the
[`renv`](https://rstudio.github.io/renv/) package to manage the versions
of dependencies. After cloning the repository, launch a new session in
the repository root directory and execute `renv::restore()` to download
the package library.


## Citations
1. 

## Contributors

- Equality AI (https://equality-ai.com/)

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="left" alt="" width="120" />

[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community!  We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI checklist and Data bias scanner.

