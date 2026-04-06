Simulation Elevator Control System | MATLAB, Simulink und Stateflow

This project demonstrates the complete development cycle of a 3-floor elevator control system (G, 1st, 2nd). 
It combines a physical simulation of cabin dynamics with complex discrete-event state logic and an interactive Graphical User Interface.

Core Components

Graphical User Interface (MATLAB GUI / HMI)

  * The system is controlled via a custom-built app that serves as the interface between the user and the simulation.
  * Interaction: Hall call buttons ("up"/"down") on each floor and car station buttons for destination selection.
  * Real-Time Coupling: Implementation of set_param commands to manipulate Simulink runtime variables directly from the UI.
    
Supervisory Control (Stateflow)
The "brain" of the system is a hierarchical Finite State Machine (FSM) designed in Stateflow.

  * State Management: Clear separation between "Travel," "Floor Stop," and "Door Operation."
  * Request Prioritization: Intelligent queue processing to determine the most efficient path between floors.
  * Safety Logic: Integrated limit switch logic (e.g., Endsch_EG_u, Endsch_2_o) to ensure the cabin stays within the physical boundaries of the shaft.


    <img width="711" height="750" alt="image" src="https://github.com/user-attachments/assets/ca6d6f32-10c4-4939-af14-f45a0996104a" />


  
