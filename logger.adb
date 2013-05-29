with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;
with Ada.Text_IO;
use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body logger is

   procedure co_log(message : String) is
      F	: Ada.Text_IO.File_Type;
      Data : Unbounded_String := To_Unbounded_String(message);
      t : String := "";
   begin
      Open (File => F, Mode => Append_File, Name => "co_sensor.log");
      Unbounded_IO.Put_Line(F, Data);
      Close(F);
   end co_log;

   procedure pump_log(message : String) is
      F	: Ada.Text_IO.File_Type;
      Data : Unbounded_String := To_Unbounded_String(message);
      t : String := "";
   begin
      Open (File => F, Mode => Append_File, Name => "pump.log");
      Unbounded_IO.Put_Line(F, Data);
      Close(F);
   end pump_log;

end logger;
