%................................................................
% MATLAB codes for Finite Element Analysis
% Discrete_Systems.m

% clear memory

clear all  

% elementNodes: connections at elements

elementNodes=[1 2;2 3;2 3;2 4;3 4];

% numberElements: number of Elements

numberElements=size(elementNodes,1); 

% By using the MATLAB function size, that returns the number 
%of lines and columns of a rectangular matrix, we can detect 
%the number of elements by inspecting the number of lines of 
%matrix elementNodes.

% numberNodes: number of nodes

numberNodes=4;

% for structure:
% displacements: displacement vector
% force : force vector
% stiffness: stiffness matrix

% initializing the matrices

displacements=zeros(numberNodes,1);
force=zeros(numberNodes,1);
stiffness=zeros(numberNodes);

%stiffness values for the springs
k=[1 1 1 1 1];

% applied load 
force(2)=1;
force(3)=1;

% computation of the system stiffness matrix
% We compute now the stiffness matrix for each element in turn and then assemble
% it in the global stiffness matrix.

for e=1:numberElements
% elementDof: element degrees of freedom (Dof)
elementDof=elementNodes(e,:) ;
stiffness(elementDof,elementDof)=stiffness(elementDof,elementDof)+[k(e) -k(e);-k(e) k(e)];
end


% boundary conditions and solution
% prescribed dofs
prescribedDof=[1];
% free Dof : activeDof
activeDof=setdiff([1:numberNodes],[prescribedDof]);

for i=10:20
force(4)=i/10;
% solution
displacements=stiffness(activeDof,activeDof)\force(activeDof);
% positioning all displacements
displacements1=zeros(numberNodes,1);
displacements1(activeDof)=displacements;
disp1(i)=displacements1(2);
disp2(i)=displacements1(3);
disp3(i)=displacements1(4);
I(i)=i/10;
end

plot(I,disp1)
xlabel('R3')
ylabel('U1')
xlim([1,2])
grid on
figure()
plot(I,disp2)
xlabel('R3')
ylabel('U2')
xlim([1,2])
xlim([1,2])
grid on
figure()
plot(I,disp3)
xlabel('R3')
ylabel('U3')
xlim([1,2])
xlim([1,2])
grid on


