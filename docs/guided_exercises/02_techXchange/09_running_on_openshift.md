# Running on OpenShift

6.1	Deploying the business service on OpenShift
With the base project that was applied, we have a great kick start on the environment to get it deployed. Within the technical preview of BAMOE 9.1, there is a 1 to 1 ratio of Process Microservice to Task and Process Management consoles (one of each as they are connected via the services to exchange information). To simplify this roll out, the workspace includes several scripts that can be used for after this lab to assist in the roll out of your services. The one that we are most interested in because our environments are operating right now all locally, is to see this working in OpenShift to get the true benefit of Cloud Native Process.

1.	Log in to OpenShift with the command line. The easiest way is to use https://ibm.biz/bamoe-ocp-token and get the oc login command from the browser. This will link you to the Development Sandbox token of Red Hat OpenShift. 

2.	Within the project itself, we have a few scripts that will assist in the roll out of the architecture. There are some limitations within the Technical Preview of IBM Business Automation Manager Open Editions in that for security, we are utilizing Keycloak and there is a one to one ratio for roll out of services. In the full release for BAMOE 9.2, these limitations will start to be greatly reduced and can be explained within a product roadmap session with your IBM account team! The script that we’re most interested in is the one that will help us roll out all of these services. This will be handled through deploy-ocp-lab.sh and deploy-ocp-lab.bat depending on how you’re accessing it, if you have time you can always refer to the scripts that can be used to setup a Keycloak instance at a high level utilizing the new-keycloak.sh. 


 
3.	This script when you run it through the usage of Package and deploy the application on OpenShift using the Quarkus Extension Maven. So if you look at the script there will be a section that looks like the below if using the Windows Batch File (deploy-to-ocp.bat):

```bat
:: Build and deploy the application
call mvn clean package ^
    -Dquarkus.container-image.build=true ^
    -Dquarkus.kubernetes-client.namespace=%NAMESPACE% ^
    -Dquarkus.openshift.deploy=true ^
    -Dquarkus.openshift.expose=true ^
    -Dquarkus.application.name=%SERVICE_NAME% ^
    -Dkogito.service.url=https://%SERVICE_NAME%-%NAMESPACE%.%BASE_URL% ^
    -Dkogito.jobs-service.url=https://%SERVICE_NAME%-%NAMESPACE%.%BASE_URL% ^
    -Dkogito.dataindex.http.url=https://%SERVICE_NAME%-%NAMESPACE%.%BASE_URL%
```
If using the script version (deploy-to-ocp.sh):
```sh
    mvn clean package \
    -Dquarkus.container-image.build=true \
    -Dquarkus.kubernetes-client.namespace=$NAMESPACE \
    -Dquarkus.openshift.deploy=true \
    -Dquarkus.openshift.expose=true \
    -Dquarkus.application.name=$SERVICE_NAME \
    -Dkogito.service.url=https://$SERVICE_NAME-$NAMESPACE.$BASE_URL \
    -Dkogito.jobs-service.url=https://$SERVICE_NAME-$NAMESPACE.$BASE_URL \
    -Dkogito.dataindex.http.url=https://$SERVICE_NAME-$NAMESPACE.$BASE_URL
```

4.	After this script is started, the Process/DMN package will be built as a Kogito-enabled service that will start building a base quarkus image of the service and from there it will publish it to the OpenShift Image Registry. After this is pushed, the deployment gets modified and exposed. After this is completed more deployments take place for the task-console and management-console. There is a 1:1 ratio of task/management console to process service in the 9.1 technical preview.

5.	When the script is completed, you will see something similar to the message below if running the deploy-dev-ocp.sh script, the important aspect of this is that the links in VSCode if you hold the control or command key (depending on operating system), you can click and open the links for the respective units.:
 
6.	Now, let's check if the service is up and running by accessing the Swagger UI:  
GET {yourserviceurl}/q/swagger-ui  - this will open your process’s Swagger-UI. If you do a POST, you can start your process similar to how it was done within the Dev-UI, the only difference is now your process is executing within a Quarkus Container on OpenShift and can interact with the different consoles. 
  
7.	After you submit a sample process run, you can access the other links to see the process. Note, if there are any timers, they start the moment you submit the process, so keep this in mind if there are any present. If you navigate to the management console, it is setup in Development mode and has no security. When you use the Task Console, login with user jdoe or mscott depending on how your process was deployed at the Keycloak login.

8.	You will notice when you login, there is a task assigned to you and a form was autogenerated based on the task process data associated with the task to help you get quickly started with the development of the workflow.


<!-- ## Deploying the business service on OpenShift

1. Log in to OpenShift with the command line using the token from https://ibm.biz/bamoe-ocp-token

2. Package and deploy the application on OpenShift using the Quarkus Extension Maven:
   ```
   mvn clean package -Dquarkus.openshift.deployment=true
   ```

3. Get the service URL using the oc cli tool:
   ```
   oc get route/cc-application-approval
   ```

4. Check if the service is up and running by accessing the Swagger UI:
   GET {yourserviceurl}/q/swagger-ui

## Deploying the Management Console

5. Open the OpenShift environment and locate the "mngmt-console" deployment.

6. Set the environment variable RUNTIME_TOOLS_MANAGEMENT_CONSOLE_DATA_INDEX_ENDPOINT with your-service-url/graphql.

7. Expose the service route using the following commands:
   ```
   oc expose pod mgmt-console --port=8080 --name=mgmt-console-service
   oc expose svc/mgmt-console-service
   oc get route mgmt-console-service
   ``` -->

# Additional Information

## Common troubleshooting tips

Use this section to document common troubleshooting issues that users may experience.

## Getting help

For assistance, please refer to the lab instructions or consult with an instructor if available.

