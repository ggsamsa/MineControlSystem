package co_sensor is
   co_reading : integer range 0 .. 1023;
   CO_HIGH : constant := 600;

   procedure set_co(to : integer);
   function read_co return Integer;

   task thread;

end co_sensor;
