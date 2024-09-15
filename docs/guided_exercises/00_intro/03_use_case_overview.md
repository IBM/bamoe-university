# Use Case Overview

The Credit Card Application Process is a comprehensive workflow that automates the evaluation and approval of credit card applications. This process ensures that applications are thoroughly evaluated and processed accurately.

## Objectives of the Business Process

The primary objective of this process is to evaluate applicant data and decide whether to approve or reject the application. This ensures that only qualified applicants receive a credit card while minimizing risk for the financial institution.

## Key Steps in the Process

1. **Receive Application**:
    - Receive and parse the application.
    - Validate initial data and assign a unique application ID.

2. **Evaluate Application**:
    - Assess the applicant's credit score and financial information.
    - Applications with a credit score below 550 are automatically rejected.
    - Applications with scores between 550 and 649 are sent for manual review.
    - High scores (650 and above) are considered for further processing.

3. **Manual Review**:
    - Further scrutiny by a financial officer.
    - Detailed analysis of the applicant's financial history and relevant factors.

4. **Generate Card Details**:
    - Once approved, generate necessary card details such as card number, CVV, expiration date, credit limit, and APR.

5. **Approval and Notification**:
    - Approved applicants receive their card details, while rejected applicants are informed of the reasons for rejection.

## Business Rules and External Validations

The process incorporates several business rules to ensure accurate decision-making:
- **Credit Score Assessment**: Determines initial eligibility based on predefined thresholds.
- **Debt-to-Income Ratio Check**: Ensures applicants have a manageable level of debt relative to their income.
- **Fraud Risk Assessment**: Uses external AI services to detect potential fraud, adding an extra layer of security.

### Approvals and Validations

- **Automated Approvals**: Based on clear-cut criteria such as credit score and debt-to-income ratio.
- **Manual Approvals**: Required for borderline cases where human judgment is necessary.
- **External Service Validations**: Involving AI-based fraud detection and other external checks to ensure data authenticity and reliability.

---
:material-check-circle-outline: _Next, let's delve into the environment setup required to begin our journey with BAMOE._
