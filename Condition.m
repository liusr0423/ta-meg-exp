clear all
clc
targetBlockNames = {'no-targ','pres-pres','pres-abs','abs-pres','abs-abs'};

cueBlockNames = {'no-cue','1-1','1-2','2-1','2-2'}; % 2-1 = cueT2,postcueT1

[targetBlockOrder,cueBlockOrder] = block_gen( targetBlockNames ,cueBlockNames )

%%
% cue order
%pre-cue = T1 
A = [2,2,2,3]; % specify validity for cue = T1
cueBlockOrder_cue1 = repmat(A,1,4); % for all target conditions

%pre-cue = T2
B = [5,5,5,4]; % specify validity for cue = T2
cueBlockOrder_cue2 = repmat(B,1,4); % for all target conditions

cueBlockOrder = [cueBlockOrder_cue1 , cueBlockOrder_cue2];

% randomize cue order
indices = randperm(length(cueBlockOrder));
cueBlockOrder = cueBlockOrder(indices);

% target order
dummy = repmat(2:5,[4,1]);
targetBlockOrder_cue1 = dummy(:)';
targetBlockOrder = repmat(targetBlockOrder_cue1,[1,2]); % for all cue conditions

% randomize target order
targetBlockOrder = targetBlockOrder(indices);

% insert blank trials every 4 target trials for target and cue block order
blank = ones(1,(length(targetBlockOrder)/4)+1);
ind = zeros(1, length(targetBlockOrder)+ length(blank));

ind (1:5:41) = blank;
ind2 = ind;
ind(find(ind==0)) = targetBlockOrder;
ind2(find(ind2==0)) = cueBlockOrder;
targetBlockOrder = ind
cueBlockOrder = ind2


% each trial: all possible combinations
% cue T1 cueBlockOrder = [2,2,2,3] % should be in random order
% 2 = valid x 3times each target order , 3 = invalid x 1time each target order (75%valid)
% targetBlockOrder = [4,4,4,4] 

% cue T1 cueBlockOrder = [2,2,2,3] 
% targetBlockOrder = [2,2,2,2]

% cue T1 cueBlockOrder = [2,2,2,3] 
% targetBlockOrder = [5,5,5,5] 

% cue T1 cueBlockOrder = [2,2,2,3] 
% targetBlockOrder = [3,3,3,3]

% cue T2 cueBlockOrder = [5,5,5,4]
% 4 = valid x 3times each target order , 3 = invalid x 1time each target order (75%valid)
% targetBlockOrder = [4,4,4,4] 

% cue T2 cueBlockOrder = [5,5,5,4]
% targetBlockOrder = [2,2,2,2]

% cue T2 cueBlockOrder = [5,5,5,4]
% targetBlockOrder = [5,5,5,5] 

% cue T2 cueBlockOrder = [5,5,5,4]
% targetBlockOrder = [3,3,3,3]



