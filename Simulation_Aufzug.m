while (get(handles.run,'value')==1)                                        % Nur wenn die Simulation läuft:

    xIst = feval( 'evalin', 'base', 'GUI_xIst');                          % Aktuelle Position: für Aufzugsanimation
    Tuer = feval( 'evalin', 'base', 'GUI_Tuer');                        % Status der Tuer auf/zu: für Türanimation
    Anforderung = feval('evalin','base','GUI_Anforderung');                    % Status der Anforderungen: für Tastenanimation

    pause(0.2)                                                             % Rechenzeit abgeben!
    %% Simulation der Aufzugskabine
    set(handles.Kabine_Aufzug,'Position',[22.2, xIst*3.3,19,9.5]);            % Aufzugskabine folgt der aktuellen Position
    
    %% Simulation der Tueren
    if Tuer == 0                                                                    % Aus Stateflow: Wenn Tuer im EG:
        set(handles.tuer_EG_l,'Position',[(22.2-7),1.0769230,7.6,8.538461]);        % oeffne linke Tuer
        set(handles.tuer_EG_r,'Position',[(29.8+7),1.0769230,7.6,8.538461]);        % oeffne rechte Tuer
    else
        set(handles.tuer_EG_l,'Position',[22.2,1.0769230,7.6,8.538461]);            % schliesse linke Tuer
        set(handles.tuer_EG_r,'Position',[29.8,1.0769230,7.6,8.538461]);            % schliesse rechte Tuer
    end
    
    if Tuer == 0.5
        set(handles.tuer_EG_l,'Position',[(22.2-3.5),1.0769230,7.6,8.538461]);      % oeffne linke Tuer nur zur Haelfte
        set(handles.tuer_EG_r,'Position',[(29.8+3.5),1.0769230,7.6,8.538461]);      % oeffne rechte Tuer nur zur Haelfte
    end
    
    if Tuer == 1                                                                    % Aus Stateflow: Wenn Tuer im 1. Stock:
        set(handles.tuer_1_l,'Position',[(22.2-7),15.4615384615,7.6,8.538461]);     % oeffne linke Tuer
        set(handles.tuer_1_r,'Position',[(29.8+7),15.4615384615,7.6,8.538461]);     % oeffne rechte Tuer
    else
        set(handles.tuer_1_l,'Position',[22.2,15.4615384615,7.6,8.538461]);         % schliesse linke Tuer
        set(handles.tuer_1_r,'Position',[29.8,15.4615384615,7.6,8.538461]);         % schliesse rechte Tuer
    end
    
    if Tuer == 1.5
        set(handles.tuer_1_l,'Position',[(22.2-3.5),15.4615384615,7.6,8.538461]);   % oeffne linke Tuer nur zur Haelfte
        set(handles.tuer_1_r,'Position',[(29.8+3.5),15.4615384615,7.6,8.538461]);   % oeffne rechte Tuer nur zur Haelfte
    end
    
    if Tuer == 2                                                                    % Aus Stateflow: Wenn Tuer im 2. Stock:
        set(handles.tuer_2_l,'Position',[(22.2-7),30.46153846153846,7.6,8.538461]); % oeffne linke Tuer
        set(handles.tuer_2_r,'Position',[(29.8+7),30.46153846153846,7.6,8.538461]); % oeffne rechte Tuer
    else
        set(handles.tuer_2_l,'Position',[22.2,30.46153846153846,7.6,8.538461]);     % schliesse linke Tuer
        set(handles.tuer_2_r,'Position',[29.8,30.46153846153846,7.6,8.538461]);     % schliesse rechte Tuer
    end
    
    if Tuer == 2.5
        set(handles.tuer_2_l,'Position',[(22.2-3.5),30.46153846153846,7.6,8.538461]); % oeffne linke Tuer nur zur Haelfte
        set(handles.tuer_2_r,'Position',[(29.8+3.5),30.46153846153846,7.6,8.538461]); % oeffne rechte Tuer nur zur Haelfte
    end
        
    
    %% Simulation der Stockwerksanzeige
    
    if xIst <= 2.75
        set(handles.anzeige_EG,'String','EG');                              % Ist die aktuelle Position <= 2.75 zeigen 
        set(handles.anzeige_1 ,'String','EG');                              % alle Stockwerksanzeigen 'EG' an
        set(handles.anzeige_2 ,'String','EG');
        set(handles.anzeige_3 ,'String','EG');
    end
    
    if xIst > 2.75 && xIst <= 6.25
        set(handles.anzeige_EG,'String','1');                               % Ist die aktuelle Position > 2.75 und <= 6.25 zeigen
        set(handles.anzeige_1 ,'String','1');                               % alle Stockwerksanzeigen '1' an
        set(handles.anzeige_2 ,'String','1');
        set(handles.anzeige_3 ,'String','1');
    end
    
    if xIst > 6.25
        set(handles.anzeige_EG,'String','2');                               % Ist die aktuelle Position > 6.25 zeigen
        set(handles.anzeige_1 ,'String','2');                               % alle Stockwerksanzeigen '1' an
        set(handles.anzeige_2 ,'String','2');
        set(handles.anzeige_3 ,'String','2');
    end
    
    %% Simulation der Tastenbeleuchtung bei Anforderung
    if Anforderung == 0
        set(handles.EG_hoch,'Backgroundcolor',[0.502,0.502,0.502]);
        set(handles.erdgeschoss,'Backgroundcolor',[0.502,0.502,0.502]);
        set(handles.eins_hoch,'Backgroundcolor',[0.502,0.502,0.502]);
        set(handles.eins_runter,'Backgroundcolor',[0.502,0.502,0.502]);
        set(handles.erster_stock,'Backgroundcolor',[0.502,0.502,0.502]);
        set(handles.zwei_runter,'Backgroundcolor',[0.502,0.502,0.502]);
        set(handles.zweiter_stock,'Backgroundcolor',[0.502,0.502,0.502]);
    else
        if Anforderung == 1                                                     % Taste EG außen
            set(handles.EG_hoch,'Backgroundcolor',[1,0,0]);
        end
        if Anforderung == 2                                                     % Taste EG innen
            set(handles.erdgeschoss,'Backgroundcolor',[1,0,0]);
        end
        if Anforderung == 10                                                    % Aufzug im EG: Beleuchtung löschen
            set(handles.EG_hoch,'Backgroundcolor',[0.502,0.502,0.502]);
            set(handles.erdgeschoss,'Backgroundcolor',[0.502,0.502,0.502]);
        end

        if Anforderung == 3                                                     % 1. Stock aufwärts (außen)
            set(handles.eins_hoch,'Backgroundcolor',[1,0,0]);
        end
        if Anforderung == 4                                                     % 1. Stock innen
            set(handles.erster_stock,'Backgroundcolor',[1,0,0]);
        end
        if Anforderung == 5                                                     % 1. Stock abwärts (außen)
            set(handles.eins_runter,'Backgroundcolor',[1,0,0]);
        end

        if Anforderung == 11                                                    % Aufzug im 1. Stock: Beleuchtung löschen
            set(handles.eins_hoch,'Backgroundcolor',[0.502,0.502,0.502]);
            set(handles.eins_runter,'Backgroundcolor',[0.502,0.502,0.502]);
            set(handles.erster_stock,'Backgroundcolor',[0.502,0.502,0.502]);
        end

        if Anforderung == 6                                                     % 2. Stock außen
            set(handles.zwei_runter,'Backgroundcolor',[1,0,0]);
        end
        if Anforderung == 7                                                     % 2. Stock innen
            set(handles.zweiter_stock,'Backgroundcolor',[1,0,0]);
        end

        if Anforderung == 12                                                    % Aufzug im 2. Stock: Beleuchtung löschen
            set(handles.zwei_runter,'Backgroundcolor',[0.502,0.502,0.502]);
            set(handles.zweiter_stock,'Backgroundcolor',[0.502,0.502,0.502]);
        end
    end
    
end