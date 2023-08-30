# Deploying and testing the Decision Service

With our decision model completed, we can now package our DMN model in a Kogito service. This can be done using the Accelerators included with {{ product.canvas }}. These accelerators will quickly take the DMN file and start building the basis of the project as a {{ product.name }} compatible decision service.

## Applying the Accelerator

To take this decision service from a standalone DMN model to a full Kogito architected decision, you will use the accelerator by clickig the button at the top of the screen. To do so follow the instructions and then we will synchronize the project to your GitHub account and also be capable being deployed as an OpenShift service.

1. At the top of the DMN model page for `call-center-decisions`, click the button `Apply Accelerator` and select **Quarkus...**.
  
    ![Apply Accelerator](../99_images/business_automation/dmn/canvas-apply-accelerator-advanced.png)

1. If you want to learn more about the accelerator, you can click the GitHub link and change the branch to the `9.0.0-quarkus-full` to learn more about it. Afterwards just click **Apply** to restructure your project into a Kogito service.

    ![Click Apply on the Accelerator to reconfigure the project](../99_images/business_automation/dmn/canvas-invoke-accelerator.png)

1. The wizard will come with a pop-up asking for a commit message for the change since this will create a Git project. You can use the default message or put whatever you would like, to do so press **Commit**.

    ![Accelerator Commit Message](../99_images/business_automation/dmn/accelerator-accept-message.png)

1. To create the project in Git, click **Share**, use your GitHub tokened ID.

    ![Use Git ID](../99_images/business_automation/dmn/sync-with-git.png)

1. Once you select your ID, a new option **Create GitHub repository...** is now available, select this.

    ![Create GitHub Repository](canvas-../99_images/business_automation/dmn/canvas-create-github.png)

1. The repository you create, can be anything you want, for the purposes of this lab, it will be called **techxchange-call-center**.

    ![Git Create Repository](../99_images/business_automation/dmn/git-create-repository.png)

