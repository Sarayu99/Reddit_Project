# Reddit_Project

This repository contains the code for the Structural Competition and Aggressive Behavior project. The files/folders in the repo are-

Files

1. 'Node_Embeddings_For_Fifteen_Subreddits.ipynb' - This python notebook contains the code to create the networkX graph, and generate the node embeddings, and find the network similarity between the sender and receiver of comments from 15 subreddits.

   _Output Files_: 

3. 'Word_Embeddings_For_Fifteen_Subreddits.ipynb' - This python notebook contains the code to generate the mean word embedding (using SBERT) of a given user on the platform, and then calculate the difference in mean word embedding between a sender and a receiver pair who interacted via a comment on the platform.

   _Output Files_:

5. 'Comment_Level_Network_Cultural_Similarity.ipynb' - This python notebook maps each comment to a cosin similarity value between the node embedding of the sender and the receiver of the comment. The unique user pairs between these senders and receivers are in the output file 'data_fifteen_subreddits_method2c_node2vec' obtained from the 'Node_Embeddings_For_Fifteen_Subreddits.ipynb' notebook. 

   _Output Files_:
   'similarity_fifteen_subreddits.csv' (which contains all the comments of the 15 subreddits, only some of which have a network similarity and cultural similarity       measure)
   'data_fifteen_subreddits_similarity.csv' (which contains only the comments which have both a network similarity measure and a cultural similarity measure)


Folders

1. Network_Graphs - This folder contains the python notebooks which were used to experiment with 3 levels of aggregation (submission, subreddit, the whole reddit data) to generate the graphs on different sizes of reddit data.

2. presentations - Contains power point presentations
