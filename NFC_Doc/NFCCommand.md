Command|	Function|	Instruction (INS)	|Standard
---|-----|-----|----|
ACTIVATE FILE|	Reversibly unblock a file.	|‘44’|	ISO/IEC 7816-9
APPEND RECORD|	Insert a new record in a file with a linear fixed structure.|	‘E2’|	ISO/IEC 7816-4|
APPLICATION BLOCK|	Reversibly block an application.|	‘1E’|	EMV|
APPLICATION UNBLOCK|	Unblock an application.|	‘18’	|EMV
ASK RANDOM	|Request a random number from the smart card.	|‘84’|	EN 726-3
CHANGE CHV|	Change the PIN.	|‘24’	|TS 51.011
CHANGE REFERENCE DATA|	Change the data used for user identification (e.g., a PIN).|	‘24’|	ISO/IEC 7816-8
CLOSE APPLICATION	|Reset all attained access condition levels.|	‘AC’|	EN 726-3
CONVERT IEP CURRENCY|	Convert currency.|	‘56’|	EN 1546-3
CREATE FILE|	Create a new file.|	‘E0’|	ISO/IEC 7816-9
CREATE RECORD|	Create a new record in a record-oriented file.|	‘E2’|	EN 726-3
CREDIT IEP|	Load the purse (IEP).	|‘52’	|EN 1546-3
CREDIT PSAM	|Pay from IEP to the PSAM.	|‘72’|	EN 1546-3
DEACTIVATE FILE|	Reversibly block a file.|	‘04’	|ISO/IEC 7816-9
DEBIT IEP	|Pay from the purse|	‘54’	|EN 1546-
DECREASE	|Reduce the value of a counter in a file.	|‘30’|	EN 726-3
DECREASE STAMPED	|Reduce the value of a counter in a file that is protected using a cryptographic checksum.|	‘34’	|EN 726-3
DELETE|	Delete a uniquely identifiable object (such as a load file, application or key).	|‘E4’|	OP
DELETE FILE	|Delete a file.	|‘E4’|	ISO/IEC 7816-9
DISABLE CHV|	Disable PIN queries.|	‘26’	|TS 51.011
DISABLE VERIFICATION REQUIREMENT|	Disable user identification (e.g., PIN queries).	|‘26’	|ISO/IEC 7816-8
ENABLE CHV|	Enable PIN queries.	|‘28’|	TS 51.011, EN 726-3
ENABLE VERIFICATION REQUIREMENT	|Enable user identification (e.g., PIN queries).	|‘28’	|ISO/IEC 7816-8
ENVELOPE	Embed| a command in a smart card command.|	‘C2’	|EN 726-3, ISO/IEC 7816-4
ERASE BINARY|	Set the content of a file with a transparent structure to the erased state.	|‘0E’|	ISO/IEC 7816-4
EXECUTE|	Execute a file.	|‘AE’|	EN 726-3
EXTEND	Extend |a file.	|‘D4’|	EN 726-3
EXTERNAL AUTHENTICATE|	Authenticate the outside world with respect to the smart card.|	‘82’	|ISO/IEC 7816-4
GENERATE AUTHORISATION CRYPTOGRAM |	Generate a signature for a payment transaction.|	‘AE’|	EMV
GENERATE PUBLIC KEY PAIR|	Generate a key pair for an asymmetric cryptographic algorithm.	|‘46’	|ISO/IEC 7816-8
GET CHALLENGE	 |Request a random number from the smart card.|	‘84’|	ISO/IEC 7816-4
GET DATA	|Read TLV-coded data objects.|	‘CA’	|ISO/IEC 7816-4
GET PREVIOUS IEP SIGNATURE	| Repeat the computation and output of the last signature received IEP.|	‘5A’|	EN 1546-3
GET PREVIOUS PSAM SIGNATURE|	Repeat the computation and output of the last signature received from the PSAM.	|‘86’|	EN 1546-3
GET RESPONSE|	Request data from the smart card (used with the T = 0 transmission protocol).|	‘C0’	|TS 51.011
GET STATUS|	Read the life-cycle state information of the card manager, application and load file.	|‘F2’	|ISO/IEC 7816-4, OP
GIVE RANDOM	|Send a random number to the smart card.	|‘86’	|EN 726-3
INCREASE	|Increase the value of a counter in a file.	|‘32’	|TS 51.011
INCREASE STAMPED|	Increase the value of a counter in a file that is protected using a cryptographic checksum.	|‘36’|	EN 726-3
INITIALIZE IEP	|Initialize IEP for a subsequent purse command.	|‘50’	|EN 1546-3
INITIALIZE PSAM	|Initialize PSAM for a subsequent purse command.	|‘70’	|EN 1546-3
INITIALIZE PSAM for Offline Collection	|Initialize PSAM for offline booking of the amount.	|‘7C’	|EN 1546-3
INITIALIZE PSAM for Online Collection|	Initialize PSAM for online booking of the amount.	|‘76’|	EN 1546-3
INITIALIZE PSAM for Update INSTALL INTERNAL AUTHENTICATE|	Initialize PSAM for changing the parameters. Install an application by invoking various oncard functions of the card manager and/or security domain. Authenticate the smart card with respect to the outside world.|	‘80’ ‘E6’ ‘88’|	EN 1546-3, OP, ISO/IEC 7816-4
INVALIDATE	|Reversibly block a file.	|‘04’|	TS 51.011, EN 726-3
ISSUER AUTHENTICATE|	Verify a signature of the card issuer.	|‘82’	|EMV-2
LOAD	|Load an application by transferring the load file.	|‘E8’	|OP
 LOAD KEY FILE LOCK MANAGE CHANNEL	|Load keys in files using cryptographic protection. Irreversibly block a file. Control the logical channels of a smart card.	|‘D8’ ‘76’ ‘70’	|EN 726-3, EN 726-3 ISO/IEC 7816-4
