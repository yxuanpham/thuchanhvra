function Example002()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
strMessage='\n Nhap m:';
m = input(strMessage);
strMessage='\n Nhap n:';
n=input(strMessage);
a = ones(m,n)
b = zeros(m,n)
c = eye(m,n)
d = randi([-10,10],m,n)
a(1, 1) = 5
e = size(a)
end

