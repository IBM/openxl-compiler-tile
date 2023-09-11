## Before you begin

  1. Refer to the [System Prerequisites](https://www.ibm.com/docs/en/openxl-c-and-cpp-aix/17.1.1?topic=prerequisites-system) page to get sizing information.  
  2. Verify that you have Manager service access role for IBM Cloud Schematics.
  3. Review and verify the Identity and Access Management (IAM) information at [Managing Power Systems Virtual Servers (IAM)](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-managing-resources-and-users).

## Required resources

  * Create a Power Systems Virtual Server Instance. For more information, see [Getting started with IBM Power Systems Virtual Servers](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-getting-started).  
  * You cannot create a private network during the VM provisioning process. You must first use the Power Systems Virtual Server user interface, command line interface (CLI), or application programming interfaced (API) to [create one](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-configuring-subnet).
  * It is recommended to create a public and private SSH key that you can use to securely connect to your Power Systems Virtual Server. For more information, see [Adding an SSH key](https://cloud.ibm.com/docs/ssh-keys?topic=ssh-keys-adding-an-ssh-key).
  
## Installing the software

To install the software, configure the following required variables:
  * Select a Power Systems Virtual Server Instance
  * Enter a name for the new image instance that is being created
  * Enter an SSH Key Name for the selected server instance
  * Enter a Network Name or ID for the selected server instance.  
  * Review all parameter settings. For details on instance parameters, refer to [Terraform Registry](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_instance).

If necessary, modify the optional configuration items related to [memory](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_instance#pi_memory), [processors](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_instance#pi_processors), [processor type](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_instance#pi_proc_type), [storage type](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_instance#pi_storage_type) and [system type](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/pi_instance#pi_sys_type). 

## Upgrading to a new version

For information about applying updates and fixes, see [Downloading fixes and updates](https://cloud.ibm.com/docs/power-iaas?topic=power-iaas-downloading-fixes-updates) in the Power Systems Virtual Server documentation.

## Uninstalling the software

Complete the following steps to uninstall a Helm Chart from your account. 

1. Go to the **Menu** > **Schematics**.
2. Select your workspace name. 
3. Click **Actions** > **Destroy resources**. All resources in your workspace are deleted.
4. Click **Update**.
5. To delete your workspace, click **Actions** > **Delete workspace**. 
