# NPC: Neighbors' Progressive Competition

This is the Matlab implementation of "NPC: Neighbors Progressive Competition Algorithm for Classification of Imbalanced Data Sets" paper by Soroush Saryazdi, Bahareh Nikpour and Hossein Nezamabadi-pour. This paper has been accepted in Signal Processing and Intelligent Systems (ICSPIS), International Conference of IEEE, 2017. For more details and the pseudo code of this method please refer to the arXiv preprint version of this paper which can be found here:[<a href="https://arxiv.org/abs/1711.10934">arXiv Preprint</a>]

<h2>---- Code Instructions ----</h2>

-<b>main_NPC.m</b>: This code is an example of classification using NPC. Use this if you are not sure how the code works.

-<b>CompN.m</b>: Function that classifies the results using NPC method.
inputs: Sample (training data), Test (test data), Weights (weights, which are calculated by the formula in the paper), WinThresh (winning threshold)
output: classification result (predicted labels)

-<b>GMCalc.m</b>: Function that calculates Geometric Mean (GM) which is a common metric for evaluating an algorithm's performance on imbalanced data.
inputs: Test (test data labels), Result (classification result: predicted labels)
output: Geometric Mean

-<b>Example_Imbalanced_Dataset_Train.mat</b>: This is an example training set that was artificially generated, to use in main_NPC to demonstrate how the code works.

-<b>Example_Imbalanced_Dataset_Test.mat</b>: This is an example test set that was artificially generated, to use in main_NPC to demonstrate how the code works.
