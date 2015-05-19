generate_dataset <- function(N){ 
  
  sex <- sample(c("M", "F"), N, replace=TRUE, prob=c(0.5, 0.5))
  
  age <- runif(N,14,88)
  
  kdisease <- sample(c("CKD", "NoCKD"), N , replace=TRUE, prob=c(0.5, 0.5))
  
  HOMAmean <- c(CKD=2.16, NoCKD=1.87)  
  HOMAsd <- c(CKD=0.64, NoCKD=0.21)
  HOMAIRscore <- rnorm(N,mean=HOMAmean[kdisease], sd=HOMAsd[kdisease])
  
  IR <- ifelse(HOMAIRscore>2.284, "IR", "NoIR")
  
  eGFRmean<-c(IR=68.27, NoIR=107.51)
  eGFRsd<-c(IR=32.51, NoIR=32.90)
  eGFR <- rnorm(N,mean=eGFRmean[IR], sd=eGFRsd[IR])
  
  sim_LVM<- function(eGFR) { 
    150-0.327*eGFR 
    
  }
  
  LVM <- sim_LVM(eGFR)
  
  LVHcutoff<- c(F=110, M=125)
  
  LVH <- ifelse(LVM > LVHcutoff[sex], "LVH","NoLVH")

  
  data.frame(sex, age, kdisease, eGFR,IR, HOMAIRscore, LVM,LVH)
     
}

patient_df<-generate_dataset(100)
patient_df

fit <- lm(LVM~ eGFR, data=patient_df)
summary(fit)

log_fit<- glm(LVH~ kdisease+HOMAIRscore+sex,data=patient_df, family= "binomial" )
log_fit2<- glm(LVH~ kdisease+IR+sex,data=patient_df, family= "binomial" )

summary(log_fit)

plot_LVM_eGFR<- ggplot(data=patient_df,aes(x=LVM, y=eGFR))+ geom_point()+ geom_smooth(method=lm)

plot_LVH_eGFR<-ggplot(data=patient_df,aes(x=LVH, y=eGFR))+ geom_boxplot()

plot_kdisease_eGFR<-ggplot(data=patient_df,aes(x=kdisease, y=eGFR))+ geom_boxplot()


