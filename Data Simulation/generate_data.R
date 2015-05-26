##Effects of insulin resistance on left ventricular hypertrophy in patients with CKD stage 1–3
##LVM<- function(LVD, IVST, PWST){ 0.8* 1.04* (LVD+IVST+PWT)^3 - LVD^3)+0.6}
##LVH <- function(LVM, BSA) {LVM/BSA}
  

generate_dataset <- function(N=100){
  
  sex <- sample(c("M", "F"), N, replace=TRUE, prob=c(0.5, 0.5))
  
  age <- runif(N,14,88)
  
  kdisease <- sample(c('CKD', 'NoCKD'), replace=TRUE, prob=c(0.5, 0.5))
  
  HOMA_mean <- c(CKD=2.16, NoCKD=1.87)  
  HOMA_sd <- c(CKD=0.64, NoCKD=0.21)
  HOMA_IR_score <- rnorm(N,mean=HOMA_mean, sd=HOMA_sd)
  
  IR <- ifelse(HOMA_IR_score>2.284, 'IR', "NoIR")
  
  LVM_mean<-c(IR=106.42, NoIR=83.8)
  LVM_sd<-c(IR=31.22, NoIR=19.71)
  LVM_score <- rnorm(N,mean=LVM_mean,sd= LVM_sd)
  
  eGFR_mean<-c(IR=68.27, NoIR=107.51)
  eGFR_sd<-c(IR=32.51, NoIR=32.90)
  eGFR <- rnorm(N,mean=eGFR_mean, sd=eGFR_sd)
  
  data.frame(sex, age,kdisease, eGFR, HOMA_IR_score, LVM_score)
  
}



df<-generate_dataset(100)
df