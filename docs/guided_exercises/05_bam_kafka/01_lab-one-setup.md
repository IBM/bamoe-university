# {{ product.short }} {{ product.version }} Kafka extension

In order to be able to start processes based on new events, we will need to configure the {{ product.short }}Kafka extension.

The {{ product.short }} Kafka extension allows the KIE Server (process and decision engine) to react to events and publish events to kafka topics.

> 📘 INFO: There are several options in {{ product.short }} to customize the Kafka address, topic names, etc. In our case, we’re using the default Kafka address, which is, localhost:9092. More customization information can be found in the official Red Hat product documentation: [Configuring a KIE Server to send and receive Kafka messages from the process.](https://access.redhat.com/documentation/en-us/red_hat_process_automation_manager/7.13/html-single/integrating_red_hat_process_automation_manager_with_other_products_and_components/index#kieserver-kafka-proc_integrating-amq-streams)

In this setup steps, we will configure {{ product.short }} only in the _server level_ - _we are not yet configuring the business project_. We will see how to configure the project as we move forward on the labs.

## Enabling the Kafka extension

We can configure the engine to support different capabilities. In order to enable processes to be started through eventing, we only need to enable the extension via system property.

1. With {{ product.short }} up and running, execute the following, where `$JBOSS_HOME` is the installation directory of the JBoss EAP instance you're running KIE Server from:

    ~~~ shell
    $JBOSS_HOME/bin/jboss-cli.sh -c
    [standalone@localhost:9990 /] /system-property=org.kie.kafka.server.ext.disabled:add(value=false)
    [standalone@localhost:9990 /] :shutdown(restart=true)
    ~~~

The first command will enable the Kafka extension. Next, we're restarting EAP so that the new configuration is active. You can check EAP logs to confirm it is restarting.

The following output will show up in {{ product.short }} logs:

~~~console
INFO  [org.kie.server.services.impl.KieServerImpl] (ServerService Thread Pool -- 74) Kafka KIE Server extension has been successfully registered as server extension
~~~

This is the only configuration you will need in a server level to be able to start processes using events.
