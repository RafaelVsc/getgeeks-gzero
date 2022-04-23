import bcrypt
from faker import Faker
fake = Faker()


def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed


def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')
    ]

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
                "desc": "Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC,  reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.",
                "printer_repair": "Sim",
                "work": "Remoto",
                "cost": "100"
            },
        },

        'attempt_be_geek': {
            "name": 'Linus',
            "lastname": 'Torvalds',
            "email": 'torvalds@linus.com',
            "password": 'pwd123',
            "geek_profile": {
                "whatsapp": "00999999999",
                "desc": "Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit",
                "printer_repair": "Não",
                "work": "Presencial",
                "cost": "150"
            },
        },

        'searcher': {
            "name": 'Johnny',
            "lastname": 'Lawrence',
            "email": 'sensei@cobrakai.com',
            "password": 'pwd123'
        },

        'search_alien': {
            "name": 'Dok',
            "lastname": 'Ock',
            "email": 'dok@oscorp.com',
            "password": 'pwd123',
            'geek_profile': {
                "whatsapp": "21999991001",
                "desc": "Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D",
                "printer_repair": "Sim",
                "work": "Presencial",
                "cost": "250"
            }
        },

        'search_common': {
            "name": 'Peter',
            "lastname": 'Parker',
            "email": 'parker@oscorp.com',
            "password": 'pwd123',
            "geek_profile": {
                "whatsapp": "00999991002",
                "desc": "Faço instalação de distribuições Linux no seu computador PC X86 ou X64 com processadores Intel ou AMD. Pode ser Linux Debian, Ubuntu, Mint, Fedora etc...",
                "printer_repair": "Não",
                "work": "Remoto",
                "cost": "200"
            },
        }

    }

    return data[target]
