import os

DEFAULTCONFIG = ["NAME 		: \n",
                 "USERNAME 	: \n",
                 "PASSWORD	: \n",
                 "HOST		: \n",
                 "PORT		: \n"]


def read_config_file():
    file_path = 'DBConfig.cfg'

    if not os.path.isfile(file_path):
        print("ERROR: DBConfig file is created, fill all fields and restart server.")
        f = open('DBConfig.cfg', "w+")

        for i in DEFAULTCONFIG:
            f.write(i)

        f.close()
        exit(-1)
    DB_name = ''
    user_name = ''
    Password = ''
    Host = ''
    Port = ''

    with open(file_path) as fp:
        for line in fp:
            if line.startswith("NAME"):
                DB_name = line.split(':')[1].strip()
            if line.startswith("USERNAME"):
                user_name = line.split(':')[1].strip()
            if line.startswith("PASSWORD"):
                Password = line.split(':')[1].strip()
            if line.startswith("HOST"):
                Host = line.split(':')[1].strip()
            if line.startswith("PORT"):
                Port = line.split(':')[1].strip()
    return [DB_name, user_name, Password, Host, Port]
