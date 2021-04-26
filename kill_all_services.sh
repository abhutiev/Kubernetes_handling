eval $(minikube docker-env)

echo "Hard killing of nginx"
docker kill  $(docker ps | grep "k8s_nginx_nginx-deployment" | cut -d ' ' -f1)
echo -e "\033[37;1;41mWhile waiting for nginx restart, you can think under question from Что? Где? Когда?\033[0m"
echo -n "⌛ В рассказе о сербской знахарке ЙовАнке корреспондент передачи \"Их нравы\" говорит, что она многое умеет:\
лечит и сердце, и желудок, и почки, ну, а ДЕЛАТЬ ЭТО она умеет лучше всего. Какие два слова, начинающиеся на\
одну и ту же букву, мы заменили словами \"ДЕЛАТЬ ЭТО\"?"
sleep 60
echo "Nginx restarted"
echo "Ответ: Заговаривать зубы"

echo "Hard killing of PhpMyAdmin"
docker kill  $(docker ps | grep "k8s_phpmyadmin_phpmyadmin-deployment" | cut -d ' ' -f1)
echo "While waiting for phpmyadmin restart, you can think under question from Что? Где? Когда?"
echo "⌛ ЕЕ покупали заранее, мелкими партиями, причем — что выглядит особо цинично — в Западной Германии. \
Вся ОНА пошла в дело за одну августовскую ночь. Назовите ЕЕ двумя словами.?"
sleep 60
echo "PhpMyAdmin restarted"
echo "Ответ: Колючая проволока"

⌛ Картасуру, древнюю столицу яванского королевства, позднее сменила на этом посту соседняя Суракарта. Назовите современное государство, события 1868 года в котором, по мнению сайта Wordsmith.Org, стоят в одном ряду с упомянутым фактом.
echo "Hard killing of WordPress"
docker kill  $(docker ps | grep "k8s_wordpress_wp-deployment" | cut -d ' ' -f1)
echo "While waiting for phpmyadmin restart, you can think under question from Что? Где? Когда?"
echo "⌛ Картасуру, древнюю столицу яванского королевства, позднее сменила на этом посту соседняя Суракарта.\
Назовите современное государство, события 1868 года в котором, по мнению сайта Wordsmith.Org,\
стоят в одном ряду с упомянутым фактом."
sleep 60
echo "WordPress restarted"
echo "Ответ: Япония"