function solved = isTowerSolved(tower)
    % Given the current tower state, determine if it is solved
    goalTower = zeros(size(tower));
    [N, ~] = size(goalTower);
    goalTower(:, end) = (1:N)';
    
    solved = all(all(tower == goalTower));
end