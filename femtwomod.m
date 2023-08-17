function [finaldisplacement] = femtwomod(n)
% MATLAB codes for Finite Element Analysis
% Discrete_Systems.m


% elementNodes: connections at elements
numberElements=n;
elementNodes=elements(numberElements);

% numberElements: number of Elements 

% By using the MATLAB function size, that returns the number 
%of lines and columns of a rectangular matrix, we can detect 
%the number of elements by inspecting the number of lines of 
%matrix elementNodes.

% numberNodes: number of nodes

numberNodes=numberElements+1;

% for structure:
% displacements: displacement vector
% force : force vector
% stiffness: stiffness matrix

% initializing the matrices

displacements=zeros(numberNodes,1);
force=zeros(numberNodes,1);
stiffness=zeros(numberNodes);

%stiffness values for the springs
k=stiffnesscalc(numberElements);

% applied load 
force(numberNodes)=100;


% computation of the system stiffness matrix
% We compute now the stiffness matrix for each element in turn and then assemble
% it in the global stiffness matrix.

for e=1:numberElements;
% elementDof: element degrees of freedom (Dof)
elementDof=elementNodes(e,:) ;
stiffness(elementDof,elementDof)=stiffness(elementDof,elementDof)+[k(e) -k(e);-k(e) k(e)];
end


% boundary conditions and solution
% prescribed dofs
prescribedDof=[1];
% free Dof : activeDof
activeDof=setdiff([1:numberNodes],[prescribedDof]);

% solution
displacements=stiffness(activeDof,activeDof)\force(activeDof);
% positioning all displacements
displacements1=zeros(numberNodes,1);
displacements1(activeDof)=displacements;
finaldisplacement=displacements1(numberNodes);
