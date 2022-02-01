import bcrypt
from faker import Faker
fake = Faker()


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user(target):

    data = {
        'faker': {
            "name": fake.first_name(),
            "lastname": fake.last_name(),
            "email": fake.free_email(),
            "password": "pwd123"
        },

        'wrong_email': {
            "name": "Pedro",
            "lastname": "de Lara",
            "email": "pedro_dl*hotmail.com",
            "password": "abc123"
        },

        'login': {
            "name": 'Rafael',
            "lastname": 'Vescio',
            "email": 'vescio@hotmail.com',
            "password": "pwd123"
        },

        'be_geek': {
            "name": 'Kim',
            "lastname": 'Dotcom',
            "email": 'kim@dot.com',
            "password": 'pwd123',
            "geek_profile": {
                "whatsapp": "11999999999",
                "description": "Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC,  reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.",
                "printer_repair": "Sim",
                "work_method": "Remoto",
                "cost": "100"
            },
        }
    }

    return data[target]
