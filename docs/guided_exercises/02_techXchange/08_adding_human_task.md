# Adding a Human Task

The long-awaited addition of Human Tasks when using Kogito and the jBPM engine together is a part of the Technical Preview for the 9.1 release. This section will focus on adding them to the process.

## Modifying the manual approval to incorporate human tasks

When the decision outcome indicates the need for manual approval, the flow should move forward to a user task. Let's add this manual step in the process and see it in action!

## Implement the Manual approval 

1. Add a new user task on your process, on the "manual approval" path. To do this from the palette, click the blank square and click and drag User to the manual approval path of the process.

2. Change the human task name to "Review Application".

3. Set the task name to reviewApplication.

4. Set the actor to jdoe.

5. Set the data assignments for the task:

   Input Assignment:
   - Name: Applicant
   - Data Type: Applicant[org.acme.cc_approval.model]
   - Source: applicant

   Output Assignment:
   - Name: approval
   - Data Type: String
   - Source: approval

## Cleaning up and finalizing the process 

6. Configure the sequence flows after the human task:

   - For the "approved" path: Set the condition to: `return approval.toLowerCase().equals("approved");`
   - For the "rejected" path: Set it as the default path or use the condition: `return approval.toLowerCase().equals("rejected");`

7. Once completed, save the diagram, and regenerate the SVG associated with this process.

## Testing the Updated Process 

8. If the process is still in `mvn quarkus:dev` then proceed to http://localhost:8080/q/dev-ui otherwise run the command to restart the application.

9. Start a new process instance that would route to manual review.

10. After submitting the process, review the process details to see how the changes impacted the process.

11. Go to the Tasks Console within the Dev-UI environment.

12. Change to the jdoe user to see the assigned task.

13. Click the Review Application link to open the task.

14. Complete the task by setting the approval status.

15. Return to the Processes view and check the completed instance details.

## Optional challenge

16. Change the actor from jdoe to mscott.

17. Add mscott to the application.properties file to make it available in the Dev-UI.

18. Test the process again with the new actor assignment.

