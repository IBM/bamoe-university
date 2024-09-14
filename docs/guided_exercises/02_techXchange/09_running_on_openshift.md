# Running on OpenShift

## Deploying the business service on OpenShift

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
   ```

# Additional Information

## Common troubleshooting tips

Use this section to document common troubleshooting issues that users may experience.

## Getting help

For assistance, please refer to the lab instructions or consult with an instructor if available.

