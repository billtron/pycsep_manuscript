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

[Complete after remaining sections are written.]

# Background

Successfully predicting the time, location, and size of future earthquakes has immense societal value and underlies much of the
research in seismology and earthquake geology. To date, there have been are no reliable earthquake predictions methods. An
earthquake prediction makes a deterministic statement about whether or not an earthquake will occur in a particular geographic
region, time window, and magnitude range. On the other hand, an earthquake forecast provides the probability that such an
earthquake will occur [@Jordan2011a]. Most of the research effort focuses on developing earthquake forecasting models as the
degree of predictability of earthquakes remains an open and important question in seismology. 

As @Schorlemmer2018a states "the fundamental idea of CSEP is simple in principle but complex in practice: earthquake forecasts
should be tested against future observations to assess their performance, thereby ensuring an unbiased test of the forecasting
power of a model." Prospective evaluations requires model developers to fully specify their models (with zero-degrees of
freedom) before any evaluations occur [@Schorlemmer2018a]. Specific parameters of an experiment are determined through
community consensus. This includes aspects such as the geographic testing region and magnitude range, authoratative evaluation
data sets, evaluation metrics, and type of forecast are defined in full before the conducting the experiment. This
standardization ensures that any potential conscious or unconscious biases are reduced, because the evaluation data are
collected after each model has been provided for evaluation.


# Statement of need

Over the last decade, the Collaboratory for the Study of Earthquake Predictability (CSEP) has lead numerous prospective
earthquake forecasting experiments. These experiments are formally conducted within testing centers [@Schorlemmer2007b] that
contain the software required to autonomously run and evaluate earthquake forecasts in full-prospective mode. The software
design emphasized a carefully controlled computing and software environment which ensured integrity of testing results.
However, the monolithic software design made it difficult for researchers to utilize various routines in the testing centers in
their own work without replicating the testing center configuration on their own system. 

`pyCSEP` was designed to provide commonly used methods from the testing centers in a Python package that researchers can
include in their notebooks or scripts. The statistical tests and tools to evaluate earthquake forecasts are required by all
model developers, and greatly benefit from open-source development practices by providing standardized, well-tested, and
community-reviewed software tools. At the time of publication, `pyCSEP` has been used for two published articles [@Bayona2020a;
@Savran2020a], and is being used by several research groups participating in the [Real-time earthquake risk reduction for a
resillient europe (RISE)](http://www.rise-eu.org/home) project.

# pyCSEP Overview

`pyCSEP` is a Python package that provides researchers with tools to evaluate earthquake forecasts against observations.
`pyCSEP` interfaces directly with popular numerical and plotting libraries such as `Numpy` and `matplotlib`.  The fundamental
design of `pyCSEP` uses a two-layer implementation so that low-level classes are both accessible through easy-to-use functions
and from their low-level implementations. This approach provides an ease of access to researchers that are not as comfortable
working with Python classes. At it's core `pyCSEP` provides implementation of peer-reviewed statistical tests developed to
evaluate earthquake forecasts [@Schorlemmer2007a; @Werner2011a; @Rhoades2011a; @Zechar2013a; @Savran2020a].  `pyCSEP` provides
objects for representing earthquake forecasts which can either be specified on a regular space-magnitude grids
[@Schorlemmer2007a] or as families of synthetic earthquake catalogs representing realizations of the underlying stochastic
model. An earthquake catalog is a data set of earthquakes events that are described, at minimum, by their origin times,
magnitudes, and spatial locations. `pyCSEP`  provides objects for interacting with earthquake catalogs and performing simple
operations on them, such as filtering and binning events on space-magnitude grids used by the forecasts that are required
during evaluation. `pyCSEP` also includes numerous plotting utilities that interface directly with `matplotlib` and `Cartopy`

# Replicability of previous software  

`pyCSEP` should be able to reproduce, in a statistical sense, the results that were generated in testing centers. We reproduce
the study by @Zechar2013a using `pyCSEP` to show consistency between the sets of results. We chose a subset of from
@Zechar2013a, namely the so-called mainshock+aftershock forecasts group.  Where applicable, integration tests have been
included in the `pyCSEP` test suite. As a general practice, we plan to include more of these types of tests as they become
available. \autoref{fig:consistency-test} shows absolute error between quantile scores as reported by @Zechar2013a and
`pyCSEP`. Naturally, as these numbers represent p-values, we chose the absolute error to avoid dealing with percent differences
of values including zero.

![Absolute error in quantile scores computed where a positive value indicates the @Zechar2013a score is greater.
\label{fig:consistency-test}](./figures/consistency_comparison_sims_1e6.pdf){width=75%}


# Acknowledgements

[Funding contributions go here.]

# References
