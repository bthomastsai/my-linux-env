

= Run uwsgi =
uwsgi --ini ./my_main.ini

= Run nginx =
sudo systemctl start nginx 

= Using CURL to implement POST method =
curl -X POST "http://127.0.0.1/callback" -i -d "Tesla"