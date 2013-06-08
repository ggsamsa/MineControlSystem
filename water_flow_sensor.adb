with device;
use device;
with pump_controller;
with hlw_handler;
with logger;
use hlw_handler;
use pump_controller;

package body water_flow_sensor is
   flow : Boolean := false;
   wfcsr : device.csr;

   function read_water_flow return Boolean is
   begin
      return flow;
   end read_water_flow;

   task body thread is
   begin
      loop

         if hlw_handler.read_water_mark /= hlw_handler.low
           and pump_controller.request_status = pump_controller.on then
            flow := true;
            logger.water_flow_log("Water flowing");
         else
            flow := false;
            logger.water_flow_log("Water not flowing");
         end if;
         delay 25.0;
      end loop;

   end thread;

end water_flow_sensor;
