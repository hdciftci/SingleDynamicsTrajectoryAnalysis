filename=uigetfile('*.csv');
filename1=uigetfile('*.csv');
high=table2array(readtable(filename));
low=table2array(readtable(filename1));
c=horzcat(high(:,2:3),low(:,2:3));
paired=c((c(:,2)~=0 & c(:,4)~=0),:);
paired(:,3)=log10(paired(:,2));
paired=horzcat(paired,log10(paired(:,4)));
only_high=c((c(:,2)~=0 & c(:,4)==0),:);
only_high(:,3)=log10(only_high(:,2));
only_high(:,4)=[];
only_low=c((c(:,2)==0 & c(:,4)~=0),:);
only_low=horzcat(only_low(:,3:4),log10(only_low(:,4)));

fid = fopen('paired.csv','w'); 
dlmwrite('paired.csv',paired,'-append'); 
fclose(fid);

fid = fopen('only_high.csv','w'); 
dlmwrite('only_high.csv',only_high,'-append'); 
fclose(fid);

fid = fopen('only_low.csv','w'); 
dlmwrite('only_low.csv',only_low,'-append'); 
fclose(fid);
