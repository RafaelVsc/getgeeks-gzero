from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def factory_user():
    user = {
        "name": fake.first_name(),
        "lastname": fake.last_name(),
        "email": fake.free_email(),
        "password": "pwd123"
    }

    return user

def factory_wrong_email():

    first_name = fake.first_name()

    return {
        "name": first_name,
        "lastname": fake.last_name(),
        "email": first_name.lower() + '&gmail.com',
        "password": "pwd123"
    }

def factory_user_login():
    return {
        "name": 'Rafael',
        "lastname": 'Vescio',
        "email": 'vescio@hotmail.com',
        "password": "pwd123"
    }

def factory_user_begeek():
    return {
        "name": 'Kim',
        "lastname": 'Dotcom',
        "email": 'kim@dot.com',
        "password": 'pwd123',
        "geek_profile": {
            "whatsapp": "11999999999",
            "description": "Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formatando, reinstalando o S.O, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.",
            "printer_repair": "Sim",
            "work_method": "Remoto",
            "cost": "100"
        },
    }