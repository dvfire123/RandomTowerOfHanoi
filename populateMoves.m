function moveList = populateMoves(tower)
    % Given the tower, generate the list of possible moves as the next
    % states of the tower in a cell array
    % Assume the tower has three poles.
    moveList = cell(6, 1); % At most six moves possible
    moveListCounter = 1;
    
    for k = 1:3
       % For each pole, look at whether
       % a) there is a disk
       % b) it can be moved to any of the other two disks legally
       curPole = tower(:, k);
       res = find(curPole ~= 0);
       if isempty(res)
           continue;
       end
       
       firstDiskIdx = res(1);
       diskVal = tower(firstDiskIdx, k);
       
       % Look at possible transfer poles
       for j = 1:3
           if j == k
               continue;
           end
           
           nextTower = tower;
           newPole = tower(:, j);
           resNew = find(newPole ~= 0);
           if isempty(resNew)
               % The transfer pole is empty--We can move our disk onto
               % there!
               nextTower(firstDiskIdx, k) = 0;
               nextTower(end, j) = diskVal; % Put it on the last row
               moveList{moveListCounter} = nextTower;
               moveListCounter = moveListCounter + 1;
               continue;
           end

           firstNewDiskIdx = resNew(1);
           diskValNew = tower(firstNewDiskIdx, j);
           
           if diskValNew > diskVal
               % The new pole's disk is bigger than the current pole: we can transfer
               nextTower(firstDiskIdx, k) = 0;
               nextTower(firstNewDiskIdx-1, j) = diskVal; % Always possible
               moveList{moveListCounter} = nextTower;
               moveListCounter = moveListCounter + 1;
           end
       end
           
    end
    
    % Remove unpopulated moves
    moveList = moveList(~cellfun('isempty',moveList));
end

