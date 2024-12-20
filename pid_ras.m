%% Constants
close all;
clear all;
a1 = 2;
a2 = 2;
b = 0.5;
c = 0.75;
xref = 5;

model = 'train_ras';
load_system(model);

%% Experiment 1 : P Control
Kp = 10;
Kd = 0;
Ki = 0;

control_out = sim(model);

figure;
plot(control_out.position,'DisplayName','Position','LineWidth',2);
grid on;
ylabel('Output');
title('Position')
legend('Location','northwest','FontSize',11);


figure;
plot(control_out.error,'DisplayName','Error','LineWidth',2);
grid on;
ylabel('Rosition Error');
title('Closed-loop Response')
legend('FontSize',11);

%% Experiment 2 : PD Control
Kp = 20;
Kd = 10;
Ki = 0;

control_out = sim(model);

figure;
plot(control_out.position,'DisplayName','Position','LineWidth',2);
grid on;
ylabel('Output');
title('Position')
legend('Location','northwest','FontSize',11);

figure;
plot(control_out.error,'DisplayName','Error','LineWidth',2);
grid on;
ylabel('Position error');
title('Closed-loop Response')
legend('FontSize',11);

%% Experiment 3 : PI Control
Kp = 15;
Kd = 0;
Ki = 10;

control_out = sim(model);

figure;
plot(control_out.position,'DisplayName','Position','LineWidth',2);
grid on;
ylabel('Output');
title('Position')
legend('Location','northwest','FontSize',11);

figure;
plot(control_out.error,'DisplayName','Error','LineWidth',2);
grid on;
ylabel('Position error');
title('Closed-loop Response')
legend('FontSize',11);


%% Experiment 4 : PID Control
Kp = 15;
Kd = 7;
Ki = 9;

control_out = sim(model);

figure;
plot(control_out.position,'DisplayName','Position','LineWidth',2);
grid on;
ylabel('Output');
title('Position')
legend('Location','northwest','FontSize',11);

figure;
plot(control_out.error,'DisplayName','Error','LineWidth',2);
grid on;
ylabel('Position error');
title('Closed-loop Response')
legend('FontSize',11);
