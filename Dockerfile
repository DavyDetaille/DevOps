FROM centos:7
RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs install httpd git&& \
    yum clean all

EXPOSE 80
# Récupération de mon repository Git avec le mini projet
RUN git clone https://github.com/DavyDetaille/DevOps.git
# Copie des fichiers du mini projet web vers la racine de mon serveur web
RUN cp -f DevOps/Website/index.html /var/www/html/index.html
# Simple startup script to avoid some issues observed with container restart
CMD ["cd","DevOps"]
CMD ["git","pull","https://github.com/DavyDetaille/DevOps.git"]
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

test
test2