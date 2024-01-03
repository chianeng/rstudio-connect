## Warm-up Questions
[ Answered by Chianeng](# Answered by Chianeng)
    2023-09-27

1. **The client you are working with is not willing to pay for https certificate and says it is not necessary for them. Please, provide us with a few arguments and options to convince them to use https for their production system**

    - I will have to make my client understands that, HTTPS is essential for any production system that       handles sensitive data like customer information or payment details. Without HTTP hackers could intercepts the data on transit or at rest and used for malicious purposes.
    - An example of such malicious acts could be "Sniffing" where the hackers will sniff the data on transit, potentially gaining access to sensitive information like passwords and credit card numbers.
    - Conclusively , I will have to make my client to know that purchasing and using HTTPS certificate will bring security and trust to the business as the site will be safe. This will build customer confidence and can possibly lead to increase sales and revenue. 


2. **What are the pros and cons of using :latest tag in Docker image?**

    - Pros: The great thing about docker ":latest" tag is that, it's easy to use, you do not need to know the exact version of an image before running it. You simple use the tag :latest.

    - Cons: Using docker latest versions might lead to unexpected changes in the container that would be challenging to troubleshoot especially as the community using the application have not had ample experience using this version.

    - Conclusively depending on your use case, at times the latest tag can be convinient to use but its important to understand the potential risks involve. If you need to ensure a consistent and reproductive environment is great to use a specific ":lts" tag of a specific docker image. 


3. **You have an application that needs environment variables to run. Which options that you know provide a secure way to store and use them, considering the fact that multiple people need to have an access and ability to change them**

    - Its challenging to manage sensitive information like passwords in a multi-user scenarios in cloud reason why environmental variables are used to enhance the security of the environment. Environmental variables can be secure in a most advance way by using Vault to manage and encrypt them. This will allow only authoriszed users to access and update the variables while keeping them secured from unauthorized access.

    - To explore other options, we could make use of Docker Compose to store environmental variables in a ".env" file and use the "env_file" in Docker to reference credentials file. This keeps passwords away from docker images hence giving access just to authorize users.

    - Another option could be using secrets in kubernetes as secrets provides a solution to store sensitive data in a seperate loctaion from the main configuration files and can be mounted to containers as environment variables. This enable you keep passwords away from unauthorise persons and only show them to authorized users of the container.


4. **What are the profits and drawbacks of using managed services vs. self-hosted?**

    - Having in mind that managed services are to a greather extent, extensively managed by the 3rd party provider unlike the hosted service where the 3rd party takes care mostly of the underlying infrastructure while the owner of the service takes care of the customization of the software component, there are a few points to consider when it comes to discussing these two on the following criteria;

*   [x] **Profits:
    - Managed services offer ease of maintenance as the provider takes care of the underlying infrastructure and some aspects of configuration making the owner of the purchase service having less control over the configuration setup.

    - Self-hosted offers more flexibilty and control over the configuration and setup

*   [x] **Drawbacks:
    - The main drawback of self-hosted services include increased time and effort required for steup and maintenance. Its important for the owner to ensure the infrastruture is secure and reliable which can be more complex and time consuming as compare to managed services

    - Also self-hosted services are more costly than managed services but provides more flexibility than them hence the right choice of using either will depend on the user specific requirements and preferences.


5. **When a Kubernetes cluster can be considered as overengineering? Please provide both business and technical arguments**

    - A  Kubernetes  cluster  can  be  considered  as  over-engineering  when  its  complexity  and  cost  outweigh  the  benefits  it  provides.  From  a  business  perspective,  it  may  be  over-engineering  if  it  does  not  provide  a  significant  return  on  investment  or  if  the  skills  required  to  operate  and  maintain  the  cluster  are  scarce  and  expensive.

    - From  a  technical  perspective,  a  Kubernetes  cluster  may  be  considered  over-engineering  if  it  is  overly  complex  for  the  application  or  use  case.  For  example,  if  the  application  is  simple  and  can  be  easily  run  on  a  single  server,  using  a  Kubernetes  cluster  may  be  overkill.

    - The  cost  can  include  both  monetary  and  non-monetary  factors.  For  example,  the  cost  of  running  the  cluster  may  include  the  cost  of  hardware,  software,  and  people  needed  to  maintain  it.  The  non-monetary  cost  may  include  the  complexity  of  the  system  and  the  time  required  to  learn  how  to  operate  it.

    - Conclusively the key here is to find  the  right  balance  between  the  benefits  of  Kubernetes  and  the  cost  of  implementing  and  operating  it.



        

        
