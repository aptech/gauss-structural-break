October 26,2004


This package contains 3 files:

1) r_break.prg 

This is the main program where you set up your data and options.
The current setup is model 1 in the paper "Estimating restricted structrual change models"
(Pierre Perron and Zhongjun Qu).

The structure of the program is such that what to do should be self explanatory after
reading our paper.

Note that we offer two ways to formulate the restrictions. The user may choose whatever 
is convenient. The first way is to write the restrictions as Delta=S*teta+ss. 
The alternative way is to write R*delta=rr (Refer to the paper for the details).

The program does three things: 1) Estimate the restricted model,returning the confidence interval
for the breaks and the standard error of the coefficients. 2) Compute the sup-F test for breaks with restrictions.
3) Simulate the critical values of the restricted structrual change sup-F test.

2) r_brcode.src

This is the main code. You should not have to modify it.

3) data.dat: a data file included as an example (it is a realization from Model 1 used in our paper).

A lot of effort has been put to construct this program and we would appreciate that you acknowledge
using this code in your research and cite the relevant paper on which it is based:

Pierre Perron and Zhongjun Qu (2004), "Estimating restricted structural change models",
manuscript, Boston University.

Although a lot of efforts has been put in constructing the program, we cannot be held responsible
for any consequences that could result from remaining errors.

Comments about errors, possible improvements and so on are most welcomed and should be
directed to Pierre Perron at perron@bu.edu or Zhongjun Qu at qu@bu.edu.


