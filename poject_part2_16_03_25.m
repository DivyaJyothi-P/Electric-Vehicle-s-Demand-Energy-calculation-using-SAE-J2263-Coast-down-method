total_weight_lb=4750;
total_weight_lb_to_kg=4750*0.4536;
total_weight=2154.6;%kg
A=27.150;%(lbf)
B=0.2778;%(lbf/mph)
C=0.02345;%((lbf/mph)^2)
%******FTP drive cycle*******
US06_DATA=readtable('FTP_DATA.xlsx');
FTP_time_sec=US06_DATA{:,1};%sec
FTP_velocity_mph=US06_DATA{:,2};%mph
FTP_time_mits=FTP_time_sec/60;%minuts
FTP_velocity_mtps=FTP_velocity_mph*0.447;%m/s
FTP_acceleration_mtps=[diff(FTP_velocity_mtps)./diff(FTP_time_sec);0];%m/s^2
%calculating kinamatic power
kinamatic_power_W_FTP=total_weight.*FTP_velocity_mtps.*FTP_acceleration_mtps;%Watt
kinamatic_power_HP_FTP=kinamatic_power_W_FTP/745.7;%HP
A_N=A*4.45;%N
B_N_kph=(B*4.45)/1.609;%N/kmph
C_N_kph2=(C*4.45)/1.609^2;%N/kmph^2
FTP_velocity_kph=FTP_velocity_mph*1.609;%kmph
%calculating road load power
Road_load_power_FTP=(A_N+(B_N_kph*FTP_velocity_kph)+(C_N_kph2*FTP_velocity_kph.^2)).*FTP_velocity_kph;%N.kmph
Road_load_power_FTP_W=(Road_load_power_FTP*(5/18));%watt
Road_load_power_FTP_HP=Road_load_power_FTP_W/(745.7);%HP
vehicle_wheel_power_watt_FTP=kinamatic_power_W_FTP+Road_load_power_FTP_W;%watt
Vehile_wheel_power_positive_FTP=max(vehicle_wheel_power_watt_FTP,0);%watt
%calculating vehicle demand energy
vehicle_demand_energy_J_FTP=Vehile_wheel_power_positive_FTP.*FTP_time_sec;%J
Distance_mile=FTP_velocity_mph.*(FTP_time_sec/3600);%mile
total_Distance_mile_FTP=sum(Distance_mile,"all");%mile
total_vehicle_demand_energy_FTP=sum(vehicle_demand_energy_J_FTP,"all");%J
total_vehicle_demand_energy_MJpm_FTP=((total_vehicle_demand_energy_FTP/10^6)/total_Distance_mile_FTP);%MJ/mile

%****Highway drive cycle************%
HEFET_DATA=readtable('HEFET_DATA.xlsx');
HEFET_time_sec=HEFET_DATA{:,1};%sec
HEFET_velocity_mph=HEFET_DATA{:,2};%mph
HEFET_time_mits=HEFET_time_sec/60;%minuts
HEFET_velocity_mtps=HEFET_velocity_mph*0.447;%m/s
HEFET_acceleration_mtps=[diff(HEFET_velocity_mtps)./diff(HEFET_time_sec);0];%m/s^2
%calculating kinamatic power
kinamatic_power_W_HEFET=total_weight.*HEFET_velocity_mtps.*HEFET_acceleration_mtps;%Watt
kinamatic_power_HP_HEFET=kinamatic_power_W_HEFET/745.7;%HP
A_N=A*4.45;%N
B_N_kph=(B*4.45)/1.609;%N/kmph
C_N_kph2=(C*4.45)/1.609^2;%N/kmph^2
HEFET_velocity_kph=HEFET_velocity_mph*1.609;%kmph
%calculating road load power
Road_load_power_HEFET=(A_N+(B_N_kph*HEFET_velocity_kph)+(C_N_kph2*HEFET_velocity_kph.^2)).*HEFET_velocity_kph;%N.kmph
Road_load_power_W_HEFET=(Road_load_power_HEFET*(5/18));%watt
Road_load_power_HP_HEFET=Road_load_power_W_HEFET/(745.7);%HP
vehicle_wheel_power_watt_HEFET=kinamatic_power_W_HEFET+Road_load_power_W_HEFET;%watt
Vehile_wheel_power_positive_HEFET=max(vehicle_wheel_power_watt_HEFET,0);%watt
%calculating vehicle demand energy
vehicle_demand_energy_J_HEFET=Vehile_wheel_power_positive_HEFET.*HEFET_time_sec;%J
Distance_mile_HEFET=HEFET_velocity_mph.*(HEFET_time_sec/3600);%mile
total_Distance_mile_HEFET=sum(Distance_mile_HEFET,"all");%mile
total_vehicle_demand_energy_HEFET=sum(vehicle_demand_energy_J_HEFET,"all");%J
total_vehicle_demand_energy_MJpm_HEFET=((total_vehicle_demand_energy_HEFET/10^6)/total_Distance_mile_HEFET);%MJ/mile

