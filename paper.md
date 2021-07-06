---
title: 'pyCSEP: A Python Package For Earthquake Forecast Developers' 
tags:
  - python
  - seismology
  - forecasting
  - statistical seismology
  - seismic hazard 
authors:
  - name: William H. Savran^[Corresponding author reachable at wsavran@usc.edu] 
    orcid: 0000-0001-5404-0778 
    affiliation: 1
  - name: Maximilian J. Werner 
    affiliation: 2
  - name: Danijel Schorlemmer 
    affiliation: 3
  - name: Philip J. Maechling 
    affiliation: 1 
affiliations:
    - name: Southern California Earthquake Center, University of Southern California 
      index: 1
    - name: University of Bristol 
      index: 2
    - name: GFZ Potsdam 
      index: 3 
date: 01 February 2021 
bibliography: paper.bib 

---

# Summary

For government officials and the public to act on real-time forecasts of earthquakes, the seismological community needs to
develop confidence in the underlying scientific hypotheses and assess models' predictive skills. The Collaboratory for the
Study of Earthquake Predictability (CSEP) provides the cyberinfrastructure and computational tools to evaluate earthquake
forecasts. `pyCSEP` is a Python package that contains the following modules: (1) earthquake catalog access and processing, (2)
data models for earthquake forecasts, (3) statistical tests for evaluating earthquake forecasts, and (4) visualization
routines. `pyCSEP` can evaluate forecasts expressed as expected rates in space-magnitude bins, and simulation-based forecasts
that produce thousands of synthetic seismicity catalogs. Most importantly, `pyCSEP` contains community-endorsed
implementations of statistical tests to evaluate earthquake forecasts – with a goal of embedding model evaluation into the
model development process. The toolkit will facilitate integrating new forecasting models into testing centers, as the models
can be built to use well defined file formats and standards provided by `pyCSEP`. 

# Background

Successfully predicting the time, location, and size of future earthquakes has immense societal value and underlies much of the
research in seismology and earthquake geology. To date, there have been no reliable earthquake predictions methods. An
earthquake prediction makes a deterministic statement about whether or not an earthquake will occur in a particular geographic
region, time window, and magnitude range. On the other hand, an earthquake forecast provides the probability that such an
earthquake will occur [@Jordan2011a]. Most of the current research effort focuses on developing earthquake forecasting models.
To what degree earthquakes can be predicted remains an open and important question in earth science. 

As @Schorlemmer2018a states "the fundamental idea of CSEP is simple in principle but complex in practice: earthquake forecasts
should be tested against future observations to assess their performance, thereby ensuring an unbiased test of the forecasting
power of a model." Practically, this requires a prospective evaluation of the earthquake forecasts. Prospective evaluations
require model developers to fully specify their models (with zero-degrees of freedom) before the evaluations begin
[@Schorlemmer2018a]. Specific parameters for an experiment are determined through community consensus. This includes parameters
such as the geographic testing region and magnitude range, authoratative data sets used to evaluate the forecasts, the
evaluation metrics, and precise definition of a forecast are defined in full before the conducting the experiment. This
standardization ensures that any potential conscious or unconscious biases are reduced, because the evaluation data are
collected after each model has been provided for evaluation.

# Statement of need

Over the last decade, the CSEP has lead numerous prospective earthquake forecasting experiments. These experiments are formally
conducted within testing centers [@Schorlemmer2007b] that contain the software required to autonomously run and evaluate
earthquake forecasts in a full prospective mode. The software design emphasized a carefully controlled computing and software
environment which ensured integrity of testing results.  However, the monolithic software design made it difficult for
researchers to utilize various routines in the testing centers in their own work without replicating the testing center
configuration on their own system. 

