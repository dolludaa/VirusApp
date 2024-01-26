# VirusApp


This is an iOS application that simulates and visualizes the spread of infection among a group of people 🦠. The app has two screens: one for entering parameters and another for visualizing the simulation. 
The simulation is conducted by randomly infecting some people, and then the number of infected people is counted at a set frequency. The simulation is then updated and visualized in real-time on the second screen.

## How to Use:


### Parameter Input Screen

Upon launching the app, the user is presented with a parameter input screen with the following input fields:
<img align="right" width="20%" src="https://github.com/dolludaa/VKInternship/assets/111228178/2fa590ec-c272-4b59-a9f6-fd7c3cd47991.png">

- Group Size: the number of people in the group for the simulation 🔢

- Infection Factor: the number of people that one infected person can infect upon contact 🤒

- Calculation Period: the frequency at which the number of infected people is recalculated and updated on the screen ⏳

- Infection Probability: the percentage likelihood that a person, who is a neighbor to an already infected person, will get infected 💯

- Start Simulation Button: used to start the simulation with the given parameters ▶️


### Simulation Screen



<img align="left" width="20%" src="https://github.com/dolludaa/VKInternship/assets/111228178/aa74caee-a7e1-4302-8f75-fb520309def3.png">

After entering the parameters and pressing the start button, the user moves to the simulation screen.

The screen displays the entire group of people for the simulation.

The screen supports scrolling and zooming for better visualization.

In the initial state, all people are healthy and displayed as such.

If the user touches a healthy person, they become infected, and the simulation updates accordingly.


The simulation is recalculated at the set frequency, and new infected people are displayed on the screen. The recalculating rule is that a random subset of neighboring infected people becomes infected, with the limitation that the subset size cannot exceed the infection factor.
Additionally, the app displays the current number of healthy and infected people, and the simulation should respond to user interaction at any time.



### Getting Started


>To start the app, clone the repository and open the project in Xcode.

>Create and run the project on a simulator or physical device.
