# Introduction

This is a series of guided exercises that will allow you to experiment the authoring of decisions using Decision Model and Notation - DMN. You will be able to experiment decision authoring in Business Central, along with the deployment and consumption of the decisions in the engine, KIE Server.

## What is DMN

Take a look at the explanation of the [DMN](http://omg.org/dmn) standard in the OMG website:

_"DMN is a modeling language and notation for the precise specification of business decisions and business rules. DMN is easily readable by the different types of people involved in decision management. These include: business people who specify the rules and monitor their application; business analysts._

_DMN is designed to work alongside BPMN and/or CMMN, providing a mechanism to model the decision-making associated with processes and cases. While BPMN, CMMN and DMN can be used independently, they were carefully designed to be complementary. Indeed, many organizations require a combination of process models for their prescriptive workflows, case models for their reactive activities, and decision models for their more complex, multi-criteria business rules. Those organizations will benefit from using the three standards in combination, selecting which one is most appropriate to each type of activity modeling. This is why BPMN, CMMN and DMN really constitute the “triple crown” of process improvement standards."_ 

{{ product.name }} and IBM {{ product.dm }} bring a set of graphical tooling that allow you to author decisions using DMN and a lightweight engine that can execute these decisions. The engine and the authoring tooling set are decoupled and you can scale it independently. 

## Tooling Set

In {{ product.name }} you can author decisions in multiple ways - all using the exact same editor in different environments:

- {{ product.sandbox }}found [and import your project here]( {{ sandbox.production }}) or jump right into the editor at [DMN.new](https://dmn.new) for a light-weight browser experience experience
- Business Central found in {{ product.short }}
- [Business Automation VSCode Extension](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-extension-red-hat-business-automation-bundle)
  - A developer IDE ([Visual Studio Code](https://code.visualstudio.com/)) extension that allows the visualization and editing of BPMN, DMN and Test Scenarios inside VSCode.

There is also a set of community tooling that's also available for use. All the tools below are backed by IBM and Red Hat:

- [DMN FEEL Handbook](https://kiegroup.github.io/dmn-feel-handbook/#dmn-feel-handbook) 
  -  A handbook for the FEEL expression language from the DMN specification, as implemented by the Drools DMN open source engine.
- [Learn DMN in 15 minutes](https://learn-dmn-in-15-minutes.com/)
  - A guided tour in a website through the elements of DMN
- [GitHub Chrome Extension](https://chrome.google.com/webstore/detail/bpmn-dmn-test-scenario-ed/mgkfehibfkdpjkfjbikpchpcfimepckf)
  - A browser extension that allows you to visualize and edit BPMN, DMN and Test Scenario files directly in GitHub. 
- [Online Editors](https://kiegroup.github.io/kogito-online/#/)
  - [BPMN.new](http://bpmn.new) - A free online editor for business processes;
  - [DMN.new](http://dmn.new) - A free online editor for decision models;
  - [PMML.new](http://pmml.new) - A free online editor for scorecards;
- [Business Modeler Hub](https://kiegroup.github.io/kogito-online/#/download)
  - Allows for the download of the: VSCode extension, GitHub Chrome Extension, and Desktop App

## The DMN Editor

The DMN Editor consists of a number of components:

- **Decision Navigator**: shows the nodes used in the Decision Requirements Diagram (DRD, the diagram), and the decisions behind the nodes. Allows for quick navigation through the model.

- **Decision Requirements Diagram Editor**: the canvas in which the model can be created.

- **Palette**: Contains all the DMN constructs that can be used in a DRD, e.g. Input Node, Decision Node, etc.

- **Expression Editor**: Editor in which DMN boxed expressions, like decision tables and literal expressions, can be created.

- **Property Panel**: provides access to the properties of the model (name, namespace, etc), nodes, etc.

- **Data Types**: allows the user to define (complex) datatypes.

![DRD](../99_images/business_automation/dmn/dmn-editor-components.jpg){:width="600px"}

![Boxed Expressions](../99_images/business_automation/dmn/dmn-editor-decision-table.jpg){:width="600px"}

![Data Types](../99_images/business_automation/dmn/dmn-editor-datatypes.jpg){:width="600px"}

## Guided Labs

These are the labs you have available in this workshop:

- Insurance Price calculation: a getting started exercise. You will import an existing module, explore it, deploy it and test it using the decision engine's REST API.

    ![Pricing DRD](../99_images/business_automation/dmn/insurance-price-drd.png){:width="600px"}

- Vacation Days: an intermediate level exercise. You will author a model from scratch, use decision tables, work with different hit policies, different FEEL constructs and expressions. Finally, you will deploy it and test it using not only the decision engine's REST API but also the Java KIE Client API.

    ![DRD Complete](../99_images/business_automation/dmn/drd-complete.png){:width="600px"}

- Call Centre: an advanced level exercise. You will author a model from scratch, create data types, consume DMN decision services from within decision nodes, and more FEEL constructs and expressions. Finally, you will deploy it and test it using not only the decision engine's REST API but also the Java KIE Client API.

    ![Decision Service Knowledge Requirement](../99_images/business_automation/dmn/decision-service-knowledge-requirement.png){:width="800px"}

These are independent guided exercises and you don't need to implement the previous use case to implement the next one.