`pyCSEP` was designed to provide vetted methods to evaluate earthquake forecasts in a Python package that researchers can
include directly in their research. The statistical tests and tools to evaluate earthquake forecasts are required by all
model developers, and greatly benefit from open-source development practices by providing standardized, well-tested, and
community-reviewed software tools. At the time of publication, `pyCSEP` has been used for two published articles [@Bayona2020a;
@Savran2020a], and is being used by several research groups participating in the [Real-time earthquake risk reduction for a
resillient europe (RISE)](http://www.rise-eu.org/home) project.

# pyCSEP Overview

`pyCSEP` provides an open-source implementation of peer-reviewed statistical tests developed to evaluate probabalistic
earthquake forecasts [@Schorlemmer2007a; @Werner2011a; @Rhoades2011a; @Zechar2013a; @Savran2020a]. In addition, `pyCSEP`
provides utilities for working with earthquake catalogs and visualizations. The fundamental design of `pyCSEP` can be described
by two layers. An inner layer constists of core `pyCSEP` objects (Python classes) that represent earthquake forecasts,
catalogs, and spatial regions. An outer layer provides a higher-level interface containing rountines routines for common tasks
in evaluating forecasts. This approach provides easy access to any developer interested in using `pyCSEP`. 
 

Earthquake forecasts can either be specified as expected earthquake rates over discrete space-magnitude-time regions
[@Schorlemmer2007a] or as families of synthetic earthquake catalogs with each catalog representing a realization from the
underlying stochastic model [e.g., @Savran2020a].  Earthquake catalogs are row-based data sets that contain features of an
earthquake. At minimum, an earthquake must be defined by its geographical location (latitude, longitude), origin time, and
magnitude. Simulation-based earthquake forecasts generate synthetic earthquake catalogs. In addition, `pyCSEP` provides objects
for working directly with forecasts from the Uniform California Earthquake Rupture Forecast with Epidemic-type Aftershock
Sequences Version 3 [@Field2017a].  An earthquake catalog is a data set of earthquakes events that are described, at
minimum, by their origin times, magnitudes, and spatial locations. `pyCSEP` provides objects for interacting with
earthquake catalogs and performing operations on them, such as filtering and binning events on the space-magnitude grids
needed for evaluation. `pyCSEP` also includes numerous plotting utilities that interface directly with `matplotlib` and
`Cartopy`.  Space-magnitude regions facilite gridding operations that are necessary for evaluating earthquake forecasts.
These objects model regular latitude, longitude cells where earthquakes can be aggregated for evaluation and visualization
purposes. `pyCSEP` provides pre-defined spatial regions that have been used in previous experiements [@Field2007a;
@Taroni2018a]. 

`pyCSEP` interfaces directly with popular numerical and plotting libraries such as `Numpy`, `matplotlib`, and `pandas`.
Users already familiar with these librarys can adapt `pyCSEP` directly into their code. `pyCSEP` provides file-formats
for forecasts and earthquake catalogs, and can accommodate users' bespoke file formats with ease. 

# Replicability of previous software  

`pyCSEP` should be able to reproduce, in a statistical sense, results from experiments run in testing centers. Results
represent outcomes from statistical testing used to compare forecasts against observations. We reproduce results from
@Zechar2013a using `pyCSEP` to show consistency between the sets of results. We chose a subset of from @Zechar2013a referred to
in their manuscript as the mainshock+aftershock forecasts group. We demonstrate replicability of results in two ways; first, using 
the error between `pyCSEP` and @Zechar2013a; and second, we perform a convergence test based on the number of random trials in
calculating the scores. 

![Error in quantile scores computed between @Zechar2013a and `pyCSEP`. Scores are oriented where positive values indicate
@Zechar2013a score is greater. The shaded gray region depicts the standard error of the difference between @Zechar2013a and
`pyCSEP`.
\label{fig:consistency-test}](./figures/consistency_comparison_sims_1e6.pdf){width=75%}

\autoref{fig:consistency-test} shows the error between quantile scores as reported by @Zechar2013a and `pyCSEP`. We define the
error as the difference between @Zechar2013a and `pyCSEP`. The largest differences are observed to be 2x10$^{-3}$ units with
average error of 1.9x10$^{-4}$. We fail to reject the null-hypothesis from a dependent t-test over two sets of quantile
scores with a p-value of 6.41x10$^{-2}$. The independent t-test for these samples produces a *p*-value of 9.98x10$^{-1}$. The
shaded region on the plot shows the standard error of the mean difference between @Zechar2013a and `pyCSEP`.

\autoref{fig:convergence-test} shows the test of convergence for the evaluation @Helmstetter2007a using `pyCSEP` and
@Zechar2013a. We plot the quantile score as a function of the number of random trials used to estimate the uncertainty of the
forecast, thereby estimating the quantile score. We find that differences in evaluation scores in quantile scores converge
after approximately 1x10$^5$ simulations. The maximum error between across all pairs of quantile scores for the
@Helmstetter2007a is 0.36%.

We observe small differences (~0.5% relative percent difference) across all evaluation pairs, and we cannot reject the
hypothesis that `pyCSEP` and @Zechar2013a are different. Based on this, we conclude that results are comparable from a statistical
point of view. One likely cause of the differences comes from a custom implementation of a pseudo-random number generator used
in the testing centers. `pyCSEP` uses random number generators provided by `numpy` and `scipy`. 

![Convergence test for evaluations of @Helmstetter2007a forecast. We plot the number of simulations used to estimate quantile
scores against the error with @Zechar2013a. Tests are distinguished by different colors and the shaded gray region represents a
relative difference of 1\% [-0.5%, 0.5%].  \label{fig:convergence-test}](./figures/convergence_test_1e6.pdf){width=100%} 

# Acknowledgements

[Funding contributions go here.]

# References
