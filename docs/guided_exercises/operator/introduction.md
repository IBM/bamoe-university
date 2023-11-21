# Red Hat PAM Operator on OpenShift 4

In this lab we will use the enhanced Business Automation Operator **7.10+** to deploy a number of {{ product.name }} environments on OpenShift **4.**

## Goal

- Install the Business Automation Operator on OCP 4.
- Use the Business Automation Operator {{product.versionLegacy}} to deploy a number of {{ product.name }} environments.
- Change the KIE-App deployment CRDs to show reconciliation.
- Change Operator ConfigMaps to make advanced configuration changes to the KIE-App.


## Problem Statement

In this lab, the goal is to provision and manage various {{ product.name }} architectures using the Business Automation Operator on OpenShift 4.

- We deploy an {{ product.short }} Trial environment, which is a basic ephemeral environment that does not require any form of storage (e.g. persistent volume, database).
- We explore Operator reconciliation features by removing provisioned resources like Services and Deployment Configs.
- We alter the deployment through the Operator to show how the provisioned environment changes.
- We change a KIE configuration parameter in the Business Automation Operator ConfigMap to demonstrate advanced configuration changes.
- We provision a more sophisticated Production environment, to show creation of PVCs, deployment of databases and integration with {{ product.short }} Smart Router.
- We use the Operator Installer console to install a new KIE-App deployment.

## First steps

**If you are using your own OpenShift environment**, follow the steps below to create a project and install the operator. If you are trying this lab in an environment provisioned by the Red Hat team, skip to the section `Inspect the Lab environment`.

1. Create a new project in OpenShift. We suggest the name `ibamoe-install`.

    ![new-ocp-project](../99_images/business_automation/operator/new-ocp-project.png){:width="650px"}

1. Navigate to `Operators`, `Operator Hub`, and search for `Business Automation`:

    ![install-operator](../99_images/business_automation/operator/install-operator.png){:width="650px"}

1. Click on the Business Automation and then, click `Install`. 

    ![install-operator-button](../99_images/business_automation/operator/install-operator-button.png){:width="650px"}

1. You can select the following options, and click on `Submit`:

    ![operator-install-options](../99_images/business_automation/operator/operator-install-options.png){:width="650px"}

1. Once subscribed, you should wait for the operator to get provisioned. Then you can proceed with the lab.

    ![operator-subscription](../99_images/business_automation/operator/operator-subscription.png){:width="650px"}

<!-- ## Inspect the Lab environment

If you attending to an enablement with a provisioned environment. We provisioned an environment where each user already has a subscription to the Business Automation Operator. These Operator subscriptions are managed by the OpenShift cluster admin.

1. Navigate to the OpenShift Master url.
1. Login to the platform with the provided username and password.

    ![OpenShift Homepage](../99_images/business_automation/operator/operator-lab-project-user.png){:width="650px"}

1. Open the project `rhpam710-operator-lab-userX`. Open the *Workloads* tab. Observe that the `business-automation-operator` has already been provisioned to your project. This has been done by the cluster-admin by subscribing your project to the Business Automation Operator. 

    ![Operator Deployment](../99_images/business_automation/operator/operator-lab-ba-operator-workload.png){:width="650px"}

1. Expand the **Operators** menu group in the left-hand-side of the screen and click on **Installed Operators**. This will show the installed Operators, or Operator Subscriptions, in your OpenShift namespace.

    ![Installed Operators](../99_images/business_automation/operator/operator-lab-installed-operators.png){:width="650px"}

1. Click on **Business Automation** to access the **Business Automation** Operator instance in your project. 

    ![{{ product.short }} Operator](../99_images/business_automation/operator/operator-lab-ba-operator-overview.png){:width="650px"} -->
