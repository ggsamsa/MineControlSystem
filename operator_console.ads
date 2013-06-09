package operator_console is

   type alarm_reason is (HIGH_METHANE, HIGH_CO, NO_AIR_FLOW, UNKNOWN_ERROR,
                        WATER_HIGH, WATER_LOW, PUMP_ON, PUMP_OFF);

   procedure check_alarms;
   procedure clear_alarms;

   procedure request_pump_status;
   procedure turn_pump_on;
   procedure turn_pump_off;
   procedure alarm(reason : alarm_reason);

end operator_console;
