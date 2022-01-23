## <p align=left>How to Run Powershell Script in Azure Pipeline in Azure DevOps <br> <br> </p>
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Azure DevOps?](#01) |
| 02 | [Azure DevOps Core Services](#02) |
| 03 | [What is Azure Pipeline?](#03) |
| 04 | [What is Azure Repository (Repos)?](#04) |
| 05 | [What is Powershell Scripting?](#05) |
| 06 | [How to Run Powershell Script in Azure Pipeline?](#06) |
| 06 | [Troubleshoot Common Issues](#06) |

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
3. At first we need to add the script into Azure Repos. 
4. You can **Clone** your script here from git. You also **add** new file here and **upload** file. I am going to upload file here. Click 3 Dots of the Right side of the page and select **Upload Files** option.
   <img src= "Image-1" alt="Upload Files"> <br><br>
   Now browse the file from file explorer or drag and drop your file here. Add comment and select branch. Now click **Commit**.
   <img src= "Image-2" alt="Upload Files"> <br><br>
   
   
