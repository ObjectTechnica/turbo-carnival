### AWS Organizations in the AWS GovCloud (US) Regions for central governance and management of AWS accounts
***
Knowledge of the AWS GovCloud (US) Regions is helpful to understand the concepts introduced in this blog post. For more information about AWS GovCloud (US), see the AWS GovCloud (US) Documentation. For information about the differences between AWS GovCloud (US) Regions and standard AWS Regions, please see AWS GovCloud (US-West) Region Compared to Standard AWS Regions.

One fundamental concept is how AWS GovCloud (US) accounts work. Each AWS GovCloud (US) account has a mapped commercial account associated with it in a 1:1 relationship (displayed in the diagrams later on in this blog post by blue dotted lines). The commercial account is used by the AWS GovCloud (US) account for billing and support-related use cases, as well as associating various account information for the AWS GovCloud (US) account (for example, an email address). This association between the AWS GovCloud (US) account and its mapped commercial account can’t be modified.

The AWS GovCloud (US) Regions have special requirements, so you’ll need to have access to the AWS GovCloud (US) Regions to use AWS Organizations in AWS GovCloud (US).

### Set up your AWS GovCloud (US) organization
***
AWS GovCloud (US) organizations are completely separate from commercial organizations and are managed independently of one another. The two most common models used to structure your AWS GovCloud (US) organization in relation to an existing commercial organization are a single company model or a reseller/partner model.

For single companies, you’ll want to use the AWS GovCloud (US) account mapped to your commercial organization master account to create your AWS GovCloud (US) organization. This maintains the relationship between the two organizations’ master accounts for easier management.
>1) The AWS GovCloud (US) account mapped to the master account of the commercial organization is used to create an AWS GovCloud (US) organization.
> 2) The other AWS GovCloud (US) accounts mapped to the member accounts of the commercial organization are invited into the new AWS GovCloud (US) organization.

Creating your organization in AWS GovCloud (US) follows the same process as in other regions either by using the API/CLI or logging in to the AWS GovCloud (US) Organizations console and choosing Create organization. For more information on creating an organization, please see Creating an Organization.

### How do I access a new AWS GovCloud programmatically using the API?
***
> 1) Use the commercial organization’s master account to call the CreateGovCloudAccount API, which creates a new account in the commercial organization. A role is created in this new commercial account that allows your commercial organization master account to assume it, the exact same way account creation works in commercial organizations today.
> 2) An AWS GovCloud (US) account is then automatically created and mapped to the commercial account that was just created. A role is created in the new AWS GovCloud (US) account that can be assumed by the AWS GovCloud (US) account mapped to the master account of the commercial organization.
> 3) Sign in to the AWS GovCloud (US) account mapped to your commercial organization’s master account and assume the role into the newly created AWS GovCloud (US) account.