/* Include files */

#include "CommSysSimulink_Project2_cgxe.h"
#include "m_eQlRKhlrApBR0RaIazSroB.h"

unsigned int cgxe_CommSysSimulink_Project2_method_dispatcher(SimStruct* S, int_T
  method, void* data)
{
  if (ssGetChecksum0(S) == 3560902291 &&
      ssGetChecksum1(S) == 1521207093 &&
      ssGetChecksum2(S) == 2518481547 &&
      ssGetChecksum3(S) == 2820928656) {
    method_dispatcher_eQlRKhlrApBR0RaIazSroB(S, method, data);
    return 1;
  }

  return 0;
}
