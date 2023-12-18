This folder contains all the programs and output files for the 'askscience' subreddit. 

Code:
1. *Node_Embeddings_For_askscience_Subreddits.ipynb*: <br>
**Creating the NetworkX graph for askscience subreddit, Generating the Node Embeddings, and Calculating the Network Similarity.** <br>
This notebook considers the askscience subreddit and generates the NetworkX graphs. The interaction between user 'i' and user 'j' is captured during the following metric-
*(Number of comments between i and j)/(Number of comments sent by all users to j)*<br>
**Part 1: Reading the data**<br>
**Part 2: Generate the Graph using Method 2c**<br>
  The unit level is the entire reddit data.
note: The column 'cosine_similarity' in all output files is actually the 'Network Similarity'

  *OUTPUT_FILES:*<br>
 * 'data_askscience_subreddits_method2c_node2vec.csv': contains the unique user pairs and their network similarity (cosine similarity between node embeddings)

-------  
2. *Word_Embeddings_For_askscience_Subreddits.ipynb*:<br>
**Generating the Word Embeddings for users across the askscience subreddit**. <br>
This notebook considers 1 subreddit - askscience. For each user in a subreddit, it calculates the mean word embedding from all his comments. Then it calculates it generates the cosine similarity of language use between user pairs.<br>
This notebook uses the SentenceBert.<br>
**Part 1: Reading the data**<br>
**Part 2: Generate the word embeddings** <br>
In this section, I have read the entire subreddit. Generate a word embedding for every comment, and store it in the 'data_word_embeddings' dataframe<br>
**Part 3: Find Cultural Similarity between user pairs**<br>
  For every user pair, find the average cosine similarity between their word embeddings<br>
note: I just did part 1 and part 2 as part 3 was not required.

  *OUTPUT FILES:*<br>
* 'data_askscience_comment_level_culsim.csv': contains the cultural similarity with comments which have a valid parent (thus user pairs are repeated)<br>
* 'data_askscience_user_pair_level_culsim.csv': contains the average cultural similarity for each unique user pair (took the mean of the first output file across user pairs to obtain the average cosine similarity)<br>
-------  
3. *Comment_Level_Network_Cultural_Similarity_askscience.ipynb*:<br>
**Mapping Every Comment to a Network and Cultural Similarity Measure, and a Parent Comment.**<br>
This python notebook maps each comment to a cosine similarity value between the node embedding of the sender and the receiver of the comment (this cosine similarity is both a cultural similarity and a network similarity). The unique user pairs similarity between these senders and receivers are in the output file 'data_askscience_subreddits_method2c_node2vec.csv' obtained from the 'Node_Embeddings_For_askscience_Subreddits.ipynb' notebook, as well as in the 'data_askscience_user_pair_level_culsim.csv' file from the 'Word_Embeddings_For_askscience_Subreddits.ipynb' notebook. The notebook also maps each comment to a parent-comment-author, as well as a cultural similarity.<br>

**Thus, each comment has been mapped to a network similarity, cultural similarity, and a parent comment author.**

  *OUTPUT FILES:*<br>
* 'similarity_askscience_subreddits.csv' : which contains all the comments of the askscience subreddit, only some of which have a network similarity and cultural similarity measure<br>
* 'data_similarity_askscience_subreddits.csv' : which contains only the comments which have both a network similarity measure and a cultural similarity measure and a parent comment<br>
-------  
4. *Aggressive_Language_askscience.ipynb*:<br>
**Compute the Dependent Variable 'aggressiveLanguage'.**<br>
The original file for the askscience subreddit has 4 parts- part 1= reading the data, part 2= Compute the 'aggressiveLanguage' variables for every comment, part 3=Compute the 'aggressiveLanguage' variables for each unique user pair, part 4=Update the 'aggressiveLanguage' variables for each comment with the average from each user pair. <br>

This notebook does only part 1 and 2.<br>

**Other than these steps each row needs to be given a timestamp value, which is done after part 1 and part 2**

  *OUTPUT FILE:*<br>
* 'data_result_askscience_subreddits_aggressive_language.csv': Contains the threat, insult, and toxicity scores for each comment<br>

references for detoxify-<br>
* https://www.kaggle.com/code/renokan/toxic-comments-using-detoxify-model/notebook?scriptVersionId=87256021 <br>
* https://github.com/unitaryai/detoxify <br>
-------  
5. *additional_tests_askscience.ipynb*:<br>
**Additional testing**.<br>
This notebook performs extra processing and tests on the askscience data<br>
The following data file 'data_result_askscience_subreddits_aggressive_language.csv' was modified to add the next two steps<br>
Part 1:   add the comment level cultural similarity (which has not yet been averaged across user_pairs)<br>
Part 2:   add a new dummy column 'netSim_Dummy' which takes value of 1 for high network similarity comments and value of 0 for low network similarity comments.<br>

  *OUTPUT FILES*:
* 'data_askscience_regressions.csv': the file ready for regressions. This file contains comments for which there was a <br>

*   parent comment author
*   network similarity (this is averaged across user pairs)
*   cultural similarity (this is averaged across user pairs)
*   insult score
*   threat score
*   toxicity score
*   time stamp (date_time, date, time, date_hour, data_hour_min)
*   cultural similarity at the comment level 
*   network similarity dummy
