Return-Path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Rob Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	"Jason Cooper" <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] clk: mvebu: Expand mv98dx3236-core-clock support
Date: Wed, 8 Feb 2017 20:00:15 +0000
Message-ID: <aabc6853d7934507a4507b0ad4354b72@svr-chch-ex1.atlnz.lc>
References: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
 <5a974d9d7260432087619486bf5d79ed@svr-chch-ex1.atlnz.lc>
 <6149d4126a214ac8b0b0184bd818bea6@svr-chch-ex1.atlnz.lc>
 <9294933.cXSW0amFbE@wuerfel>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 08/02/17 23:53, Arnd Bergmann wrote:=0A=
> On Tuesday, February 7, 2017 3:07:37 AM CET Chris Packham wrote:=0A=
>>>=0A=
>>> Actually I wonder if I can try a bit harder to keep a system booting.=
=0A=
>>> The following might work=0A=
>>> 1) add the compatible strings to the existing armada clock drivers.=0A=
>>> 2) update the dts to use the new compatible strings.=0A=
>>> 3) add the new driver and remove the compatible strings from the armada=
=0A=
>>> drivers.=0A=
>>>=0A=
>>> #1 would still upset checkpatch.pl because the documentation would only=
=0A=
>>> arrive in #2.=0A=
>>=0A=
>> Actually upon testing #1 is unnecessary. I lose some of the gated clocks=
=0A=
>> but nothing that prevents booting.=0A=
>=0A=
> Just to be sure: this means we can merge 2) and 3) independently and=0A=
> having just one of them will not cause regressions over what we have=0A=
> today?=0A=
>=0A=
=0A=
Correct. And that's what I sent out as v2.=0A=
=0A=
http://lists.infradead.org/pipermail/linux-arm-kernel/2017-February/486467.=
html=0A=
http://lists.infradead.org/pipermail/linux-arm-kernel/2017-February/486471.=
html=0A=
=0A=
