with hlw_handler;
with Ada.Text_IO; use Ada.Text_IO;


package body simulator is
   task body thread is
   begin
      hlw_handler.write_water_mark(hlw_handler.high);
      delay 60.0;
      hlw_handler.write_water_mark(hlw_handler.low);
   end thread;

end simulator;
