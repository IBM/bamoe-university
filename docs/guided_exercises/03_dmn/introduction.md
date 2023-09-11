# Learn Decision Automation with DMN

It's time to learn how Decision Automation can be made simple with Open Standards And Open Editions. Throughout these exercises, you'll experiment the development of decisions using Decision Model and Notation - DMN, and learn how to run, deploy and consume your decisions.

Before getting started, let's get familiar with the exercises you'll be working on and get introduced to the concepts of the DMN Standard, an increasingly adopted strategy for developing rules in the decision automation market.

## Goals of the Guided Exercises

These are the labs you have available in this workshop:

- Getting Started, Insurance Price calculation: Start by importing an existing module. Explore, deploy and test it using local development capabilities of Open Editions.

    ![Pricing DRD](../99_images/business_automation/dmn/insurance-price-drd.png){:width="600px"}

- Intermediate, Vacation Days: Author a model from scratch, use decision tables, work with different hit policies, different FEEL constructs and expressions. Finally, you will deploy it and test it, optionally running it on OpenShift.

    ![DRD Complete](../99_images/business_automation/dmn/drd-complete.png){:width="600px"}

- Advanced, Call Center: You will author a model from scratch, create data types, consume DMN decision services from within decision nodes, and more FEEL constructs and expressions. Finally, you will deploy and test it locally and optionally on OpenShift.

    ![Decision Service Knowledge Requirement](../99_images/business_automation/dmn/decision-service-knowledge-requirement.png){:width="800px"}

These are independent guided exercises and you don't need to implement the previous use case to implement the next one. If you are more comfortable with DMN, you can go to the more advanced labs immediately.

Before moving forward, get up to speed with what is DMN and explore the editor capabilities you'll be using.

## Introduction to DMN

### What is DMN

DMN, along with BPMN, is managed by the Object Management Group (OMG). Let's have a look at what OMG describes about the [DMN](http://omg.org/dmn) standard, in their website:

!!! quote "OMG explanains what is DMN"

    _"DMN is a modeling language and notation for the precise specification of business decisions and business rules. DMN is easily readable by the different types of people involved in decision management. These include: business people who specify the rules and monitor their application; business analysts._

    DMN is designed to work alongside BPMN and/or CMMN, providing a mechanism to model the decision-making associated with processes and cases. While BPMN, CMMN and DMN can be used independently, they were carefully designed to be complementary. Indeed, many organizations require a combination of process models for their prescriptive workflows, case models for their reactive activities, and decision models for their more complex, multi-criteria business rules. Those organizations will benefit from using the three standards in combination, selecting which one is most appropriate to each type of activity modeling. This is why BPMN, CMMN and DMN really constitute the “triple crown” of process improvement standards."_

{{ product.name }} brings a set of graphical tooling that allow you to author decisions using DMN and a lightweight engine that can execute these decisions. The engine and the authoring tooling set are decoupled and you can scale it independently.

### Tooling Set

With {{ product.name }} you can author decisions in multiple ways - and using the exact same editor across different environments:

- [{{ product.canvas }}]( {{ sandbox.production }}){:target="blank"} brings a new experience for easily working with decisions and processes in {{ product.name }}. This is a highly scalable and lightweight method for maintaining diagrams that the community has moved towards and which IBM has most recently embraced and been working hard on!
- [Business Automation VSCode Extension](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-extension-red-hat-business-automation-bundle)
    - A developer IDE ([Visual Studio Code](https://code.visualstudio.com/)) extension that allows the visualization and editing of BPMN, DMN and Test Scenarios inside VSCode.
    - If you are currently using {{ product.legacy }} and are utilizing things like KIE Server and Business Central, you can also build the DMN model within there. The preference for this lab is to focus on {{ product.name }}, but this option is capable of being done. A core component of {{product.name }} is intercompatability between versions and IBM's heavy emphasis on DMN is that the models produced for varying levels of the product are still compatible across releases. The walkthroughs are going to focus on {{product.canvas}} for the DMN labs.

Adding to the tools above, there are also other tools and knowledge sources you can leverage from the open source community. Listed below are you'll find resources developed in collaboration between IBM and Red Hat, for the community (not supported):

- [DMN FEEL Handbook](https://kiegroup.github.io/dmn-feel-handbook/#dmn-feel-handbook)
  - A handbook for the FEEL expression language from the DMN specification, as implemented by the Drools DMN open source engine.
- [Learn DMN in 15 minutes](https://learn-dmn-in-15-minutes.com/)
  - A guided tour in a website through the elements of DMN
- [Open Source Online Editors](https://kiegroup.github.io/kogito-online/#/)
  - [BPMN.new](http://bpmn.new) - A free online editor for business processes;
  - [DMN.new](http://dmn.new) - A free online editor for decision models;
  - [PMML.new](http://pmml.new) - A free online editor for scorecards;

### Exploring The Decisions Editor

Both in Canvas and VSCode, you'll have the same components within the the DMN Editor. They consist of:

#### Editor Pane

From the Editor pane you can edit and view multiple areas including:

- **Decision Navigator**: shows the nodes used in the Decision Requirements Diagram (DRD, the diagram), and the decisions behind the nodes. Allows for quick navigation through the model.

- **Decision Requirements Diagram Editor**: the canvas in which the model can be created.

- **Palette**: Contains all the DMN constructs that can be used in a DRD, e.g. Input Node, Decision Node, etc.

- **Expression Editor**: Editor in which DMN boxed expressions, like decision tables and literal expressions, can be created.

- **Property Panel**: provides access to the properties of the model (name, namespace, etc), nodes, etc.

![Decisions Requirement Diagram highlighting Navigator, the Editor, Palette and Property Panel](../99_images/business_automation/dmn/dmn-editor-components.png "Decisions Requirement Diagram"){:width="800px" caption="Decisions Requirement Diagram"}

![Boxed Expressions](../99_images/business_automation/dmn/dmn-editor-decision-table.png){:width="800px"}

#### Data Types Pane

Within the Data Types pane you can define data types that are used for your decision, including complex types.

![Data Types](../99_images/business_automation/dmn/dmn-editor-datatypes.png){:width="800px"}

