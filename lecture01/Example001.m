function Example001()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
a = rand();
fprintf('\n ...: [%8.3f]', a);
r = randi([1 10]);
fprintf('\n ...[1 10]: [%d]',r);
rArray = randi([-10  10], 1, 10);
fprintf('\n ...:%d.',size(rArray,2));
fprintf('\n Mang duoc tao la: ');
fprintf('[%2d]', rArray);
end