LOAD KEY FILE LOCK MANAGE CHANNEL |	Load keys in files using cryptographic protection. Irreversibly block a file. Control the logical channels of a smart card.|	‘D8’ ‘76’ ‘70’|	EN 726-3, EN 726-3 ISO/IEC 7816-4
MANAGE SECURITY ENVIRONMENT|	Change the parameters for using cryptographic algorithms in the smart card.|	‘22’	|ISO/IEC 7816-8
MUTUAL AUTHENTICATE|	Mutually authenticate the smart card and the terminal.	|‘82’	|ISO/IEC 7816-8
PERFORM SCQL OPERATION|	Execute an SCQL instruction.	|‘10’	|ISO/IEC 7816-7
PERFORM SECURITY OPERATION|	Execute a cryptographic algorithm in the smart card.	|‘2A’	|ISO/IEC 7816-8
PERFORM TRANSACTION OPERATION|	Execute an SCQL transaction instruction.	|‘12’	|ISO/IEC 7816-7
PERFORM USER OPERATION	Manage |users in the context of SCQL.	|‘14’	|ISO/IEC 7816-7
PSAM COLLECT|	Execute PSAM online booking of an amount.	|‘78’	|EN 1546-3
PSAM COLLECT|	End PSAM online booking of an amount.|	‘7A’|	EN 1546-3
PSAM COMPLETE |	End paying the IEP against the PSAM.|	‘74’|	EN 1546-3
PSAM VERIFY COLLECTION|	End PSAM offline booking of an amount.|	‘7E’|	EN 1546-3
PUT DATA	|Write TLV-coded data objects.|	‘DA’|	ISO/IEC 7816-4
PUT KEY|	Write one or more new keys or replace existing keys.|	‘D8’|	OP
REACTIVATE FILE|	Unblock a file.	|‘44’	|ISO/IEC 7816-9
READ BINARY	|Read from a file with a transparent structure.	|‘B0’	|TS 51.011
READ BINARY STAMPED	|Read data from a file with a transparent structure that is secured with a cryptographic checksum.	|‘B4’	|ISO/IEC 7816-4
READ RECORD	|Read data from a file with a record-oriented structure.	|‘B2’	|TS 51.011
READ RECORD(S)|	Read data from a file with a record-oriented structure.	|‘B2’|	ISO/IEC 7816-4
READ RECORD STAMPED	|Read data from a file with a record-oriented structure that is secured with a cryptographic checksum.	|‘B6’|	EN 726-3
REHABILITATE	|Unblock a file.|	‘44’	|TS 51.011 EN ???
RESET RETRYCOUNTER	|Reset an error counter.	|‘2C’|	ISO/IEC 7816-8
RUN GSM ALGORITHM|	Execute a GSM-specific cryptographic algorithm.	|‘88’	|TS 51.011
SEARCH BINARY	|Search for a text string in a file with a transparent structure.	|‘A0’	|ISO/IEC 7816-9
SEARCH RECORD	|Search for a text string in a file with a record-oriented structure.	|‘A2’|	ISO/IEC 7816-9
SEEK	|Search for a text string in a file with a record-oriented structure.|	‘A2’	|TS 51.011, EN 726-3
SELECT	|Select a file.|	‘A4’	|TS 51.011
SELECT (FILE)	|Select a file.	|‘A4’|	ISO/IEC 7816-4
SET STATUS	|Write life-cycle state data for the card manager, application and load file.	|‘F0’|	OP
SLEEP	Obsolete| command for setting the smart card in a power-saving state.	|‘FA’	|TS 51.011
STATUS	Read |various data from the currently selected file.|	‘F2’	|TS 51.011
TERMINATE CARD USAGE|	Irreversibly block a smart card.|	‘FE’|	ISO/IEC 7816-9
TERMINATE DF|	Irreversibly block a DF.|	‘E6’|	ISO/IEC 7816-9
TERMINATE EF	| Irreversibly block an EF.	|‘E8’|	ISO/IEC 7816-9
UNBLOCK CHV|	Reset a PIN retry counter that has reached its maximum value.|	‘2C’|	TS 51.011 EN
UPDATE BINARY |	Write to a file with a transparent structure.|	‘D6’	|TS 51.011, ISO/IEC7816-4
UPDATE IEP PARAMETER|	Change the general parameters of a purse.|	‘58’	|EN 1546-3
UPDATE PSAM Parameter (offline)	|Modify the parameters in the PSAM (offline).|	‘84’	|EN 1546-3
UPDATE PSAM Parameter (online)|	Modify the parameters in the PSAM (online).	|‘82’|	EN 1546-3
UPDATE RECORD	 |Write to a file with a linear fixed, linear variable or cyclic structure.	|‘DC’	|TS 51.011, ISO/IEC 7816-4
VERIFY	|Verify the transferred data (such as a PIN).	|‘20’|	ISO/IEC 7816-4, EMV
VERIFY CHV|	Verify the PIN.	|‘20’|	TS 51.011
WRITE BINARY|	Write to a file with a transparent structure using a logical AND/OR process.	|‘D0’|	ISO/IEC 7816-4
WRITE RECORD	|Write to a file with a record-oriented structure using a logical AND/OR process.	|‘D2’	|ISO/IEC 7816-4
Input/Output Parameters of important Smart Card Commands