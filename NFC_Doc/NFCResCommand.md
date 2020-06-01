| Returncode |	Status | Meaning	| Standard|
----|----|----|---|
‘61xx’|	NP	| Command successfully executed; ‘xx’ bytes of data are available and can be requested using GET RESPONSE.	|ISO/IEC 7816-4
‘6281’|	WP	| The returned data may be erroneous.	|ISO/IEC 7816-4
‘6282’	|WP	 |Fewer bytes than specified by the Le parameter could be read, since the end of the file was encountered first.	|ISO/IEC 7816-4
‘6283’	|WP|	The selected file is reversibly blocked (invalidated).	|ISO/IEC 7816-4
‘6284’|	WP|	The file control information (FCI) is not structured in accordance with ISO/IEC7816-4.	|ISO/IEC 7816-4
‘62xx’|	WP|	Warning; state of non-volatile memory not changed.|	ISO/IEC 7816-4
‘63Cx’	|WP |	The counter has reached the value ‘x’ (0 = x = 15) (the exact significance depends on the command).	| ISO/IEC 7816-4
|‘63xx’	|WP|	Warning; state of non-volatile memory changed.|ISO/IEC 7816-4
|‘64xx’|	EE	|Execution error; state of non-volatile memory not changed.	|ISO/IEC 7816-4
|‘6581’	|EE	|Memory error (e.g. during a write operation).	|ISO/IEC 7816-4
|‘65xx’|	EE|	Execution error; state of non-volatile memory changed.	|ISO/IEC 7816-4
|‘6700’	|CE	 |Length incorrect.|	ISO/IEC 7816-4
|‘67xx’ . . . ‘6Fxx’|	CE	|Check errors.	|ISO/IEC 7816-4
|‘6800’	|CE	|Functions in the class byte not supported (general).	|ISO/IEC 7816-4
|‘6881’	|CE|	Logical channels not supported.|	|ISO/IEC 7816-4
|‘6882’	|CE	|Secure messaging not supported.|	|ISO/IEC 7816-4
|‘6900’	|CE|	Command not allowed (general)	|ISO/IEC 7816-4|
|‘6981’	|CE|	Command incompatible with file structure.|	|ISO/IEC 7816-4
|‘6982’	|CE	|Security state not satisfied.	|ISO/IEC 7816-4|
|‘6983’	|CE	|Authentication method blocked.|	|ISO/IEC 7816-4
‘6984’	|CE	|Referenced data reversibly blocked (invalidated).|	ISO/IEC 7816-4
|‘6985’	|CE|	Usage conditions not satisfied.|	ISO/IEC 7816-4
|‘6986’	|CE|	Command not allowed (no EF selected).|	ISO/IEC 7816-4
‘6987’	|CE|	Expected secure messaging data objects missing.	|ISO/IEC 7816-4
‘6988’	|CE	|Secure messaging data objects incorrect.	|ISO/IEC 7816-4
‘6A00’|	CE|	Incorrect P1 or P2 parameters (general).	|ISO/IEC 7816-4
‘6A80’|	CE|	Parameters in the data portion are incorrect.	|ISO/IEC 7816-4
‘6A81’|	CE	|Function not supported.	ISO/IEC 7816-4
‘6A82’|	CE	|File not found.	|ISO/IEC 7816-4
‘6A83’|	CE|	Record not found.	|ISO/IEC 7816-4
‘6A84’	|CE|	Insufficient memory.	I|SO/IEC 7816-4
‘6A85’	|CE|	Lc inconsistent with TLV structure	|ISO/IEC 7816-4
‘6A86’|	CE|	Incorrect P1or P2 parameter.	|ISO/IEC 7816-4
‘6A87’	|CE|	Lc inconsistent with P1 or P2.	|ISO/IEC 7816-4
‘6A88’	|CE|	Referenced data not found.	|ISO/IEC 7816-4
‘6B00’|	CE|	Parameter 1 or 2 incorrect.	|ISO/IEC 7816-4
‘6Cxx’	|CE|	Bad length value in Le; ‘xx’ is the correct length.	|ISO/IEC 7816-4
‘6D00’	|CE|	Command (instruction) not supported.	|ISO/IEC 7816-4
‘6E00’	|CE|	Class not supported.	|ISO/IEC 7816-4
‘6F00’|	CE|	Command aborted – more exact diagnosis not possible (e.g., operating system error).	|ISO/IEC 7816-4
‘9000’	|NP|	Command successfully executed.	|ISO/IEC 7816-4
‘920x’	|NP|	Writing to EEPROM successful after ‘x’ attempts.	|TS 51.011
‘9210’	|CE|	Insufficient memory.	|TS 51.011
‘9240’|	EE|	Writing to EEPROM not successful.	|TS 51.011
‘9400’	|CE	|No EF selected.	|TS 51.011
‘9402’	|CE	|Address range exceeded.	|TS 51.011
‘9404’|	CE|	FID not found, record not found or comparison pattern not found.	|TS 51.011
‘9408’|CE|Selected file type does not match command.	|TS 51.011
‘9802’	|CE|	No PIN defined.	|TS 51.011
‘9804’|	CE|	Access conditions not satisfied, authentication failed.	|TS 51.011
‘9835’	|CE	|ASK RANDOM or GIVE RANDOM not executed.	|TS 51.011
‘9840’	|CE	|PIN verification not successful.	|TS 51.011
‘9850’|	CE	|INCREASE or DECREASE could not be executed because a limit has been reached.|TS 51.011
‘9Fxx’|	NP|	Command successfully executed; ‘xx’ bytes of data are available and can be requested using GET RESPONSE.	|TS 51.011
