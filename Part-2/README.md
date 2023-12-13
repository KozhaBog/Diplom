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
