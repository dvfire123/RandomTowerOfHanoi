function res = canTransit(states, i, j)
    % Given the list of states, determine whether state i can transit to
    % state j
    
    % Conditions of transter:
    % 1) One and only one disk moved
    % 2) The moved disk is from the top of a pole
    % 3) Destination pole has that disk being the top disk legally
    
    if i == j
        res = false;
        return;
    end
    
    s1 = states{i};
    s2 = states{j};
    
    movePattern = (s1 ~= s2);
    if sum(sum(movePattern)) ~= 2
        % No disk or more than 1 disk moved
        res = false;
        return;
    end
        
    % Look at whether one of the moved disks is the top disk
    moveVec = s1(movePattern);  % Two by 1 vector in which one is non-zero
    % The edge case of two disks "swapping" is also no good
    if all(moveVec)
        % Swap case: no good!
        res = false;
        return;
    end
    diskMoved = moveVec(moveVec ~= 0);
    for pole = 1:3
       [maxDisk, diskIdx] = max(s1(:, pole));
       if maxDisk ~= diskMoved
           continue;
       end
       
       % Pole is the original pole where the moved disk occurred.  Ensure
       % that it is the top disk
       for i = 1:diskIdx-1
           pos = s1(i, pole);
           if pos ~= 0
               res = false;
               return;
           end
       end
       break;
    end
    
    % Now look at the new state to ensure that the moved disk does not have
    % any larger disks on top of it.
    for pole = 1:3
       [maxDisk, diskIdx] = max(s2(:, pole));
       if maxDisk ~= diskMoved
           continue;
       end
       
       % Pole is the original pole where the moved disk occurred.  Ensure
       % that it is the top disk and no smaller disk is beneath it.
       % Size of disk is inversely ordered.
       for i = 1:diskIdx-1
           pos = s2(i, pole);
           if pos ~= 0 
               res = false;
               return;
           end
       end
       
       for i = diskIdx+1:length(s2(:, pole))
           pos = s2(i, pole);
           if pos > diskMoved
               res = false;
               return;
           end
       end
       
       break;
    end
    
    res = true;
end