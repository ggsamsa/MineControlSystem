with pump_controller;
with Ada.Text_IO;
use Ada.Text_IO;

package body operator_console is

   prev : alarm_reason;

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

   procedure turn_pump_off is
   begin
      pump_controller.set_pump(pump_controller.off);
   end turn_pump_off;

   procedure alarm (reason : alarm_reason) is
   begin
      if reason /= prev then
         case reason is
         when HIGH_CO => Put_Line ("/!\/!\ HIGH_CO /!\/!\");
         when HIGH_METHANE => Put_Line ("/!\/!\ HIGH_METHANE /!\/!\");
         when NO_AIR_FLOW => Put_Line ("/!\/!\ NO_AIR_FLOW /!\/!\");
         when others => null;
         end case;
         prev := reason;
      end if;
   end alarm;

   procedure info (content : info_content) is
   begin
      case content is
         when WATER_HIGH => Put_Line ("Water reached a HIGH level");
         when WATER_LOW => Put_Line ("Water reached a LOW level");
         when PUMP_ON => Put_Line ("Pump is ON");
         when PUMP_OFF => Put_Line ("Pump is OFF");
         when others => null;
      end case;
   end info;


end operator_console;
