# Terraform : Reduzindo custos na AWS

![alt text](https://boanoticia.org.br/wp-content/uploads/2021/01/aws-logo.png)
<br>
<br>

A função do módulo é criar 2 lambdas, permissoões e apontamento no cloudwatch com a função de Ligar e Desligar instâncias de forma programada e automatizada visando reduzir custos com horas de instancias em execução

<br>
Após rodar o terraform será necessário colocar as Tags nas suas ec2

* LIGAR: ON > Para ligar no horário definido
* DESLIGAR: ON > Para desligar no horário definido
<br>
O horário deve ser definido no arquivo cloud_watch.tf nas linhas
* schedule_expression   = "cron(00 22 * * ? *)"

<br>
<br>



créditos pelo cod python: 

https://github.com/drezende/aws-lambda-start-stop
