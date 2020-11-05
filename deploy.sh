#!/bin/bash

usernames=$(cat usernames.txt)
port=50155

for user in $usernames; do
	mkdir "$user"
	touch /home/xfaraday/housing/$user/Dockerfile
	printf "
	#Dockerfile
	FROM ubuntu:20.04

	RUN apt-get update -y

	RUN apt-get install -y openssh-server
	RUN mkdir /var/run/sshd
	RUN echo 'root:mastersecuresshpassword9876' | chpasswd
	RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
	RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
	
	RUN useradd -rm -d /home/$user -s /bin/bash -g root -G sudo -u 1000 $user
	RUN echo '$user:supersecurepasswordCISOCTF2020' | chpasswd

	RUN echo 'export VISIBLE=now' >> /etc/profile
	
	RUN sed -i 's/#*Port 22/Port $port/g' /etc/ssh/sshd_config
	
	EXPOSE $port

	CMD [\"/usr/sbin/sshd\", \"-D\"]
	" > /home/xfaraday/housing/$user/Dockerfile
	dos2unix /home/xfaraday/housing/$user/Dockerfile /home/xfaraday/housing/$user/Dockerfile
	docker build -t $user /home/xfaraday/housing/$user
	docker run -p $port:$port $user &
	port=$((port+1))
done

