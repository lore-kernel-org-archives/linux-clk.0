Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF5FC10F14
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 13:26:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 41146217D7
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 13:26:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=factor-ts.ru header.i=@factor-ts.ru header.b="nDuu2Vh+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388302AbfDRN0x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 09:26:53 -0400
Received: from dionis-sg.factor-ts.ru ([194.154.76.132]:37703 "EHLO
        factor-ts.ru" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389005AbfDRN0x (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Apr 2019 09:26:53 -0400
Subject: Re: [E1000-devel] igb driver with Intel Atom Bay Trail issue
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=factor-ts.ru; s=10;
        t=1555593998; bh=b613gw7TynOA/eZdNvQMYv8BFdNMmbofw4G/G4JiQUI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To;
        b=nDuu2Vh+qrJXWjdhOmePfTWUs2B1+qAEUT8cuUuB2b6iTqXexqRLTM1xsre6h6ydk
         VcePwZtYaJfPYMwn4n+dqRsJKMlrMJoZevd8EQhewAy4+LRpA4HJgl+H/ZjCiHjtXm
         ZV8Bb4mWBZjC46pMmY0uv26Dr2jjY8m1+lQ7rCqM=
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?Q?David_M=c3=bcller?= <dave.mueller@gmx.ch>,
        "Fujinaka, Todd" <todd.fujinaka@intel.com>,
        "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>,
        "e1000-devel@lists.sf.net" <e1000-devel@lists.sf.net>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <e01bb9da-0dde-4bfa-5693-eb4c02a1d696@redhat.com>
 <20190328152421.GJ9224@smile.fi.intel.com>
 <26800a0e-c309-1e69-c5b4-e11b761c7b40@redhat.com>
 <20190328154931.GK9224@smile.fi.intel.com>
 <d4c44bc8-ae0c-a6ff-3042-ae3185ceb33e@redhat.com>
 <ef893b2e-121a-d395-9843-47d0c9f1515a@factor-ts.ru>
 <942808d6-e2c1-cc8c-4aed-9b44a7ce4c76@redhat.com>
 <c5ebcf73-1706-48d8-6904-ae6a89c44151@redhat.com>
 <20190408172111.GX9224@smile.fi.intel.com>
 <a5392081-b545-6c19-ed0f-d71432308c63@redhat.com>
 <20190409153125.GU9224@smile.fi.intel.com>
 <a05e2ac3-de31-bd7a-6b39-8cdf00190f67@redhat.com>
From:   Semyon Verchenko <semverchenko@factor-ts.ru>
Message-ID: <c2fa7ae8-1ad5-1a85-3e25-8bc5a9b5ee01@factor-ts.ru>
Date:   Thu, 18 Apr 2019 16:26:32 +0300
MIME-Version: 1.0
In-Reply-To: <a05e2ac3-de31-bd7a-6b39-8cdf00190f67@redhat.com>
Content-Type: multipart/mixed;
 boundary="------------321881A98C0FCA60AC0E666F"
Content-Language: en-US-large
X-MailScanner-ID: 451B423E8003.A00E2
X-MailScanner: Found to be clean
X-MailScanner-From: semverchenko@factor-ts.ru
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This is a multi-part message in MIME format.
--------------321881A98C0FCA60AC0E666F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 18.04.2019 16:09, Hans de Goede wrote:
> Hi,
>
> On 09-04-19 17:31, Andy Shevchenko wrote:
>> On Mon, Apr 08, 2019 at 08:43:10PM +0200, Hans de Goede wrote:
>>> On 08-04-19 19:21, Andy Shevchenko wrote:
>>>> On Thu, Apr 04, 2019 at 04:43:03PM +0200, Hans de Goede wrote:
>>>>> On 29-03-19 16:53, Hans de Goede wrote:
>>>>>> On 3/29/19 2:59 PM, Семен Верченко wrote:
>>>>
>>>>>> Hmm, so 4 ethernet cards and 4 enabled / marked as critical clocks.
>>>>>>
>>>>>> Supporting this through get_clk is going to require a DMI table 
>>>>>> in the igb driver
>>>>>> combined with checking which PCI "slot" the card is to get the 
>>>>>> correct clock
>>>>>> for each ethernet controller.
>>>>>>
>>>>>> I believe tht just restoring the old behavior to mark all clocks 
>>>>>> enabled
>>>>>> on boot as critical, but then limited to this system based on a 
>>>>>> dmi match,
>>>>>> is the best solution here.
>>>>>>
>>>>>> Andy?
>>>>>
>>>>> Andy? Now that we've the patch ready for the other system which 
>>>>> needs to
>>>>> have the CLK_IS_CRITICAL workaround and enables this based on DMI 
>>>>> info,
>>>>> I believe the best fix for this system is to simply add it to that 
>>>>> DMI
>>>>> table?
>>>>
>>>> I reviewed v4, supposed to go via CLK tree.
>>>
>>> Right, but that patch adds the quirk for the system with the USB hub,
>>> do you agree, that given that each ethernet controller seems to be
>>> using its own clock, it is best to use a DMI quirk for this case too?
>>>
>>> If you agree then someone needs to prepare a follow-up patch on top of
>>> v4 which adds the DMI info for this board to the table.
>>
>> I hope we may find a better solution in the future, but for now as a 
>> quick fix
>> the proposed can be done.
>
> Ok.
>
> Семен Верченко, this means that we are going to need DMI info from
> the board in question. I thought we already had that, but I now see that
> you original report did not have that a
>
> Please run as root:
>
> dmidecode &> dmidecode.log
>
> And then reply to this email with the generated dmidecode.log file
> attached. Once I have that file I can prepare a patch fixing this.
>
> Regards,
>
> Hans
>

--------------321881A98C0FCA60AC0E666F
Content-Type: text/x-log;
 name="dmidecode.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dmidecode.log"

# dmidecode 3.2
Getting SMBIOS data from sysfs.
SMBIOS 2.7 present.
51 structures occupying 2122 bytes.
Table at 0x000E6F40.

Handle 0x0000, DMI type 0, 24 bytes
BIOS Information
	Vendor: INSYDE Corp.
	Version: 3I380D A3
	Release Date: 11/09/2015
	Address: 0xF0000
	Runtime Size: 64 kB
	ROM Size: 3072 kB
	Characteristics:
		PCI is supported
		BIOS is upgradeable
		BIOS shadowing is allowed
		Boot from CD is supported
		Selectable boot is supported
		EDD is supported
		8042 keyboard services are supported (int 9h)
		Serial services are supported (int 14h)
		Printer services are supported (int 17h)
		CGA/mono video services are supported (int 10h)
		ACPI is supported
		USB legacy is supported
		ATAPI Zip drive boot is supported
		BIOS boot specification is supported
		Function key-initiated network boot is supported
		Targeted content distribution is supported
	BIOS Revision: 24.0
	Firmware Revision: 0.0

Handle 0x0001, DMI type 1, 27 bytes
System Information
	Manufacturer: Lex BayTrail      
	Product Name: 3I380D            
	Version:                   
	Serial Number: BT-I C2II1
	UUID: 00000001-0000-4000-0000-4c028910f18b
	Wake-up Type: Power Switch
	SKU Number:                   
	Family:                   

Handle 0x0002, DMI type 2, 17 bytes
Base Board Information
	Manufacturer: Lex               
	Product Name: 3I380D            
	Version:                   
	Serial Number:                   
	Asset Tag:                   
	Features:
		Board is a hosting board
		Board is replaceable
	Location In Chassis:                   
	Chassis Handle: 0x0003
	Type: Motherboard
	Contained Object Handles: 0

Handle 0x0003, DMI type 3, 24 bytes
Chassis Information
	Manufacturer: Lex               
	Type: Notebook
	Lock: Not Present
	Version:                   
	Serial Number:                   
	Asset Tag:                   
	Boot-up State: Safe
	Power Supply State: Safe
	Thermal State: Safe
	Security Status: None
	OEM Information: 0x00000000
	Height: Unspecified
	Number Of Power Cords: 1
	Contained Elements: 0
	SKU Number: Not Specified

Handle 0x0004, DMI type 4, 42 bytes
Processor Information
	Socket Designation: CPU 1
	Type: Central Processor
	Family: Atom
	Manufacturer: Intel(R) Corporation
	ID: 79 06 03 00 FF FB EB BF
	Signature: Type 0, Family 6, Model 55, Stepping 9
	Flags:
		FPU (Floating-point unit on-chip)
		VME (Virtual mode extension)
		DE (Debugging extension)
		PSE (Page size extension)
		TSC (Time stamp counter)
		MSR (Model specific registers)
		PAE (Physical address extension)
		MCE (Machine check exception)
		CX8 (CMPXCHG8 instruction supported)
		APIC (On-chip APIC hardware supported)
		SEP (Fast system call)
		MTRR (Memory type range registers)
		PGE (Page global enable)
		MCA (Machine check architecture)
		CMOV (Conditional move instruction supported)
		PAT (Page attribute table)
		PSE-36 (36-bit page size extension)
		CLFSH (CLFLUSH instruction supported)
		DS (Debug store)
		ACPI (ACPI supported)
		MMX (MMX technology supported)
		FXSR (FXSAVE and FXSTOR instructions supported)
		SSE (Streaming SIMD extensions)
		SSE2 (Streaming SIMD extensions 2)
		SS (Self-snoop)
		HTT (Multi-threading)
		TM (Thermal monitor supported)
		PBE (Pending break enabled)
	Version: Intel(R) Atom(TM) CPU  E3825  @ 1.33GHz
	Voltage: 0.8 V
	External Clock: 133 MHz
	Max Speed: 1330 MHz
	Current Speed: 1340 MHz
	Status: Populated, Enabled
	Upgrade: None
	L1 Cache Handle: 0x0008
	L2 Cache Handle: 0x0009
	L3 Cache Handle: Not Provided
	Serial Number: Not Specified
	Asset Tag: Not Specified
	Part Number: Not Specified
	Core Count: 2
	Core Enabled: 2
	Thread Count: 1
	Characteristics:
		64-bit capable
		Multi-Core
		Execute Protection
		Enhanced Virtualization
		Power/Performance Control

Handle 0x0005, DMI type 6, 12 bytes
Memory Module Information
	Socket Designation: DIMM0
	Bank Connections: 0 0
	Current Speed: Unknown
	Type: None
	Installed Size: 4096 MB (Single-bank Connection)
	Enabled Size: 4096 MB (Single-bank Connection)
	Error Status: OK

Handle 0x0006, DMI type 6, 12 bytes
Memory Module Information
	Socket Designation: DIMM1
	Bank Connections: 0 0
	Current Speed: Unknown
	Type: None
	Installed Size: Not Installed
	Enabled Size: Not Installed
	Error Status: OK

Handle 0x0007, DMI type 7, 19 bytes
Cache Information
	Socket Designation: L1 Cache
	Configuration: Enabled, Not Socketed, Level 1
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 48 kB
	Maximum Size: 48 kB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Single-bit ECC
	System Type: Data
	Associativity: Fully Associative

Handle 0x0008, DMI type 7, 19 bytes
Cache Information
	Socket Designation: L1 Cache
	Configuration: Enabled, Not Socketed, Level 1
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 64 kB
	Maximum Size: 64 kB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Single-bit ECC
	System Type: Instruction
	Associativity: 8-way Set-associative

Handle 0x0009, DMI type 7, 19 bytes
Cache Information
	Socket Designation: L2 Cache
	Configuration: Enabled, Not Socketed, Level 2
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 1024 kB
	Maximum Size: 1024 kB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Single-bit ECC
	System Type: Unified
	Associativity: 8-way Set-associative

Handle 0x000A, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J1A2
	Internal Connector Type: None
	External Reference Designator: USB2.0
	External Connector Type: Access Bus (USB)
	Port Type: USB

Handle 0x000B, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J1A2
	Internal Connector Type: None
	External Reference Designator: USB2.0
	External Connector Type: Access Bus (USB)
	Port Type: USB

Handle 0x000C, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J2A2
	Internal Connector Type: None
	External Reference Designator: USB3.0 Port0
	External Connector Type: Access Bus (USB)
	Port Type: USB

Handle 0x000D, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J9D1
	Internal Connector Type: None
	External Reference Designator: UART to Micro USB
	External Connector Type: Access Bus (USB)
	Port Type: USB

Handle 0x000E, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: CON6A1
	Internal Connector Type: None
	External Reference Designator: SD Card
	External Connector Type: Other
	Port Type: Other

Handle 0x000F, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J9B1
	Internal Connector Type: None
	External Reference Designator: Keyboard
	External Connector Type: PS/2
	Port Type: Keyboard Port

Handle 0x0010, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J9B1
	Internal Connector Type: None
	External Reference Designator: Mouse
	External Connector Type: PS/2
	Port Type: Mouse Port

Handle 0x0011, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J5A1
	Internal Connector Type: None
	External Reference Designator: Microphone
	External Connector Type: Mini Jack (headphones)
	Port Type: Audio Port

Handle 0x0012, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J5A1
	Internal Connector Type: None
	External Reference Designator: Line In
	External Connector Type: Mini Jack (headphones)
	Port Type: Audio Port

Handle 0x0013, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J5A1
	Internal Connector Type: None
	External Reference Designator: Line Out
	External Connector Type: Mini Jack (headphones)
	Port Type: Audio Port

Handle 0x0014, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J7A1
	Internal Connector Type: None
	External Reference Designator: Audio Jack
	External Connector Type: Mini Jack (headphones)
	Port Type: Audio Port

Handle 0x0015, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J2A2
	Internal Connector Type: None
	External Reference Designator: Network Rj45 Jack
	External Connector Type: RJ-45
	Port Type: Network Port

Handle 0x0016, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J4J1
	Internal Connector Type: None
	External Reference Designator: SATA
	External Connector Type: SAS/SATA Plug Receptacle
	Port Type: Other

Handle 0x0017, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J4E2
	Internal Connector Type: SAS/SATA Plug Receptacle
	External Reference Designator: SATA Cable
	External Connector Type: None
	Port Type: Other

Handle 0x0018, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J4A1
	Internal Connector Type: None
	External Reference Designator: VGA
	External Connector Type: DB-15 female
	Port Type: Video Port

Handle 0x0019, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J1A1
	Internal Connector Type: None
	External Reference Designator: Display Port
	External Connector Type: Other
	Port Type: Video Port

Handle 0x001A, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J3A1
	Internal Connector Type: None
	External Reference Designator: Display Port
	External Connector Type: Other
	Port Type: Video Port

Handle 0x001B, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J9B4
	Internal Connector Type: None
	External Reference Designator: Serial Port
	External Connector Type: DB-9 male
	Port Type: Serial Port 16550A Compatible

Handle 0x001C, DMI type 8, 9 bytes
Port Connector Information
	Internal Reference Designator: J2A1
	Internal Connector Type: None
	External Reference Designator: HDMI
	External Connector Type: Other
	Port Type: Other

Handle 0x001D, DMI type 9, 17 bytes
System Slot Information
	Designation: J5C1
	Type: x4 PCI Express x4
	Current Usage: Available
	Length: Other
	ID: 0
	Characteristics:
		PME signal is supported
		Hot-plug devices are supported
		SMBus signal is supported
	Bus Address: 0000:00:00.0

Handle 0x001E, DMI type 9, 17 bytes
System Slot Information
	Designation: J4B3
	Type: x1 PCI Express x1
	Current Usage: Available
	Length: Other
	ID: 0
	Characteristics:
		PME signal is supported
		Hot-plug devices are supported
		SMBus signal is supported
	Bus Address: 0000:00:00.0

Handle 0x001F, DMI type 9, 17 bytes
System Slot Information
	Designation: J6C1
	Type: x1 PCI Express x1
	Current Usage: Available
	Length: Other
	ID: 0
	Characteristics:
		PME signal is supported
		Hot-plug devices are supported
		SMBus signal is supported
	Bus Address: 0000:00:00.0

Handle 0x0020, DMI type 9, 17 bytes
System Slot Information
	Designation: J6D1
	Type: x1 PCI Express x1
	Current Usage: Available
	Length: Other
	ID: 0
	Characteristics:
		PME signal is supported
		Hot-plug devices are supported
		SMBus signal is supported
	Bus Address: 0000:00:00.0

Handle 0x0021, DMI type 11, 5 bytes
OEM Strings
	String 1: Insyde Chipset

Handle 0x0022, DMI type 12, 5 bytes
System Configuration Options
	Option 1: String1 for Type12 Equipment Manufacturer
	Option 2: String2 for Type12 Equipment Manufacturer
	Option 3: String3 for Type12 Equipment Manufacturer
	Option 4: String4 for Type12 Equipment Manufacturer

Handle 0x0023, DMI type 13, 22 bytes
BIOS Language Information
	Language Description Format: Long
	Installable Languages: 4
		en|US|iso8859-1
		fr|CA|iso8859-1
		zh|TW|unicode
		ja|JP|unicode
	Currently Installed Language: en|US|iso8859-1

Handle 0x0024, DMI type 15, 29 bytes
System Event Log
	Area Length: 0 bytes
	Header Start Offset: 0x0000
	Header Length: 32 bytes
	Data Start Offset: 0x0020
	Access Method: General-purpose non-volatile data functions
	Access Address: 0x0000
	Status: Valid, Not Full
	Change Token: 0x12345678
	Header Format: OEM-specific
	Supported Log Type Descriptors: 3
	Descriptor 1: POST memory resize
	Data Format 1: None
	Descriptor 2: POST error
	Data Format 2: POST results bitmap
	Descriptor 3: Log area reset/cleared
	Data Format 3: None

Handle 0x0025, DMI type 16, 15 bytes
Physical Memory Array
	Location: System Board Or Motherboard
	Use: System Memory
	Error Correction Type: None
	Maximum Capacity: 8 GB
	Error Information Handle: No Error
	Number Of Devices: 2

Handle 0x0026, DMI type 17, 34 bytes
Memory Device
	Array Handle: 0x0025
	Error Information Handle: No Error
	Total Width: 64 bits
	Data Width: 64 bits
	Size: 4096 MB
	Form Factor: SODIMM
	Set: None
	Locator: DIMM0
	Bank Locator: BANK 0
	Type: DDR3
	Type Detail: Synchronous
	Speed: 1066 MT/s
	Manufacturer: 00
	Serial Number: 00000000
	Asset Tag: Unknown
	Part Number:                   
	Rank: Unknown
	Configured Memory Speed: 1066 MT/s

Handle 0x0027, DMI type 17, 34 bytes
Memory Device
	Array Handle: 0x0025
	Error Information Handle: No Error
	Total Width: Unknown
	Data Width: Unknown
	Size: No Module Installed
	Form Factor: SODIMM
	Set: None
	Locator: DIMM1
	Bank Locator: BANK 1
	Type: Unknown
	Type Detail: None
	Speed: Unknown
	Manufacturer: Not Specified
	Serial Number: Not Specified
	Asset Tag: Unknown
	Part Number: Not Specified
	Rank: Unknown
	Configured Memory Speed: Unknown

Handle 0x0028, DMI type 19, 15 bytes
Memory Array Mapped Address
	Starting Address: 0x00000000000
	Ending Address: 0x000FFFFFFFF
	Range Size: 4 GB
	Physical Array Handle: 0x0025
	Partition Width: 2

Handle 0x0029, DMI type 20, 19 bytes
Memory Device Mapped Address
	Starting Address: 0x00000000000
	Ending Address: 0x000FFFFFFFF
	Range Size: 4 GB
	Physical Device Handle: 0x0026
	Memory Array Mapped Address Handle: 0x0028
	Partition Row Position: Unknown

Handle 0x002A, DMI type 21, 7 bytes
Built-in Pointing Device
	Type: Touch Pad
	Interface: PS/2
	Buttons: 2

Handle 0x002B, DMI type 22, 26 bytes
Portable Battery
	Location: I2C2
	Manufacturer: Intel SR 1
	Manufacture Date: Date
	Serial Number: 123456789
	Name: SR Real Battery
	Chemistry: Lithium Ion
	Design Capacity: 0 mWh
	Design Voltage: 3750 mV
	SBDS Version: CRB Battery 0
	Maximum Error: Unknown
	OEM-specific Information: 0x00000000

Handle 0x002C, DMI type 26, 22 bytes
Voltage Probe
	Description: Voltage Probe Description.
	Location: <OUT OF SPEC>
	Status: <OUT OF SPEC>
	Maximum Value: Unknown
	Minimum Value: Unknown
	Resolution: Unknown
	Tolerance: Unknown
	Accuracy: Unknown
	OEM-specific Information: 0x00000000
	Nominal Value: Unknown

Handle 0x002D, DMI type 27, 15 bytes
Cooling Device
	Type: Chip Fan
	Status: OK
	OEM-specific Information: 0x00000000
	Nominal Speed: Unknown Or Non-rotating
	Description: Cooling Device Description.

Handle 0x002E, DMI type 28, 22 bytes
Temperature Probe
	Description: Temperature Probe Description.
	Location: Unknown
	Status: Unknown
	Maximum Value: Unknown
	Minimum Value: Unknown
	Resolution: Unknown
	Tolerance: Unknown
	Accuracy: Unknown
	OEM-specific Information: 0x00000000
	Nominal Value: Unknown

Handle 0x002F, DMI type 32, 11 bytes
System Boot Information
	Status: No errors detected

Handle 0x0030, DMI type 39, 22 bytes
System Power Supply
	Location: OEM_Define0
	Name: OEM_Define1
	Manufacturer: OEM_Define2
	Serial Number: OEM_Define3
	Asset Tag: OEM_Define4
	Model Part Number: OEM_Define5
	Revision: OEM_Define6
	Max Power Capacity: 75 W
	Status: Present, OK
	Type: Regulator
	Input Voltage Range Switching: Auto-switch
	Plugged: No
	Hot Replaceable: No
	Input Voltage Probe Handle: 0x002C
	Cooling Device Handle: 0x002D

Handle 0x0031, DMI type 41, 11 bytes
Onboard Device
	Reference Designation: IGD
	Type: Video
	Status: Disabled
	Type Instance: 1
	Bus Address: 0000:00:02.0

Handle 0xFEFF, DMI type 127, 4 bytes
End Of Table


--------------321881A98C0FCA60AC0E666F--
