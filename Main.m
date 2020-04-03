path = '/Users/marpero3/COVID-19/COVID-19/csse_covid_19_data/csse_covid_19_time_series/';
name_file_1 ='time_series_covid19_';
name_file_2 ='_global';
extension = '.csv';
file_of_confirmed = strcat(path, name_file_1, 'confirmed', name_file_2, extension);
file_of_death = strcat(path, name_file_1, 'deaths', name_file_2, extension);
file_of_recovered = strcat(path, name_file_1, 'recovered', name_file_2, extension);
fig = strcat(name_file_1, 'spain.png');
fig2 = strcat(name_file_1, 'global.png');

DataConfirmed = importdata(file_of_confirmed,',',1);
DataDeath = importdata(file_of_death,',',1);
DataRecovered = importdata(file_of_recovered,',',1);
DataRecovered = importdata(file_of_recovered,',',1);

indexSpain = 202;

ConfirmedSpain = DataConfirmed.data(indexSpain,:);
ConfirmedSpain(1:3) = [];
Date = 1:length(ConfirmedSpain)

DeathSpain = DataDeath.data(indexSpain,:);
DeathSpain(1:3) = [];

RecoveredSpain = DataRecovered.data(200,:);
RecoveredSpain(1:3) = [];

figure
semilogy(Date,ConfirmedSpain,'*b',Date,RecoveredSpain,'*g',Date,DeathSpain,'*r')
h = legend ("Confirmats","Recuperats","Morts","northwest");
legend (h, "location", "northwest");
xlabel('Dia des de que van començar a contar els xinesos')
ylabel('Nombre de casos en Espanya')
saveas(gcf, fig)

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

figure
semilogy(DateGlobal,ConfirmedGlobal,'*b',DateGlobal,RecoveredGlobal,'*g',DateGlobal,DeathGlobal,'*r')
%semilogy(DateGlobal,ConfirmedGlobal,'*b')
h2 = legend ("Confirmats","Recuperats","Morts","northwest");
legend (h2, "location", "northwest");
xlabel('Dia des de que van començar a contar els xinesos')
ylabel('Nombre de casos global')
saveas(gcf, fig2)
