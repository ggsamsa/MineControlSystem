with Ada.Text_IO;
use Ada.Text_IO;
with operator_console;
with co_sensor;


procedure main is

   a : Character;

begin


   loop
      Put_Line ("/^\_/^\_/^\_/^\_/^\");
      Put_Line ("Do you wish to:");
      Put_Line ("turn (O)n the pump");
      Put_Line ("turn o(F)f the pump");
      Put_Line ("(R)equest pump status");
      Put_Line ("e(X)it");

      co_sensor.initialise;

      Get_Immediate(a);

      case a is
         when 'r' => operator_console.request_pump_status;
         when 'o' => operator_console.turn_pump_on;
         when 'f' => operator_console.turn_pump_off;
         when 'x' => exit;
         when others => Put_Line("Undefined option");
      end case;
   end loop;
end main;
