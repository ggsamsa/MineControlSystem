package water_flow_sensor is
   type water_flow is (yes, no);

   function read_water_flow return water_flow;

   task thread;

end water_flow_sensor;
