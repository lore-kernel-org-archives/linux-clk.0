Return-Path: <york.sun@nxp.com>
From: york sun <york.sun@nxp.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "pmarrecas@outlook.com" <pmarrecas@outlook.com>,
	York Sun <yorksun@freescale.com>, Mike Turquette <mturquette@baylibre.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrey Filippov
	<andrey@elphel.com>, Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [Resend Patch v7] driver/clk/clk-si5338: Add common clock
 framework driver for si5338
Date: Tue, 23 Aug 2016 22:22:05 +0000
Message-ID: <AM4PR0401MB1732B669DB6B2406B07BAD459AEB0@AM4PR0401MB1732.eurprd04.prod.outlook.com>
References: <AM4PR0401MB17320B3CAE8C6903207778429AEB0@AM4PR0401MB1732.eurprd04.prod.outlook.com>
 <20160823221728.GA22992@roeck-us.net>
Reply-To: york sun <york.sun@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 08/23/2016 03:17 PM, Guenter Roeck wrote:=0A=
> On Tue, Aug 23, 2016 at 05:04:47PM +0000, york sun wrote:=0A=
>> SI5338 is a programmable clock generator. It has 4 sets of inputs,=0A=
>> PLL, multisynth and dividers to make 4 outputs. This driver splits=0A=
>> them into multiple clocks to comply with common clock framework.=0A=
>>=0A=
>> See Documentation/devicetree/bindings/clock/silabs,si5338.txt for=0A=
>> details.=0A=
>>=0A=
>> Signed-off-by: York Sun <yorksun@freescale.com>=0A=
>> CC: Mike Turquette <mturquette@baylibre.com>=0A=
>> CC: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>=0A=
>> CC: Guenter Roeck <linux@roeck-us.net>=0A=
>> CC: Andrey Filippov <andrey@elphel.com>=0A=
>> CC: Paul Bolle <pebolle@tiscali.nl>=0A=
>>=0A=
>=0A=
> Your patch is badly corrupted.=0A=
>=0A=
> Guenter=0A=
>=0A=
=0A=
Sorry for that. Let me try to generate the patch again.=0A=
=0A=
York=0A=
