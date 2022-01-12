<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible AI and Application of Checklist and Scanner
1. [What is Resposible AI?](#what-is-respsonsible)
2. [Fairness](#fairness)
  1. [Methodology](#methodology)
4. [Bias detection](#bias-detection)
5. [Transparency](#transparency)

## What is Responsible AI? <a name="what-is-respsonsible"></a> 
AI brings extraordinary opportunities to healthcare, but also incredible responsibility.  AI products in healthcare have a direct impact on people’s health outcomes and lives, which raises considerable questions about ethics, trust, fairness, and risk. The more healthcare decisions we place in the hands of AI, the more risk we accept.  Responsible AI is a framework designed to address that risk with guiding principles applied to AI development to ensure that ethical, equitable, accuracy, and security and privacy standards are met and to mitigate the potential for risk of harm from AI products to individuals and society.

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br/>

## Fairness <a name="fairness"></a> 

## Bias detection <a name="bias-detection"></a> 

### Methodology <a name="methodology"></a> 
Figure 1: Methodology for Data bias scanner
<img src="https://github.com/EqualityAI/Checklist/blob/main/img/bias_methodology.png" align="left" alt="" width="1000" />

## Transparency <a name="transparency"></a> 
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

