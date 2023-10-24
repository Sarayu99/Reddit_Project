# Reddit_Project

This repository contains the code for the Structural Competition and Aggressive Behavior project. The files/folders in the repo are-

**Files**

1. 'Node_Embeddings_For_Fifteen_Subreddits.ipynb' - This python notebook contains the code to create the networkX graph, and generate the node embeddings, and find the network similarity between the sender and receiver of comments from 15 subreddits.

   _Output Files_:
   * 'data_fifteen_subreddits_method2c_node2vec.csv' (which contains the unique user pairs and their network similarity (cosine similarity between node embeddings)

2. 'Word_Embeddings_For_Fifteen_Subreddits.ipynb' - This python notebook contains the code to generate the mean word embedding (using SBERT) of a given user on the platform, and then calculate the difference in mean word embedding between a sender and a receiver pair who interacted via a comment on the platform.

   _Output Files_:
   * 'data_fifteen_subreddits_comment_level_culsim.csv': contains the cultural similarity with comments that have a valid parent (thus user pairs are repeated)
   * 'data_fifteen_subreddits_user_pair_level_culsim.csv': contains the average cultural similarity for each unique user pair (took the mean of the first output file across user pairs to obtain the average cosine similarity)

3. 'Comment_Level_Network_Cultural_Similarity.ipynb' - This python notebook maps each comment to a cosin similarity value between the node embedding of the sender and the receiver of the comment. The unique user pairs between these senders and receivers are in the output file 'data_fifteen_subreddits_method2c_node2vec' obtained from the 'Node_Embeddings_For_Fifteen_Subreddits.ipynb' notebook. 

   _Output Files_:
   * 'similarity_fifteen_subreddits.csv' (which contains ALL the comments of the 15 subreddits, only some of which have a network similarity and cultural similarity measure)
   * 'data_fifteen_subreddits_similarity.csv' (which contains ONLY the comments that have both a network similarity measure and a cultural similarity measure)


**Folders**

1. Network_Graphs - This folder contains the python notebooks which were used to experiment with 3 levels of aggregation (submission, subreddit, the whole reddit data) to generate the graphs on different sizes of reddit data.

2. output_files - This folder contains all the output files generated from the python notebooks.

