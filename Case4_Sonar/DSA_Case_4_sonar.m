clc
clear
close all
fs=48000;

%DSA Case Opgave 4

%Indlæsning af data
data_0_30=importdata('0_30m.dat');
data_1=importdata('1m.dat');
data_2=importdata('2m.dat');
dataOriginal=importdata('minFil.dat');

dataOriginal=myhex2dec(dataOriginal);

%Plotning i tidsdomæne
figure(1);
subplot(311);
plot(data_2);
title('Tidsdomæne 2m');
subplot(312);
plot(data_1);
title('Tidsdomæne 1m');
subplot(313);
plot(data_0_30);
title('Tidsdomæne 0.30m');


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


%Plotning af krydskorrelation
figure(2);
plot(mycrosscor2m);
title('Crosscorrelation - 2m');
xlim([0 1000])

figure(3);
plot(mycrosscor1m);
title('Crosscorrelation - 1m');
xlim([0 500])

figure(4);
plot(mycrosscor0_30m);
title('Crosscorrelation - 0.30m');
xlim([0 280])
