%Sollwertgenerator für die Aufzugsachse
%=========================================================================

function xSollwert = Sollwertgenerator_Aufzug(vMax)

%u = 0;
%% Variablen in den Funktions-Workspace laden
tsim_akt = feval('evalin','base','tsim');                                   %Aktuelle Simulationszeit
tsim_last_step = feval('evalin','base','tsim_last_step');                   %Simulationszeit bei dem letzten Zustand
xSollwert_last_step = feval('evalin','base','xSollwert_last_step');         %X-Sollwert bei dem letzten Zustand
xSollwert = feval('evalin','base','xSollwert');                             %aktueller X-Sollwert
a = feval('evalin','base','a');                                             %Beschleunigung
fall_alt = feval('evalin','base','fall_alt');                               %letzter Zustand
fall_neu = feval('evalin','base','fall_neu');                               %aktueller Zustand
vSollwert = feval('evalin','base','vSollwert');                             %aktuelle Soll-Geschwindigkeit
vSollwert_last_step = feval('evalin','base','vSollwert_last_step');         %v-Sollwert bei dem letzten Zustand


%% Unterscheidung der verschiedenen Faelle
if vMax > 0
    u = 1;
end
if vMax < 0
    u = 2;
end
if vMax ==0
    u = 0;
end


switch u
    
    case 0;
        %Position bleibt unverändert-> 
        xSollwert = xSollwert;
        fall_alt = 0;
        
    % Motor faehrt nach oben im Eilgang
    % von EG -> 1.Stock oder EG -> 2.Stock oder 1.Stock -> 2.Stock
    case 1;
        fall_neu = 1;
        
        if fall_neu ~= fall_alt
            tsim_last_step = tsim_akt;
            xSollwert_last_step = xSollwert;
            vSollwert_last_step = vSollwert;
        end
        
        if vSollwert < vMax
            vSollwert = a*(tsim_akt-tsim_last_step);
            xSollwert = xSollwert_last_step + vSollwert*(tsim_akt-tsim_last_step);
            
            if vSollwert>=vMax
               tsim_last_step = tsim_akt;
               xSollwert_last_step = xSollwert;
               vSollwert_last_step = vSollwert;
            end
        else
            xSollwert = xSollwert_last_step + vSollwert*(tsim_akt-tsim_last_step);
            
        end
        
        fall_alt = 1;
       
    % Motor faehrt nach unten im Eilgang
    % von 2.Stock-> 1.Stock oder EG oder 1.Stock -> EG
        case 2;
            fall_neu = 2;
        
        if fall_neu ~= fall_alt
            tsim_last_step = tsim_akt;
            xSollwert_last_step = xSollwert;
            vSollwert_last_step = vSollwert;
        end
        
        if vSollwert > vMax
            vSollwert = -a*(tsim_akt-tsim_last_step);
            xSollwert = xSollwert_last_step + vSollwert*(tsim_akt-tsim_last_step);
            
            if vSollwert<=vMax
               tsim_last_step = tsim_akt;
               xSollwert_last_step = xSollwert;
               vSollwert_last_step = vSollwert;
            end
        else
            xSollwert = xSollwert_last_step + vSollwert*(tsim_akt-tsim_last_step);
            
        end
        
        fall_alt = 2;
end




%% Werte zurück in den Workspace schreiben
assignin('base','tsim_last_step',tsim_last_step);
assignin('base','xSollwert_last_step',xSollwert_last_step);
assignin('base','xSollwert',xSollwert);
assignin('base','fall_alt',fall_alt);
assignin('base','fall_neu',fall_neu);
assignin('base','vSollwert',vSollwert);
assignin('base','vSollwert_last_step',vSollwert_last_step);

end %Ende Funktion