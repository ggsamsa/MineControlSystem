with Ada.Text_IO;
use Ada.Text_IO;
WITH Ada.Integer_Text_IO;
with operator_console;
with co_sensor;
with ch4_sensor;
with water_flow_sensor;
with air_flow_sensor;
with mytime;
with device;

procedure main is

   a : Character;
   value : Integer;
   t : Boolean;

   procedure setup is
      co_file	: Ada.Text_IO.File_Type;
      ch4_file	: Ada.Text_IO.File_Type;
      pump_file	: Ada.Text_IO.File_Type;
      wf_file	: Ada.Text_IO.File_Type;
      af_file 	: Ada.Text_IO.File_Type;
   begin
      Create(co_file, Ada.Text_IO.Out_File, "co_sensor.log");
      Create(ch4_file, Ada.Text_IO.Out_File, "ch4_sensor.log");
      Create(pump_file, Ada.Text_IO.Out_File, "pump.log");
      Create(wf_file, Ada.Text_IO.Out_File, "water_flow.log");
      Create(af_file, Ada.Text_IO.Out_File, "air_flow.log");
      Close(co_file);
      Close(ch4_file);
      Close(pump_file);
      Close(wf_file);
      Close(af_file);
   end setup;

begin
 --  mytime.output_time;
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
      Put_Line ("        CO: " & Integer'Image(co_sensor.read_co));
      Put_Line ("       CH4: " & Integer'Image(ch4_sensor.read_ch4));
      Put_Line ("Water Flow: ");
      Put_Line ("  Air Flow: " & Boolean'Image(air_flow_sensor.read_air_flow));
      Put_Line ("");
      Put_Line ("-- ENVIRONMENT MANIPULATION --");
      Put_Line ("(6) set CO [1 .. 1023] THRESHOLD: 600");
      Put_Line ("(7) set CH4 [1 .. 1023] THRESHOLD: 600");
      Put_Line ("(8) set Water Flow");
      Put_Line ("(9) switch Air Flow");
      Put_Line ("");
      Put_Line ("e(X)it");
      Put_Line ("-----------------------------------");

      co_sensor.initialise;

      Get_Immediate(a);

      case a is
         when 'r' => operator_console.request_pump_status;
         when 'o' => operator_console.turn_pump_on;
         when 'f' => operator_console.turn_pump_off;
         when '6' => Put("New CO value: ");
            Ada.Integer_Text_IO.get(value);
            co_sensor.set_co(value);
         when '7' => Put("New CH4 value: ");
            Ada.Integer_Text_IO.Get(value);
            ch4_sensor.set_ch4(value);
         when '9' => t := air_flow_sensor.read_air_flow;
            if t = true then
               air_flow_sensor.set_operation(device.clear);
            else
               air_flow_sensor.set_operation(device.set);
            end if;
         when 'x' => exit;
         when others => Put_Line("Undefined option");
      end case;
   end loop;
end main;
