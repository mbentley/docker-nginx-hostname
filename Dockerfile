FROM nginxinc/nginx-unprivileged:alpine

# add additional entrypoint that writes hostname to file
COPY 40-set-output-to-hostname.sh /docker-entrypoint.d/40-set-output-to-hostname.sh

# be root to chmod the index file
USER root
RUN chmod 777 /usr/share/nginx/html/index.html

# return back to non-root user
USER nginx
