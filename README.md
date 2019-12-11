# TCGA_SpliceSeq_Docker
Files needed to create a docker image to run the TCGA SpliceSeq application

Note two databases are also needed to run the application - the TCGA_SpliceGraph and TCGA_Download releational databases.

To create the docker image, first clone this repository.

Next, modify tcgaspliceseq.xml so that the db connect string, user id, and password are correct for your instances of the TCGA_SpliceGraph and TCGA_Download databases.

In the project directory, run docker build -t <name you want for the docker image>
  
To run an instance of the created image run docker run -it -p 80:8080 --name <name you want for container> <image name>
