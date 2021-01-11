FROM python:3.7-buster

ENV DEBIAN_FRONTEND=noninteractive \
    AIRFLOW_HOME='/usr/local/airflow'

RUN apt-get update \
&&  apt-get upgrade -qqy \
&&  apt-get install -y --no-install-recommends \
    build-essential \
    freetds-bin \
    krb5-user \
    ldap-utils \
    libffi6 \
    libsasl2-2 \
    libsasl2-modules \
    libssl1.1 \
    locales  \
    lsb-release \
    sasl2-bin \
    sqlite3 \
    unixodbc \
    default-libmysqlclient-dev \
    wait-for-it \
&&  pip install --upgrade pip \
                setuptools \
                apache-airflow[mysql,postgres]==2.0.0 \
&&  rm -rf /root/.cache \
&&  apt-get remove -qqy --purge \
            build-essential \
&&  apt-get -qqy autoremove --purge

COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
