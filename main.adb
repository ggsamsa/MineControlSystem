with Ada.Text_IO;
use Ada.Text_IO;
WITH Ada.Integer_Text_IO;
with operator_console;
with co_sensor;
with ch4_sensor;

procedure main is

   a : Character;
   value : Integer;
   procedure setup is
      co_file	: Ada.Text_IO.File_Type;
      pump_file	: Ada.Text_IO.File_Type;
   begin
      Create(co_file, Ada.Text_IO.Out_File, "co_sensor.log");
      Create(pump_file, Ada.Text_IO.Out_File, "pump.log");
      Close(co_file);
      Close(pump_file);
   end setup;

begin
   setup;
   Put_Line ("MINE CONTROL SYSTEM SIMULATION V .1");
   Put_Line ("");
   loop
      Put_Line ("-----------------------------------");
      Put_Line ("-- OPERATOR CONSOLE --");
      Put_Line ("turn (O)n the pump");
      Put_Line ("turn o(F)f the pump");
      Put_Line ("(R)equest pump status");
      Put_Line ("(C)heck for alarms");
      Put_Line ("");
      Put_Line ("-- ENVIRONMENT MONITORING --");
      Put_Line ("(1) read CO");
      Put_Line ("(2) read CH4");
      Put_Line ("(3) read Water Flow");
      Put_Line ("(4) read Air Flow");
      Put_Line ("");
      Put_Line ("-- ENVIRONMENT MANIPULATION --");
      Put_Line ("(6) set CO");
      Put_Line ("(7) set CH4");
      Put_Line ("(8) set Water Flow");
      Put_Line ("(9) set Air Flow");
      Put_Line ("");
      Put_Line ("e(X)it");
      Put_Line ("-----------------------------------");

      co_sensor.initialise;

      Get_Immediate(a);

      case a is
         when 'r' => operator_console.request_pump_status;
         when 'o' => operator_console.turn_pump_on;
         when 'f' => operator_console.turn_pump_off;
         when '1' => Put_Line("CO:" & Integer'Image(co_sensor.read_co));
         when '2' => Put_Line("CH4:" & Integer'Image(ch4_sensor.read_ch4));
         when '6' => Ada.Integer_Text_IO.get(value);
            co_sensor.set_co(value);
         when '7' => Ada.Integer_Text_IO.Get(value);
            ch4_sensor.set_ch4(value);
         when 'x' => exit;
         when others => Put_Line("Undefined option");
      end case;
   end loop;
end main;
