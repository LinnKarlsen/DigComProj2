/* Include files */

#include "CommSysSimulink_Project2_cgxe.h"
#include "m_pbzv8PJFjDjKVJ8RPx81DE.h"

unsigned int cgxe_CommSysSimulink_Project2_method_dispatcher(SimStruct* S, int_T
  method, void* data)
{
  if (ssGetChecksum0(S) == 1827223586 &&
      ssGetChecksum1(S) == 1086880661 &&
      ssGetChecksum2(S) == 3238265965 &&
      ssGetChecksum3(S) == 1216730885) {
    method_dispatcher_pbzv8PJFjDjKVJ8RPx81DE(S, method, data);
    return 1;
  }

  return 0;
}
