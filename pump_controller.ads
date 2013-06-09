package pump_controller is
   type pump_status is (on, off);
   type pump_condition is (enabled, disabled);

   PUMP_NOT_SAFE : exception;

   procedure set_pump(to : pump_status);
   function request_status return pump_status;
   procedure is_safe;
   procedure not_safe;

   procedure switch_pump_by_oper;

   function read_pump_switch return Boolean;

end pump_controller;
