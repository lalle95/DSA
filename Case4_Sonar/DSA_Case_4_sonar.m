clc
clear
close all
fs=48000;
ts=1/fs;

%DSA Case Opgave 4

%Indlæsning af data
data_0_30=importdata('0_30m.dat');
data_1=importdata('1m.dat');
data_2=importdata('2m.dat');
dataOriginal=importdata('minFil.dat');

dataOriginal=myhex2dec(dataOriginal); %Konverteres fra hex til decimal

%Definition af frekvensakser
N2=length(data_2);
N1=length(data_1);
N0_30=length(data_0_30);

f_res_2=fs/N2;
f_axis_2=(0:f_res_2:fs-f_res_2);

f_res_1=fs/N1;
f_axis_1=(0:f_res_1:fs-f_res_1);

f_res_0_30=fs/N0_30;
f_axis_0_30=(0:f_res_0_30:fs-f_res_0_30);

%Plotning i tidsdomæne
figure(1);
subplot(311);
plot(data_2);
xlim([0 2500]);
title('Tidsdomæne 2m');
subplot(312);
plot(data_1);
xlim([0 2500]);
title('Tidsdomæne 1m');
subplot(313);
plot(data_0_30);
xlim([0 2500]);
title('Tidsdomæne 0.30m');

%Placeholders til krydskorrelationerne
mycrosscor2m=zeros(1,length(data_2)+length(dataOriginal)); %Placeholder
mycrosscor1m=zeros(1,length(data_1)+length(dataOriginal)); %Placeholder
mycrosscor0_30m=zeros(1,length(data_0_30)+length(dataOriginal)); %Placeholder

%Crosscorrelation 2m
for n=1:(length(data_2)-length(dataOriginal))
    sum=0;
    for k=1:length(dataOriginal)
        sum=sum+dataOriginal(k)*data_2(n+k);
    end
    mycrosscor2m(n)=sum;
end

%Crosscorrelation 1m
for n=1:(length(data_1)-length(dataOriginal))
    sum=0;
    for k=1:length(dataOriginal)
        sum=sum+dataOriginal(k)*data_1(n+k);
    end
    mycrosscor1m(n)=sum;
end

%Crosscorrelation 0.30m
for n=1:(length(data_0_30)-length(dataOriginal))
    sum=0;
    for k=1:length(dataOriginal)
        sum=sum+dataOriginal(k)*data_0_30(n+k);
    end
    mycrosscor0_30m(n)=sum;
end

%plotning af frekvensspektre
figure(2);
%2m
subplot(311);
plot(f_axis_2,abs(fft(data_2)));
xlim([0 fs/2]);
ylim([0 100]);
xlabel('Hz');
title('Frekvensspektrum - 2m');

%1m
subplot(312);
plot(f_axis_1,abs(fft(data_1)));
xlim([0 fs/2]);
ylim([0 100]);
xlabel('Hz');
title('Frekvensspektrum - 1m');


%0.30m
subplot(313);
plot(f_axis_0_30,abs(fft(data_0_30)));
xlim([0 fs/2]);
ylim([0 100]);
xlabel('Hz');
title('Frekvensspektrum - 0.30m');

%Plotning af krydskorrelation
%2m
figure(3);
plot(mycrosscor2m);
title('Crosscorrelation - 2m');
xlim([0 1000])

%1m
figure(4);
plot(mycrosscor1m);
title('Crosscorrelation - 1m');
xlim([0 500])

%0.30m
figure(5);
plot(mycrosscor0_30m);
title('Crosscorrelation - 0.30m');
xlim([0 280])

%Udregning af afstande
V_l=343; %Lydens hastighed i luft (m/s)
mps=ts*V_l/2; %Meter pr. sample.

%Delay i samples er aflæst som afstanden imellem bølgetoppe på
%krydskorrelationen.

%0.30m
d_samples_0_30m=190-136; %Delay i samples
afstand_0_30m=d_samples_0_30m*mps; %Udregnet afstand (m)

%1m
d_samples_1m=310-136; %Delay i samples
afstand_1m_2=d_samples_1m*mps; %Udregnet afstand (m)

%2m
d_samples_2m=650-132; %Delay i samples
afstand_2m=d_samples_2m*mps; %Udregnet afstand (m)
