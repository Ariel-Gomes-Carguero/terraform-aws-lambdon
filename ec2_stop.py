import boto3

#define ec2
ec2 = boto3.resource('ec2')

def lambda_handler(event, context):
    # definir a procura por instâncias RUNNING e com a TAG ambiente=DESLIGAR
    filters = [{
        'Name': 'tag:DESLIGAR',
        'Values': ['ON']
        },
        {
            'Name': 'instance-state-name', 
            'Values': ['running']
        }
    ]
    
    #busca as instâncias
    instances = ec2.instances.filter(Filters=filters)   
    
    #Pega o ID da instância
    RunningInstances = [instance.id for instance in instances]
    
    #Log para testar quais instâncias foram impactadas
    print(RunningInstances)

    #verificar se existem instâncias de TAG: DESLIGAR executando
    if len(RunningInstances) > 0:
        #perform the shutdown
        shuttingDown = ec2.instances.filter(InstanceIds=RunningInstances).stop()
        print("Stoppando as instâncias")
    else:
        print("Não foram encontradas instâncias em RUNNING")

    return 'Olá, seu comando rodou corretamente!'