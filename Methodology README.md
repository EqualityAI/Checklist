<img src="https://github.com/EqualityAI/Checklist/blob/master/img/collogo.png" align="right" alt="EqualityAI Logo" width="120" />

# Methodology of MLOps Flow Checklist w/Data Bias Scanner
1. [What is Responsible AI?](#what-is-responsible-ai)
2. [Transparency](#transparency)
3. [Bias detection](#bias-detection)
4. [Fairness](#fairness)

## What is Responsible AI? <a name="what-is-responsible"></a> 
AI brings extraordinary opportunities for great benefit, coupled with the responsibility to avoid harmful, unintended consequences. AI products in healthcare directly impact health outcomes and lives, raising weighty questions about ethics, trust, fairness, safety, privacy and risk.<sup>1, 2-4</sup> As more healthcare decisions are placed in the hands of AI, institutions must accept more responsibility for these products and ensure their fair application.

To achieve the potential of AI to improve lives and achieve higher societal objectives, AI tools require a human-centered approach. Responsible AI is an emerging framework that addresses this need and safeguards against potential risks of AI by guiding development using principles that ensure standards are met for ethics, fairness, accuracy, security and privacy. Responsible AI frameworks will increasingly be used to mitigate the potential risks of harm from AI. Implementing Responsible AI in the development lifecycle, relies on three core principles of Responsible AI: transparency, bias detection, and fairness (see **Figure 1** for the full framework).<br />

<p align="center"><b>Figure 1. Responsible AI Framework</b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/framework.png" align="center" alt="EqualityAI Framework" width="900" /><br />

_**Footnote: Development Update. Additional principles of Responsible AI including privacy and security, accountability, reliability and safety will be addressed in future Equality AI Responsible AI Checklist versions._

## Transparency <a name="transparency"></a> 
We developed the MLOps Flow Checklist to implement the MINimum Information for Medical AI Reporting (MINIMAR) standard. MINIMAR is an ongoing initiative to create minimal reporting standards that facilitate the transparent dissemination of algorithms across healthcare systems. We applied these standards in the checklist sections: ???Construct & Prepare Data???, ???Data bias scanner???, ???Build & Train???, and ???Staged deployment???. The use of this standard addresses potential biases and unintended consequences of AI algorithms.<sup>10</sup> Reporting standards including CONSORT, SPIRIT, and TRIPOD-ML are also extending their checklists to include an ML or AI component, and we look forward to their development and impact.<sup>10,14</sup><br />


## Bias Detection <a name="bias-detection"></a> 

<p align="center"><b>Figure 2. Location of Data Bias Scanner </b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/location_scanner.png" align="center" alt="Data Bias Scanner selected in the MLOPS Workflow Checklist" width="900" /><br />

We have included a Data Bias Scanner (i.e. bias detection) in the ???Construct & Prepare Data??? section of the MLOps Flow Checklist (see **Figure 2**). Including bias detection in AI development is crucial to address issues of ethics, fairness and inclusion. Biases hidden in the training data used for model development are known to have negative consequences in certain populations.<sup>15-16</sup> Potential biases in training data must be exposed to prevent algorithms that exacerbate or perpetuate inequality. Ensuring that measurement of protected classes occurs is fundamental to the Responsible AI lifecycle. The  Data Bias Scanner attempts to combine the existing literature and open source tools to scan data for biases.

_**Footnote: Development Update. The data scanner described here and available in our open source tool kit is a generic data scanner. Currently we have partnered with University of Utah, Department of Biomedical Informatics to develop enterprise data scanners by data type (e.g. EHR structured, Omics, etc.), starting with a Transcriptome data specific scanner._

<p align="center"><b>Figure 3. Biases in Source Data </b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/bias_methodology.png" align="left" alt="EqualityAI Bias Methodology" width="1000" />

_**Footnote: The Data Bias Scanner will only scan for biases in source data. Learning and Evaluation bias will be addressed in other sections of the checklist in future versions._

There are many types of bias, and addressing them is feasible to varying degrees. Suresh et al, demonstrated how biases that arise in throughout the MLOps workflow (e.g. misclassification, missing data, data imbalance) can be categorized into Historical bias, Representation bias, Measurement bias, Aggregation bias, and Evaluation bias.<sup>17</sup> For the biases related to the source of data (see **Figure 3**), the Data Bias Scanner identifies the presence of each bias (see below).

_**Footnote: Assessing separation and sufficiency criteria require the presence of models and selection of a parity metric. These metrics cannot be assessed using only the data, however, we are capable of assessing the independence criteria. Additionally we are researching, when possible, how to provide corrections and solutions._

<details open>
  <summary><strong>Historical Bias</strong></summary>
  <hr/>
  <em>Historical bias refers to disparate or harmful outcomes that are observed in available source data because the world is not and has not been fair. To assess the independence criteria, we determine if the proportions of outcomes are approximately equal for each minority/majority group. For instance, our Data Bias Scanner calculates incidence rate ratios to compare the minority class(es) to the majority class. If the difference in incidence rate ratios is large (or greater than 20%),<sup>18</sup> there is evidence of disparate (unequal) outcomes by group or Historical Bias has been detected.</em></br></br>
  
- To assess the independence criteria, we determine if the proportions of outcomes are approximately equal for each minority/majority group. For instance, our Data Bias Scanner calculates incidence rate ratios to compare the minority class(es) to the majority class. If the difference in incidence rate ratios is large (or greater than 20%),18 there is evidence of disparate (unequal) outcomes by group or Historical Bias has been detected.
    </summary>
</details>

<details>
  <summary><strong>Representation Bias</strong></summary>
  <hr/>
  <em>Representation bias exists when the data a model is trained on does not reflect the real world use case of the application of the model. For instance, a model trained on data at the Veterans Affairs (a population dominated by males), will not perform well when deployed to a population with equal representation of the sexes due to the difference in the proportion of the minority/majority group. </em></br></br>

- Prompt the user (or coder) for the proportion of each minority/majority group in the setting the algorithm will be applied to. Compare those to the proportions in the data. A large difference in the proportions of the groups between the training data and use case will prevent the model from generalizing well. 
  
    </summary>
</details>

<details>
  <summary><strong>Measurement Bias</strong></summary>
  <hr/>
  <em>Measurement bias arises in situations in which we hope to characterize an unobserved condition through the use of an observed, but different, proxy. For instance, we may hope to assess community healthcare needs through the use of cost data, however, in poorer communities individuals have less money to spend on healthcare, creating the false appearance of being healthier. Allocating services based on this proxy variable (costs), will underserve the poorer communities.</em></br></br>

- Compare model calibration by minority/majority group to assess if the proportion of outcomes reflects the probability of the outcome assigned by the model. 
- Compare distributions of variables to see if the minority/majority groups have the same distributions.
  - Perform Kolmogorov-Smirnof tests, etc.
- Fit stratified models for each minority/majority group and look for effect modification.
  - Are model coefficients (weights) similar by minority/majority group?
  - For black box models, are Shapley values similar?
  
    </summary>
</details>

<details>
  <summary><strong>Aggregation Bias</strong></summary>
  <hr/>
  <em>Aggregation bias arises when a one-size-fits-all model is fit to data in which there are underlying groups or types of examples that should be considered differently. Aggregation bias refers to situations in which the average effect across groups does not reflect the within-group truth. For example, we may hope to estimate the average body weight of the adult population and use that to characterize people as under or overweight. If we were to average male and female weights together, we would calculate an average value that is between the average weight of a male and female. When using this average in assessments, females would nearly always appear to appear to be below the average, and males above the average. Aggregation bias would be corrected by calculating the average weights separately by sex.</em></br></br>

- Fit models for each minority/majority group and determine if the independent variable effects are similar or different, or if the model fit is superior when stratified. This may be done by comparing model weights, Shapley values, model performance, etc. 
  
    </summary>
</details>

</br></br>

## Fairness <a name="fairness"></a> 
<p align="center"><b>Figure 4. Location of Fairness</b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/location_fairness.png" align="center" alt="Fairness selected under Build & Train in the MLOPS Workflow Checklist" width="900" /><br />

We have included a Fairness section in the ???Build & Train'' section of the MLOps Flow Checklist (see **Figure 4**) to provide guidance on the selection of parity metrics when fairness is a concern. Traditionally, ML developers seek out high benchmark performance metrics (such as root mean squared error, log loss, accuracy, area under the ROC curve, etc.)5 while overlooking the disparate impact of prediction errors for minority subpopulations (such as certain races, ethnicities, and sexes) which exacerbated and propagated existing inequalities.<sup>1, 2-4</sup> 

To achieve fairness in AI outcomes, metrics to assess the equity of models (i.e. otherwise known as fairness metrics) must be considered in addition to evaluating performance metrics. A fairness metric, similar to a performance metric, is a metric which is optimized in the process of fitting a model. The key difference is that it is a metric on which parity (equality) is created among levels of a minority population to meet a standard of algorithmic fairness. When selected appropriately, fairness metrics create algorithmic equity of opportunity, outcome, or other criteria as determined appropriate to the task.

<p align="center"><b>Table 1. Crosswalk of Fairness Metrics</b></center><br />

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

Selecting the optimal approach to fairness metric selection and application is a daunting task. The literature is expansive, uses non-standardized vocabulary, and is incomplete in it???s recommendations for application. Barocas et al crosswalked various fairness criteria into three main categories: Independence, Sufficiency, and Separation. (see full crosswalk in **Table 1.**) An open source tool by Aequitas<sup>9</sup> describes real-world situations and uses a fairness logic tree to provide guidance on fairness metric selection. Paulus, et al. took this one step further by assessing healthcare provider and recipient incentive structures and how those should influence fairness metric selection.

<p align="center"><b>Figure 5. Fairness Section of Checklist</b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/fairnessapp.png" align="center" alt="Fairness metric screen grab" width="900" /><br />

We expanded on Barocas et al to include recommendations from the Aequitas framework and the work of Paulus, et al to narrow down to four questions to guide fairness metric selection for the task at hand (see questions, **Figure 5**).


## Citations <a name="citations"></a>
1. Paulus, J.K., Kent, D.M. Predictably unequal: understanding and addressing concerns that algorithmic clinical prediction may increase health disparities. npj Digit. Med. 3, 99 (2020). https://doi.org/10.1038/s41746-020-0304-9
2. Vyas DA, Eisenstein LG, Jones DS. Hidden in plain sight-reconsidering the use of race correction in clinical algorithms. N Engl J Med 2020; 383: 874???882. doi:10.1056/NEJMms2004740
3. Ahmed, S., Nutt, C.T., Eneanya, N.D. et al. Examining the Potential Impact of Race Multiplier Utilization in Estimated Glomerular Filtration Rate Calculation on African-American Care Outcomes. J GEN INTERN MED 36, 464???471 (2021). https://doi.org/10.1007/s11606-020-06280-5
4. Obermeyer Z, Powers B, Vogeli C, Mullainathan S. Dissecting racial bias in an algorithm used to manage the health of populations. Science. 2019 Oct 25;366(6464):447-453. doi: 10.1126/science.aax2342. PMID: 31649194.
5. Barocas, S., Hardt, M., & Narayanan, A. (2019). Fairness in machine learning. http://www.fairmlbook.org
6. Wailoo, K. Historical aspects of race and medicine: the case of J. Marion Sims. JAMA 320, 1529???1530 (2018).
7. Wong, W. F., LaVeist, T. A. & Sharfstein, J. M. Achieving health equity by design. JAMA 313, 1417???1418 (2015).
8. Williams, D. R. & Wyatt, R. Racial bias in health care and health: challenges and opportunities. JAMA 314, 555???556 (2015).
9. Saleiro, Pedro, et al. "Aequitas: A bias and fairness audit toolkit." arXiv preprint arXiv:1811.05577 (2018).
10. Tina Hernandez-Boussard, Selen Bozkurt, John P A Ioannidis, Nigam H Shah, MINIMAR (MINimum Information for Medical AI Reporting): Developing reporting standards for artificial intelligence in health care, Journal of the American Medical Informatics Association, Volume 27, Issue 12, December 2020, Pages 2011???2015, https://doi.org/10.1093/jamia/ocaa088
11. Riley RD, Ensor J, Snell KI, et al. External validation of clinical prediction models using big datasets from e-health records or IPD meta-analysis: opportunities and challenges. BMJ 2016; 353: i3140.
12. Bozkurt S, Cahan E, Seneviratne MG, et al. Reporting of demographic data, representativeness and transparency in machine learning models using electronic health records. JAMA Netw Open 2020; 3 (1): e1919396.
13. Nagendran M, Chen Y, Lovejoy CA, et al. Artificial intelligence versus clinicians: systematic review of design, reporting standards, and claims of deep learning studies. BMJ 2020; 368: m689.
14. Liu X, Faes L, Calvert MJ, Denniston AK, CONSORT/SPIRIT-AI Extension Group. Extension of the CONSORT and SPIRIT statements. Lancet 2019; 394 (10205): 1225.
15. Ferryman K, Pitcan M. Fairness in precision medicine. Data & Society. 2018. https://datasociety.net/library/fairness-in-precision-medicine/ Accessed November 19, 2019.
16. Gianfrancesco MA, Tamang S, Yazdany J, Schmajuk G. Potential biases in machine learning algorithms using electronic health record data. JAMA Intern Med 2018; 178 (11): 1544???7.
17. H. Suresh, J.V. Guttag, A framework for understanding sources of harm throughout the machine learning lifecycle. arXiv preprint arXiv:1901.10002 (2019)
18. C.F.R. ?? 1607.4. Available at https://www.law.cornell.edu/cfr/text/29/1607.4 


## Contributors <a name="contributors"></a>

- Equality AI (https://equality-ai.com/)

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/collogo.png" align="left" alt="" width="120" />

[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community!  We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI checklist and Data bias scanner.

