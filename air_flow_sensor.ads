with device;
package air_flow_sensor is
   procedure initialise;

   function read_air_flow return boolean;

   procedure set_operation (to : device.device_operation);

   task thread;


end air_flow_sensor;
