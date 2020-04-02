path = '/Users/marpero3/COVID-19/COVID-19/csse_covid_19_data/csse_covid_19_time_series/';
name_file_1 ='time_series_covid19_';
name_file_2 ='_global';
extension = '.csv';
file_of_confirmed = strcat(path, name_file_1, 'confirmed', name_file_2, extension);
file_of_death = strcat(path, name_file_1, 'deaths', name_file_2, extension);
file_of_recovered = strcat(path, name_file_1, 'recovered', name_file_2, extension);

fig = strcat(name_file_1, 'spain.png');

DataConfirmed = importdata(file_of_confirmed,',',1);
DataDeath = importdata(file_of_death,',',1);
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
xlabel('Dia des de que van començar a contar els xinesos')
ylabel('Nombre de casos en Espanya')
h = legend ("Confirmats","Recuperats","Morts","northwest");
legend (h, "location", "northwest");
saveas(gcf, fig)
