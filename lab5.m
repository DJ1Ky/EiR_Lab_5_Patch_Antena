close all, clc, clear

%%

% ESEIAAT
lat_eseiaat= 41.5627;
long_eseiaat= 2.02328;

% LELL
lat_lell= 41.52102380130514;
long_lell = 2.1048295172430427;   

%% ISOTROPIC

tx = txsite("Latitude",lat_eseiaat,"Longitude",long_eseiaat);
tx.TransmitterFrequency = 131e6;
tx.TransmitterPower = 1000;
tx.AntennaHeight=3;
rx = rxsite("Latitude",lat_lell,"Longitude",long_lell);
rx.ReceiverSensitivity=-110;
rx.AntennaHeight=10;

% FREESPACE
ss_free = sigstrength(rx,tx,"freespace");
margin_free = abs(rx.ReceiverSensitivity - ss_free);

% LONGLEY-RICE
ss_lr = sigstrength(rx,tx,"longley-rice");
margin_lr = abs(rx.ReceiverSensitivity - ss_lr);

% link(rx,tx)
% coverage(tx,"longley-rice","SignalStrengths",-100:5:-60)  

% CLOSE IN
ss_ci = sigstrength(rx,tx,"close-in");
margin_ci = abs(rx.ReceiverSensitivity - ss_ci);

% link(rx,tx)
% coverage(tx,"close-in","SignalStrengths",-100:5:-60)  

%% DIPOLE
tx.AntennaAngle=-35.0330;
tx.Antenna=dipole;
tx.Antenna.Length=1.0756;
tx.Antenna.Width=0.0229;

% FREESPACE
ss_free = sigstrength(rx,tx,"freespace");
margin_free = abs(rx.ReceiverSensitivity - ss_free);

% LONGLEY-RICE
ss_lr = sigstrength(rx,tx,"longley-rice");
margin_lr = abs(rx.ReceiverSensitivity - ss_lr);

% link(rx,tx)
% coverage(tx,"longley-rice","SignalStrengths",-100:5:-60) 

% CLOSE IN
ss_ci = sigstrength(rx,tx,"close-in");
margin_ci = abs(rx.ReceiverSensitivity - ss_ci);

% link(rx,tx)
% coverage(tx,"close-in","SignalStrengths",-100:5:-60) 

%% PARABOLIC

tx.Antenna=reflectorParabolic;
tx.Antenna.Exciter=dipole;
tx.Antenna.Radius=11.4425;
tx.Antenna.FocalLength=5.7212;
tx.Antenna.Tilt=90;
tx.Antenna.TiltAxis=[0 1 0];
%tx.Antenna.FeedLocation=[0 0 0];
%tx.Antenna.FeedWidth=0;

% FREESPACE
ss_free = sigstrength(rx,tx,"freespace");
margin_free = abs(rx.ReceiverSensitivity - ss_free);

% LONGLEY-RICE
ss_lr = sigstrength(rx,tx,"longley-rice");
margin_lr = abs(rx.ReceiverSensitivity - ss_lr);

% link(rx,tx)
% coverage(tx,"longley-rice","SignalStrengths",-100:5:-60) 

% CLOSE IN
ss_ci = sigstrength(rx,tx,"close-in");
margin_ci = abs(rx.ReceiverSensitivity - ss_ci);

link(rx,tx)
coverage(tx,"close-in","SignalStrength",-100:5:-60) 

