FROM ubuntu:20.04
LABEL authors="art-not"
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
EXPOSE 22
COPY my-ssh-key.pub /root/.ssh/authorized_keys
CMD ["/usr/sbin/sshd", "-D"]
