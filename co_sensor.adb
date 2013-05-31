with logger; use logger;
with operator_console;

--pragma Elaborate_All(logger);
--pragma Elaborate_All(operator_console);
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
            co_log("HIGH_CO");
         end if;
         delay 35.0;
      end loop;

   end thread;
end co_sensor;
