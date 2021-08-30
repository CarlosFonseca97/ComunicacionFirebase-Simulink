%Get baudrate values as scalar
%This function is solving "the parameter must be scalar" error for baudrate
function [] = baudrate_value()

global baud;
global baud_indeks;

switch baud_indeks
    case 1
    baud = 1200;
    case 2
    baud = 1800;
    case 3
    baud = 2400;
    case 4
    baud = 4800;
    case 5
    baud = 9600;
    case 6
    baud = 19200;
    case 7
    baud = 38400;
    case 8
    baud = 115200;
    case 9
    baud = 230400;
    %add here extras...
end

end
   
