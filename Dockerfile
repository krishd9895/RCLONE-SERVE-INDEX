FROM developeranaz/rc-index:latest

# Try downloading the custom rclone package first
RUN curl -f -O 'https://raw.githubusercontent.com/developeranaz/Rclone-olderversion-Backup/main/rclone-current-linux-amd64.zip' || \
    curl -O 'https://downloads.rclone.org/rclone-current-linux-amd64.zip' && \
    unzip rclone-current-linux-amd64.zip && \
    cp /rclone-*-linux-amd64/rclone /usr/bin/ && \
    chown root:root /usr/bin/rclone && \
    chmod 755 /usr/bin/rclone && \
    rm -rf rclone-current-linux-amd64.zip /rclone-*-linux-amd64

# Add rcindex from build context
COPY rcindex /usr/bin/rcindex
RUN chmod +x /usr/bin/rcindex

# Default command
CMD rcindex
