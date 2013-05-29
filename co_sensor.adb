with operator_console;
with logger;
with Ada.Text_IO;


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

   procedure read_co is
   begin
      Ada.Text_IO.Put_Line ("-> " & Integer'Image(co_present));
   end read_co;



   task body thread is
   begin
      -- co_present := valor
      if co_present > CO_HIGH then
         --         operator_console.alarm(HIGH_CO);
         logger.co_log("HIGH_CO");
         null;

      end if;
   end thread;
end co_sensor;
