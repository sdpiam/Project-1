## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

https://github.com/sdpiam/Project-1/blob/45c47ecec4b879f31ef9260d45ef2ad3cab9a755/Diagrams/My%20ELK%20Stack%20Network.png

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the ansible file may be used to install only certain pieces of it, such as Filebeat.

https://github.com/sdpiam/Project-1/blob/63c11b2ffda90336a4c295244d4dc4f4d2af6518/Ansible/Filebeat/filebeat-playbook.yml

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use 
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting inbond access to the network.
The load balancer ensures that any work, incoming traffic, will be shared by both vulnerable web servers. The purpose of the Jump Box is to ensure only authorized users will be able to connect.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the filesystems of the VMs on the network and system metrics.
- Filebeat detects changes to the filesystem. Its used specifically to collect Apache logs.
- Metricbeat detects changes in system metrics such as CPU usage. For example we can use it to detect SSH login attempts and or failed sudo escalations.

The configuration details of each machine may be found below.


| Name     | Function    | IP Address | Operating System |
|----------|-------------|------------|------------------|
| Jump Box | Gateway     | 10.0.0.8   | Linux            |
| Web 1    | Web Server  | 10.0.0.4   | Linux            |
| Web 2    | Web Server  | 10.0.0.5   | Linux            |
| ELK      | Monitoriing | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
52.156.65.156

Machines within the network can only be accessed by each other.
The Web 1 and Web 2 VMs send traffic to the ELK server. Their corresponding IP address is 20.94.216.164.

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | 52.156.65.156        |
| ELK      | No                  | 10.0.0.8             |
| Web 1    | No                  | 10.0.0.8             |
| Web 2    | No                  | 10.0.0.8             |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because the main advantage of automating configuration with Ansible is that it enables IT administrators the ability to automate your daily work tasks and give the administrator more time to focus on the needs of the business.

The "install-elk" playbook implements the following tasks:
- Configure Elk VM with Docker
- Install docker.io
- Install pip3
- Download and launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

https://github.com/sdpiam/Project-1/blob/b05813d3557b8520223c6ed4e970136f0fa3e7f2/Images/Docker%20PS.png

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 10.0.0.4
- Web 2 10.0.0.5

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects data about the file system, which files have changed and when they changed.
- Metricbeat collects machine metrics, such as uptime.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the YAML file to /etc/ansible.
- Update the /etc/ansible/hosts file to include host group, private IP address followed by ansible_python_interpreter=/usr/bin/python3.
- Run the playbook, and navigate to curl localhost/setup.php to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:
- The playbooks are listed as install-elk.yml / filebeat-playbook.yml / metricbeat-playbook.yml /ansible_config.yml. They are to be copied into /etc/ansible directory.
- To make Ansible run the playbook on a specific machine, update the /etc/ansible/hosts file. Within this file, name groups using square brackets (currently contains '[webservers]' and '[elk]') surrounding the group-name and under replace private IP's with your own respective IP's. You then use these group-names behind the "hosts:" field in the playbooks to specify which machines to apply the playbook to.

-To check if the ELK server is running, navigate to http://[your.VM.IP]:5601/app/kibana

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._
