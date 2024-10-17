% Volcano Drawing

top_side_x = -270:0.1:270;
top_side_y = 1600 + top_side_x * 0;

left_side_x = -2000:0.1:-270;
left_side_y = 1.0005.^(left_side_x+16000)-1000;

right_side_x = 270:0.1:2000;
right_side_y = 1.0005.^(-right_side_x+16000)-1000;

figure(1)

plot(left_side_x, left_side_y, "r", LineWidth=2), hold on
plot(right_side_x, right_side_y, "r", LineWidth=2), hold on
plot(top_side_x, top_side_y, "r", LineWidth=2), hold on


% Tephra Simulation

b = [0 2.5 4.5 6.5 8.5];
m = [50 25 50 75 100];

for i = 1:5
    % m = 20 + (150-20).*rand(1,1);
    initial_velocity_y = 20 + (60-20).*rand(1,1);
    initial_velocity_x = -60 + (60+60).*rand(1,1);

    graph_projectile(b(i), m(i), initial_velocity_x, initial_velocity_y, i)
end 
