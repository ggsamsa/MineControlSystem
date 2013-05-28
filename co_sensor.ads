package co_sensor is
   type co_reading is new integer range 0 .. 1023;
   CO_HIGH : constant co_reading := 600;

   procedure initialise;
   task thread;

end co_sensor;