1. When you create the repository, a message will open at the top with a link to the Git repository that was created. In the case of the example it is at [this example repository](https://github.com/timwuthenow/techxchange-call-center).

    ![Example Repository](../99_images/business_automation/dmn/example-repository-created.png)

1. Now that this repository is created, you can work on it locally 

2. Click on the **Deploy** button in the upper-right corner of the screen. This will package our DMN mode in a Deployment Unit (KJAR) and deploy it onto the Execution Server (KIE-Server).

3. Go to the **Execution Servers** perspective by clicking on "Menu → Deploy → Execution Servers". You will see the **Deployment Unit** deployed on the Execution Server.

## Testing DMN Solution

In this section, you will test the DMN solution with Execution Server’s Swagger interface and via Java KIE Client API.

### Testing the Decision Service via the REST API

The Swagger interface provides the description and documentation of the Execution Server’s RESTful API. At the same time, it allows the APIs to be called from the UI. This enables developers and users to quickly test a, in this case, a deployed DMN Service .

1. Navigate to [KIE Server](https://localhost:8080/kie-server) swagger docs

1. Locate the **DMN Models** section. The DMN API provides the DMN model as a RESTful resources, which accepts 2 operations:

    - `GET`: Retrieves the DMN model.

    - `POST`: Evaluates the decisions for a given input.

1. Expand the `GET` operation by clicking on it.

1. Click on the **Try it out** button.

1. Set the **containerId** field to `call-centre-decisions` and set the **Response content type** to `application/json` and click on **Execute** ![DMN Swagger Get](../99_images/business_automation/dmn/dmn-swagger-get.png){:width="800px"}

1. If requested, provide the username and password of your **Business Central** and **KIE-Server** user.

1. The response will be the model-description of your DMN model.

## Evaluate the Model

Next, we will evaluate our model with some input data. We need to provide our model with the **incoming call**, **list of employees** and **office location**.

1. Expand the `POST` operation and click on the **Try it out** button

1. Set the **containerId** field to `call-centre-decisions`. Set the **Parameter content type** and **Response content type** fields to `application/json`.

1. Pass the following request to evaluate whether the given call is accepted by the call-centre.

    **IMPORTANT**: We’re explicitly specifying the **decision-name** of the decision we want to evaluate. If we would not specify this, the engine will evaluate the full model, and hence will also require us to pass the `call` input. When we only evaluate the `Accept Call` decision, we only need to specify the inputs of `Accept Call`. In the decision service invocation in the `Accept Call` logic, the input `incoming call` is passed to the `call` parameter of the decision service.

    ~~~json
      { 
        "decision-name" : "Accept Call",
        "dmn-context":{ 
          "incoming call":{ 
              "phone": { 
                  "country prefix": "+420", 
                  "phone number": "1234" 
              }, 
                "purpose": "help" 
          },
          "employees": [{ 
              "name": "Duncan", 
              "office location": "Rome" 
          }], 
          "office": { 
              "location": "Rome" 
          } 
        } 
      } 

    ~~~

    Click on **Execute**. The result value of the `Accept Call` should be `true`. Test the service with a number of other values. For example, specify a banned phone number like: +421 92000001

### Using the KIE-Server Client

IBM {{ product.dm }} provides a KIE-Server Client API that allows the user to interact with the KIE-Server from a Java client using a higher level API. It abstracts the data marshalling and unmarshalling and the creation and execution of the RESTful commands from the developer, allowing him/her to focus on developing business logic.

In this section we will create a simple Java client for our DMN model.

**IMPORTANT:** If your KIE Server is exposed via https you need to configure the ``javax.net.ssl.trustStore and `javax.net.ssl.trustStorePassword` in the Java client code using the Remote Java API. If not, you may get a `rest.NoEndpointFoundException`. For more information check [this solution](https://access.redhat.com/solutions/5424601) Red Hat's knowledge base.

1. Create a new Maven Java JAR project in your favourite IDE (e.g. IntelliJ, Eclipse, Visual Studio Code).

1. Add the following dependency to your project:

    ~~~xml
    <dependency> 
      <groupId>org.kie.server</groupId> 
      <artifactId>kie-server-client</artifactId> 
      <version>{{ product.legacygav }}</version> 
    <scope>compile</scope> 
    </dependency> 
    ~~~

1. Create a Java package in your `src/main/java` folder with the name `org.kie.dmn.lab`.

1. In the package you’ve just created, create a Java class called `Main`.

1. Add a `public static void main(String[] args)` method to your main class.

1. Before we implement our method, we first define a number of constants that we will need when implementing our method (note that the values of your constants can be different depending on your environment, model namespace, etc.):

    ~~~java
    private static final String KIE_SERVER_URL = "http://localhost:8080/kie-server/services/rest/server"; 
    private static final String CONTAINER_ID = "call-centre-decisions"; 
    private static final String USERNAME = "bamAdmin"; 
    private static final String PASSWORD = "ibmpam1!"; 
    private static final String DMN_MODEL_NAMESPACE = "https://kiegroup.org/dmn/_2E9DCCE2-8C2B-496E-AC37-103694E51940";
    private static final String DMN_MODEL_NAME = "call-centre";
    ~~~

    > 📘 INFO: If you're using the Linux environment on Skytap use the following.

    ~~~java
    private static final String KIE_SERVER_URL = "http://localhost:8080/kie-server/services/rest/server"; 
    private static final String CONTAINER_ID = "call-centre-decisions"; 
    private static final String USERNAME = "pamadmin"; 
    private static final String PASSWORD = "pamadm1n"; 
    private static final String DMN_MODEL_NAMESPACE = "https://kiegroup.org/dmn/_2E9DCCE2-8C2B-496E-AC37-103694E51940";
    private static final String DMN_MODEL_NAME = "call-centre";
    ~~~

1. KIE-Server client API classes can mostly be retrieved from the `KieServicesFactory` class. We first need to create a `KieServicesConfiguration` instance that will hold our credentials and defines how we want our client to communicate with the server:

   ~~~java
   KieServicesConfiguration kieServicesConfig = KieServicesFactory.newRestConfiguration(KIE_SERVER_URL, new
   EnteredCredentialsProvider(USERNAME, PASSWORD)); 
   kieServicesConfig.setMarshallingFormat(MarshallingFormat.JSON);
   ~~~

1. Next, we create the `KieServicesClient`:

    ~~~java
    KieServicesClient kieServicesClient = KieServicesFactory.newKieServicesClient(kieServicesConfig);
    ~~~

1. From this client we retrieve our DMNServicesClient:

    ~~~java
    DMNServicesClient dmnServicesClient = kieServicesClient.getServicesClient(DMNServicesClient.class);
    ~~~

1. To pass the input values to our model to the Execution Server, we need to create a `DMNContext`:

    ~~~java
    DMNContext dmnContext = dmnServicesClient.newContext(); 
    ~~~

1. We pass the input variables to the `DMNContext`. We define the following three methods that create the data inputs:

    ~~~java
    private static Map<String, Object> getIncomingCall() { 
      Map<String, Object> incomingCall = new HashMap<>(); 
      Map<String, Object> phone = new HashMap<>(); 
      phone.put("country prefix", "+420"); 
      phone.put("phone number", "1234"); 
      incomingCall.put("phone", phone); 
      incomingCall.put("purpose", "help"); return incomingCall; 
    }

    private static List<Map<String, Object>> getEmployees() {
      List<Map<String,Object>> employees = new ArrayList<>();
      Map<String, Object> employee = new HashMap<>();
      employee.put("name", "Duncan");
      employee.put("office location", "Rome");
      employees.add(employee);
      return employees;
    }
    
    private static Map<String, Object> getOffice() {
      Map<String, Object> office = new HashMap<>();
      office.put("location", "Rome");
      return office;
    }
    ~~~

1. We can now add the data to the `DMNContext` as follows:

    ~~~java
    dmnContext.set("incoming call", getIncomingCall()); dmnContext.set("employees", getEmployees()); 
    dmnContext.set("office", getOffice()); 
    ~~~

1. We now have defined all the required instances needed to send a DMN evaluation request to the server. We explicitly specify which decision we want to evaluate, in this case the `Accept Call` decision, by using the `evaluateDecisionByName` of the `DMNServiceClient`.

    ~~~java
    ServiceResponse<DMNResult> dmnResultResponse = dmnServicesClient.evaluateDecisionByName(CONTAINER_ID, DMN_MODEL_NAMESPACE, DMN_MODEL_NAME, "Accept Call", dmnContext);
    ~~~

1. Finally we can retrieve the DMN evaluation result and print it in the console:

    ~~~java
    DMNDecisionResult decisionResult = dmnResultResponse.getResult().getDecisionResultByName("Accept Call"); 
    System.out.println("Is the call accepted?: " + decisionResult.getResult()); 
    ~~~

1. Compile your project and run it. Observe the output in the console, which should say: **Is the call accepted?: true**

The complete project can be found here: <https://github.com/kmacedovarela/dmn-workshop-labs/tree/master/call-centre-dmn-lab-client>
