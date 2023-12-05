# Nexus In Boxes

This demo is designed to show Sonatypes portfolio
in action in a pseudo-realistic manner

Docker compose is required to run this demo.

The docker compose file is configured via environmental
variables. 

It is assumed you have an appropriate licence file(s) for
these products 

To get started copy the env_template file into the root
of this directory and rename it as ".env".

# Setup 
Edit this .env file and fill in the environmental variable LIFECYCLE_LICENCE_FILE
with the full path to the licence file

Other variables in this file can be changed but the
demo can be launched with no other changes

Unless otherwise changed userid and passwords will be 

admin / admin123 for Nexus and Lifecycle

admin@admin.com / admin for PGAdmin

## Short cut

The simplest step is to run 'docker compose up -d'  which will launch the demo and build and required images as needed
To terminate the process, cd into the root of this demo and issue 'docker compose down' to close down the containers.
Using 'docker compose up -d' subsequently will bring the demo back in it's last state. To close and remove any persistant data use 'docker compose down -v'


## Longer way 

### Pre Launch 
To launch the container images must be created.  
Run 'docker compose build' in the root of the project.
A series of images using the namespace referenced in ${DOCKER_PREFIX} will be created.
This is a one off exercise unless you change the code.  

### Launch 
With the images created, run  'docker compose up' for the containers to be created and launched.
Launch is completed when a message similar to this is seen: 

### Tear down 
If running from the console, interupt the process using crtl-c. Once back at the command line
you can remove all temporary resources using 'docker compose down -v'  This will reclaim any networks or volumes created by the process. Note that images will not be removed. 








 


