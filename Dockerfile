FROM alpine

RUN apk update && apk add dropbear

# Create user
RUN adduser -D vpnuser && echo "vpnuser:vpnpassword" | chpasswd

EXPOSE 2222

CMD mkdir -p /etc/dropbear && \
    dropbearkey -t rsa -f /etc/dropbear/dropbear_rsa_host_key && \
    dropbearkey -t dss -f /etc/dropbear/dropbear_dss_host_key && \
    /usr/sbin/dropbear -E -F -p 2222
