with device;
use device;

with logger;

package body water_flow_sensor is
   flow : water_flow := no;

   wfcsr : device.csr;

   function read_water_flow return water_flow is
   begin
      return flow;
   end read_water_flow;

   task body thread is
   begin
      loop

         if wfcsr.operation = device.set then
            flow := yes;
            logger.water_flow_log("Water flowing");
         else
            flow := no;
            logger.water_flow_log("Water not flowing");
         end if;
         delay 25.0;
      end loop;

   end thread;

end water_flow_sensor;
