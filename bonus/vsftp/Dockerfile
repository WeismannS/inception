FROM alpine:3.20

RUN apk add --no-cache vsftpd

RUN mkdir -p /var/www/inception/htdocs/wordpress \
    && adduser -D ftpuser \
    && echo "ftpuser:ftp123" | chpasswd \
    && echo "local_root=/var/www/inception/htdocs/wordpress" >> /etc/vsftpd/vsftpd.conf \
    && echo "seccomp_sandbox=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "listen=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "listen_ipv6=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "anonymous_enable=NO" >> /etc/vsftpd/vsftpd.conf \
    && echo "local_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "write_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_enable=YES" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_min_port=30000" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_max_port=30009" >> /etc/vsftpd/vsftpd.conf \
    && echo "pasv_address=127.0.0.1" >> /etc/vsftpd/vsftpd.conf \
    && echo "userlist_enable=NO" >> /etc/vsftpd/vsftpd.conf

EXPOSE 20 21 30000-30009

CMD ["vsftpd", "/etc/vsftpd/vsftpd.conf"]
