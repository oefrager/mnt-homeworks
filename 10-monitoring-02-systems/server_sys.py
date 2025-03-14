import json
import datetime


def get_system_info():
    system_info = {}

# Информация о ядре системы
    with open('/proc/version') as f:
        for line in f:
            system_info['system core'] = line.split()[2]
            
# Нагрузка на процессор, средняя (MHz)
    with open('/proc/cpuinfo') as f:
        cpu_load = 0
        count_cpu = 0
        for line in f:
            if line.startswith('cpu MHz'):
                cpu_load += int(line.split(':')[1].strip()[:-4])
                count_cpu += 1
    system_info['cpu_load_MHz'] = cpu_load // count_cpu
    
    # Информация о свободной памяти (в килобайтах)
    with open('/proc/meminfo') as f:
        mem_free = None
        for line in f:
            if line.startswith('MemFree:'):
                mem_free = int(line.split()[1])
                break
    system_info['memory_free_kb'] = mem_free

    # Информация о времени рвботы (в секундах)
    with open('/proc/uptime') as f:
        for line in f:
            uptime = int(line.split()[0][:-3])
            system_info['system_uptime_sec'] = uptime

    # Информация о загрузке сети (в килобайтах)
    with open('/proc/net/dev') as f:
        for line in f:
            if line.startswith('enp2s0:'):
                ipv4 = {}
                ipv4['Rx_kb/s'] = int(line.split()[1])/uptime//1000
                ipv4['Tx_kb/s'] = int(line.split()[9])/uptime//1000
                break
    system_info['ipv4:'] = ipv4
  
    return system_info


current_time = str(datetime.datetime.now().time())
current_date = str(datetime.datetime.now().date())

data = {}
data[current_time] = get_system_info()

with open((current_date + '-awesome-monitoring.log'), 'a', encoding='utf-8') as output:
    print(json.dumps(data, indent=4), file=output)