%*******************US06 drive cycle************************************************************************
US06_DATA=readtable('US06.xlsx');
US06_time_sec=US06_DATA{:,1};%sec
US06_velocity_mph=US06_DATA{:,2};%mph
US06_time_mits=US06_time_sec/60;%minuts
US06_velocity_mtps=US06_velocity_mph*0.447;%m/s
US06_acceleration_mtps=[diff(US06_velocity_mtps)./diff(US06_time_sec);0];%m/s^2
%calculating kinamatic power
kinamatic_power_W_US06=total_weight.*US06_velocity_mtps.*US06_acceleration_mtps;%Watt
kinamatic_power_HP_US06=kinamatic_power_W_US06/745.7;%HP
A_N=A*4.45;%N
B_N_kph=(B*4.45)/1.609;%N/kmph
C_N_kph2=(C*4.45)/1.609^2;%N/kmph^2
US06_velocity_kph=US06_velocity_mph*1.609;%kmph
%calculating road load power
Road_load_power_US06=(A_N+(B_N_kph*US06_velocity_kph)+(C_N_kph2*US06_velocity_kph.^2)).*US06_velocity_kph;%N.kmph
Road_load_power_US06_W=(Road_load_power_US06*(5/18));%watt
Road_load_power_US06_HP=Road_load_power_US06_W/(745.7);%HP
vehicle_wheel_power_watt_US06=kinamatic_power_W_US06+Road_load_power_US06_W;%watt
Vehile_wheel_power_positive_US06=max(vehicle_wheel_power_watt_US06,0);%watt
%calculating vehicle demand energy
vehicle_demand_energy_J_US06=Vehile_wheel_power_positive_US06.*US06_time_sec;%J
Distance_mile=US06_velocity_mph.*(US06_time_sec/3600);%mile
total_Distance_mile_US06=sum(Distance_mile,"all");%mile
total_vehicle_demand_energy_US06=sum(vehicle_demand_energy_J_US06,"all");%J
total_vehicle_demand_energy_MJpm_US06=((total_vehicle_demand_energy_US06/10^6)/total_Distance_mile_US06);%MJ/mile

