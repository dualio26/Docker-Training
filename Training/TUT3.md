## Training 3

### Overview:
<br>
<details>

- https://hub.docker.com/_/hello-world

- This checks docker is correctly installed and operational 

- Running use command prompt. Windows key + R, cmd opens the command prompt

- Run in command line –>  `docker run hello-world`

</details>

<br>

## Session info:

- Download the example files in this directory of the Repo

<br>

## Objectives

1. Install FIMS
2. Continuation of more advanced Docker
    - Trails
    - Upgrades
    - Backup
3. Production installation plan

<br>

### Install FIMS Liferay

[Install Presentaion](/)

<br><br>

## FIM System Design

<br>

<details>
<br>

- ### Logical Design
    <br>
    <details>

    <br><br>
    [//]: # Add Lucid Chart image here
    <br><br>

    </details>
    <br>

- ### Physical Connection
    <br>
    <details>

    <br><br>
    [//]: # Add Lucid Chart image here
    <br><br>

    </details>

    </details>

<br><br>

## More Advanced Docker

- Backup: docker-4-volumes
- Upgrades: skeleton-5-upgrades
- Trials (blue/green): skeleton-6-trials 

<br><br>

## Docker; 4 - Volumes

<br>

<details>

### Commands:
  1. `docker-compose build`
  2. `docker-compose up -d`
  3. [`localhost:8888`](https://localhost:8888)
  4. `docker cp docker-4-volumes_webapp_1:/var/www/html .\`
  5. You should now have a new directory called html, navigate to index.php within the directory and open with your desired editor.<br> (e.g. `notepad.exe html/index.php`)
  6. Change the content from;<br>
    - `3: echo "Hello, World from php in Docker! <br>";`
    <br>to<br>
    - `3: echo "Bula Fiji from php in Docker! <br>";`
  7. `docker cp .\html docker-4-volumes_webapp_1:/var/www/`
  8.  There is no need to rebuild, browse [`localhost:8888`](https://localhost:8888)
  9.  `docker-compose down`

</details>
<br>

## Skeleton; 5 - Upgrades

<br>

<details>

### Commands:
  1. `docker build -t bula-fiji:v1  .\bula-fiji`
  2. `docker-compose up -d`
  3. `docker ps`
  4.  browser (A) [`localhost:5678`](https://localhost:5678)
  5.  browser (B) [`localhost:8888`](https://localhost:8888)
  6.  browser (bula-fiji) [`localhost:8222`](https://localhost:8222)
  7. `docker cp docker-4-volumes_webapp_1:/var/www/html .\`
  8.  Using `notepad.exe bula-fiji\src\index.php` change the content in bula-fiji\src\index.php from;<br>
    - `3: echo "Hello, World from php in Docker! <br>";`
    <br>to<br>
    - `3: echo "Bula Fiji from php in Docker! <br>";`
  9.  `docker build -t bula-fiji:v2  .\bula-fiji`
  10. Change the content in docker-compose.yml from;<br>
    - `28: image: bula-fiji:v1`
    <br>to<br>
    - `28: image: bula-fiji:v2`
  11. `docker-compose up -d`
  12. Browse [`localhost:8888`](https://localhost:8888)
  13. `docker-compose down`

</details>
<br>

## Skeleton; 6 - Trails

<br>

<details>

### Commands:
  1. `docker-compose build`
  2. `docker-compose up -d`
  3.  Browse [`localhost:8080`](https://localhost:8080)
  4.  Check that it identifies itself as (A)
  5.  Now change volumes/proxy-node/caddy/Caddyfile from;<br>
    - `24:      reverse_proxy http://172.28.5.2:5678 {`
    <br>to<br>
    - `24:      reverse_proxy http://172.28.5.2:5678 http://172.28.5.3:5678 {`
  6.  `docker-compose restart proxy-node`
  7.  Change the content in docker-compose.yml from;<br>
    - `28: image: bula-fiji:v1`
    <br>to<br>
    - `28: image: bula-fiji:v2`
  8.  Browse [`localhost:8080`](https://localhost:8080)<br>Check that it identifies itself as (A) or possibly (B)<br>If you keep refresh the page it will change
  9.  `docker-compose down`

</details>