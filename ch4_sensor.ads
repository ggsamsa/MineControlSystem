package ch4_sensor is


   procedure set_ch4 (to : integer);
   function read_ch4 return integer;

   task thread;

end ch4_sensor;
