//wijesinghe D.B.

#include <stdio.h>
#include <windows.h>

HANDLE _handler;
char _read_buf[1]= "";
char _wrrite_buf[1];

DWORD read = 0;
DWORD write = 0;

bool initialize_connection();
bool send_command(char command);
char receive_command();
void close_bluetooth_handler();


void PrintError( LPCSTR str)
{
	LPVOID lpMessageBuffer;
	int error = GetLastError();
	FormatMessage(
		FORMAT_MESSAGE_ALLOCATE_BUFFER |
		FORMAT_MESSAGE_FROM_SYSTEM,
		NULL,
		error,
		MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), //The user default language
		(LPTSTR) &lpMessageBuffer,
		0,
		NULL
	);
	printf("%s: (%d) %s\n\n",str,error,lpMessageBuffer);
	LocalFree( lpMessageBuffer );
}

bool initialize_connection(){

	TCHAR *pcCommPort = TEXT("COM1");


	// open port for I/O
	_handler = CreateFile(
		pcCommPort,
		GENERIC_READ|GENERIC_WRITE,
		0,NULL,
		OPEN_EXISTING,0,NULL);

	if(_handler == INVALID_HANDLE_VALUE) {
		PrintError("E012_Failed to open port");
		return false;
	} 
	else {
		// set timeouts
		COMMTIMEOUTS cto = { 1, 100, 1000, 0, 0 };
		DCB dcb;
		if(!SetCommTimeouts(_handler,&cto)){
			PrintError("E013_SetCommTimeouts failed");
			return false;
		}

		// set DCB
		memset(&dcb,0,sizeof(dcb));
		dcb.DCBlength = sizeof(dcb);
		dcb.BaudRate = 9600;
		dcb.fBinary = 1;
		dcb.fDtrControl = DTR_CONTROL_ENABLE;
		dcb.fRtsControl = RTS_CONTROL_ENABLE;
		// dcb.fOutxCtsFlow = 1;
		// dcb.fRtsControl = DTR_CONTROL_HANDSHAKE;

		dcb.Parity = NOPARITY;
		dcb.StopBits = ONESTOPBIT;
		dcb.ByteSize = 8;

		if(!SetCommState(_handler,&dcb)){
			PrintError("E014_SetCommState failed");
			return false;
		}

		printf("connected to robot!\n");

		int i =1;
		
		_wrrite_buf[0] = -1;

	}
	return true;
}

bool send_command(char command){
	_wrrite_buf[0] = command;
	WriteFile(_handler,_wrrite_buf,1,&write,NULL);
	_wrrite_buf[0] = -1;
	return true;
}

char receive_command(){
	char temp ;
	ReadFile(_handler,_read_buf,sizeof(_read_buf),&read,NULL);// read is updated with the number of bytes read
	temp = _read_buf[0];
	_read_buf[0] = NULL;
	return temp;
}

void close_bluetooth_handler(){
	CloseHandle(_handler);
}