## Training 1

### Overview:

- https://hub.docker.com/_/hello-world

- This checks docker is correctly installed and operational 

- Running use command prompt. Windows key + R, cmd opens the command prompt

- Run in command line –>  `docker run hello-world`

<br>

## Session info:

- Download the example files in this directory of the Repo

<br>

### Docker; 1 - Run

<br>
<details>

1. Neccesary Commands
    - Pull
    - Image
    - Run

<br>

2. Process
   1. Open command prompt
   2. Change directory to directory where the zip file was extracted to (e.g docker-1-run) (cd)
   3. Type -> notepad.exe command.txt to open the command text file 
   4. Select first command line with mouse and copy 
   5. Paste into command prompt 
   6. Where a line starts with a # this is an instruction rather than a command e.g visit a browser and copy in the URL e.g [`localhost:5678`](https://localhost:5678)

<br>

3. Output
   1. Terminal Output<br><br><img src="../Images/Picture28.png">
    <br><br>
   2. Web Solution<br><br><img src="../Images/Picture31.png">
</details>
<br>

### Docker; 2 - Run + PS + Kill

<br>
<details>

1. Neccesary Commands
    - Run
      - Detach/interactive (-d/-it)
      - Ports - Publish/Expose
    - PS – lists instances that are running on the server
    - Kill – removes running image

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker docker run -d -p 5678:5678 hashicorp/http-echo -text="hello world"`<br><br><img src="../Images/Picture32.png">

   2. `docker docker run -d -p 8765:5678 hashicorp/http-echo -text="hello world"`<br><br>docker ps<br><br><img src="../Images/Picture33.png">

   3. `docker docker run -d -p 8888:5678 hashicorp/http-echo -text="hello world"`<br><br><img src="../Images/Picture31.png">
</details>
<br>

### Docker; 3 - Run + PS + Kill

<br>
<details>

1. Neccesary Commands
    - Run
      - Network

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker network create --driver=bridge --subnet=172.28.5.0/24 --ip-range=172.28.5.0/24 --gateway=172.28.5.254 mynet`
    <br><br><img src="../Images/Picture35.png"><br><br>

   2. `docker run -d -p 5678:5678 --network=mynet --ip="172.28.5.2" hashicorp/http-echo -text="hello world A - Publish local port 5678“`
   3. `docker run -d -p 8888:5678 --network=mynet --ip="172.28.5.3" hashicorp/http-echo -text="hello world B - Redirect to public 8888“`
   4. `docker run -d --expose 5678 --network=mynet --ip="172.28.5.4" hashicorp/http-echo -text="hello world C - Exposed port 5678 only”`<br><br>`docker ps`<br><br><img src="../Images/Picture36.png"><br><br>

   5. Exposed port accessed through external IP address<br><br><img src="../Images/Picture34.png">
</details>
<br>

### Docker; 4 - Build

<br>
<details>

1. Neccesary Commands
    - Build

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker build -t php-hello-world`
   2. `docker image`
   3. `docker run -d -p 8888:80 php-hello-world`
   4. `docker ps`

Use your desired browser and enter [`localhost:8888`](https://localhost:8888) into the search bar

   5. `docker run -d -p 5678:5678 --network=mynet --ip="172.28.5.2" hashicorp/http-echo -text="hello world A - Publish local port 5678“`<br><br><br>`docker run -d -p 8888:5678 --network=mynet --ip="172.28.5.3" hashicorp/http-echo -text="hello world B - Redirect to public 8888“`<br><br><br>`docker run -d --expose 5678 --network=mynet --ip="172.28.5.4" hashicorp/http-echo -text="hello world C - Exposed port 5678 only”`<br><br>`docker ps`<br><br><img src="../Images/Picture36.png"><br><br>

2. Output<br><br><img src="../Images/Picture37.png">
</details>
<br>

### Compose; 1 - Compose + Up

<br>
<details>

