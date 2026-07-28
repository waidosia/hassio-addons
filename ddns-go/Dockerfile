ARG BUILD_FROM
FROM ${BUILD_FROM}

# ddns-go 官方版本号（GitHub Actions 自动更新此值）
ARG DDNS_GO_VERSION="6.17.2"

# 下载官方二进制文件
RUN \
    apk add --no-cache curl \
    && case "$(uname -m)" in \
        "x86_64")   DDNS_ARCH="x86_64" ;; \
        "aarch64")  DDNS_ARCH="arm64"  ;; \
        "armv7l")   DDNS_ARCH="armv7"  ;; \
        "armv6l")   DDNS_ARCH="armv6"  ;; \
        *) echo "Unsupported arch: $(uname -m)" && exit 1 ;; \
    esac \
    && curl -fsSL \
       "https://github.com/jeessy2/ddns-go/releases/download/v${DDNS_GO_VERSION}/ddns-go_${DDNS_GO_VERSION}_linux_${DDNS_ARCH}.tar.gz" \
       -o /tmp/ddns-go.tar.gz \
    && mkdir -p /tmp/ddns-go-extract \
    && tar -xzf /tmp/ddns-go.tar.gz -C /tmp/ddns-go-extract \
    && cp /tmp/ddns-go-extract/ddns-go /usr/local/bin/ddns-go \
    && chmod +x /usr/local/bin/ddns-go \
    && rm -rf /tmp/ddns-go*

# 复制启动脚本
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
