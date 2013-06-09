with pump_controller;
with Ada.Text_IO;
use Ada.Text_IO;

package body operator_console is

   alarm_1, alarm_2, alarm_3, alarm_4, alarm_5, alarm_6, alarm_7 : Boolean;

   procedure request_pump_status is
      ps : pump_controller.pump_status;
   begin
      ps := pump_controller.request_status;
      case ps is
         when pump_controller.on => Put_Line("Pump is ON");
         when pump_controller.off => Put_Line("Pump is OFF");
      end case;
   end request_pump_status;

   procedure turn_pump_on is
   begin
      pump_controller.set_pump(pump_controller.on);
   exception
         when pump_controller.PUMP_NOT_SAFE => Put_Line("/!\/!\ PUMP NOT SAFE /!\/!\");
   end turn_pump_on;

   procedure switch_pump is
   begin
      pump_controller.switch_pump_by_oper;
   end switch_pump;

   procedure alarm (reason : alarm_reason) is
   begin
      case reason is
         when HIGH_CO => alarm_1 := true;
         when HIGH_METHANE => alarm_2 := true;
         when NO_AIR_FLOW => alarm_3 := true;
         when WATER_HIGH => alarm_4 := true;
         when WATER_LOW => alarm_5 := true;
         when PUMP_ON => alarm_6 := true;
         when PUMP_OFF => alarm_7 := true;
         when others => null;
      end case;
   end alarm;

   procedure check_alarms is
   begin
      clear_alarms;
      delay 0.8;
      if alarm_1 = true then
         Put_Line ("/!\/!\ HIGH_CO /!\/!\");
      end if;
      if alarm_2 = true then
         Put_Line ("/!\/!\ HIGH_METHANE /!\/!\");
      end if;
      if alarm_3 = true then
         Put_Line ("/!\/!\ NO_AIR_FLOW /!\/!\");
      end if;
      if alarm_4 = true then
         Put_Line ("Water reached a HIGH level");
      end if;
      if alarm_5 = true then
         Put_Line ("Water reached a LOW level");
      end if;
      if alarm_6 = true then
         Put_Line ("Pump is ON");
      end if;
      if alarm_7 = true then
         Put_Line ("Pump is OFF");
      end if;
      clear_alarms;
   end check_alarms;

   procedure clear_alarms is
   begin
      alarm_1 := false;
      alarm_2 := false;
      alarm_3 := false;
      alarm_4 := false;
      alarm_5 := false;
      alarm_6 := false;
      alarm_7 := false;
   end clear_alarms;

end operator_console;
