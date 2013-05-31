with operator_console;
with logger;
with device;
use device;

package body air_flow_sensor is
   air_flow : boolean;

   afcsr : device.csr;

   procedure initialise is
   begin
      null;
   end initialise;

   procedure set_operation(to : device.device_operation) is
   begin
      afcsr.operation := to;
   end set_operation;


   function read_air_flow return boolean is
   begin
      return air_flow;
   end read_air_flow;

   task body thread is
   begin
      loop
         air_flow := afcsr.operation = device.set;
         if not air_flow then
            operator_console.alarm(operator_console.NO_AIR_FLOW);
            logger.air_flow_log("NO_AIR_FLOW");
         else
            logger.air_flow_log("AIR_FLOW");
         end if;
         delay 20.0;
      end loop;

   end thread;
end air_flow_sensor;
