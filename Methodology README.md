<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="right" alt="" width="120" />

# Methodology of MLOps Flow Checklist w/Data Bias Scanner
1. [What is Responsible AI?](#what-is-responsible-ai)
2. [Transparency](#transparency)
3. [Bias detection](#bias-detection)
4. [Fairness](#fairness)

## What is Responsible AI? <a name="what-is-responsible"></a> 
AI brings extraordinary opportunities for great benefit, coupled with the responsibility to avoid harmful, unintended consequences. AI products in healthcare directly impact health outcomes and lives, raising weighty questions about ethics, trust, fairness, safety, privacy and risk.<sup>1, 2-4</sup> As more healthcare decisions are placed in the hands of AI, institutions must accept more responsibility for these products and ensure their fair application.

To achieve the potential of AI to improve lives and achieve higher societal objectives, AI tools require a human-centered approach. Responsible AI is an emerging framework that addresses this need and safeguards against potential risks of AI by guiding development using principles that ensure standards are met for ethics, fairness, accuracy, security and privacy. Responsible AI frameworks will increasingly be used to mitigate the potential risks of harm from AI. Implementing Responsible AI in the development lifecycle, relies on three core principles of Responsible AI: transparency, bias detection, and fairness (see **Figure 1** for the full framework).<br />

<p align="center"><b>Figure 1. Responsible AI Framework</b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/framework.png" align="center" alt="" width="900" /><br />

_**Footnote: Development Update. Additional principles of Responsible AI including privacy and security, accountability, reliability and safety will be addressed in future Equality AI Responsible AI Checklist versions._

## Transparency <a name="transparency"></a> 
We developed the MLOps Flow Checklist to implement the MINimum Information for Medical AI Reporting (MINIMAR) standard. MINIMAR is an ongoing initiative to create minimal reporting standards that facilitate the transparent dissemination of algorithms across healthcare systems. We applied these standards in the checklist sections: “Construct & Prepare Data”, “Data bias scanner”, “Build & Train”, and “Staged deployment”. The use of this standard addresses potential biases and unintended consequences of AI algorithms.<sup>10</sup> Reporting standards including CONSORT, SPIRIT, and TRIPOD-ML are also extending their checklists to include an ML or AI component, and we look forward to their development and impact.<sup>10,14</sup><br />


## Bias Detection <a name="bias-detection"></a> 

<p align="center"><b>Figure 2. Location of Data Bias Scanner </b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/location_scanner.png" align="center" alt="" width="900" /><br />

We have included a Data Bias Scanner (i.e. bias detection) in the “Construct & Prepare Data” section of the MLOps Flow Checklist (see **Figure 2**). Including bias detection in AI development is crucial to address issues of ethics, fairness and inclusion. Biases hidden in the training data used for model development are known to have negative consequences in certain populations.<sup>15-16</sup> Potential biases in training data must be exposed to prevent algorithms that exacerbate or perpetuate inequality. Ensuring that measurement of protected classes occurs is fundamental to the Responsible AI lifecycle. The  Data Bias Scanner attempts to combine the existing literature and open source tools to scan data for biases.

_**Footnote: Development Update. The data scanner described here and available in our open source tool kit is a generic data scanner. Currently we have partnered with University of Utah, Department of Biomedical Informatics to develop enterprise data scanners by data type (e.g. EHR structured, Omics, etc.), starting with a Transcriptome data specific scanner._

<p align="center"><b>Figure 3. Biases in Source Data </b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/bias_methodology.png" align="left" alt="" width="1000" />

_**Footnote: The Data Bias Scanner will only scan for biases in source data. Learning and Evaluation bias will be addressed in other sections of the checklist in future versions._

There are many types of bias, and addressing them is feasible to varying degrees. Suresh et al, demonstrated how biases that arise in throughout the MLOps workflow (e.g. misclassification, missing data, data imbalance) can be categorized into Historical bias, Representation bias, Measurement bias, Aggregation bias, and Evaluation bias.<sup>17</sup> For the biases related to the source of data (see **Figure 3**), the Data Bias Scanner identifies the presence of each bias (see below).

_**Footnote: Assessing separation and sufficiency criteria require the presence of models and selection of a parity metric. These metrics cannot be assessed using only the data, however, we are capable of assessing the independence criteria. Additionally we are researching, when possible, how to provide corrections and solutions._

<details open>
  <summary><strong>Historical Bias</strong></summary>
  <hr/>
  <em>Historical bias refers to disparate or harmful outcomes that are observed in available source data because the world is not and has not been fair. To assess the independence criteria, we determine if the proportions of outcomes are approximately equal for each minority/majority group. For instance, our Data Bias Scanner calculates incidence rate ratios to compare the minority class(es) to the majority class. If the difference in incidence rate ratios is large (or greater than 20%),<sup>18</sup> there is evidence of disparate (unequal) outcomes by group or Historical Bias has been detected.</em>
    </summary>
</details>

<details>
  <summary><strong>Representation Bias</strong></summary>
  <hr/>
  <em>"InterpretML: A Unified Framework for Machine Learning Interpretability" (H. Nori, S. Jenkins, P. Koch, and R.
        Caruana 2019)</em>
    </summary>
</details>
</br></br>

## Fairness <a name="fairness"></a> 














## What is Responsible AI? <a name="what-is-responsible"></a> 
AI brings extraordinary opportunities for great benefit, coupled with the responsibility to avoid harmful unintended consequences. AI products in healthcare directly impact health outcomes and lives, raising weighty questions about ethics, trust, fairness, safety, privacy and risk. <sup>1, 2-4</sup> As more healthcare decisions are placed in the hands of AI, institutions must accept more responsibility for these products and ensure their fair application. 
 
To achieve the potential of AI to improve lives and achieve higher societal objectives, AI tools require human-centered frameworks to prevent bias and unfairness. Responsible AI is an emerging framework that addresses this need and safeguards against potential risks of AI by guiding development of AI using principles that ensure standards are met for ethics, fairness, accuracy, security and privacy. Responsible AI frameworks will increasingly be used to mitigate the potential risks of harm from AI. Implementing Responsible AI in the development lifecycle, relies on three core principles of Responsible AI: fairness, transparency, and bias mitigation.  

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
### Introduction <a name="introduction_b"></a>
Including bias detection in AI development is crucial to address issues of ethics, fairness and inclusion. Biases hidden in the training data used for model development are known to have negative consequences in certain populations.<sup>15-16</sup> Potential biases in training data must be exposed to prevent algorithms that exacerbate or perpetuate inequality. Ensuring that measurement of protected classes occurs is fundamental to the responsible AI lifecycle. Biases in the training data must be interrogated to create a world in which diversity and inclusion are thoughtfully considered. 

### The Challenge <a name="challenge_b"></a>
There are many types of bias, and addressing them is feasible to varying degrees. The Data bias scanner of the Responsible AI Checklist attempts to combine the existing literature (see **Methodology**), open source tools, and legal concepts to scan data for biases and provide solutions. This work is ongoing and we welcome everyone to join us to provide feedback to improve our tools.
 
_**Footnote: Development Update. Equality AI is currently partnered with University of Utah, Department of Biomedical Informatics to develop data type specific bias scanners, starting with Transcriptome data and EHR (i.e. structured) data. Ongoing partnerships are being explored to address Sensor, Claims, Imaging and Clinical Trials data types._

### Methodology <a name="methodology_b"></a>
For bias, as shown in Figure 2, we started by finding an overarching framework for bias with respect to the ML life cycle. In doing this we were able to organize biases such as misclassification, missing data, data imbalance into overarching categories of Historical bias, Representation bias, Measurement bias, Aggregation bias, and Evaluation bias.<sup>17</sup> For each of these biases, research is being done to determine statistical best practices for identifying the presence of each bias in a data source, and suggestions for corrections.

_**Footnote: Development Update. Learning bias and Deployment bias are addressed in Monitoring tools, which are currently in development._

**Figure 2:** Methodology for Data bias scanner
<img src="https://github.com/EqualityAI/Checklist/blob/main/img/bias_methodology.png" align="left" alt="" width="1000" />

## Development <a name="development"></a>

Contributions are welcome\! This application uses the
[`renv`](https://rstudio.github.io/renv/) package to manage the versions
of dependencies. After cloning the repository, launch a new session in
the repository root directory and execute `renv::restore()` to download
the package library.


## Citations <a name="citations"></a>
1. Paulus, J.K., Kent, D.M. Predictably unequal: understanding and addressing concerns that algorithmic clinical prediction may increase health disparities. npj Digit. Med. 3, 99 (2020). https://doi.org/10.1038/s41746-020-0304-9 
2. Vyas DA, Eisenstein LG, Jones DS. Hidden in plain sight-reconsidering the use of race correction in clinical algorithms. N Engl J Med 2020; 383: 874–882. doi:10.1056/NEJMms2004740
3. Ahmed, S., Nutt, C.T., Eneanya, N.D. et al. Examining the Potential Impact of Race Multiplier Utilization in Estimated Glomerular Filtration Rate Calculation on African-American Care Outcomes. J GEN INTERN MED 36, 464–471 (2021). https://doi.org/10.1007/s11606-020-06280-5
4. Obermeyer Z, Powers B, Vogeli C, Mullainathan S. Dissecting racial bias in an algorithm used to manage the health of populations. Science. 2019 Oct 25;366(6464):447-453. doi: 10.1126/science.aax2342. PMID: 31649194.
5. Barocas, S., Hardt, M., & Narayanan, A. (2019). Fairness in machine learning. http://www.fairmlbook.org
6. Wailoo, K. Historical aspects of race and medicine: the case of J. Marion Sims. JAMA 320, 1529–1530 (2018).
7. Wong, W. F., LaVeist, T. A. & Sharfstein, J. M. Achieving health equity by design. JAMA 313, 1417–1418 (2015).
8. Williams, D. R. & Wyatt, R. Racial bias in health care and health: challenges and opportunities. JAMA 314, 555–556 (2015).
9. Saleiro, Pedro, et al. "Aequitas: A bias and fairness audit toolkit." arXiv preprint arXiv:1811.05577 (2018).
10. Tina Hernandez-Boussard, Selen Bozkurt, John P A Ioannidis, Nigam H Shah, MINIMAR (MINimum Information for Medical AI Reporting): Developing reporting standards for artificial intelligence in health care, Journal of the American Medical Informatics Association, Volume 27, Issue 12, December 2020, Pages 2011–2015, https://doi.org/10.1093/jamia/ocaa088
11. Riley RD, Ensor J, Snell KI, et al. External validation of clinical prediction models using big datasets from e-health records or IPD meta-analysis: opportunities and challenges. BMJ 2016; 353: i3140.
12. Bozkurt S, Cahan E, Seneviratne MG, et al. Reporting of demographic data, representativeness and transparency in machine learning models using electronic health records. JAMA Netw Open 2020; 3 (1): e1919396.
13. Nagendran M, Chen Y, Lovejoy CA, et al. Artificial intelligence versus clinicians: systematic review of design, reporting standards, and claims of deep learning studies. BMJ 2020; 368: m689.
14. Liu X, Faes L, Calvert MJ, Denniston AK, CONSORT/SPIRIT-AI Extension Group. Extension of the CONSORT and SPIRIT statements. Lancet 2019; 394 (10205): 1225.
15. Ferryman K, Pitcan M. Fairness in precision medicine. Data & Society. 2018. https://datasociety.net/library/fairness-in-precision-medicine/ Accessed November 19, 2019.
16. Gianfrancesco MA, Tamang S, Yazdany J, Schmajuk G. Potential biases in machine learning algorithms using electronic health record data. JAMA Intern Med 2018; 178 (11): 1544–7.
17. H. Suresh, J.V. Guttag, A framework for understanding sources of harm throughout the machine learning lifecycle. arXiv preprint arXiv:1901.10002 (2019)


## Contributors <a name="contributors"></a>

- Equality AI (https://equality-ai.com/)

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="left" alt="" width="120" />

[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community!  We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI checklist and Data bias scanner.

