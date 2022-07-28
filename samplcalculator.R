add <- function(x,y){
return(x+y)
}
subtract <- function(x,y){
return(x-y)
}
multiply <- function(x,y){
return(x*y)
}
divide <- function(x,y)
{
return(x/y)
}
#input from the user
print("select the following operation")
print("1.ADD")
print("2.subtract")
print("3.multiply")
print("4.divide")
ch=as.integer(readline(prompt="enter choice[1/2/3/4/]: "))
num1 =as.integer(readline(prompt="enter first number: "))
num2 =as.integer(readline(prompt="enter second number: "))
operator <- switch(ch,"+","-","*","/")
result<- switch(ch,add(num1,num2),subtract(num1,num2),multiply(num1,num2),divide(num1,num2))
print(paste(num1,operator,num2,"=",result))


