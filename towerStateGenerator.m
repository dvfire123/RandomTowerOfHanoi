function states = towerStateGenerator(N)
    % This function returns a cell array of all possible states in a Hanoi
    % Tower configuration of N disks.
    % Recursion will be used.
    
    if N == 1
       states = {
           [1 0 0]; 
           [0 1 0];
           [0 0 1];
       };
   
       return;
    end
    
    stateSize = N*3;
    newStates = cell(stateSize, 1);
    prevStates = towerStateGenerator(N - 1);
    for k = 0:length(prevStates)-1
        prevState = prevStates{k+1};
        for j = 1:3
            newState = [zeros(1, 3); prevState];
            newState(1, j) = N;
            downIdx = 1;
            while downIdx < N && newState(downIdx + 1, j) == 0
                % Ensure no gaps between disks
                newState(downIdx + 1, j) =  newState(downIdx, j);
                newState(downIdx, j) = 0;
                downIdx = downIdx + 1;
            end
            newStates{k*3 + j} = newState;
        end
    end
    
    states = newStates;
end
