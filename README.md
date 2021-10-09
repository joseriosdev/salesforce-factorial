# Salesforce Factorial

Classic factorial project, done in order to learn the concepts of **Salesforce Packaging**.

### Includes next information:
* Visualforce Page
* Apex Controller
* Unit Test
* Custom Tab metadata
* Links to each one of the packages created:
	* [1GP Unmanaged Package](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5e000000aOu3, "Salesforce Factorial Link")
	* [1GP Managed Package](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5e000000aOu8, "Salesforce Factorial Link")
	* [2GP Managed Package](https://login.salesforce.com/packaging/installPackage.apexp?p0=04t5e000000viXKAAY, "Salesforce Factorial Link")

#### Some useful trails
* **[Package Development Model](https://trailhead.salesforce.com/content/learn/modules/sfdx_dev_model)**
* **[Change Set Development Model](https://trailhead.salesforce.com/content/learn/modules/declarative-change-set-development)**
* **[Org Development Model](https://trailhead.salesforce.com/content/learn/modules/org-development-model)**
* **[Second-Generation Managed Packages](https://trailhead.salesforce.com/content/learn/modules/second-generation-managed-packages)**
* **[Unlocked Packages for Customers](https://trailhead.salesforce.com/content/learn/modules/unlocked-packages-for-customers/build-your-first-unlocked-package)**

---
---

## What I did
> Quick clarification, follow this if you have a project "100% done" including the unit tests with code coverage above 80%. Even though were deployed 3 types of pacakages, all of them are interconnected in a way because of the way I did it, using the same ORGS.

### Initial Setup
1. Install **[VSCode](https://code.visualstudio.com/download)**
2. Install **[Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)**
3. Install Java **[11](https://www.oracle.com/co/java/technologies/javase/jdk11-archive-downloads.html)** or **[8](https://docs.oracle.com/javase/8/docs/technotes/guides/install/install_overview.html)**
	* While doing this step, you might run into problems, is suggested to follow the attached note in [this trailhead](https://trailhead.salesforce.com/content/learn/projects/quick-start-lightning-web-components/set-up-visual-studio-code) if needed
4. Once you got all this setup, your machine will understand the `sfdx` commands and VSCode can perform the shortcuts as well

```bash
NOTE: When using CLI use the --help attribute as a wildcard
===========================================================
EX:
sfdx --help
sfdx force --help
sfdx force:source --help
```

5. Create a `sfdx` project, could be done through VSCode or CLI
	* **_CLI ->_** Run the command: `sfdx force:project:create -n salesforce-factorial -t standard -x`
	* **_VSCode ->_** This app has command line shortcuts by pressing `ctrl+shift+p` then you just look for the options that says "Create Project" and follow along by pressing enter
6. At this point you can keep trying to use the VSCode shortcuts or use the Salesforce CLI. I followed the CLI to learn better what's going on in the backstage
7. Log to your **DevORG** `sfdx auth:web:login`
8. Retrive your **DevORG** information needed for the deployment of the package, thinkgs like Tabs, Objects, LWC, Apex code... for example: `sfdx force:source:retrieve -m ApexClass:MyApexClass`

### Create 1GP Unmanaged Package
1. We first need to create an **Artifact** _(.zip file containing all the source code)_ 
2. Create an Artifact with `sfdx force:source:convert -r ./src/folder -d ./deployFolder -n "Package Name"`
3. Previous step will create a folder, so turn that folder into .zip file
4. Log to your **PackagingORG** `sfdx auth:web:login`
5. Deploy the Artifact `sfdx force:mdapi:deploy -f artifact.zip -u PackagingORG`
4. In your **PackagingORG** go to _Setup>Package Manager>New_ and select the necessary items that belongs to the package funcionality, this includes Tests
5. Click Upload, a link will be generate and can be shareable

### Create 1GP Managed Package
1. In your **PackagingORG** setup your namespace in _Package Manager_, once verified your unique namespace, select the package to be managed
2. Setup your **DevhubORG**  by login to your destinated **DevhubORG** and then in the setup>Dev Hub> switch to _"Enabled"_ these options: **Enable Dev Hub** & **Enable Unlocked Packages and Second-Generation Managed Packages**
3. Previous step allows your **DevhubORG** to have access to next tab "Namespace Register" where you can add with point and click the previously created namespace, login to your **PackagingORG** will be needed
4. Double check that you have added the namespace key in the sfdx-project.json file
5. On your CLI setup the **DevhubORG**, login first `sfdx auth:web:login`
6. CLI `sfdx config:set defaultdevhubusername=devhubAlias`
7. Go back to your **PackagingORG** go to _Package Manager_ and deploy now the Managed package by uploading once again and this will generate another link

### Create 2GP Managed Package
0. Create a scratch org for test only, not completely mandatory for this deployment but is a needed concept for 2GP `sfdx force:org:create --definitionfile config/project-scratch-def.json --durationdays 30 --setalias MyScratchOrg -v DevHub`
1. Create a 2GP package through CLI `sfdx force:package:create -n "Package Name" -t Managed -r src-folder`
2. This will generate a package with the Id that starts with "0Ho", for example "0Ho5e0000004CfeCAE"
3. You can have the package created, but is necessary to create also a **version** from that package, it is important to notice that the version Id will start with "04t", for example "04t5e000000viXKAAY"
4. While creating this version, you need to run the Apex Tests by adding the parameter -c _(--codecoverage)_ and -x _(--installationkeybypass)_
5. Create a version from previous package created `sfdx force:package:version:create -a "Version Name" -c -p 0Ho5e0000004CfeCAE -x`
6. Now, to share the package, you need to promote it `sfdx force:package:version:promote -p 04t5e000000viXKAAY`

> _This .md file doesn't cover the how to deploy a 2GP Unlock Package, however here's the [documentation link](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_unlocked_pkg_intro.htm)_

---
###### _Generic README_
---
### Salesforce DX Project: Next Steps

Now that you’ve created a Salesforce DX project, what’s next? Here are some documentation resources to get you started.

#### How Do You Plan to Deploy Your Changes?

Do you want to deploy a set of changes, or create a self-contained application? Choose a [development model](https://developer.salesforce.com/tools/vscode/en/user-guide/development-models).

#### Configure Your Salesforce DX Project

The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.

#### Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
