with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Text_IO;
use Ada.Text_IO;
use Ada.Strings.Unbounded;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Calendar;            use Calendar;
with Calendar.Formatting; use Calendar.Formatting;

package body logger is

   package Fix_IO is new Ada.Text_IO.Fixed_IO(DAY_DURATION);
   use Fix_IO;

   Year,Month,Day : INTEGER;
   Seconds  : DAY_DURATION;
   Time_And_Date  : TIME;


   function Output_Time(Time_In_Seconds : DAY_DURATION) return String is
      Time : FLOAT;
      Hours, Minutes, Seconds : Integer;
      log_time	: String := "";
      Temp_Unbounded_String : Unbounded_String;

      h : String := "";
      m : String := "" ;
      s : String := "";

   begin
      Put_Line("1");
      Time := FLOAT(Time_In_Seconds);
      Hours := Integer((Time - 30.0 * 60.0) / (60.0 * 60.0));
      Time := Time - FLOAT(Hours) * 60.0 * 60.0;
      Minutes := Integer((Time - 30.0) / 60.0);
      Seconds := Integer(Time - 0.5) mod 60;

      Put_Line(Integer'Image(Hours));
      Put_Line(h);
      log_time := Integer'Image(Hours) & ' ' & Integer'Image(Minutes) & ' ' & Integer'Image(Seconds);
      Put_Line("sao: " & log_time);
      return log_time;
   end Output_Time;

   procedure co_log(message : String) is
      F	: Ada.Text_IO.File_Type;
      Data : Unbounded_String := To_Unbounded_String(message);
      t : String := "";
   begin
      Time_And_Date := Clock;
      Split(Time_And_Date, Year, Month, Day, Seconds);

--      t := Output_Time(Seconds);
--	Put_Line("tttt");
--     Put_Line(t);
      Open (File => F, Mode => Append_File, Name => "co_sensor.log");
      Unbounded_IO.Put_Line(F, Data);
      Close(F);
   end co_log;

end logger;
