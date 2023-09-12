# Overview of Order Management Process

This is a Process Management lab in which will implement an Order Management process. The process will use BPMN2 constructs like **Swimlanes**, **User Tasks**, **Gateways**, combined with decision-based routing based on a **DMN Model** (Decision Model & Notation). It also introduces more dynamic concepts of the {{ product.legacy }} process engine, like dynamic assignments of tasks based on process instance data.

## Goals

- Create an Order Management project in {{ product.legacy }}
- Define and create the process' domain model using the platform’s
    Data Modeller.
- Implement an order management process in the process designer
- Implement decision logic in a DMN model.
- Create forms with the platform’s Form Modeller.
- Deploy the project to the platform’s Execution Server.
- Execute the end-to-end process.

## Pre-reqs

- Successful completion of the *Environment Setup Lab* or
- An existing, accessible, DM/PAM 7.3+ environment.

## Problem Statement

In this lab we will create an Order Management process that manages the process of ordering a new phone or laptop.

- Start the process by providing the order information.
- The supplier sends an offer stating the expected delivery date and its best offer.
- Depending on the urgency of the urgency and the price, the order can be auto-approved by a DMN decision.
- If the order is not auto-approved, the manager needs to complete an approval step.
