*   [RStudio Connect](#RStudio Connect)
    By Chianeng
    2023-09-27


*   [Getting startedr](#Getting started)
    *   [x] **PART ONE: WARM-UP-QUESTIONS AND ANSWERS
Visit `warm-up-exercise` directory to learn some basic cloud concepts


    *   [x] **PART TWO: Practical exercise

*   [RStudio Connect Installation, Configuration and Terraform Infra-Provisioning](RStudio Connect Installation, Configuration and Terraform Infra-Provisioning)


## Tasks To Be Executed:

1. Install and configure [RStudio Connect](https://docs.rstudio.com/rsc/installation/) for Shiny apps.
2. Provide the IaC configuration of the infrastructure. 
3. The solution has to be directly runnable and accessible via browser
    - Additionally, please satisfy these requirements:
            **The solution follows infrastructure as code principle**
            **Create documentation for the client with the low tech skills to be able to reproduce the environment on their own**
            **Make sure that time to initialize the deployment is relatively small**
            **The repository with code has pipelines that execute [linting](https://en.wikipedia.org/wiki/Lint_(software))


## Requirements: 

1. Spin up your VM using a 3rd party provider like AWS. Am using Ubuntu 20.04 LTS (ami) and a t2 medium instance type
2. Use an ssh tool like gitbash or MobaXterm for ssh. [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html)
3. To Install [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on your terminal.
4. Resources to be created includes:

        **vpc and its componenents(igw,subnets,azs,rts,nat-gw,rt-assoc)
        **ec2 instance and its components(sg,eip,keypair)
5. A bashscript to install rstudio Connect
6. A gitlab ci/cd yaml file to execute linting on the terra-code


## Procedure:

    1. **Get started** by ensuring you have terraform, git and aws cli installed in your terminal
    
    2. Create a pgitlab repo named **rstudio-connect** and cloned it.
```
git clone https://gitlab.com/chianeng_projects/rstudio-connect.git
```
    
    3. To create the IAC for RStudio Connect, Open the following  .tf files:

*   [main.tf](#main.tf)= to define aws provider and provision resources
*   [variable.tf](#variable.tf)= to parametarize resources and avoid hard coding for code reusability
*   [keypair.tf](#keypair.tf)= to avoid hard coding the private key
*   [output.tf](#output.tf) = to get server ip to access rstudio connect via webserver
*   [.gitignore](#.gitignore) = to reduce the size of  the terra directory 
*   [locals.tf](#locals.tf)= to store named values to avoid duplication within the code


    4. After writting the Infra Code, run the following terra-commands to provision the resources

*   [x] **To initialize all the .tf files needed to deploy the infrastructure run :
            ```
            terraform init 
            ```
            
*   [x] **To check and verify if  all syntaxes within the script are correct :
            ```
            terraform validate
            ```
            
*   [x] **To apply all configurations made on the .tf files run :
            ```
            terraform apply -auto -approve
            ```

*   [x] **To remove or delete all applied resources from provider run
            ```
            terraform destroy 
            ```

    5. After deploying the reources, access the RStudio Connect through the VM's ip gotten as output from the terraform logs plus  port 3737 of the RStudio Connect applied
     
     6. Finally make use of gitlab runner to run the linting pipeline using the **gitlab-ci.yml** to identify potential errors and vulnerabilties in your terra-files code.
