FROM nginx:stable-alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# more custom error pages from here https://github.com/bartosjiri/nginx-errors
COPY errors/ usr/share/nginx/html/errors/

RUN chown -R nginx.nginx /usr/share/nginx/html/

EXPOSE 80