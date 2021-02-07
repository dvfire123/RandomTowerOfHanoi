function moves = getNumMoves(N)
    % One simulation of number of moves to solve the Tower of Hanoi of N
    % disks.
    % Note: the minimum moves required is 2^N - 1
    
    % The tower is represented as an N by 3 matrix.  An entry with a
    % non-zero indicates the presence of a disk, and 0 otherwise.  The
    % first column shall be the starting column and the last column being
    % the final (goal) column. In any column, no non-zeros can be below any
    % other non-zeros of greater value.
    tower = zeros(N, 3);
    tower(:, 1) = (1:N)';
    
    moves = 0;
    % Now we start to count the moves
    while ~isTowerSolved(tower)
        moveList = populateMoves(tower);
        numPosMoves = length(moveList);
        moveLotto = randperm(numPosMoves); % Shuffle the moves
        moveIdx = moveLotto(1);
        tower = moveList{moveIdx};
        
        moves = moves + 1;
    end
end
