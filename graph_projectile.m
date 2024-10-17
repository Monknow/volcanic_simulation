function graph_projectile(b, m, initial_velocity_x, initial_velocity_y, i)  
    g = 9.8;
    colors = [".r", ".g", ".b", ".c", ".k"];

    acceleration_x = @(t, v_x) (-b * v_x)/m; 
    acceleration_y = @(t, v_y) (-m*g - b * v_y)/m;
    % acceleration_y = @(t, v_y) (-m*g + 1/2 * 0.5 * 1.225 * 0.2286.^2 * pi* v_y.^2)/m;

    next_position_x = 0;
    next_position_y = 1666;

    next_velocity_x = initial_velocity_x;
    next_velocity_y = initial_velocity_y;
    
    t_start = 0;
    t_end = 60;
    
    n = 1000;
    h = (t_end - t_start)/n;
    
    t = [];

    x = [];
    v_x = [];
    a_x = [];

    y = [];
    v_y = [];
    a_y = [];

    index = 0;
    
    for next_t = t_start : h : t_end
        next_position_x = next_position_x + h * next_velocity_x;
        next_position_y = next_position_y + h * next_velocity_y;
        
        next_acceleration_x = acceleration_x(next_t, next_velocity_x);
        next_acceleration_y = acceleration_y(next_t, next_velocity_y);
    
        next_velocity_x = next_velocity_x + h * acceleration_x(next_t, next_velocity_x);
        next_velocity_y = next_velocity_y + h * acceleration_y(next_t, next_velocity_y);

        if next_position_y <= 0
            break
        end
    
        index = index + 1;
    
        t(index) = next_t;

        x(index) = next_position_x;
        v_x(index) = next_velocity_x;
        a_x(index) = next_acceleration_x;


        y(index) = next_position_y;
        v_y(index) = next_velocity_y;
        a_y(index) = next_acceleration_y;
    
        figure(1)
    
        
        plot(next_position_x, next_position_y, colors(i));
        hold on
    
    end

    figure

    subplot(3,2,1);
    plot(t, x, colors(i))
    xlabel("time (s)")
    ylabel("position x (m)")
    grid on
    hold on

    subplot(3,2,2);
    plot(t, y, colors(i))
    xlabel("time (s)")
    ylabel("position y (m)")
    grid on
    hold on

    subplot(3,2,3);
    plot(t, v_x, colors(i))
    xlabel("time (s)")
    ylabel("velocity x (m/s)")
    grid on
    hold on

    subplot(3,2,4);
    plot(t, v_y, colors(i))
    xlabel("time (s)")
    ylabel("velocity y (m/s)")
    grid on
    hold on

    subplot(3,2,5);
    plot(t, a_x, colors(i))
    xlabel("time (s)")
    ylabel("acceleration x (m/s^2)")
    grid on
    hold on


    subplot(3,2,6);
    plot(t, a_y, colors(i))
    xlabel("time (s)")
    ylabel("acceleration y (m/s^2)")
    grid on

    hold off
    
end

