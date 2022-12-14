[![build](https://github.com/getforce-bootcamp/car-part/actions/workflows/build.yml/badge.svg)](https://github.com/getforce-bootcamp/car-part/actions/workflows/build.yml)

### Requirements
- [Enable Dev Hub in your Org](https://www.youtube.com/watch?v=Y1pZ9sFcILo)
- [Install Salesforce CLI](https://developer.salesforce.com/tools/sfdxcli)
- [Install Git](https://git-scm.com/downloads)
---

1. Clone this repository:

    ```
    git clone https://github.com/getforce-bootcamp/car-part.git
    cd car-part
    ```

1. Authorize your hub org:

    ```
    sfdx auth:web:login -d -a devhub
    ```

1. Create a scratch org:

    ```
    sfdx force:org:create -s -f config/project-scratch-def.json -a app
    ```

1. Push the app to your scratch org:

    ```
    sfdx force:source:push
    ```  
1. Open the scratch org:

    ```
    sfdx force:org:open
    ```
## Entity–relationship model   
<img width="986" alt="ER-diagram" src="https://user-images.githubusercontent.com/89274213/190663688-c9496343-d8e1-4036-a366-75310bbf85f8.png">    
    
## Contributors
<a href = "https://github.com/getforce-bootcamp/car-part/graphs/contributors">
  <img src = "https://contrib.rocks/image?repo=getforce-bootcamp/car-part"/>
</a>
