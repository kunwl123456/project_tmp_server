#include "core_dumper.h"

#include <cstdio>
#include <signal.h>
#include <stdlib.h>
#include <string.h>

#ifdef __linux__
#include <unistd.h>
#include <sys/statfs.h>

#else
#include <windows.h>
#include <stdlib.h>
#include <DbgHelp.h>
#include <eh.h>
#include <psapi.h>

#pragma comment(lib,"Dbghelp.lib")
#endif



























































