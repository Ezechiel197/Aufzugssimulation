function varargout = gui_aufzug(varargin)
% GUI_AUFZUG MATLAB code for gui_aufzug.fig
%      GUI_AUFZUG, by itself, creates a new GUI_AUFZUG or raises the existing
%      singleton*.
%
%      H = GUI_AUFZUG returns the handle to a new GUI_AUFZUG or the handle to
%      the existing singleton*.
%
%      GUI_AUFZUG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_AUFZUG.M with the given input arguments.
%
%      GUI_AUFZUG('Property','Value',...) creates a new GUI_AUFZUG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_aufzug_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_aufzug_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_aufzug

% Last Modified by GUIDE v2.5 17-Apr-2013 15:29:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_aufzug_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_aufzug_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before gui_aufzug is made visible.
function gui_aufzug_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_aufzug (see VARARGIN)

% Choose default command line output for gui_aufzug
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_aufzug wait for user response (see UIRESUME)
% uiwait(handles.aufzug);
Modell_Aufzug;
run Initdatei;



% --- Outputs from this function are returned to the command line.
function varargout = gui_aufzug_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in EG_hoch.
function EG_hoch_Callback(hObject, eventdata, handles)
% hObject    handle to EG_hoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/EG_hoch','value','1');
pause(0.5);
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/EG_hoch','value','0');

% --- Executes on button press in eins_hoch.
function eins_hoch_Callback(hObject, eventdata, handles)
% hObject    handle to eins_hoch (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/eins_hoch','value','1');
pause(0.5);
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/eins_hoch','value','0');

% --- Executes on button press in eins_runter.
function eins_runter_Callback(hObject, eventdata, handles)
% hObject    handle to eins_runter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/eins_runter','value','1');
pause(0.5);
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/eins_runter','value','0');

% --- Executes on button press in zwei_runter.
function zwei_runter_Callback(hObject, eventdata, handles)
% hObject    handle to zwei_runter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/zwei_runter','value','1');
pause(0.5);
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/zwei_runter','value','0');

% --- Executes on button press in zweiter_stock.
function zweiter_stock_Callback(hObject, eventdata, handles)
% hObject    handle to zweiter_stock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/Zweiter_Stock','value','1');
pause(0.5);
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/Zweiter_Stock','value','0');

% --- Executes on button press in erster_stock.
function erster_stock_Callback(hObject, eventdata, handles)
% hObject    handle to erster_stock (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/Erster_Stock','value','1');
pause(0.5);
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/Erster_Stock','value','0');

% --- Executes on button press in erdgeschoss.
function erdgeschoss_Callback(hObject, eventdata, handles)
% hObject    handle to erdgeschoss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/Erdgeschoss','value','1');
pause(0.5);
set_param('Modell_Aufzug/Bedienknoepfe_Aufzug/Erdgeschoss','value','0');


% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of run

        
if (get(handles.run,'value')== 1)
    Initdatei;
    set_param('Modell_Aufzug','SimulationCommand','start');
    set(handles.run,'Backgroundcolor',[0,1,0]);
    set(handles.anzeige,'String','Betrieb'); 
    pause(0.2);
    Simulation_Aufzug;
    
else
    set_param('Modell_Aufzug','SimulationCommand','stop');
    set(handles.run,'Backgroundcolor',[1,0,0]);
    set(handles.anzeige,'String','Kein Betrieb');
   
end
%xist = feval('evalin','base','X_aktuell');
%xend = feval('evalin','base','Xsoll_2_o');
