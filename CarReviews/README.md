# INFO-555_project_1
## Author

Kiwoon Hong
University of Arizona
kiwoon2799@arizona.edu

## Project Title

Statistical NLP - Building a model to extract feedback from car review data

## Description

Customer reviews are essential for industries as they influence brand reputation, potential buyers, and strategic decision-making. Analyzing these reviews allows stakeholders to gain insights into consumer feedback, enhancing product development, marketing strategies, and identifying market trends. This project focuses on analyzing car reviews using sentiment analysis and zero-shot classification techniques to extract key consumer feedback. Negative feedback will be categorized to identify complaint trends, interpreting feedback patterns through neural network-based emotion scores for better sentiment analysis. The Car Review Dataset on Hugging Face includes various user reviews, but since there is no predefined review category, the models employed will utilize unsupervised learning.

## Instructions

### Files
* `INFO555_Project1_Kiwoon_Hong`: A file that has already been run and contains output.
* `INFO555_Project1_Kiwoon_Hong_clear`: A file that has been cleared of output.
* The result is the same whether you run with either file
* `INFO_555_Project_1_Writeup`: A 2-page paper containing the description, experiment, analysis, and results of the project.
* `~\INFO-555_project_1\data`: This is data from the project, but you can load it directly from within the code.
### Executing

* This code is suitable for running in Google Colab.
* Set the runtime type to GPU.

### Running code blocks

* If you run them in order from the top, it would work out.
* `Import Libraries`, `Load Dataset`: Import the required libraries and load the dataset from the huggingface
* `EDA`: Shows the structure of your data, but must be run for the next step.
* `Model 1 - Transformers`: Contains sentiment analysis models 1 and 2 and the Zero-Shot Classifier model.
* `Evaluation`: Shows the evaluation table corresponding to each model. The sentiment analysis model evaluations include confusion matrixes and sampled tables, and the ZSC model evaluation includes a sampled table.

## Data Source
https://huggingface.co/datasets/florentgbelidji/car-reviews