with operator_console;
with logger;
with Ada.Text_IO;


package body co_sensor is
   co_present : co_reading := 700;
   procedure initialise is
   begin
      null;
   end initialise;

   task body thread is
   begin
      -- co_present := valor
      if co_present > CO_HIGH then
         --         operator_console.alarm(HIGH_CO);
               Ada.Text_IO.Put_Line("qwe");
         logger.co_log("HIGH_CO");
         null;

      end if;
   end thread;
end co_sensor;
