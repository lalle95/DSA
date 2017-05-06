
% Eksempel på skrivning af array til fil, som kan læses ind i CrossCore
signal= [0.1 0.2 0.3 0.4 0.5];
fs=44100;
ts=1/fs;
T=1500/fs;
t=[0:ts:T-ts];
signal=0.9*chirp(t,2000,T-ts,3500);
soundsc(signal,fs);
signalhex = mydec2hex(signal);
fid=fopen('minFil.dat', 'w');
for i=1:length(signalhex)-1,
    fprintf(fid, '%s,\n', signalhex{i});
end
fprintf(fid, '%s\n', signalhex{end});   % Uden ","-tegn
fclose(fid)



