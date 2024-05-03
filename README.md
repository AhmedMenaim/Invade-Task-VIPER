# Demo

**The demo is being slowed intentionally to be able to see the button action & the loading.**

![Simulator Screen Recording - iPhone 15 Pro - 2024-05-03 at 04 14 32](https://github.com/AhmedMenaim/Invade-Task-VIPER/assets/26345314/2b9dba4f-c05c-49a7-a338-4c4ea27e4af0)

# Requirements:
### Functional
  - Fetching and parsing data from API.
  - Listing Data.
  - Navigation to Details view.
    
### Non-Functional:
- Scalability:
  - Modularity.
 
# Diagrams
 - High-Level Diagram
   ![High-Level-Diagram](https://github.com/AhmedMenaim/Invade-Task-VIPER/assets/26345314/d6d6d107-f716-456a-a6a6-532280376b89)

    
- Low-Level Diagram - VIPER with clean architecture
  ![VIPER](https://github.com/AhmedMenaim/Invade-Task-VIPER/assets/26345314/e96eae05-9abb-48a1-aa2e-efd2347dc509)

# Decisions

- IDE & Deployment target:
  - XCode 15.1
  - Deployment target: 17.2
    
- UI:
  - UIKit - Xibs
  - VIPER with Clean Architecture.

- Principals and Patterns:
  - SOLID conformance:
    - Features are separated into modules.
    - Factory pattern to create module & Factory to create the interactor.
    - Repository to format backend data.
    - Shared Repository to manage communication among modules.
      
- Dependency Manager:
    - No dependencies, all is natively implemented.

# Important notes
1. Communication among modules is being done using SharedRepository which is being implemented using singleton.
2. Caching is not implemented inside the code cause of the time interval for the task.
3. Using Notification center is not the best way to take the refresh action but also cause of the task time interval, it was the better solution (For now), we can use delegator in the future to delegate the action.
4. All print statements are being wrapped inside `#if DEBUG` to avoid having it printed in production, it's done one time inside an extension.
5. The errors functions are being implemented just in case we need to have a code inside it in the future but in the mean time they are empty as the focus was on the functionalities implementation more than adding a design for each error.
6. I didn't focus on the design as was mentioned to be able to finish ASAP.
   
# What could be improved
- Creating caching layer to cache the data.
- Use delegation instead of NotificationCenter.
