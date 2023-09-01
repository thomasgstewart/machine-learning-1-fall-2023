gs <- function(M){
  c <- ncol(M)
  r <- nrow(M)
  zeros <- c()
  for(i in 1:(c-1)){
    if(i %in% zeros) next
    for(j in (i+1):c){
      alpha <- c(t(M[,j]) %*% M[,i] / (t(M[,i]) %*% M[,i]))
      w <- M[,j] -  alpha * M[,i]
      M[,j] <- w
      if(sum(zapsmall(w) == 0) == r) zeros <- c(zeros,j)
    }
  }
zapsmall(M)
}

R <- gs(M <- matrix(sample(1:2,9,TRUE),3))
t(R) %*% R
M
R

M <- matrix(c(1,1,1,3,0,2,1,0,0,0,1,0,0,0,1),3)
gs(M)
