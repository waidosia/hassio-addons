#!/usr/bin/with-contenv bashio
set -euo pipefail

# ============================================================
# DDNS-GO 启动脚本 - HAOS 加载项
# ============================================================

CONFIG_DIR="/config/ddns-go"
CONFIG_FILE="${CONFIG_DIR}/.ddns_go_config.yaml"
WEB_PORT="9876"

# 创建配置目录
mkdir -p "${CONFIG_DIR}"

bashio::log.info "DDNS-GO 启动中..."
bashio::log.info "Web UI 端口: ${WEB_PORT}"
bashio::log.info "配置文件: ${CONFIG_FILE}"

# -l: 监听地址  -c: 配置文件路径
exec ddns-go -l ":${WEB_PORT}" -c "${CONFIG_FILE}"
