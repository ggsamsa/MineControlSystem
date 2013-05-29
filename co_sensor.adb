with operator_console;
with logger;
with Ada.Text_IO;
with operator_console;

package body co_sensor is
   co_present : integer := 700;
   procedure initialise is
   begin
      null;
   end initialise;

   procedure set_co(to : integer) is
   begin
      co_present := to;
   end set_co;

   function read_co return Integer is
   begin
      return co_present;
   end read_co;



   task body thread is
   begin
      loop
         if co_present > CO_HIGH then
            operator_console.alarm(operator_console.HIGH_CO);
            logger.co_log("HIGH_CO");
         end if;
         delay 15.0;
      end loop;

   end thread;
end co_sensor;
