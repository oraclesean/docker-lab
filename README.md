# Oracle Database on Docker Lab
Lab resources for running Oracle databases in Docker containers on Oracle Cloud Infrastructure.

## Deploy on OCI
To deploy this lab on Oracle Cloud Infrastructure, [create a new Always Free Tier account](https://signup.cloud.oracle.com/?language=en&intcmp=:ow:o:p:feb:0916FreePageBannerButton&sourceType=:ow:o:p:nav:0916BCButton%2B:ow:o:p:feb:0916FreePageBannerButton), log in to an existing account still within the trial period or an account with enough credits to create a VM.Standard2.1 instance or higher.
Then, click on the "Deploy to Oracle Cloud" button:
[![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?zipUrl=https://github.com/oraclesean/docker-lab/releases/download/v1.0/master.zip)
Accept the Oracle Terms of Use and click the "Next" button.

Confirm that you have accepted the License Agreement by checking the box.

Add or paste an SSH key.

Select a shape for the compute instance.

Check "Show advanced options" to select a database version and optionally create a container.

Select "Lab" as the source. ("Lab" pulls an existing database image from the Oracle Container Registry. "Build" creates a database image from the Oracle docker-images repository and adds 10-15 minutes to the provisioning.)

Select a database version, 19c or 21c.

Optionally choose to run a container. If you're unfamiliar with Docker, accept the default values for container name, database SID and PDB name, and host TNS port.

Click the "Next" button.

Review the stack information and make sure the "Run Apply" checkbox is checked, then click the "Create" button.

Resource Manager will begin building the stack and after a few moments the job will complete and the Resource Manager Job icon will turn green. A new tab will appear (you may need to reload the page) titled "Application Information". Select this tab.

Copy the "Compute public IP address" using the 'Copy' option.

Open a terminal or shell session on your local machine and enter the following command, substituting the path to your SSH key and the public IP address of the compute instance you just copied from OCI:
```ssh -l opc -i <path to your key> <compute public IP address>```
Wait 10-15 minutes to allow provisioning to complete. Provisioning is done when:
* If no container creation was requested, running `docker images` returns a database image
* If container creation was requested, running `docker ps` returns a database container
