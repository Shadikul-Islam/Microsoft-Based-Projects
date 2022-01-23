## <p align=left>How to Run Powershell Script in Azure Pipeline in Azure DevOps <br> <br> </p>
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Azure DevOps?](#01) |
| 02 | [Azure DevOps Core Services](#02) |
| 03 | [What is Azure Pipeline?](#03) |
| 04 | [What is Azure Repository (Repos)?](#04) |
| 05 | [What is Powershell Scripting?](#05) |
| 06 | [How to Run Powershell Script in Azure Pipeline?](#06) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure DevOps?</a>
Azure DevOps is a service offered by Microsoft based on the Azure cloud computing platform that provides a complete set of tools to manage software development projects. It consists of:
- Five key services
- An extensive marketplace that contains extensions to further extend the Azure DevOps platform and integrate with third-party services

### <a name="02">:diamond_shape_with_a_dot_inside: &nbsp;Azure DevOps Core Services</a>
Core Azure DevOps services are:
1. Azure Boards
2. Azure Pipeline
3. Azure Repos
4. Azure Test Plans
5. Azure Artifacts

In here I will discuss about the **Azure Pipeline** and **Azure Repos**.
### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Pipeline?</a>
Azure Pipeline is a cloud service that we can use to build and test our code project automatically. The Azure pipeline has a lot of capabilities such as continuous integration and continuous delivery to regularly and consistently test and builds our code and ship to any target.
Pipelines are the CI/CD tool that facilitates automated building, testing, and deployment. Azure Pipelines supports any programming language or platform which enables users to create pipelines that support Windows, Linux, and macOS using cloud-hosted agents.
These pipelines are easily extensible through the extensions available in the marketplace. Besides, they support advanced workflows that can be used to facilitate:
- Multi-phase builds
- Test integrations
- Custom reporting functions

### <a name="04">:diamond_shape_with_a_dot_inside: &nbsp;What is Azure Repository (Repos)?</a>
Azure Repository is a set of version control tools that we can use to manage our code. In case if we are entirely new to version control, then version control enables us to track changes we make in our code over time. There are so many software that is available in the market to enable version control on our code. We can use the version control system to keep track of each change done by each developer, safely merge them, test the changes, and publish the change into production.

There are two types of version control in Azure Repos.
- **Git:** It is a distributed version control.
- **Team Foundation Version Control:** It is a centralized version control.

### <a name="05">:diamond_shape_with_a_dot_inside: &nbsp;What is Powershell Scripting?</a>
Windows PowerShell is a command-line shell and scripting language designed especially for system administration. Its analogue in Linux is called as Bash Scripting. Built on the .NET Framework, Windows PowerShell helps IT professionals to control and automate the administration of the Windows operating system and applications that run on Windows Server environment.

### <a name="06">:diamond_shape_with_a_dot_inside: &nbsp;How to Run Powershell Script in Azure Pipeline?</a>
1. Go to [Azure DevOps Portal](https://dev.azure.com/). Click the organization name and go inside of your desired organization page. 
If you don't have any organization then you can create a new organization by clicking **New Organization** option.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-1.png" alt="Organization Image">
2. I am going to my existing organization named **MyOrganization01.** Now we need to go inside to a project page. If you don't have any project create a new project by clicking **New Project** option.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-2.png" alt="Project Image">
3. At first we need to add the script into Azure Repos. From the left side menu of the page, clcik on the **Repos** to go Repository page. 
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-4.png" alt="Repository"> <br><br>

4. You can select a existing repository or you can create a new repository or you can import a repository. If you want to create a new Repository then click the **New Repository** <br>
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-3.png" alt="Repository"> <br><br>
5. Now select your new created repository or existing repository. Now you need to add files in this repository. You can **Clone** your script file here from git. You can create a new file here or can **upload** new file here. I am going to upload file here. Click 3 Dots of the Right side of the page and select **Upload Files** option. <br><br>
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-1.png" alt="Upload Files"> <br><br>
   Now browse the file from file explorer or drag and drop your file here. Add comment and select branch. Now click **Commit**.
<img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-2.png" alt="Upload Files"> <br><br>
6. Now go to pipeline by clicking **Pipeline** on the left side of the page. Now you need to follow this following setps.
   - To create a new Pipeline clcik **New Pipeline** <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-5.png" alt="Pipeline"> <br><br>
   - I want to create pipeline without YAML. You can create YAML if you want. Now select the **Use Classic Editor** to create a pipeline without YAML. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-6.png" alt="Pipeline"> <br><br>
   - Now you need to select the source where your script located. I uploaded my script in Azure Repos so I am selecting **Azure Repos Git** and click **Continue**. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-7.png" alt="Pipeline"> <br><br>
   - Now click on **Empty Job**. We will add our job later. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-8.png" alt="Pipeline"> <br><br>
   - In this page you can give a name of this project. I gave name Powershell Script Run. You need to select your Agent. If your agent Hosted from Azure then Select **Azure Pipeline**. My agent is self-hosted agent whcih I have created already before named **Self-Hosted-Agent-Pool**. So I selected that agent. If you don't know how to create a self hosted agent you can read my another documentation by [clicking here](https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/DOCUMENTATION.MD).<br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-9.png" alt="Pipeline"> <br><br>
   - Now click on the **Agent job 1 + button**. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-10.png" alt="Pipeline"> <br><br>
     Write Powershell on the search box and select **Powershell** and click **Add**. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-11.png" alt="Pipeline"> <br><br>
     After clicking **Add** button Powershell wiil be added in Agent job. Click on **Powershell Script**. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-12.png" alt="Pipeline"> <br><br>
     Here you can change the disply name. You need to select the scipt path which you uploaded in Azure Repos. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-13.png" alt="Pipeline"> <br><br>
     After selecting the script you need to click on **Save & Queue** then click on **Save & Run**.
   - After clicking on **Save & Run** your script will be started to run. You will be see like this. <br> <br> 
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-14.png" alt="Pipeline"> <br><br>
   - Click on **Agent Job 1** . You can see full log of it. To shwo the Powershell log just click on the **Powershell Script**. You can see the raw log by clicking on the **View Raw Log**. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-15.png" alt="Pipeline"> <br><br>
   - If your script don't run seccussfully then you can see a **Red Cross Sign**. You can check the log like the previous step. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Projects/blob/master/Azure%20DevOps-How%20to%20Run%20Powershell%20Script%20in%20Azure%20Pipeline/Images/Image-16.png" alt="Pipeline"> <br><br>
     
#### :diamond_shape_with_a_dot_inside: &nbsp;That’s it. We have learnt how to Run Powershell Script in Azure Pipeline in Azure DevOps. Happy Learning.  :diamond_shape_with_a_dot_inside: &nbsp;
