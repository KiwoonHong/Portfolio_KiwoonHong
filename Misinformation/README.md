# INFO-555_project_3
## Author

Kiwoon Hong
University of Arizona
kiwoon2799@arizona.edu

## Project Title

Fake News Detection - Using LLM Models

## Description
Misinformation spreads rapidly through social networks and online platforms, making it hard for individuals to identify reliable sources. The ease and speed of AI-driven misinformation creation further complicate detection. As a result, the spread of fake news poses a significant challenge with widespread consequences for societies.

The goal of this project is to create a detection model using fake news data. By building an effective fake news detection model, we can help stop the spread of misinformation, promote media literacy, and restore trust in reliable sources of information.

## Instructions

### Files
* `INFO555_Project3_Kiwoon_Hong.ipynb`: A file that has the code for the project. This includes codes that sampling the data, but also includes loading the sampled data.
* `INFO_555_Project_3_Writeup`: A 2-page paper containing the description, experiment, analysis, and results of the project.
* `~\INFO-555_project_3\data`: A folder for data from the project.
* `~\INFO-555_project_3\tex`: A folder for LaTex files of `INFO_555_Project_3_Writeup`.

### Executing

* You should input your Open-AI API code and creAI API code to call APIs.
* You can load the data with predicted columns frame by running `IF you want to skip LLM APIs..` part in `INFO555_Project3_Kiwoon_Hong.ipynb`. You can skip calling APIs(`Open AI`, `Exa web seach`) by load the `~\INFO-555_project_3\data\sampled_data`.

### Running code blocks

* If you run them in order from the top, it would work out(You can skip `IF you want to skip LLM APIs..`).
* `Import Libraries`, `Load Dataset`: Import the required libraries and load the dataset from the huggingface
* `EDA`: Shows the structure of the data.
* `Sampling`: Sample the data(500 samples).
* `Baseline Model`: Defining the function for running the baseline model.
* `Experiment Model`: Defining the function for running the experimental model.
* `prediction`: Predict labels for each model.
* `IF you want to skip LLM APIs..` : Load the data frame with predicted labels.
* `Bootstrap Resampling` : Conduct bootstrap resampling and show its distribution.
* `Evaluation` : Evaluate each model.




## Data Source
https://huggingface.co/datasets/GonzaloA/fake_news