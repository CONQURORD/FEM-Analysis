
for i=1:5
    a(i)=i*2;
    u(i)=femtwomod(a(i));
end

plot(a,u)
xlabel('number of elements')
ylabel('end displacement')
grid on