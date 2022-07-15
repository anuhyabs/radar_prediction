# Radar Scattering Prediction

## Project Summary

We are trying to estimate the backscattering of radar from snowpits using parameters from SnowEx data such as density, temperature, grain size and height. We are also trying to understand the relationship between these input parameters and the backscatter and evaluate the parameter sensitivity. We also want to explore the link between SnowEx pit measurements and input parameters of DMRT-Bic.

### The problem

Currently, we know that there is backscatter when a radar is directed towards snow but we do not know what variables of the snow actually have an impact on this backscatter and how much impact each of these parameters have on it. This is is the problem we are trying to solve using Machine Learning. In the broader context, the inference of the relationship between input parameters and the amplitude can help us calibrate current sensor tools and also to be used to reverse engineer when the satellites are up in the air.

### Application Example

Decsision Tree Model (for VV polarization):

![Decision Tree](saving_plot1.jpeg)

Random Forest Model (for VV polarization):

![Random Forest](RandomForest.jpg)

Variable Importance (for VV polarization):

![Variable Importance](VI.jpg)

### Sample data

Snow pit data set accessed from the snowexsql database:

![snowex](snowex.jpeg)

UAVSAR Data for Output:

![uavsar](uavsar.jpeg)

### Specific Questions

1. Can we use machine learning to predict the radar backscattering from snowex input parameters?
2. Is there a relationship between the DMRT input parameters and SnowEx pit measurements?
3. How much do the input parameters contribute  to the variability of the amplitude? 

### Existing methods

The existing method to do this is using a DMRT Model. 

### Proposed methods/tools

We are implementing linear regression, decision trees and random forest machine learning models to helps us answer the questions.

### Collaborators on this project

| Team Member  | Role | GitHub ID |
| ------------- | ------------- | --- |
| Jonas Jans  | Project Lead  | [jonas-frederik](https://github.com/jonas-frederik) |
| HP Marshall | Data Science Lead  | [hpmarshall](https://github.com/hpmarshall) |
| Aaliyah Hanni | Data Engineer | [aaliyahfiala42](https://github.com/aaliyahfiala42) |
| Yiying Gao | ML Engineer | [viggieG](https://github.com/viggieG) |
| Anuhya Bhagavatula| Data Scientist | [anuhyabs](https://github.com/anuhyabs) |
| Shrusti Ghela | ML Engineer | [shrusti-ghela](https://github.com/shrusti-ghela) |
| Samuel Marcus | Intern | [samuelmarcus99](https://github.com/samuelmarcus99) |

### Background reading

1. https://ieeexplore.ieee.org/document/6185696
2. https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6877612
3. https://web.eecs.umich.edu/~leutsang/Computer%20Codes%20and%20Simulations.html
4. https://ntrs.nasa.gov/api/citations/20150000366/downloads/20150000366.pdf