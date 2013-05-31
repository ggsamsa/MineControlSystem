with operator_console;
with logger;

with pump_controller;
with ch4_status;
use pump_controller;

package body ch4_sensor is
   ch4_present : integer := 800;

   procedure set_ch4 (to : integer) is
   begin
      ch4_present := to;
   end set_ch4;

   function read_ch4 return Integer is
   begin
      return ch4_present;
   end;

   task body thread is
   begin
      loop
         if ch4_present > CH4_HIGH then
            ch4_status.write_ch4_status(ch4_status.ch4_unsafe);
            operator_console.alarm(operator_console.HIGH_METHANE);
            logger.ch4_log("HIGH_METHANE");
            pump_controller.not_safe;
         else
            ch4_status.write_ch4_status(ch4_status.ch4_safe);
            logger.ch4_log("METHANE_SAFE");
         end if;
         delay 35.0;
      end loop;

   end thread;
end ch4_sensor;
