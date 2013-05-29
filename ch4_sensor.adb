with logger;
with operator_console;
with pump_controller;
with ch4_status;

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
            logger.co_log("HIGH_CO");
            pump_controller.not_safe;
         else
            ch4_status.write_ch4_status(ch4_status.ch4_safe);
         end if;
         delay 15.0;
      end loop;

   end thread;
end ch4_sensor;