path = '/Users/marpero3/COVID-19/COVID-19/csse_covid_19_data/csse_covid_19_time_series/';
name_file_1 ='time_series_covid19_';
name_file_2 ='_global';
extension = '.csv';
file_of_confirmed = strcat(path, name_file_1, 'confirmed', name_file_2, extension);
file_of_death = strcat(path, name_file_1, 'deaths', name_file_2, extension);
file_of_recovered = strcat(path, name_file_1, 'recovered', name_file_2, extension);
fig = strcat(name_file_1, 'spain.png');
fig2 = strcat(name_file_1, 'global.png');
fig3 = strcat(name_file_1, 'daily_spain.png');


textXlabel = 'Dies';

DataConfirmed = importdata(file_of_confirmed,',',1);
DataDeath = importdata(file_of_death,',',1);
DataRecovered = importdata(file_of_recovered,',',1);

indexSpain = 227;

ConfirmedSpain = DataConfirmed.data(indexSpain,:);
ConfirmedSpain(1:3) = [];
Date = 1:length(ConfirmedSpain);

length(ConfirmedSpain);

textDies = strcat('Dies acumulats:  ', num2str(length(ConfirmedSpain)));

DeathSpain = DataDeath.data(indexSpain,:);
DeathSpain(1:3) = [];

RecoveredSpain = DataRecovered.data(214,:);
RecoveredSpain(1:3) = [];

ConfirmedSpain(ConfirmedSpain<=0) = NaN;
RecoveredSpain(RecoveredSpain<=0) = NaN;
DeathSpain(DeathSpain<=0) = NaN;

figure;
semilogy(Date,ConfirmedSpain,'*b',Date,RecoveredSpain,'*g',Date,DeathSpain,'*r');
legend ("Confirmats","Recuperats","Morts","location","northwest");
text (pi, 10, ctime (time ()));
text (pi, 20, textDies);
xlabel(textXlabel);
ylabel('Nombre de casos en Espanya');
saveas(gcf, fig);

ConfirmedGlobalMatrix = DataConfirmed.data(:,:);
ConfirmedGlobalMatrix(:,1:3) = [];
ConfirmedGlobalMatrix(:,1);
ConfirmedGlobal = sum(ConfirmedGlobalMatrix);

DateGlobal = 1:length(ConfirmedGlobal);

DeathGlobalMatrix = DataDeath.data(:,:);
DeathGlobalMatrix(:,1:3) = [];
DeathGlobal = sum(DeathGlobalMatrix);

RecoveredGlobalMatrix = DataRecovered.data(:,:);
RecoveredGlobalMatrix(:,1:3) = [];
RecoveredGlobal = sum(RecoveredGlobalMatrix);

figure;
semilogy(DateGlobal,ConfirmedGlobal,'*b',DateGlobal,RecoveredGlobal,'*g',DateGlobal,DeathGlobal,'*r');
legend ("Confirmats","Recuperats","Morts", "location", "northwest");
text (pi, 200000, ctime (time ()));
text (pi, 400000, textDies);
xlabel(textXlabel);
ylabel('Nombre de casos global');
saveas(gcf, fig2);

ConfirmedSpainAux = ConfirmedSpain;
ConfirmedSpainAux(1) = [];
ConfirmedSpain(length(ConfirmedSpain)) = [];
DailyConfirmedSpain = ConfirmedSpainAux - ConfirmedSpain;

DeathSpainAux = DeathSpain;
DeathSpainAux(1) = [];
DeathSpain(length(DeathSpain)) = [];
DailyDeathSpain = DeathSpainAux - DeathSpain;

RecoveredSpainAux = RecoveredSpain;
RecoveredSpainAux(1) = [];
RecoveredSpain(length(RecoveredSpain)) = [];
DailyRecoveredSpain = RecoveredSpainAux - RecoveredSpain;

DateDaily = 1:length(DailyRecoveredSpain);

figure;
p1 = plot(DateDaily,DailyConfirmedSpain,'-b',"linewidth",2,DateDaily,DailyRecoveredSpain,'-g',"linewidth",2,DateDaily,DailyDeathSpain,'-r',"linewidth",2);
legend ("Confirmats","Recuperats","Morts", "location", "northwest");
text (pi, 1000, ctime (time ()));
text (pi, 1800, textDies);
xlabel(textXlabel);
ylabel('Nombre de casos diaris Espanya');
saveas(gcf, fig3);

close all


