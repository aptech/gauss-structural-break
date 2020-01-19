@
This version: November 20, 2004.
These routines can be used by and distributed for non-profit academic purposes
without any royalty except that the users must cite:
Pierre Perron and Zhongjun Qu (2004): "Estimating restricted structural change models", manuscript, Boston University.
and acknowledge the use of this code.

Even though we tried to make this program error-free we cannot be held
responsible for any consequences that could result from remaining errors.
@

new;
format /ld 6,3; 
cls;

@Main inputs to run the program@

output file = br-out.out reset;     @select your output file@

@number of observations@

bigt=120;

@Set up data, y is the dependent variable, z are the regressors@

load y[bigt,1] = data.dat;      @read data@
z=ones(bigt,1);

@ number of regressors in a single regime, q@
q=1; 
@ number of breaks under the alternative@
m=3; 

@Specification of the Restrictions.

There are two possible ways to specify the restrictions (see paper for details):

A) Form delta=S*teta+ss;
B) Form R*delta=rr;

Start by specifying what form you will use (put a 1 for the form used and a 0 for the other)@

forma=0;
formb=1;

@ for unrestricted model, put forma=1, formb=0, SS as identity matrix and ss a matrix of zeros
 e.g.
S={ 1 0 0 0, 0 1 0 0, 0 0 1 0, 0 0 0 1};
ss={0, 0, 0, 0};
@

@Setup the restriction matrix and vector (put anything for the form not used)@

@ S should be a matrix of full row rank@
S={1 0 1 0, 0 1 0 1};
S=S';
ss={0,0,0,0};

@ R should be a matrix of full row rank@
R={1 0 -1 0, 0 1 0 -1};
rr=0;
R0={0};

@Specify the implied restrictions when no breaks are present. 
This is not zero when you have within regime restrictions that are identical across all regimes.
If you have no such restrictions use the specifications below.@

S0={1};
ss0=0;
R0={0};
rr0=0;

@Select the procedures you want to perform. Put a 1 for yes, a 0 for no.@

doestim=1;                 @to estimate the parameters and confidence intervals@
dotest=1;                  @to construct the sup-F test@
docv=1;                    @to simulate the critical values of the asymptotic distribution of the test.
                            Warning: this can be quite long.@

@Other options@

robust=1;            @set to 1 if you want the confidence intervals 
                                to be robust to the presence of autocorrelation and 
                                heteroskedasticity in the residuals, 0 otherwise.
                               The method used is Andrews(1991) automatic
                               bandwidth with AR(1) approximation and the
                               quadratic quernel. Note: Do not set to 1 if
                               lagged dependent variables are included as regressors.@

prewhit=0;          @when robust=1, set to 1 if you want to apply AR(1) prewhitening
                                prior to estimating the long run covariance  matrix@

hetvar=1;              @Option for the construction of the F-tests.
                                 Set to 1 if want to allow for the variance of the residuals
                                 to be different across segments. if hetvar=0, the variance
                                 of the residuals is assumed constant across segments
                                 and constructed from the full sample.@
Tstar=500;       @ Sample size used to construct the Weiner process to simulate the
                             asymptotic distribution of the sup-F test. 
                             Tstar=500 yields reasonable approximations for the models we considered.
                             Warning: the value of Tstar is the main factor influencing the time it takes for the 
                              procedure to complete.  At T=500, it can already take a few hours.@
rep=2000;          @ number of replications used to get the quantiles of the asymptotic distribution 
                               of the sup-F test.  2000 should be enough, but a larger number would yield more accurate estimates.@

trm=0.10;               @ trimming parameter that specifes the minimal lenght of a segment as 
                                 a proportion of the sample size.@
                         


call mainp(m,q,z,y,trm,robust,prewhit,hetvar,S,ss,S0,ss0,R,rr,R0,rr0,doestim,dotest,docv,Tstar,rep,bigt,forma,formb);

@set the path to where you store the file brcode.src@

#include r_break.src;           

end;
