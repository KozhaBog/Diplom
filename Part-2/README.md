1.	Заходим по ssh на сервер master
ssh ubuntu@<ip_server_master>
2.	Наше приложение уже ждёт нас в папке app, зайдём в неё
cd app
3.	Проверяем работоспособность, запустим контейнер:
docker-compose up -d
4.	Как только поднялось, идём на <ip_server_master>:3003 проверяем что всё работает
5.	Останавливаем контейнер
docker-compose down
6.	Заходим на свой GitLab
7.	Создаём новый проект
![image](https://github.com/KozhaBog/Diplom/assets/122201504/190dfadb-8ba4-4ae8-8c10-d6e1c5cc7790)
8.	Создаём runner, идём в Settings -> CI/CD -> Runners -> New Project Runner. Ставим тег v1.1
9.	Записываем переменные для логина в докер-хаб (вы должны быть зарегистрированы). Идём в Settings -> CI/CD -> Variables
![image](https://github.com/KozhaBog/Diplom/assets/122201504/fd57079c-b1e9-45cd-b288-45a42041c698)
10. Получаем токен для верификации. В Gitlab идём в Edit Profile, слева выбираем Access Token. Далее жмём справа на Add new token. Вводим имя, выставляем галочки “api”, “read_api”, “create_runner”, “write_repository”
![image](https://github.com/KozhaBog/Diplom/assets/122201504/6ecff7bf-7940-4ad3-8331-7f4895f5c1d2)
11.	Копируем токен аутентификации
![image](https://github.com/KozhaBog/Diplom/assets/122201504/e4df0279-f62c-40dd-831a-f5486f19635c)
12.	На сервере копируем к себе пустой гит проекта, командой ниже, вместо пароля вставляем наш токен, полученный выше перекидываем папку app в него
****git clone https://gitlab.com/KozhaBog/diplom.git
mv -f app/* deployapp/ 
mv -f app/.gitlab-ci.yml /deployapp
cd deployapp
git add .
git commit -m “Deploy CI”
git push origin****
lab, вместо пароля вставляем Access Token, полученный выше.
17.	У нас автоматически запустится pipeline сборки и отправки образа в DockerHub. Проверим Jobs и Dockerhub
