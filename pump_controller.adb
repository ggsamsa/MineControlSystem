package body pump_controller is
   motor_status : pump_status := off;

   procedure set_pump(to : pump_status) is
   begin
      if to = on then
         motor_status := on;
      else
         motor_status := off;
      end if;
   end set_pump;

   function request_status return pump_status is
   begin
      return motor_status;
   end request_status;

end pump_controller;
