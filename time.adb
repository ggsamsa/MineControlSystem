   with Ada.Text_IO;         use Ada.Text_IO;
   with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
   with Calendar;            use Calendar;
package body mytime is

     Year,Month,Day : INTEGER;
   Start,Seconds  : DAY_DURATION;
   Time_And_Date  : TIME;


   procedure output_time is

      Time : FLOAT;
      Hours, Minutes, Seconds : INTEGER;
   begin
      Time_And_Date := Clock;
      Split(Time_And_Date, Year, Month, Day, Seconds);
      Time := FLOAT(Seconds);
      Hours := INTEGER((Time - 30.0 * 60.0) / (60.0 * 60.0));
      Time := Time - FLOAT(Hours) * 60.0 * 60.0;
      Minutes := INTEGER((Time - 30.0) / 60.0);
      Seconds := INTEGER(Time - 0.5) mod 60;
      Put(Hours, 3);
      Put(":");
      Put(Minutes, 2);
--      Put(":");
 --     Put(Seconds, 2);

   end output_time;
end mytime;
