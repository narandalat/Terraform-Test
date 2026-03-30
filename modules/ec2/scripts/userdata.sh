#!/bin/bash
hostnamectl set-hostname svc.miprueba.com.ar
apt-get update -y
apt-get install -y docker.io (por si querés meterle docker de una)