## In this documentation I will describe how to Create and Configure a Self-Hosted-Agent in Azure DevOps Manually

1. Go to [Azure DevOps Portal](https://dev.azure.com/). Click the organization name and go inside of your desired organization. 
If you don't have any organization then you can create a new organization by clicking **New Organization** option.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-1.png" alt="Organization Image">

2. I am going to my existing organization named **MyOrganization01.** Now we need to go inside to a project. If you don't have any projects create a new project by clicking **New Project** option.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-2.png" alt="Project Image">
   
3. I am going to my existing project named **MyProject01**. You can see on the right-side end of the page the **Project Settings** option. Click the Project Settings and go inside of it.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-3.png" alt="Project Settings Image">
   
4. Scroll down the project settings and you can see the Agent Pools option. Click the **Agent Pools** option and go inside of it.

   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-4.png" alt="Agent Pools Image">

5. If you do it for the first time then you can't see any Agent Pool. I have created Agent Pool already so you can see two Agent Pools in my Screenshot. To create a new Agent Pool just click Add Pool on the top right side of the page.
   
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-5.png" alt="Add Agent Pools Image">

6. After clicking Add Pool then you can see a short form on the right side of the page. Now fill-up the form with the necessary information.
   - Pool to link: **New**
   - Pool type: **Self-Hosted**
   You can grant access permission to all pipelines. Now click **Create**. <br> <br>
   
   <img src= "https://github.com/Shadikul-Islam/Microsoft-Based-Work/blob/master/Azure%20DevOps-Create%20and%20Configure%20Self%20Hosted%20Agent/Images/Image-6.png" alt="Create Agent Pools Image">
