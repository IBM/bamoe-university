# Introduction

In this guided lab let’s see in practice how we can use process automation applications that fits within event-driven architectures. We can list at least three ways to adjust our business application fit within EDA:

- We can build processes that can react to events that happen in the ecosystem;
- From within the process, we can emit events to notify the ecosystem about key activities in the business process and interact with external services via events;
- We can track every transaction committed either for business processes, cases (case management), or human tasks by publishing events for.

## The alignment of tech evolution and business standards like BPMN

When providing an implementation for a specification, each provider has the opportunity to deliver the solution of choice. It is not different for the BPMN specification. It allows different implementations for its diagram elements, and this is how {{ product.short }} delivers the most recent tech concepts by still allowing business users to use the modeling notation they are used to.

In {{ product.short }} (a.k.a. jBPM), it is possible to make use of message events (starting, intermediate or ending) to interact via events. In this case, the KIE Server Kafka extension makes sure the communication occurs effectively with the event streaming brokers.

In the upcoming labs we will learn how to model the processes and when and how to add configurations to the business project and KIE Server.