1. Neccesary Commands
    - Up
    - Down
    - Start
    - Stop

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker-compose up -d`
   2. `docker ps`<br><br><img src="../Images/Picture38.png" style="width:50%;"><br><br><img src="../Images/Picture39.png" style="width:50%;">
   3. Browse [`localhost:8888`](https://localhost:8888)

   4. Now up, start, stop, stop<br><br>`docker-compose up -d`<br><br>
   5. `docker ps`
   6. `docker-compose start`
   7. `docker ps`
   8. `docker-compose down`
   9. `docker ps` <br><br><img src="../Images/Picture40.png" style="width:50%;">[//]: # Re do image

</details>
<br>

### Compose; 2 - Compose + Build

<br>
<details>

1. Neccesary Commands
    - Up
    - Down
    - Start
    - Stop
    - Build

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker-compose build`
   2. `docker-compose up -d`
   3. Browse [`localhost:8888`](https://localhost:8888) Notice there is no "down"<br><br><img src="../Images/Picture41.png" style="width:50%;">[//]: # Re do image<br><br><img src="../Images/Picture42.png" style="width:50%;"><br><br>
   4. Change the content in bula-fiji/src/index.php to;
   5. `3: echo "Hello, World from php in Docker!<br>";`
   6. `3: echo "Bula Fiji from php in Docker!<br>";`
   7. Browse [`localhost:8888`](https://localhost:8888)<br><br><img src="../Images/Picture43.png" style="width:50%;">

</details>
<br>

### Compose; 3 - Compose + Network

<br>
<details>

1. Neccesary Commands
    - Up
    - Down
    - Start
    - Stop

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker-compose up -d`
   2. `docker ps`
   3. Browse (A) [`localhost:5678`](https://localhost:5678)<br><br>Browse (B) [`localhost:8888`](https://localhost:8888)<br><br><img src="../Images/Picture44.png" style="width:50%;"><br><br><img src="../Images/Picture45.png" style="width:50%;"><br><br>
   4. Now open these ports in someone elses browser<br><br><img src="../Images/Picture46.png" style="width:50%;">

</details>
<br>

### Compose; 4 - Compose + Volume

<br>
<details>

1. Neccesary Commands
    - Up
    - Down
    - Start
    - Stop
    - Build

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker-compose build`
   2. `docker-compose up -d`
   3. [`localhost:8888`](https://localhost:8888)<br><br><img src="../Images/Picture47.png" style="width:50%;"><br><br><img src="../Images/Picture48.png" style="width:50%;"><br><br>
   4. Change the content in volumes/bula-fiji-node/index.php to;
   5. `3: echo "Hello, World from php in Docker!<br>";`<br><br>`3: echo "Bula Fiji from php in Docker!<br>";`<br><br>There is no need to rebuild
   6. [`localhost:8888`](https://localhost:8888)<br><br><img src="../Images/Picture43.png" style="width:50%;">

</details>
<br>


### Compose; 1 - Skeleton System

<br>
<details>

1. Neccesary Commands
    - Run
      - Network

<br><br>
[//]: # Add Lucid Chart image here
<br><br>

1. Process
   1. `docker-compose build`
   2. `docker-compose up -d`
   3. [`localhost:8888`](https://localhost:8888)
   4. <br><br><img src="../Images/Picture47.png" style="width:50%;"><br><br><img src="../Images/Picture48.png" style="width:50%;"><br><br>
   5. Change the content in volumes/bula-fiji-node/index.php to;
   6. `3: echo "Hello, World from php in Docker!<br>";`<br><br>`3: echo "Bula Fiji from php in Docker!<br>";`<br><br>There is no need to rebuild
   7. [`localhost:8888`](https://localhost:8888)<br><br><img src="../Images/Picture43.png" style="width:50%;">

</details>
<br>

### Terminology

<br>
<details>

1. Proxy
    - Rev Proxy
    - Switch (Name/IP/Portal)
    - SSL
2. Images
    - Postgresql
    - Liferay
    - Caddy
    - Shiny Proxy
    - Hello World
    - Http Echo
</details>
<br>

### Skeleton System

<br>
<details>

[//]: # Add Lucid Chart image here

1. Images
    - Postgresql
    - Liferay
    - Shiny Proxy
      - Rimages
</details>
<br>

### Traffic Routing (inc Liferay)

<br>
<details>
<br><br><img src="../Images/Picture29.png" style="width:50%;">
[//]: # Add Lucid Chart image here
</details>
<br>

### Traffic Routing (Full Complexity)

<br>
<details>
[//]: # Add Lucid Chart image here
</details>
<br>