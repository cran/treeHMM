% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backward.R
\name{backward}
\alias{backward}
\title{Infer the backward probabilities for all the nodes of the treeHMM}
\usage{
backward(hmm, observation, bt_seq, kn_states = NULL)
}
\arguments{
\item{hmm}{hmm Object of class List given as output by \code{\link{initHMM}}}

\item{observation}{A list consisting "k" vectors for "k" features, each vector being a character series of discrete emmision values at different nodes serially sorted by node number}

\item{bt_seq}{A vector denoting the order of nodes in which the tree should be traversed in backward direction(from leaves to roots). Output of \code{\link{bwd_seq_gen}} function.}

\item{kn_states}{(Optional) A (L * 2) dataframe where L is the number of training nodes where state values are known. First column should be the node number and the second column being the corresponding known state values of the nodes}
}
\value{
(N * D) matrix denoting the backward probabilites at each node of the tree, where "N" is possible no. of states and "D" is the total number of nodes in the tree
}
\description{
\code{backward} calculates the backward probabilities for all the nodes
}
\details{
The backward probability for state X and observation at node k is defined as the probability of observing the sequence of observations e_k+1, ... ,e_n under the condition that the state at node k is X.
That is:\cr\code{b[X,k] := Prob(E_k+1 = e_k+1, ... , E_n = e_n | X_k = X)}
\cr where \code{E_1...E_n = e_1...e_n} is the sequence of observed emissions and \code{X_k} is a random variable that represents the state at node \code{k}
}
\examples{
tmat = matrix(c(0,0,1,0,0,0,0,1,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0),
               5,5, byrow= TRUE ) #for "X" (5 nodes) shaped tree
hmmA = initHMM(c("P","N"),list(c("L","R")), tmat) #one feature with two discrete levels "L" and "R"
obsv = list(c("L","L","R","R","L")) #emissions for the one feature for the 5 nodes in order 1:5
bt_sq = bwd_seq_gen(hmmA)
kn_st = data.frame(node=c(3),state=c("P"),stringsAsFactors = FALSE) 
                   #state at node 3 is known to be "P"
BackwardProbs = backward(hmmA,obsv,bt_sq,kn_st)
}
\seealso{
\code{\link{forward}}
}