%**********************SC03 drive cycle*****************************************************
SC03_DATA=readtable('sco3.xlsx');
SC03_time_sec=SC03_DATA{:,1};%sec
SC03_velocity_mph=SC03_DATA{:,2};%mph
SC03_time_mits=SC03_time_sec/60;%minuts
SC03_velocity_mtps=SC03_velocity_mph*0.447;%m/s
SC03_acceleration_mtps=[diff(SC03_velocity_mtps)./diff(SC03_time_sec);0];%m/s^2
%calculating kinamatic power
kinamatic_power_W_SC03=total_weight.*SC03_velocity_mtps.*SC03_acceleration_mtps;%Watt
kinamatic_power_HP_SC03=kinamatic_power_W_SC03/745.7;%HP
A_N=A*4.45;%N
B_N_kph=(B*4.45)/1.609;%N/kmph
C_N_kph2=(C*4.45)/1.609^2;%N/kmph^2
SC03_velocity_kph=SC03_velocity_mph*1.609;%kmph
%calculating road load power
Road_load_power_SC03=(A_N+(B_N_kph*SC03_velocity_kph)+(C_N_kph2*SC03_velocity_kph.^2)).*SC03_velocity_kph;%N.kmph
Road_load_power_SC03_W=(Road_load_power_SC03*(5/18));%watt
Road_load_power_SC03_HP=Road_load_power_SC03_W/(745.7);%HP
vehicle_wheel_power_watt_SC03=kinamatic_power_W_SC03+Road_load_power_SC03_W;%watt
Vehile_wheel_power_positive_SC03=max(vehicle_wheel_power_watt_SC03,0);%watt
%calculating vehicle demand energy
vehicle_demand_energy_J_SC03=Vehile_wheel_power_positive_SC03.*SC03_time_sec;%J
Distance_mile=SC03_velocity_mph.*(SC03_time_sec/3600);%mile
total_Distance_mile_SC03=sum(Distance_mile,"all");%mile
total_vehicle_demand_energy_SC03=sum(vehicle_demand_energy_J_SC03,"all");%J
total_vehicle_demand_energy_MJpm_SC03=((total_vehicle_demand_energy_SC03/10^6)/total_Distance_mile_SC03);%MJ/mile
fprintf('total vehicle demand energy MJ/mile for SC03 drive cycle=%f\n',total_vehicle_demand_energy_MJpm_SC03)
fprintf('total vehicle demand energy MJ/mile for FTP drive cycle=%f\n',total_vehicle_demand_energy_MJpm_FTP)
fprintf('total vehicle demand energy MJ/mile for HEFET drive cycle=%f\n',total_vehicle_demand_energy_MJpm_HEFET)
fprintf('total vehicle demand energy MJ/mile for US06 drive cycle=%f\n',total_vehicle_demand_energy_MJpm_US06)
%******Plotting*****************************%
figure(1)
plot(FTP_time_mits,kinamatic_power_HP_FTP,'b')
xlabel('time(minuts)')
ylabel('kinamatic power(hp)')
legend('kinamatic power Vs time')
title('FTP: kinamatic power Vs time ')
figure(2)
plot(FTP_velocity_kph,Road_load_power_FTP_HP,'r','LineWidth',2)
xlabel('velocity(kmph)')
ylabel('Road load power(hp)')
title('FTP: Road load power Vs velocity')
legend('Road load power Vs velocity')
figure(3)
subplot(2,2,1)
plot((FTP_velocity_kph),(vehicle_demand_energy_J_FTP),'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('FTP: vehicle demand energy Vs velocity ')
subplot(2,2,2)
plot(sort(FTP_velocity_kph),sort(vehicle_demand_energy_J_FTP),'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('FTP:sorted vehicle demand energy Vs velocity ')
subplot(2,2,3)
plot(FTP_velocity_kph,vehicle_wheel_power_watt_FTP,'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('FTP: vehicle wheel power Vs velocity ')
subplot(2,2,4)
plot(sort(FTP_velocity_kph),sort(vehicle_wheel_power_watt_FTP),'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('FTP:sorted vehicle wheel power Vs velocity ')
figure(4)
plot(FTP_time_mits,vehicle_wheel_power_watt_FTP,'b')
xlabel('time(minuts')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs Time')
title('FTP:vehicle wheel power Vs Time ')

%**************************************************************
figure(21)
plot(HEFET_time_mits,kinamatic_power_HP_HEFET,'b')
xlabel('time(minuts)')
ylabel('kinamatic power(hp)')
legend('kinamatic power Vs time')
title('HEFET:kinamatic power Vs time')
figure(23)
plot(HEFET_velocity_kph,Road_load_power_HP_HEFET,'r','LineWidth',2)
xlabel('velocity(kmph)')
ylabel('Road load power(hp)')
title('HEFET: Road load power Vs velocity')
legend('Road load power Vs velocity')
figure(40)
subplot(2,2,1)
plot(HEFET_velocity_kph,vehicle_demand_energy_J_HEFET,'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('HEFET:vehicle demand energy Vs velocity ')
subplot(2,2,2)
plot(sort(HEFET_velocity_kph),sort(vehicle_demand_energy_J_HEFET),'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('HEFET:sorted vehicle demand energy Vs velocity ')
subplot(2,2,3)
plot((HEFET_velocity_kph),(vehicle_wheel_power_watt_HEFET),'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('HEFTP: vehicle wheel power Vs velocity ')
subplot(2,2,4)
plot(sort(HEFET_velocity_kph),sort(vehicle_wheel_power_watt_HEFET),'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('HEFTP:sorted vehicle wheel power Vs velocity ')
figure(24)
plot(HEFET_time_mits,vehicle_wheel_power_watt_HEFET,'b')
xlabel('time(minuts')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs Time')
title('HEFET:vehicle wheel power Vs Time ')

%******************************************************************
figure(31)
plot(US06_time_mits,kinamatic_power_HP_US06,'b')
xlabel('time(minuts)')
ylabel('kinamatic power(hp)')
legend('kinamatic power Vs time')
title('US06: kinamatic power Vs time ')
figure(32)
plot(US06_velocity_kph,Road_load_power_US06_HP,'r','LineWidth',2)
xlabel('velocity(kmph)')
ylabel('Road load power(hp)')
title('US06: Road load power Vs velocity')
legend('Road load power Vs velocity')
figure(33)
subplot(2,2,1)
plot((US06_velocity_kph),(vehicle_demand_energy_J_US06),'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('US06: vehicle demand energy Vs velocity ')
subplot(2,2,2)
plot(sort(US06_velocity_kph),sort(vehicle_demand_energy_J_US06),'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('US06:sorted vehicle demand energy Vs velocity ')
subplot(2,2,3)
plot(US06_velocity_kph,vehicle_wheel_power_watt_US06,'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('US06: vehicle wheel power Vs velocity ')
subplot(2,2,4)
plot(sort(US06_velocity_kph),sort(vehicle_wheel_power_watt_US06),'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('US06:sorted vehicle wheel power Vs velocity ')
figure(34)
plot(US06_time_mits,vehicle_wheel_power_watt_US06,'b')
xlabel('time(minuts')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs Time')
title('US06:vehicle wheel power Vs Time ')
%************************************************************************************************
figure(41)
plot(SC03_time_mits,kinamatic_power_HP_SC03,'b')
xlabel('time(minuts)')
ylabel('kinamatic power(hp)')
legend('kinamatic power Vs time')
title('SC03: kinamatic power Vs time ')
figure(42)
plot(SC03_velocity_kph,Road_load_power_SC03_HP,'r','LineWidth',2)
xlabel('velocity(kmph)')
ylabel('Road load power(hp)')
title('SC03: Road load power Vs velocity')
legend('Road load power Vs velocity')
figure(43)
subplot(2,2,1)
plot((SC03_velocity_kph),(vehicle_demand_energy_J_SC03),'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('SC03: vehicle demand energy Vs velocity ')
subplot(2,2,2)
plot(sort(SC03_velocity_kph),sort(vehicle_demand_energy_J_SC03),'b')
xlabel('velocity(kmph')
ylabel('vehicle demand energy')
legend('vehicle demand energy Vs velocity')
title('SC03:sorted vehicle demand energy Vs velocity ')
subplot(2,2,3)
plot(SC03_velocity_kph,vehicle_wheel_power_watt_SC03,'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('SC03: vehicle wheel power Vs velocity ')
subplot(2,2,4)
plot(sort(SC03_velocity_kph),sort(vehicle_wheel_power_watt_SC03),'b')
xlabel('velocity(kmph')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('SC03:sorted vehicle wheel power Vs velocity ')
figure(44)
plot(SC03_time_mits,vehicle_wheel_power_watt_SC03,'b')
xlabel('time(minuts')
ylabel('vehicle wheel power(W)')
legend('vehicle wheel power Vs Time')
title('SC03:vehicle wheel power Vs Time ')
%*****************************************
figure(5)
subplot(2,2,1)
plot(SC03_velocity_kph,Vehile_wheel_power_positive_SC03,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('SC03:positive vehicle wheel power  Vs velocity ')
subplot(2,2,2)
plot(US06_velocity_kph,Vehile_wheel_power_positive_US06,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('US06: positive vehicle wheel power Vs velocity ')
subplot(2,2,3)
plot(FTP_velocity_kph,Vehile_wheel_power_positive_FTP,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('FTP:positive vehicle wheel power Vs velocity ')
subplot(2,2,4)
plot(HEFET_velocity_kph,Vehile_wheel_power_positive_HEFET,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('HEFTP:positive vehicle wheel power  Vs velocity ')
figure(6)
subplot(2,2,1)
plot(SC03_time_mits,Vehile_wheel_power_positive_SC03,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('SC03:positive vehicle wheel power Vs velocity ')
subplot(2,2,2)
plot(US06_time_mits,Vehile_wheel_power_positive_US06,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('US06:positive vehicle wheel power Vs velocity ')
subplot(2,2,3)
plot(FTP_time_mits,Vehile_wheel_power_positive_FTP,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('FTP:positive vehicle wheel power Vs velocity ')
subplot(2,2,4)
plot(HEFET_time_mits,Vehile_wheel_power_positive_HEFET,'b')
xlabel('velocity(kmph')
ylabel('positive vehicle wheel power(W)')
legend('vehicle wheel power Vs velocity')
title('HEFET:positive vehicle wheel power Vs velocity ')
% ***********bar chart*************
figure(7)
Drive_cycle={'FTP','HEFET','US06','SC03'};
Vehicle_Demand_Energy=[total_vehicle_demand_energy_MJpm_FTP,total_vehicle_demand_energy_MJpm_HEFET,total_vehicle_demand_energy_MJpm_US06,total_vehicle_demand_energy_MJpm_SC03];
bar(Drive_cycle,Vehicle_Demand_Energy)
xlabel('Drive_cycle')
ylabel('Vehicle Demand Energy(MJ/mile)')
title('Vehicle Demand Energy vs Drive_cycle')


