<img src="https://github.com/EqualityAI/Checklist/blob/master/img/collogo.png" align="right" alt="" width="120" />

# MLOps Flow Checklist w/Data Bias Scanner
This repository contains the source code for the Equality AI MLOps Flow Checklist and integrate Data Bias Scanner, an R Shiny based library that is one component of the Equality AI Responsible AI Toolkit. The Responsible AI Checklist Application provides a framework to guide the design, development, and deployment of machine learning (ML) models with good intention to empower healthcare organizations, patients, and employees, allowing companies to engender trust and to scale AI with confidence.

<p align="center"><b>Figure 1. MLOps Flow Checklist</b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/checklistapp.png" align="center" alt="" width="900" /><br />

<p align="center"><b>Figure 2. Location of Data Bias Scanner </b></center><br /><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/location_scanner.png" align="center" alt="" width="900" /><br /><br />

We have included a Data Bias Scanner in the “Construct & Prepare Data” section of the MLOps Flow Checklist (see **Figure 2**). Including bias detection in AI development is crucial to address issues of ethics, fairness and inclusion. Biases hidden in the training data used for model development are known to have negative consequences in certain populations.<sup>15-16</sup> Potential biases in training data must be exposed to prevent algorithms that exacerbate or perpetuate inequality. Ensuring that measurement of protected classes occurs is fundamental to the Responsible AI lifecycle. The  Data Bias Scanner attempts to combine the existing literature and open source tools to scan data for biases (see **Figure 3**).<br /><br />

<p align="center"><b>Figure 3. Data Bias Scanner </b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/scanner.png" align="center" alt="" width="900" /><br /><br />

_**Footnote: Development Update. Equality AI is currently partnered with University of Utah, Department of Biomedical Informatics to develop data type specific bias scanners, starting with Transcriptome data and EHR (i.e. structured) data. Ongoing partnerships are being explored to address Sensor, Claims, Imaging and Clinical Trials data types._ 

<br />

## What is Responsible AI?
AI brings extraordinary opportunities for great benefit, coupled with the responsibility to avoid harmful, unintended consequences. AI products in healthcare directly impact health outcomes and lives, raising weighty questions about ethics, trust, fairness, safety, privacy and risk.<sup>1, 2-4</sup> As more healthcare decisions are placed in the hands of AI, institutions must accept more responsibility for these products and ensure their fair application.

To achieve the potential of AI to improve lives and achieve higher societal objectives, AI tools require a human-centered approach. Responsible AI is an emerging framework that addresses this need and safeguards against potential risks of AI by guiding development using principles that ensure standards are met for ethics, fairness, accuracy, security and privacy. Responsible AI frameworks will increasingly be used to mitigate the potential risks of harm from AI. Implementing Responsible AI in the development lifecycle, relies on three core principles of Responsible AI: transparency, bias detection, and fairness (see **Figure 4** for the full framework).

<p align="center"><b>Figure 4. Responsible AI Framework</b></center><br />

<img src="https://github.com/EqualityAI/Checklist/blob/master/img/framework.png" align="center" alt="" width="900" /><br />

_**Footnote: Development Update. Additional principles of Responsible AI including privacy and security, accountability, reliability and safety will be addressed in future Equality AI Responsible AI Checklist versions._

## Checklist components
<details>
  <summary><strong>Define Problem</strong></summary>
  <hr/>
  <strong>Project: </strong></br>
  <em>
    Expected Stakeholders | Types of harm | Trade offs | Cohort selection
    </em></br></br>
    <hr/>
  <strong>Population & Setting: </strong></br>
  <em>
    Population | Study setting | Data source | Cohort selection
    </em></br></br>
</details>

<details>
  <summary><strong>Construct & Prepare Data</strong></summary>
  <hr/>
  <strong>Demographics: </strong></br>
  <em>
    Age | Sex | Race | Ethnicity | Socioeconomic status
    </em></br></br>
    <hr/>
  <strong>Data Bias Scanner: </strong></br>
  <em>
  <strong>See Methodology README</strong> for more details.
    </em></br></br>
</details>

<details>
  <summary><strong>Build & Train</strong></summary>
  <hr/>
  <strong>Model Architecture: </strong></br>
  <em>
    Model output | Target user | Data splitting | Gold standard | Model task | Model architecture | Features | Missingness
    </em></br></br>
    <hr/>
  <strong>Fairness: </strong></br>
  <em>
  <strong>See Methodology README</strong> for more details.
    </em></br></br>
</details>

<details>
  <summary><strong>Staged Deployment</strong></summary>
  <hr/>
  <em>
    Optimization | Internal model validation | External model validation | Transparency
    </em></br></br>
</details>


## Try the checklist for yourself

- Download and run app

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

## Save & use data

### What questions can you answer, if you save the data?
1. **Suggest metrics from the description text alone.** From the description, use NLP AI to suggest the metrics that suit the situation (is a positive model prediction assistive? Then we should use a metric focusing on false negative parity. With NLP we can suggest this from just the text).<br /><br />
2. **Predict model deployment probability bias.** If we collect information about the models that are actually deployed. We can predict the probability that a model will be deployed, using the checklist contents as covariates.<br /> 
3. **Forecast the model deployment bias.** We can also use that same checklist information to forecast the model deployment bias.<br /> 
4. **Suggest the impact of the model on the real world.** If a model is likely to be deployed, based on the metrics selected, we can determine the real world impact. (We can do this for incorrectly selected metrics as well).<br /> 
5. **Determine what metrics are most likely to be successfully deployed.** Maybe some model metrics are associated with successful deployment (low deployment bias), and others are not.  We can learn this from the data.<br /> 
6. **Determine what the "true" barriers are to model success.** Generic scientific questions can be answered using this data. Someone may answer the question "What models are most likely to be deployed successfully?"

## Development

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
18. C.F.R. § 1607.4. Available at https://www.law.cornell.edu/cfr/text/29/1607.4 

## Contributors 

- Equality AI (https://equality-ai.com/)

<img src="https://github.com/EqualityAI/Checklist/blob/main/img/collogo.png" align="left" alt="" width="120" />

[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to improving AI standards for Healthcare with solutions to support Responsible AI development in the machine learning community. To do this, we welcome all academics and developers to join our open source community!  We are dedicated to making progress in the development of Responsible AI standards by providing trustworthy services and a collection of open source resources and tools for the ML Healthcare community, starting with our Responsible AI checklist and Data bias scanner.

