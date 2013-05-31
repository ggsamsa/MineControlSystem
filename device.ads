package device is
   type device_error is (clear, set);
   type device_operation is (clear, set);
   type interrupt_status is (Interrupt_disabled, Interrupt_enabled);
   type device_status is (Device_disabled, Device_enabled);
   type csr is
      record
         error_bit : device_error;
         operation : device_operation;
         done      : boolean;
         interrupt : interrupt_status;
         device    : device_status;
      end record;




   for device_error use (clear => 0, set => 1);
   for device_operation use (clear => 0, set => 1);
   for interrupt_status use (Interrupt_disabled => 0,
                             Interrupt_enabled => 1);
   for device_status use (Device_disabled => 0,
                          Device_enabled => 1);
end device;
