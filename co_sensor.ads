package co_sensor is
   co_reading : integer range 0 .. 1023;
   CO_HIGH : constant := 600;

   procedure initialise;

   procedure set_co(to : integer);
   procedure read_co;

   task thread;

end co_sensor;
