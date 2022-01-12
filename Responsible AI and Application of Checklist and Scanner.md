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
Figure 1 describes how we determined what metrics to use and when to use them. We compared numerous proposed fairness metrics and crosswalked and organized them into three main metrics: Independence, Sufficiency, and Seperation. After identifying what metrics to use, we then sought to understand the situations in which fairness is of concern. An open source tool by Aequitas started describing real-world situations and a fairness logic tree to provide guidance on metric selection by situation. Paulus, et al. took it one step further by assess specific healthcare situations and when fairness is of concern to the patient. These works helped us to narrow down to four questions that can help choose the appropriate fairness metric.

**Figure 1:** Methodology for selecting a fairness metric
<img src="https://github.com/EqualityAI/Checklist/blob/main/img/fairness_methodology.png" align="left" alt="" width="1000" />

**Table 1:** Crosswalk between fairness metrics
| Publications                                   | Metric                           |Closest match |Note       |
|:----------------------------------------------:|:--------------------------------:|:------------:|:---------:|
|Aequitas                                        |Equal Selection Parity            |Independence  |Relaxation |
|Dwork et al. (2011)                             |Statistical parity                |Independence  |Equivalent |
|                                                |Group fairness                    |Independence  |Equivalent |
|Aequitas                                        |Demographic parity                |Independence  |Equivalent |
|Darlington (1971)                               |Darlington criterion (4)          |Independence  |Relaxation |
|Corbett-Davies et al. (2017)                    |Conditional statistical parity    |Independence  |Equivalent |
|Hardt, Price, Srebro (2016)                     |Equalized odds                    |Separation    |Equivalent |
|Berk et al. (2017)                              |Conditional procedure accuracy    |Separation    |Equivalent |
|Zafar et al. (2017)                             |Avoiding disparate mistreatment   |Separation    |Equivalent |
|Aequitas                                        |False Negative Rate Parity        |Separation    |Relaxation |
|Aequitas                                        |False Positive Rate Parity        |Separation    |Relaxation |
|Hardt, Price, Srebro (2016)                     |Equal opportunity                 |Separation    |Relaxation |
|Chouldechova (2016)                             |Predictive equality               |Separation    |Relaxation |
|Kleinberg, Mullainathan, Raghavan (2016)        |Balance for the negative class    |Separation    |Relaxation |
|Kleinberg, Mullainathan, Raghavan (2016)        |Balance for the positive class    |Separation    |Relaxation |
|Woodworth (2017)                                |Equalized correlations            |Separation    |Relaxation |
|Darlington (1971)                               |Darlington criterion (3)          |Separation    |Relaxation |
|Cleary (1966)                                   |Cleary model                      |Sufficiency   |Relaxation |
|Berk et al. (2017)                              |Conditional use accuracy          |Sufficiency   |Equivalent |
|Chouldechova (2016)                             |Calibration within groups         |Sufficiency   |Equivalent |
|Chouldechova (2016)                             |Predictive parity                 |Sufficiency   |Relaxation |
|Darlington (1971)                               |Darlington criterion (1), (2)     |Sufficiency   |Relaxation |
|Aequitas                                        |False Discovery Rate Parity       |Sufficiency   |Relaxation |
|Aequitas                                        |False Omission Rate Parity        |Sufficiency   |Relaxation |
|Aequitas                                        |False Positives/Group Size parity |Neither       |Neither    |
|Aequitas                                        |False Negatives/Group Size parity |Neither       |Neither    |



## Bias detection <a name="bias-detection"></a> 
### Methodology <a name="methodology"></a> 
As shown in Figure 2, first we identified a framework in which to view bias and then use the existing canon of literature to determine the statistical best practices for identifying the bias and guidance for corrections.

**Figure 2:** Methodology for Data bias scanner
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

