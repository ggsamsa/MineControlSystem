package air_flow_sensor is

   function read_air_flow return boolean;

   procedure set_air_flow (to : Boolean);

   task thread;


end air_flow_sensor;
