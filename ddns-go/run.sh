#!/usr/bin/with-contenv bashio
set -euo pipefail

# ============================================================
# DDNS-GO 启动脚本 - HAOS 加载项
# ============================================================

CONFIG_DIR="/config/ddns-go"
WEB_PORT="9876"

# 创建配置目录
mkdir -p "${CONFIG_DIR}"

bashio::log.info "DDNS-GO 启动中..."
bashio::log.info "Web UI 端口: ${WEB_PORT}"
bashio::log.info "配置目录: ${CONFIG_DIR}"

# 使用 exec 替换进程，确保信号正确传递
exec ddns-go -s ":${WEB_PORT}" -f "${CONFIG_DIR}"
