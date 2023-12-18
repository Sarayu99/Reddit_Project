This folder contains all the programs and output files for the 'askscience' subreddit. 

Code:
1. *Node_Embeddings_For_askscience_Subreddits.ipynb*: <br>
Creating the NetworkX graph for askscience subreddit, Generating the Node Embeddings, and Calculating the Network Similarity. <br>
This notebook considers the askscience subreddit and generates the NetworkX graphs. The interaction between user 'i' and user 'j' is captured during the following metric-
*(Number of comments between i and j)/(Number of comments sent by all users to j)*
**Part 1: Reading the data**<br>
**Part 2: Generate the Graph using Method 2c**<br>
  The unit level is the entire reddit data.
note: The column 'cosine_similarity' in all output files is actually the 'Network Similarity'

*OUTPUT_FILES:*<br>
 * 'data_askscience_subreddits_method2c_node2vec.csv': contains the unique user pairs and their network similarity (cosine similarity between node embeddings)


3. *Word_Embeddings_For_askscience_Subreddits.ipynb*:
4. *Comment_Level_Network_Cultural_Similarity_askscience.ipynb*:
5. *Aggressive_Language_askscience.ipynb*:
6. *additional_tests_askscience.ipynb*:
