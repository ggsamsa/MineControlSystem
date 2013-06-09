with ch4_status; use ch4_status;
with logger;


package body pump_controller is
   motor_status : pump_status := off;
   motor_condition : pump_condition := enabled;

   pump : Boolean := false;

   procedure set_pump(to : pump_status) is
   begin
      if to = on and not pump then
         if ch4_status.read_ch4_status = ch4_status.ch4_safe then
            motor_status := on;
            logger.pump_log ("Pump is ON");
         else
            raise PUMP_NOT_SAFE;
         end if;
      else
         if motor_status = on then
            motor_status := off;
            logger.pump_log ("Pump is OFF");

         end if;
      end if;
   end set_pump;

   procedure switch_pump_by_oper is
   begin
      if pump = true then
        pump := false;
      else
         pump := true;
      end if;
   end switch_pump_by_oper;

   function read_pump_switch return Boolean is
   begin
        return pump;
   end read_pump_switch;


   function request_status return pump_status is
   begin
      return motor_status;
   end request_status;

   procedure is_safe is
   begin
      if motor_status = on then
         logger.pump_log("motor_started");
         motor_condition := enabled;
      end if;
      logger.pump_log("motor_safe");
   end is_safe;

   procedure not_safe is
   begin
      if motor_status = on then
         motor_status := off;
      end if;
      motor_condition := disabled;
      logger.pump_log("motor unsafe");
   end not_safe;

end pump_controller;
