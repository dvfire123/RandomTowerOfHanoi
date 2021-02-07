function moves = getExpectedNumMoves(N)
    % Analytic Calculation of expected moves for Tower of Hanoi of N disks.
    states = towerStateGenerator(N);
    numStates = length(states);
    P = zeros(numStates, numStates); % P is the transition matrix
    for i = 1:numStates
       for j = 1:numStates
            if canTransit(states, i, j)
                P(i, j) = 1;
            end
       end
       % Normalize the row
       sumTransit = sum(P(i, :));
       if sumTransit > 0
           P(i, :) = P(i, :)/sumTransit; 
       end
    end
    
    % Now it's just linear algebra and Markov Chain theory
    Q = P(1:numStates-1, 1:numStates-1);
    F = (eye(numStates-1) - Q);
    tVec = F\ones(numStates-1, 1);
    
    moves = tVec(1);
end
