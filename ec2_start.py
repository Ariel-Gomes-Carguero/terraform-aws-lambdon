import boto3

#define ec2
ec2 = boto3.resource('ec2')

def lambda_handler(event, context):
    # definir a procura por instâncias STOPPED e com a TAG ambiente=LIGAR
    filters = [{
        'Name': 'tag:LIGAR',
        'Values': ['ON']
        },
        {
            'Name': 'instance-state-name', 
            'Values': ['stopped']
        }
    ]
    
    #busca as instâncias
    instances = ec2.instances.filter(Filters=filters)   
    
    #Pega o ID da instância
    RunningInstances = [instance.id for instance in instances]
    
    #Log para testar quais instâncias foram impactadas
    print(RunningInstances)

    #verificar se existem instâncias com a TAG: LIGAR desligadas
    if len(RunningInstances) > 0:
        #perform the shutdown
        shuttingDown = ec2.instances.filter(InstanceIds=RunningInstances).start()
        print("Startando as instâncias")
    else:
        print("Não foram encontradas instâncias STOPPED")

    return 'Olá, seu código rodou corretamente'