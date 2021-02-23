# TFWDataEngineerTrialDay
Some sample scripts to provide infrastructure for a remote trial day as part of the recruitment process 
of the TFW Data-Team. Prior to the training day candidates should use this material to set up a local 
instance of apache airflow 2.0 by building a custom docker image with the provided docker file and 
using this inside the docker compose setup specified by the given docker-compose file.

On this basis, we will provide some task(s) depending on candidate profile during the actual training day. 
These tasks are supposed to be worked on at that day by candidates in collaboration (please ask questions) 
with other team members.

So it would be good, if you ensure that the following commands were executed on your local system before trial day

`docker build -t local-airflow:2.0.0 .`

followed by 

`docker-compose up`

after that, check if you can login to a local airflow instance by opening this url in your browser.

http://localhost:8080/login/

The username is `admin` and the password is `admin`

