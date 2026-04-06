%Init-Datei
%Einstellen der Parameter
%=========================================================================
%Simulationsdaten
%-------------------------------------------------------------------------
T_Stop = 100;                                                               %Simulationsende
step_max = 0.0001;                                                          %Maximale Schrittweite

%%
%Sollwertgenerator
%-------------------------------------------------------------------------

a = 3;                                                                      %Einstellen der Beschleunigung
vMax = 4;                                                                   %Maximale positive Geschwindigkeit (nach oben)
vMin = -vMax; 

xSwitch_EG_u = 0.20;                                                        %Endschalten unten Erdgeschoss
xSwitch_EG_o = 1;                                                           %Endschalten oben Erdgeschoss
xSwitch_1_u = 3.50;                                                         %Endschalter unten 1.Stock
xSwitch_1_m = 4.50;                                                         %Endschalter mitten 1.Stock
xSwitch_1_o = 5.50;                                                         %Endschalter oben 1.Stock
xSwitch_2_u = 8.00;                                                         %Endschalter unten 2.Stock
xSwitch_2_o = 9.0;                                                          %Endschalter oben 2.Stock

%% Daten für die Simulation
GUI_xIst = 0;                                                               %Aktuelle Position aus Simulink
GUI_Anforderung = 0;                                                        %Aktuelle Anforderung aus Stateflow
GUI_Tuer = 0;                                                               %Tuerstatus aus Stateflow

%% Sollwertgenerator 
tsim=0;                                                                     %Simulationszeit
tsim_last_step=0;                                                           %Simulationszeit bei Ausführung des letzten Cases
xSollwert=0;                                                                %Merker des Weg-Sollwertes
xSollwert_last_step=0;                                                      %Merker zur Berechnung des neuen Weg-Sollwertes
fall_alt=0;                                                                 %Merker für den letzten Fall
fall_neu=0;                                                                 %Merker für den aktuellen Fall
vSollwert=0;                                                                %Merker für den aktuellen Geschwindigkeits-Sollwertes
vSollwert_last_step=0;                                                      %Merker zur Berechnung des neuen Geschwindigkeits-Sollwertes

%% Motordaten
RA = 0.250;                                                                 %Ankerwiderstand [Ohm]
LA = 0.004;                                                                 %Ankerinduktivitaet [H]
TA = LA/RA;                                                                 %Zeitkonstante des Motors [s]
J = 0.012;                                                                  %Massentraegheitsmoment des Motors [kgm^2]
CM = 1.528;                                                                 %Drehmomentkonstante des Motors
CE = 1.528;                                                                 %Spannungskonstante Gegenspannung
MLast = 10;                                                                 %Lastmoment
%% Daten des Stromreglers
Tt = 0.0001;                                                                %Totzeit des Stromreglers
Tgl = 0.001;                                                                %Glaettungszeitkonstante
Kpi = LA/(2*(Tt+Tgl));                                                      %Verstaerkung des Stromreglers [Ohm]
                                                                            %Zeitkonstante des Stromreglers = TA
                                                                            
 %% Daten des Drehzahlreglers
 Kpn = (2*pi*J)/(CM*4*(Tt+Tgl));                                           %Verstaerkung des Drehzahlreglers 
 TN = 8*(Tt+Tgl);                                                          %Zeitkonstante des Drehzahlreglers
 N_Max = 33.33;                                                            %Maximale Drehzahl [U/s]
 
 %% Daten des Lagereglers
 hsp = 1;                                                                  %Spindelsteigung [cm/U]
 Kpx = 1/(2*8*(Tt+Tgl)*hsp);                                               %Verstaerkung des Lagereglers[1/cm*s]
 
 %% Zuweisung der Werte an den Base-Workspace
 assignin('base','T_Stop',T_Stop);
 assignin('base','step_max',step_max);
 
 assignin('base','a',a);
 assignin('base','vMax',vMax);
 assignin('base','vMin',vMin);
 assignin('base','xSwitch_EG_u',xSwitch_EG_u);
 assignin('base','xSwitch_EG_o',xSwitch_EG_o);
 assignin('base','xSwitch_1_u',xSwitch_1_u);
 assignin('base','xSwitch_1_m',xSwitch_1_m);
 assignin('base','xSwitch_1_o',xSwitch_1_o);
 assignin('base','xSwitch_2_u',xSwitch_2_u);
 assignin('base','xSwitch_2_o',xSwitch_2_o);
 
 assignin('base','GUI_xIst',GUI_xIst);
 assignin('base','GUI_Anforderung',GUI_Anforderung);
 assignin('base','GUI_Tuer',GUI_Tuer);
 
 assignin('base','tsim',tsim);
 assignin('base','tsim_last_step',tsim_last_step);
 assignin('base','xSollwert',xSollwert);
 assignin('base','xSollwert_last_step',xSollwert_last_step);
 assignin('base','fall_alt',fall_alt);
 assignin('base','fall_neu',fall_neu);
 assignin('base','vSollwert',vSollwert);
 assignin('base','vSollwert_last_step',vSollwert_last_step);
 
 assignin('base','RA',RA);
 assignin('base','LA',LA);
 assignin('base','TA',TA);
 assignin('base','J',J);
 assignin('base','CM',CM);
 assignin('base','CE',CE);
 assignin('base','MLast',MLast);
 
 assignin('base','Tt',Tt);
 assignin('base','Tgl',Tgl);
 assignin('base','Kpi',Kpi);
 
 assignin('base','Kpn',Kpn);
 assignin('base','TN',TN);
 assignin('base','N_Max',N_Max);
 
 assignin('base','hsp',hsp);
 assignin('base','Kpx',Kpx);
 
 
                                                                        