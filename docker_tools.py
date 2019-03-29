import docker
import json

def read_file_to_text(file_path):

    f = open(file_path, "r")
    return f.read()

def get_config_map(filePath):

    #read configuration file to map
    return json.loads(read_file_to_text(filePath))

def container_exists_in_list(con_list, name):
    for container in con_list:
        if container.attrs['Name'] == '/' + name:
            return True
    return False

def image_exists_in_list(img_list, name):
    pass

def main():

    config_map      = get_config_map('./docker_tools/config.json')
    container_name  = config_map['containerName']
    image_name      = config_map['imageName']
    version         = config_map['version']
    full_name       = container_name + '-' + version
    container       = None

    #get list of all docker containers
    docker_client   = docker.from_env()
    containers_list = docker_client.containers.list()

    #container with name exists
    container_exists = container_exists_in_list(containers_list, full_name)
    print 'Container Exists = ' + str(container_exists)
    print ''

    if container_exists:
        container        = docker_client.containers.get(full_name)
        status = container.status

        if status == 'paused':
            print full_name + ' Status is Paused'
            pass
        elif status == 'running':
            print full_name + ' Status is Running'
            pass



if __name__ == '__main__':
        main()