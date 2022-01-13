<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Responsible Application of Checklist and Scanner
1. [What is Responsible AI?](#what-is-responsible-ai)
2. [Fairness](#fairness)
    1. [Introduction](#introduction_f)
    2. [The challenge](#challenge_f)
    3. [Methodology](#methodology_f)
3. [Transparency](#transparency)
    1. [Introduction](#introduction_t)
    2. [The challenge](#challenge_t)
    3. [Methodology](#methodology_t)
4. [Transparency](#bias)
    1. [Introduction](#introduction_b)
    2. [The challenge](#challenge_b)
    3. [Methodology](#methodology_b)
5. [Development](#development)
6. [Citations](#citations)
7. [Contributors](#contributors)

## What is Responsible AI? <a name="what-is-responsible"></a> 
AI brings extraordinary opportunities for great benefit, coupled with the responsibility to avoid harmful unintended consequences. AI products in healthcare directly impact health outcomes and lives, raising weighty questions about ethics, trust, fairness, safety, privacy and risk. <sup>1, 2-4</sup> As more healthcare decisions are placed in the hands of AI, institutions must accept more and more responsibility for these products, and ensure their fair application. 
 
To achieve the potential of AI to improve lives and achieve grand societal objectives, AI tools require human-centered frameworks to prevent bias and unfairness. Responsible AI is an emerging framework that addresses this need and safeguards against potential risks of AI by guiding development of AI using principles that ensure standards are met for ethics, fairness, accuracy, security and privacy. Responsible AI frameworks will increasingly be used to mitigate the potential risks of harm from AI. Implementing Responsible AI in the development lifecycle, relies on three core principles of Responsible AI: fairness, transparency, and bias mitigation.  

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br/>

_**Footnote: Development Update. Additional principles of Responsible AI including privacy and security, accountability, reliability and safety will be addressed in future Equality AI Responsible AI Checklist versions._

## Fairness <a name="fairness"></a>
### Introduction <a name="introduction_f"></a>
The Fairness metric section of the Responsible AI Checklist combines the existing literature (see Methodology), open source tools, and legal concepts to provide guidance on the selection of parity metrics when fairness is a concern. 
 
Traditionally, machine learning (ML) developers sought out high benchmark performance metrics (such as root mean squared error, logloss, accuracy, area under the ROC curve, etc.)<sup>5</sup> while overlooking the disparate impact of prediction errors for protected classes (such as race, ethnicity, and sex) which exacerbated and propagated existing inequalities.<sup>1, 2-4</sup> To achieve fairness in AI outcomes, protected classes such as race, ethnicity and sex must be considered. 
 
Responsible AI uses fairness metrics to assess the equity of models, rather than having a pure focus on task performance metrics. A fairness metric, similar to a performance metric, is a metric which is optimized in the process of fitting a model. The key difference is that it is a metric on which parity (equality) is created among levels of a protected class, to meet a standard of algorithmic fairness. When selected appropriately, fairness metrics create algorithmic equity of opportunity, outcome, or other criteria as determined appropriate to the task. 

_**Footnote: Development Update. Demographic criteria for protected classes (e.g. race, ethhnicity, sex) have multiple response levels. Responsible AI seeks to use a fairness criteria to create parity among the levels of the protected class (LPC).<sup>6-8 </sup>_

### The Challenge <a name="challenge_f"></a>
Selecting the optimal approach to fairness metric selection is a daunting task. The literature on fairness metrics is expansive, uses non-standardized vocabulary, and is incomplete in it’s recommendations for application. Reviewing, collating, and curating the literature is an on-going process that will require a community of developers, academics and experts with the north star of patients' wellbeing and health outcomes in mind. The fairness metric selection portion of our checklist has been built based on the following approach. We welcome you to join us in the effort by using our tools and providing feedback. 

### Methodology <a name="methodology_f"></a>
**Figure 1** describes how we determined what metrics to use and when to use them. We expanded on the work of Barocas et al to include recommendations from the Aequitas framework. Barocas et al crosswalk fairness criteria into three main categories: Independence, Sufficiency, and Separation. (see full crosswalk in **Table 1.**) 

Understanding that there are multiple potential fairness metrics, one must determine the correct fairness criteria to apply to the task at hand. An open source tool by Aequitas<sup>9</sup> describes real-world situations and uses a fairness logic tree to provide guidance on fairness metric selection. Paulus, et al. took this one step further by assessing healthcare provider and recipient incentive structures and how those should influence fairness metric selection. 

These works helped us to narrow down to four questions in the Fairness metric section of the checklist that recommend an appropriate fairness metric for healthcare specific algorithms (see crosswalked questions to metrics in the [insert file name]).
 
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

