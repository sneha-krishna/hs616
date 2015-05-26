generate_dataset <- function(N){ 
  
  sex <- sample(c("M", "F"), N, replace=TRUE, prob=c(0.5, 0.5))
  
  age <- runif(N,14,88)
  
  kdisease <- sample(c("CKD", "NoCKD"), N , replace=TRUE)
  
  eGFRmean<-c(CKD=68.27, NoCKD=107.51)
  eGFRsd<-c(CKD=32.51, NoCKD=32.90)
  eGFR <- rnorm(N,mean=eGFRmean[kdisease], sd=eGFRsd[kdisease])
  
  HOMAmean <- c(CKD=2.284, NoCKD=1.87)  
  HOMAsd <- c(CKD=0.64, NoCKD=0.21)
  HOMAIRscore <- rnorm(N,mean=HOMAmean[kdisease], sd=HOMAsd[kdisease])
  
  IR <- ifelse(HOMAIRscore>2.284, "IR", "NoIR")
  
  sim_LVM<- function(x) { 
    150-0.3*x + ifelse(sex=='F', -15, 0)
    
  }
  
  LVM <- sim_LVM(eGFR)
  
  LVHcutoff<- c(F=110, M=125)
  
  LVH <- ifelse(LVM > LVHcutoff[sex] & IR== 'IR' , "LVH","NoLVH")
  
  data.frame(sex, age, kdisease, eGFR, HOMAIRscore, IR, LVM,LVH)     
}
patient_df<-generate_dataset(1e6)
patient_df



# Analysis 

#shows patient with LVH have lower levels of stimated glomerular filtration rate (e-GFR) on average
plot_LVH_eGFR<-ggplot(data=patient_df,aes(x=LVH, y=eGFR))+ geom_boxplot()
plot(plot_LVH_eGFR)

# shows patients with IR have lower levels of stimated glomerular filtration rate (e-GFR) on average
plot_IR_eGFR<-ggplot(data=patient_df,aes(x=IR, y=eGFR))+ geom_boxplot()
plot(plot_IR_eGFR)

# shows HOMA-IR has positive correlations with left ventricular mass index (LVMI)
fit_IRscore_LVM <- lm(HOMAIRscore~ LVM, data=patient_df)
summary(fit_IRscore_LVM)

#HOMA-IR score has negative correlations with e-GFR
fit_HOMAIRscore_eGFR <- lm(HOMAIRscore~ eGFR, data=patient_df)
summary(fit_HOMAIRscore_eGFR)

#Left ventricular mass (LVM) has negative correlations with e-GFR
fit_LMV_eGFR <- lm(LVM~ eGFR, data=patient_df)
summary(fit_LMV_eGFR )

log_fit<- glm(LVH~ kdisease+IR,data=patient_df, family= "binomial" )
summary(log_fit)

d_tree_fit<- ctree(LVH~IR+kdisease,data=patient_df)
plot(d_tree_fit)


