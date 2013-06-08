with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Integer_Text_IO;
with operator_console;
with co_sensor;
with ch4_sensor;
with water_flow_sensor;
with air_flow_sensor;
with hlw_handler;
with mytime;
with device;


procedure main is

   a : Character;
   value : Integer;
   t : Boolean;

   procedure setup is
      co_file, ch4_file, pump_file, wf_file, af_file : Ada.Text_IO.File_Type;
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

   procedure read_file (which: String) is
      Filename   : String := which;
      File       : Ada.Text_IO.File_Type;
      Line_Count : Natural := 0;
   begin
      Ada.Text_IO.Open (File => File,
                        Mode => Ada.Text_IO.In_File,
                        Name => Filename);
      while not Ada.Text_IO.End_Of_File (File) loop
         declare
            Line : String := Ada.Text_IO.Get_Line (File);
         begin
            Line_Count := Line_Count + 1;
            Ada.Text_IO.Put_Line (Natural'Image (Line_Count) & ": " & Line);
         end;
      end loop;
      Ada.Text_IO.Close (File);
   end read_file;

begin
   setup;
   Put_Line ("/-----------------------------------\");
   Put_Line ("|MINE CONTROL SYSTEM SIMULATION V .1|");
   Put_Line ("|___________________________________|");
   loop
      New_Line;
      Put_Line ("-----------------------------------");
      Put_Line ("-- OPERATOR CONSOLE --");
      Put_Line ("turn (O)n the pump");
      Put_Line ("turn o(F)f the pump");
      Put_Line ("(R)equest pump status");
      Put_Line ("(C)heck for alarms");
      New_Line;
      Put_Line ("-- ENVIRONMENT MONITORING --");
      Put_Line ("        CO: " & Integer'Image(co_sensor.read_co));
      Put_Line ("       CH4: " & Integer'Image(ch4_sensor.read_ch4));
      Put_Line ("Water Flow: " & Boolean'Image(water_flow_sensor.read_water_flow));
      Put_Line ("  Air Flow: " & Boolean'Image(air_flow_sensor.read_air_flow));
      New_Line;
      Put_Line ("-- LOGGING --");
      Put_Line ("(1) Read CO sensor LOG");
      Put_Line ("(2) Read CH4 sensor LOG");
      Put_Line ("(3) Read Water Flow sensor LOG");
      Put_Line ("(4) Read Air Flow sensor LOG");
      Put_Line ("-- ENVIRONMENT MANIPULATION --");
      Put_Line ("(6) set CO [1 .. 1023] THRESHOLD: 600");
      Put_Line ("(7) set CH4 [1 .. 1023] THRESHOLD: 600");
      Put_Line ("(8) switch Air Flow");
      Put_Line ("(9) Set Water Level to HIGH");
      Put_Line ("(0) Set Water Level to LOW");
      New_Line;
      Put_Line ("e(X)it");
      Put_Line ("-----------------------------------");

      Get_Immediate(a);

      case a is
         when 'r' => operator_console.request_pump_status;
         when 'o' => operator_console.turn_pump_on;
         when 'f' => operator_console.turn_pump_off;
         when '1' => New_Line; Put_Line("CO LOG -----");
            read_file("co_sensor.log");
         when '2' => New_Line; Put_Line("CH4 LOG -----");
            read_file("ch4_sensor.log");
         when '3' => New_Line; Put_Line("Water Flow LOG -----");
            read_file("water_flow.log");
         when '4' => New_Line; Put_Line("Air Flow LOG -----");
            read_file("air_flow.log");
         when '6' => Put("New CO value: ");
            Ada.Integer_Text_IO.get(value);
            co_sensor.set_co(value);
         when '7' => Put("New CH4 value: ");
            Ada.Integer_Text_IO.Get(value);
            ch4_sensor.set_ch4(value);
         when '8' => t := air_flow_sensor.read_air_flow;
            if t = true then
               air_flow_sensor.set_air_flow(false);
            else
               air_flow_sensor.set_air_flow(true);
            end if;
         when '9' => hlw_handler.write_water_mark(hlw_handler.high);
         when '0' => hlw_handler.write_water_mark(hlw_handler.low);
         when 'x' => exit;
         when others => Put_Line("Undefined option");
      end case;
   end loop;
end main;
