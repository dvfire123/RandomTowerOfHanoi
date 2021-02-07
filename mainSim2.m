% Simulate random Hanoi Tower solve moves
clear;
clc;
close all;

%% main script
simCount = 1e6;
N = 3;
moveVec = NaN(simCount, 1);
for k = 1:simCount
     moveVec(k) = getNumMoves(N);
     fprintf('Done trial %d\n', k);
end

expectedMoves = sum(moveVec) / simCount;

%% Process Bar Graph
figure;
bar(moveVec);
