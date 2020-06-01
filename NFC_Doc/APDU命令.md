#### APDU

APDU 消息体的结构

一个应用中通常包含发送命令和接收消息两部分，因此一个正确的responds需要一个正确的Command。

##### command APDU 


Illustrated by figure 3 (see also table 6), the command APDU defined in this part of ISO/IEC 7816 consists of

根据ISO/IEC 7816 规定

* 强制的头信息包含 4 bytes (CLA INS P1 P2)
* 附加的body体：可变长度的Data 信息

Header|	Body|
---|-----------|
CLA INS P1 P2|	[Lc field] [Data field] [Le field]

在[data field]区域的数据长度代表示[LC filed]的信息
期望的最大数据代表了LC(length of expected data)，当le 只包含零的时候，返回可以去获取的最大数据

Code	|Name|	Length	|Description|
----|----|----|---|
CLA	|Class|	1	|Class of instruction
INS	|Instruction	|1|	Instruction code
P1|	Parameter 1	|1|	Instruction parameter 1
P2	|Parameter 2	|1|	Instruction parameter 2
Lc field	|Length|	variable 1 or 3	|Number of bytes present in the data field of the command
Data field|	Data|	variable=Lc	|String of bytes sent in the data field of the command
Le field	|Length|	variable 1 or 3|	Maximum number of bytes expected in the data field of the response to the command


####Response APDU

在ISO/IEC 7816 协议中 APDU 包含如下两部分

APDU defined in this part of ISO/IEC 7816 consists of
a conditional body of variable length
a mandatory trailer of 2 bytes (SW1 SW2)

Body|	Trailer|
----|-----|
[Data field]|	SW1 SW2


Code|	Name|	Length|	Description
---|---|---|----
Data field|	Data|	variable=Lr|	String of bytes received in the data field of the response
SW1	|Status byte 1|	1|	Command processing status
SW2	|Status byte 2	|1|	Command processing qualifier


#### Class byte




#### Instruction byte 
当CLA位于’00’ 和 ‘7F‘之间对应的INS含义 在 ISO/IEC 7816. 标准中 ISO/IEC JTC 1 SC17.

|Value|	Command name|	Clause
----|----|----|
‘0E’|	ERASE BINARY	|6.4
’20’|	VERIFY	|6.12
’70’|	MANAGE CHANNEL	|6.16
’82’|	EXTERNAL AUTHENTICATE	|6.14
’84’|	GET CHALLENGE	|6.15
’88’|	INTERNAL AUTHENTICATE	|6.13
‘A4’|	SELECT FILE	|6.11
‘B0’|	READ BINARY	|6.1
‘B2’|	READ RECORD(S)	|6.5
‘C0’|	GET RESPONSE	|7.1
‘C2’|	ENVELOPE	|7.2
‘CA’|	GET DATA	|6.9
‘D0’|	WRITE BINARY	|6.2
‘D2’|	WRITE RECORD	|6.6
‘D6’|	UPDATE BINARY|	6.3
‘DA’|	PUT DATA	|6.10
‘DC’|	UPDATE DATA	|6.8
‘E2’|	APPEND RECORD	|6.7




