%DSA Case 3: Vejecelle
clear
clc
close all

load('vejecelle_data.mat');
figure(1);
plot(vejecelle_data);
title('Unfiltered signal');
%Ved analyse ses det at vejecellen er ubelastet indtil ca. 1000 samples, og
%belastet fra ca. 1050 samples. Imellem dette er der en overgangsfase, der
%ses bort fra.

%Opdeling af i loaded og unloaded.
loaded=vejecelle_data(1:1000);
unloaded=vejecelle_data(1050:end);

%Plotning af tidsdomæne-signal.
figure(2);
subplot(211);
plot(unloaded);
title('Unloaded part');
subplot(212);
plot(loaded);
title('Loaded part');

%Udregning af gennemsnit.
avg_unloaded=sum(unloaded)/length(unloaded)
avg_loaded=sum(loaded)/length(loaded)

%Udregning af varians og standardafvigelse for ufiltreret signal.
var_unloaded=0;
for n= 1: length(unloaded)
    var_unloaded=var_unloaded+(unloaded(n)-avg_unloaded)^2;
end
var_unloaded=var_unloaded/(length(unloaded)) %length-1?
dev_unloaded=sqrt(var_unloaded)

var_loaded=0;
for n= 1: length(loaded)
    var_loaded=var_loaded+(loaded(n)-avg_loaded)^2;
end
var_loaded=var_loaded/(length(loaded)) %length-1?
dev_loaded=sqrt(var_loaded)

%Histogrammer
figure(3);
subplot(211);
histogram(unloaded);
xlim([900 1600]);
title('Histogram - unloaded part');
subplot(212);
histogram(loaded);
xlim([900 1600]);
title('Histogram - loaded part');
%Hvordan er det nu liiige man definerer standard-afvigelse på en graf?

%Plotning af power-spektrum
powerSpectrum=abs(fft(vejecelle_data));
figure(4);
plot(mag2db(powerSpectrum).^2);
title('Power Spectrum');
%Da støjen er nogenlunde ligeligt fordelt ligner det hvid støj.

bits_per_gram=(avg_unloaded-avg_loaded)/1000;
grams_per_bit=1/bits_per_gram;



%Filtrering: Løbende filter
N=100; %Orden af filter.
%30 koefficienter giver en settle time på ca 30 samples.
%fs=300 -> 30 samples =0.1s=100ms.
y=zeros(1,N);
x=zeros(1,N);

unloaded_filtered=zeros(1, length(unloaded)); %Placeholder
loaded_filtered=zeros(1, length(loaded)); %Placeholder

for n=1:length(unloaded)
    for k=1:N
        if n+k<length(unloaded)
            x(k)=unloaded(n+k);
        end
    end
    unloaded_filtered(n)=sum(x)/N;
end

for n=1:length(loaded)
    for k=1:N
        if n+k<length(loaded)
            x(k)=loaded(n+k);
        end
    end
    loaded_filtered(n)=sum(x)/N;
end

%Plotning af ufiltreret signal kontra filtreret signal.
figure(5);
subplot(221);
plot(unloaded);
title('Unloaded - Unfiltered');
ylim([1250 1550])
subplot(222);
plot(unloaded_filtered);
title('Unloaded - Filtered');
ylim([1250 1550])
subplot(223);
plot(loaded);
title('Loaded - Unfiltered');
ylim([900 1300])
subplot(224);
plot(loaded_filtered);
title('Loaded - Filtered');
ylim([900 1300])
%Udregning af gennemsnit.
avg_unloaded_filtered=sum(unloaded_filtered)/length(unloaded_filtered)
avg_loaded_filtered=sum(loaded_filtered)/length(loaded_filtered)

%Udregning af varians og standardafvigelse for filtreret signal.
var_unloaded_filtered=0;
for n= 1: length(unloaded_filtered)
    var_unloaded_filtered=var_unloaded_filtered+(unloaded_filtered(n)-avg_unloaded_filtered)^2;
end
var_unloaded_filtered=var_unloaded_filtered/(length(unloaded_filtered)-1) %length-1?
dev_unloaded_filtered=sqrt(var_unloaded_filtered)

var_loaded_filtered=0;
for n= 1: length(loaded_filtered)
    var_loaded_filtered=var_loaded_filtered+(loaded_filtered(n)-avg_loaded_filtered)^2;
end
var_loaded_filtered=var_loaded_filtered/(length(loaded_filtered)-1) %length-1?
dev_loaded_filtered=sqrt(var_loaded_filtered)

figure(6)
subplot(221)
histogram(unloaded)
xlim([900 1550])
ylim([0 280])
title('Histogram - Unloaded, ufiltreret')
subplot(222)
histogram(loaded)
xlim([900 1550])
ylim([0 280])
title('Histogram - Loaded, ufiltreret')
subplot(223)
histogram(unloaded_filtered)
xlim([900 1550])
ylim([0 280])
title('Histogram - Unloaded, filtreret')
subplot(224)
histogram(loaded_filtered)
xlim([900 1550])
ylim([0 280])
title('Histogram - Loaded, filtreret')




%Opgave 3
%Vi tager den største standardafvigelse af enten den loadede eller
%unloadede filtrerede.
gram_thresh=dev_unloaded_filtered*grams_per_bit*10;
%Vi ser at der kun kan måles med 150 grams præcision, da der er 15g's
%usikkerhed. Da vi kun kan måle med 150 grams præcision kan vi ikke have
%flere betydende cifre med end heltal.
