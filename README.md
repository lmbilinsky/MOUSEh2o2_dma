1. Update to the model: for increased realism, the per-cell death rate of hepatocytes is now 0 if the intracellular h2o2 concentration, [h2o2], is less than 1 micromolar. Otherwise, it is as described in the paper.

2. To reproduce the in vivo arsenic simulations in ``A Computational Model of Endogenous Hydrogen Peroxide Metabolism in Hepatocytes, Featuring a Critical Role for GSH," run the Matlab script MOUSEh2o2_dma.m. All other .m files (which calculate reaction and transport velocities) in this repository are called by this master script and should be stored in the same directory/folder as it.

3. If you are not interested in the arsenic application, and just want access to the in vivo computational model of endogenous H2O2 metabolism in mouse liver, please see the repository MOUSEh2o2.

4. If you wish to conjoin the in vivo computational model of endogenous H2O2 metabolism in mouse liver to an in vivo PK/TK model for another ROS-generating xenobiotic to create a new PBPK/PD model, change the name of MOUSEh2o2_dma.m to MOUSEh2o2_(xenobiotic name).m. Delete all reference to the arsenicals, including in equation 232
(equation governing cytoplasmic H2O2 concentration). Insert the PK/TK equations for the new xenobiotic. Liver must be among the modeled organs. Then, an in vitro PBPK/PD model must be constructed (please see the README.md file for the repository RATh2o2_dma3) and identified. This requires that data sets, analogous to those collected by Naranmandura for DMA3, be available for the xenobiotic of interest. Once this in vitro PBPK/PD model has been identified, the function f relating intracellular xenobiotic concentration to the rate of excess H2O2 production should be inserted into the analogous equation in MOUSEh2o2_(xenobiotic name).m. This produces the in vivo PBPK/PD model.

5. In the future, I will be uploading a mouse version of the in vitro computational model of endogenous H2O2 metabolism in hepatocytes, for use in developing in vitro
PBPK/PD models for mouse hepatocytes. This is important because, to create an in vivo PBPK/PD model for the impact on mouse liver of a xenobiotic, the critical function f should be identified by fitting the *mouse* version of an in vitro PBPK/PD model to mouse-specific data sets (Naranmandura used rat hepatocytes). Note that mouse and rat hepatocytes are not metabolically identical (for example, GSH content is slightly greater in mouse hepatocytes).

6. VERY IMPORTANT: the in vitro experiments should use exposure levels that translate into intracellular xenobiotic concentrations that are in the ballpark of what is
predicted in liver using the in vivo PK/TK model, for the dose range of interest. This is because we will not know how to extrapolate f far outside of the intracellular concentration range over which it was identified. This is probably the major reason that the in vivo PBPK/PD model presented here is not accurate enough to be viewed
as anything more than a proof of concept.  
