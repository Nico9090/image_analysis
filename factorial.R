i<-1
x<-readline('Enter a number: ')
x<-as.numeric(x)
fac<-1
while (i<x){
  fac<-as.numeric(fac)*(x-as.numeric(i))
  i<-as.numeric(i)+1
  if (i==x){
    fac<-as.numeric(fac)*x
  }
}
print(fac)
