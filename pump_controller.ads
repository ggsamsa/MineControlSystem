package pump_controller is
   type pump_status is (on, off);
   procedure set_pump(to : pump_status);
   function request_status return pump_status;
end pump_controller;
