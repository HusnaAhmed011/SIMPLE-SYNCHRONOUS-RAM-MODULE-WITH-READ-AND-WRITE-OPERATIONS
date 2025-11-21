# SIMPLE-SYNCHRONOUS-RAM-MODULE-WITH-READ-AND-WRITE-OPERATIONS

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: HUSNA FIRDOS

*INTERN ID*: CT04DR1337

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*:  NEELA SANTHOSH KUMAR

## Description:-
### Software used for Implementation:
The whole project was implemented in the Visual Studio Code, and Icarus Verilog (iverilog) was installed and embedded in the terminal. The compilation was carried out with the help of the following command:

         code: iverilog -o syn_ram_tb.vvp syn_ram_tb.v
         
This assembles the testbench and the Synchronous RAM module into one simulation. The following was used to run the simulation:

         code: vvp syn_ram_tb.vvp
         
The terminal output made sure that the RAM did all the tasks correctly.
The values 10 and 01 were stored at the address 3 and address 7 respectively and during the read, both values were read correctly at the read phase, which confirms that it behaved correctly in synchronous mode.

### GTKWAVE - Waveform Simulator:
GTKWave was then applied to open the generated VCD file to visualize the transitions between the signal:

          code: gtkwave
          
GTKWave helped to give a visual representation of clock transitions, address movement, write enable (we) timing, reset behaviour, registered output (dout_reg) updates and final dout output after OE gating.

The waveform confirmed the following major behaviours:
1. *Synchronous Write* took place at the rising edges of clock when we = 1.
2. *Synchronous Read* wrote output on an increasing edge only.
3. The *reset* was properly executed to set the output register to 00 then to normal operation.
4. The output bus was gated by the correct use of *Output Enable(oe)*

The expected timing of a synchronous RAM was as expected of the waveform behaviour which confirmed the design is correctly implemented and with no glitches or unwanted transitions.

### Behavioural & Testbench :
BEHAVIOURAL OPERATION:

The contents of the RAM were created as a single sequential block:
 
    code: always @(posedge clk)
 
 Inside this block: 
 • The *reset* resets the output register.
 • *Read* takes data stored in memory and puts it in a registered output.
 • *Write* occurs when *we = 1*, the din is stored in *mem[addr]*.
 This provides complete synchrony of all operations like a normal digital RAM.
The outpuut is gated using:

     code: assign douut = oe ? dout_reg : 2'b00;

to ensure that the RAM acts in a realistic manner when it is on a shared bus.

TESTBENCH OPERATION:

The testbench provides the inputs to the RAM with a sequence of reset pulse, write cycles and read cycles

 it uses:

    code: $dumpfile("syn_ram_tb.vcd"); //create a cvd file
          $dumpvars(0, syn_ram_tb);
    
to produce waveform traces and completely check behaviour by waveform examination and readback values of the simulation.

Testbench includes controlled timing, clock generation and write the sequential operations followed by the read operaions to test the functionality of the RAM. This ensure that all the elements of RAM are tested.

## Conclusion:
The Synchronous RAM was successfully implemented and verified. The design supports Synchronous Write, Synchronous Read, Registered Output, Reset Control and Output Enable.
The behaviour of the RAM was consistent with the simulation and waveform analysis results, as the waveforms shows
• There was appropriate storage of data written at rising edges.
• After one clock cycle, Reads had the right values.
• Reset and OE were working properly.
The design is functional, dependable and clean. This establishes the correctness and compatibility of RAM module to work as a simple synchronous memory to be used in bigger digital systems.

# OUTPUT 

### GTKWAVE:

<img width="1456" height="891" alt="Image" src="https://github.com/user-attachments/assets/0ee86b89-b0cf-4951-a5bb-ce2d7d3641e4" />


### VS TERMINAL:

 <img width="1829" height="1066" alt="Image" src="https://github.com/user-attachments/assets/dec452cf-add7-4763-acb1-73299fc6c7ae" />
