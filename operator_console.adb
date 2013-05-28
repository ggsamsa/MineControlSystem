with pump_controller;
with Ada.Text_IO;
use Ada.Text_IO;

package body operator_console is

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
   end turn_pump_on;

   procedure turn_pump_off is
   begin
      pump_controller.set_pump(pump_controller.off);
   end turn_pump_off;

end operator_console;
