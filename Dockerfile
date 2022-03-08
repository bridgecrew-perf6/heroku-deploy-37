FROM nginx:alpine 

COPY ./nginx/default.conf.template /etc/nginx/conf.d/default.conf.template

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./index.html /usr/share/nginx/html

CMD sh -c "envsubst \"`env | awk -F = '{printf \" \\\\$%s\", $1}'`\" < etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"
