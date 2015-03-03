A<-array(c(3,2,-1,2,-2,0.5,-1,4,-1), dim=c(3,3))
A
n<-3
Aaug <- cbind(A, diag(n))
Aaug
Aaug[1,]<- Aaug[1,]/Aaug[1,1]
Aaug[2,]<- Aaug[2,] - (Aaug[2,1]*Aaug[1,])
Aaug[3,] <- Aaug[3,] - (Aaug[3,1]*Aaug[1,])

Aaug[2,]<- Aaug[2,]/Aaug[2,2]
Aaug[3,] <- Aaug[3,] - (Aaug[3,2]*Aaug[2,])

Aaug[3,]<- Aaug[3,]/Aaug[3,3]
Aaug

A_inv <- Aaug[1:3, 4:6]
A_inv


Aaug[2,] <- Aaug[2,] - (Aaug[2,3]*Aaug[3,])
Aaug[1,]<- Aaug[1,] - (Aaug[1,1]*Aaug[3,])
Aaug

#still need to convert Aaug[1,2] to 0 
#to check work =