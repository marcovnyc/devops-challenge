# SchoolApp Docker + Django + pipenv + MySQL NGINX


clone this project 
```
https://github.com/marcovnyc/devops-challenge
```



### 
```
cd into devops-challenge

```

### Run Docker commands
```
docker build -t devops-challenge:latest .
```
then 
```
docker-compose up -d
```

create migration 

```
docker exec -it devops-challenge_django_1 python schoolapp/manage.py migrate

```

then create a superuser

```
docker exec -it devops-challenge_django_1 python schoolapp/manage.py createsuperuser

```

bounce the containers
```
docker-compose restart
ubuntu@ip-172-31-93-232:~/devops-challenge$ docker-compose restart
Restarting ngx                       ... done
Restarting devops-challenge_django_1 ... done
Restarting database                  ... done
ubuntu@ip-172-31-93-232:~/devops-challenge$

```

now visit the site http://34.201.33.233


Happy Django!

   ### So How to scale this environment horizontaly ####

The best way to scale this would be to use a ci cd pipeline that would build this container
and rather than using hard coded variables the variables are passed as env vars 
these env vars would live in kubernetes secrets so that the env vars are available to the container
at container boot. 

then the pipeline would deploy this container using a kubernetes manifest / helm or kuztomize setup
and deploy it to a kubernetes cluster.  From there we can setup rules to scale this containers based on 
many behaviors 

https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/


Also we would host the database on RDS which is more scalable than hosting it on an EC2 instance. 


