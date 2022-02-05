## <p align=center>How to Create, Configure, Delete and Troubleshoot Common Issue of a Self-Hosted Agent in Azure DevOps <br> <br> </p> 
| **SL** | **Topic** |
| --- | --- |
| 01 | [What is Agent?](#01) |
| 02 | [What is Self-Hosted Agent?](#02) |
| 03 | [When we need Self-Hosted Agent?](#03) |
| 04 | [How to Create and Configure a Self-Hosted Agent](#04) | 
| 05 | [How to Delete Self-Hosted Agent](#05) |
| 06 | [Troubleshoot Common Issues](#06) |

### <a name="01">:diamond_shape_with_a_dot_inside: &nbsp;What is Agent?</a>
Agent is a server with the appropriate Operating System and the tools installed and configured.
Azure DevOps supports the following two types of Agents
 - **Microsoft Hosted Agent** – These agents are managed by Microsoft
 - **Self-Hosted Agents** – These are created and managed by the Customer.

Here I will discuss about the Self-Hosted Agents.

### <a name="02">:diamond_shape_with_a_dot_inside: &nbsp;What is Self-Hosted Agent?</a>
An agent that you set up and manage on your own to run jobs is a self-hosted agent. You can use self-hosted agents in Azure Pipelines or Azure DevOps Server, formerly named Team Foundation Server (TFS). Self-hosted agents give you more control to install dependent software needed for your builds and deployments

### <a name="03">:diamond_shape_with_a_dot_inside: &nbsp;When we need Self-Hosted Agent?</p>
Most of the times, using the Microsoft hosted Agents should be good. However, below are the scenarios in which you should look at configuring Self-Hosted Agents
- If 10GB free space in the Virtual Machine (Agent) is not sufficient for your build needs.
- When you want a Virtual Machine, whose capacity is greater than of Standard DS2V2.
- When you would like to use a Software that is not available in the Microsoft hosted Build Agents.

### <a name="04">:diamond_shape_with_a_dot_inside: &nbsp;How to Create and Configure a Self-Hosted Agent</a>
1. Go to [Azure DevOps Portal](https://dev.azure.com/). Click the organization name and go inside of your desired organization page. 
If you don't have any organization then you can create a new organization by clicking **New Organization** option.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-1.png" alt="Organization Image"> 

2. I am going to my existing organization named **MyOrganization01.** Now we need to go inside to a project page. If you don't have any projects create a new project by clicking **New Project** option.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-2.png" alt="Project Image">
   
3. I am going to my existing project named **MyProject01**. You can see on the right-side end of the page the **Project Settings** option. Click the Project Settings and go inside of it.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-3.png" alt="Project Settings Image">
   
4. Scroll down the project settings and you can see the Agent Pools option. Click the **Agent Pools** option and go inside of it.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-4.png" alt="Agent Pools Image">

5. If you do it for the first time then you can't see any Agent Pool. I have created Agent Pool already so you can see two Agent Pools in my screenshot. To create a new Agent Pool just click **Add Pool** on the top right side of the page.
   
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-5.png" alt="Add Agent Pools Image">

6. After clicking Add Pool then you can see a short form on the right side of the page. Now fill-up the form with the necessary information.
   - Pool to link: **New**
   - Pool type: **Self-Hosted** <br>
   You can grant access permission to all pipelines. Now click **Create**. <br> <br>
   
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-6.png" alt="Create Agent Pools Image">
   
7. Click the newly created Agent Pool and go inside Click **New Agent** to create a new Agent. After clicking New Agent a page will appear and there give instructions on how to create an Agent. We need to follow the instruction.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-7.png" alt="Agent Create Image">
   
8. You can notice that Instruction is given for Windows, Mac, Linux. Since we will configure for Windows machine so we will follow the Windows instructions.
   - At first I copied the link and open the link from browser to download the agent files. Here is the downloaded file. <br> <br>
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-8.png" alt="Download the Agent Files"> <br>
   - Open **Powershell in Administrator Mode** and Run this Script. <br>
     ```PowerShell
     mkdir agent ; cd agent
     Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.196.2.zip", "$PWD")
     ```
     
     <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-9.png" alt="Run Command Image">
     <br>This command will be created a new folder named **agent** and will go inside the agent folder then extract the zip file which downloaded.
   - Now run this command. This command will execute the **config.cmd** file.
     ```PowerShell
     .\config.cmd
     ```
   - When you run this command you need to give these following information.
     - Enter server URL: https://dev.azure.com/YourOrganizationName
     - You need to create **Personal Access Token (PAT)**. To create this go to [Azure DevOps](https://dev.azure.com/) → My Account → Personal Access Token → New Token → Provide the Name → Set Scope: Full Access → Create → Now copy the PAT and paste it into PowerShell. <br>
       <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-10.png" alt="PAT Creation Image"> <br>
       <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-11.png" alt="PAT Creation Image"> <br>
       <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-12.png" alt="PAT Creation Image"> <br> <br>
     - Enter agent pool: Enter the agent pool name that you created earlier. In my case, it is **Self-Hosted-Agent-Pool**.
     - Enter agent name: I am providing this name **Self-Agent**. You can provide anything of your choice. If you give enter without providing anything then it will take automatically by its default name what it suggests.
     - Enter work folder: I pressed enter to keep its default value.
     - Enter run agent as service: Y
     - Enter User account to use for the service: Press Enter
     - Enter whether to prevent service starting immediately after configuration is finished: Press Enter cause I want to start it now. <br> <br>
       <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-13.png" alt="Agent Configuration Image"> <br>
9. <a name="9">To check the agent from Azure DevOps portal go to Project Settings → Agent Pool → Click the Agent Pool Name → Click Agent. <br> <br>
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-14.png" alt="Check Agent Image"> </a>
 
### <a name="05">:diamond_shape_with_a_dot_inside: &nbsp;How to Delete Self Hosted Agent:</a>

1. Go to the Agent folder where you unzip the Agent files. In my case it is **C:\Users\Sadik\agent**. click Windows file explorer path and write **cmd** then hit enter to open CMD in this path. <br> <br>
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-15.png" alt="Open CMD Image">
2. Now run this command. <br> <br>
   ```PowerShell
   config.cmd remove
   ```
   After successfully running this command, you can see it like this. <br> <br>
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-16.png" alt="Remove Agent Image">
   
### <a name="06">:diamond_shape_with_a_dot_inside: &nbsp;Troubleshoot Common Issues:</a>
1. If you see that your agent is offline then you can solve this issue by running a command. <br> <br>
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-17.png" alt="Offline Agent Image">
2. To make your agent online just run this command from **Command Prompt**.
   ```PowerShell
   .\run.cmd
   ```
   After successfully running this command, you can see it like this. <br> 
   
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-18.png" alt="Online Agent Image"> <br> <br>
   Now your Agent will be online. To check it follow the **[step 9](#9)**. <br>
   
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-14.png" alt="Online Agent Image"> <br>
   
#### :diamond_shape_with_a_dot_inside: &nbsp;That’s it. We have learned how to Create, Configure, Delete and Troubleshoot an Agent in Azure DevOps. Happy Learning.  :diamond_shape_with_a_dot_inside: &nbsp;
