package operator_console is

   type alarm_reason is (HIGH_METHANE, HIGH_CO, NO_AIR_FLOW, UNKNOWN_ERROR);

   procedure request_pump_status;
   procedure turn_pump_on;
   procedure turn_pump_off;
   procedure alarm(reason : alarm_reason);

end operator_console;
