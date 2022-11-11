# regfile
## Name and NetID
Name: Hunter Shen(Zhihang Shen) NetID: zs149
Name: Kevin Shen            NetID: ks713
Name: Caroline Chen         NetID: xc198
## Design implementation 
For this project checkpoint, our goal is to implement a simple processor that can support simple R type and I type instructions, We mainly modified processor.v we used our own regfile and alu modules and integrate them into the whole project. And we use imem.v and dmem.v as memory generation files. For the top level logic of this project, we set the top level entity of this project be skeleton.v, we use clock divider to accommodate the clocks for regfile and pc, and we call regfile and pc to execute the instructions, For processor.v, we follow the knowledge learned in class to divide the instructions into necessary parts, and complete each R type and I type instructions as required for this assignment.
## Bugs and issues
All componets seem working well so far, testbench is passed without error.

