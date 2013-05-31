   with Ada.Text_IO;         use Ada.Text_IO;
   with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Calendar;            use Calendar;
with ada.Strings.Unbounded;
use ada.Strings.Unbounded;

package body mytime is

   procedure output_time is


      Year,Month,Day : INTEGER;
      Seconds  : DAY_DURATION;
      Time_And_Date  : TIME;

      procedure sub(Time_In_Seconds : DAY_DURATION) is
         Time : FLOAT;
         Hours, Minutes, Seconds : INTEGER;
         tmp : String := "";
      begin
         Time := FLOAT(Time_In_Seconds);
         Hours := INTEGER((Time - 30.0 * 60.0) / (60.0 * 60.0));
         Time := Time - FLOAT(Hours) * 60.0 * 60.0;
         Minutes := INTEGER((Time - 30.0) / 60.0);
         Seconds := INTEGER(Time - 0.5) mod 60;
         Put(Hours, 3);
         Put(":");
         Put(Minutes, 2);
         Put(":");
         Put(Seconds, 2);
         tmp := Integer'Image(Hours);
      end sub;

   begin
      Time_And_Date := Clock;
      Split(Time_And_Date, Year, Month, Day, Seconds);
      sub(Seconds);
   end output_time;

end mytime;
