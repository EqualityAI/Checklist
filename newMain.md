<img src="https://github.com/EqualityAI/Checklist/blob/master/img/color logo only.PNG" align="left" alt="EqualityAI Logo" width="65" />

# Equality AI `responsible_mlops`
[Equality AI (EAI)](https://equality-ai.com/) is the first organization to begin assembling the [Responsible AI framework]() into an end-to-end Responsible MLOPs Studio. The technology behind our Responsible MLOPs Studio is an open source ML software framework and tool, called `responsible_mlops`, with additional functions that can be selectively incorporated to create various workflows designed to produced <b>equitable, responsible models.</b>

<b>[Read our EAI Manifesto](https://equality-ai.com/) and star this repo to show your support!!!</b>

<details open>
  <summary><font size="2"><i>Sneak peak ...</i></font></summary>
  Using our responsible_mlops toolkit, we <b>decreased the disparity</b> in the proportion of hospitalization between whites and blacks from 11.23% (pre-mitigation) to 7.93% (post-mitigation).
  <img src="img/results.PNG" align="center" alt="" width="75%" />
  </details>



## What is Responsible AI?
In 2019, [Obermeyer et al.]() revealed a Healthcare commercial prediction algorithm affecting the care of millions of patients <font size="5"><i>exhibiting significant racial bias</i></font> that had gone <b><font size="5">undetected</font></b>, resulting in <b><font size="5">Black patients</font></b> with complex medical needs not qualifying for extra care, despite being considerably sicker than White patients. Recent scrutiny of machine learning (ML) usage in healthcare systems has revealed numerous examples of harmful medical decisions made at the <b><font size="5">expense of minority and vulnerable populations.</font></b> Medical professionals and researchers relying on ML models to assist in decision making are often unaware of the bias unintentionally introduced into algorithms by real-world data that incorporates inherent unfairness and produces biased outcomes that widen the gap in healthcare inequity.   

<details>
  <summary><font size="2"><i>More studies ...</i></font></summary>
  <hr/>
  </details>

Data scientists are the newest members of the healthcare team, and as such, the Hippocratic Oath applies:  First do no harm.  Developers must accept greater responsibility to ensure the ML models they develop do no harm.  Unfortunately, the typical tools and MLOps workflows available to developers have proven to be insufficient for this task. Responsible AI is an emerging framework that addresses this need and helps mitigate the potential risks of harm from AI and includes ethics, fairness, accuracy, security, and privacy.  

<details>
  <summary><font size="2"><i>See full framework ...</i></font></summary>
  <img src="img/framework.png" align="center" alt="" width="900" />
  </details>

## `responsible_mlops` 
To make steps in our `responsible_mlops` easy to follow, our expert statisticians, academic partners and machine learning experts have likened these various workflows to something everyone can understand???a recipe. These recipes outline the ???ingredients??? you need and the exact steps to take to ensure you???ve cooked up a fair machine learning model. Our first recipe is a [fair preprocessing ML recipe]() and the main goal of this recipe is to repair the data set on which the model is run (pre-processing).</br>

<details>
  <summary><font size="2"><i>Learn more ...</i></font></summary>
  To create a fair preprocessing ML algorithm, you will need to incorporate two crucial functions into your ML workflow:  a mitigation method and a fairness metric.  Mitigation methods are employed to address bias in data and/or machine learning models and achieve fairness in output.  Fairness metrics are needed to mathematically represent the fairness or bias levels of a machine learning model. <br></br>

Let???s assemble the "ingredients" and get started!

**Ingredients**
* Your research question (or run our use case)
* Source data (or use our sample data)
* Fairness metric
* Mitigation method
* Integrated development environment (IDE), such as R studio
* R programming language, Python version coming soon
* Access to the Equality AI GitHub repository
</hr>
  </details>

[Sign up]() to hear when we release recipes that will tackle adjustments to the model (in processing) and the predictions (post-processing).

## Highlighted functions
With the release of our Fair Preprocessing Machine Learning Recipe, we want to introduce our `fairness_tree_metric` and `mitigation_method_mapping` functions that provide guidance on choosing appropriate fairness metrics and determining suitable fairness mitigation strategies.

<details>
  <summary><font size="4"> fairness_tree_metric() </font></summary>
  <b>Arguments</b>
  &emsp; .data </br>
  &emsp;&emsp; A data frame, data frame extension (e.g. a tibble), or a lazy data frame (e.g. from dbplyr or dtplyr). See Methods, below, for more details.
  </details>

<details>
  <summary><font size="4"> mitigation_method_mapping() </font></summary>
  <b>Arguments</b>
  &emsp; .data </br>
  &emsp;&emsp; A data frame, data frame extension (e.g. a tibble), or a lazy data frame (e.g. from dbplyr or dtplyr). See Methods, below, for more details.
  </details>

  <details>
  <summary><font size="4"> data_prepare_nhamcs() </font></summary>
  <b>Arguments</b>
  &emsp; .data </br>
  &emsp;&emsp; A data frame, data frame extension (e.g. a tibble), or a lazy data frame (e.g. from dbplyr or dtplyr). See Methods, below, for more details.
  </details>

  <details>
  <summary><font size="4"> train_test_split() </font></summary>
  <b>Arguments</b>
  &emsp; .data </br>
  &emsp;&emsp; A data frame, data frame extension (e.g. a tibble), or a lazy data frame (e.g. from dbplyr or dtplyr). See Methods, below, for more details.
  </details>
  
   <details>
  <summary><font size="4"> data_balancing() </font></summary>
  <b>Arguments</b>
  &emsp; .data </br>
  &emsp;&emsp; A data frame, data frame extension (e.g. a tibble), or a lazy data frame (e.g. from dbplyr or dtplyr). See Methods, below, for more details.
  </details>

## Responsible AI Takes a Community
We are starting with fairness, and it doesn???t end there. We have much more in the works,  and we want to know???what do you need? Do you have a Responsible AI challenge you need to solve? Drop us a line and let???s see how we can help! 

## Contributing to the project
Equality AI uses both GitHib and Slack to manage our open source community. To participate:

1. Join the Slack community (equalityai.slack.com)
    + Introduce yourself in the #Introductions channel. We're all friendly people!
2. Check out the [CONTRIBUTING]() file to learn how to contribute to our project, report bugs, or make feature requests.
3. Try out the [Responsible Machine Learning Toolkit](https://github.com/EqualityAI/ResponsibleMachineLearningToolkit)
    + Hit the top right "star" button on GitHub to show your love!
    + Watch the repo so that you get notifications when changes are made.
    + <img src="img/watch.PNG" align="center" alt="" width="175" />
    + Follow the recipe above to use the code. 
4. Provide feedback on your experience using the GitHub discussions or the Slack #support channel
    + For any questions or problems, send @Andy LaHart a message on Slack, or send an email to andy@equalityai.com.


## Authors
<img src="https://github.com/EqualityAI/Checklist/blob/master/img/color logo only.PNG" align="left" alt="" width="75" />

[Equality AI](https://equality-ai.com/) is a public benefit corporation dedicated to helping data scientists close the health disparity gap by assembling a Responsible AI framework into tools that include modernized, end-to-end MLOps with functions that can be selectively incorporated to create various workflows designed to produced equitable, responsible models. <br></br>  

`fairness_metric_tree()` <br></br>
`mitigation_mapping_info()` <br></br>
`data_prepare_nhamcs()` <br></br>
`train_test_split()` <br></br>
`data_balancing()` <br></br>
`ml_model()` <br></br>
`ml_results()` <br></br>
`fairness_metric()` <br></br>
`bias_mitigation()` <br></br>
