Return-Path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Florian Fainelli <f.fainelli@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, "Jason
 Cooper" <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
	<gregory.clement@free-electrons.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
	Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Juri Lelli <juri.lelli@arm.com>, Thomas Petazzoni
	<thomas.petazzoni@free-electrons.com>, Laxman Dewangan
	<ldewangan@nvidia.com>, Kalyan Kinthada
	<Kalyan.Kinthada@alliedtelesis.co.nz>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCHv2 0/5] Support for Marvell switches with integrated CPUs
Date: Thu, 5 Jan 2017 04:24:21 +0000
Message-ID: <185147a37cab4d7eaea5f79d86cc9451@svr-chch-ex1.atlnz.lc>
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
 <6c6795d3-06ab-a4f0-78ad-5ecc78c1aa2f@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 05/01/17 17:07, Florian Fainelli wrote:=0A=
> Le 01/04/17 =E0 19:36, Chris Packham a =E9crit :=0A=
>> The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with=0A=
>> integrated CPUs. They CPU block is common within these product lines and=
=0A=
>> (as far as I can tell/have been told) is based on the Armada XP. There=
=0A=
>> are a few differences due to the fact they have to squeeze the CPU into=
=0A=
>> the same package as the switch.=0A=
>=0A=
> It's really great to see these changes, do you have a plan to also add=0A=
> support for the integrated switch using a DSA/switchdev driver?=0A=
=0A=
I'd love to see a switchdev driver but it's a huge task (and no I'm not =0A=
committing to writing it). As it stands Marvell ship a switch SDK =0A=
largely executes in userspace with a small kernel module providing some =0A=
linkage to the underlying hardware.=0A=
=0A=
We (a few of us here at Allied Telesis NZ) have discussed switchdev and =0A=
how we get from using Marvell's SDK in our products to using switchdev =0A=
proper.=0A=
=0A=
The first step would probably be some kind of trampoline driver which =0A=
communicates with a userspace helper to do the actual work. =0A=
Alternatively there is some support in Marvell's SDK for compilation as =0A=
a binary blob so a proprietary kernel module is another option. Neither =0A=
of these are particularly nice in a free software world.=0A=
=0A=
A full "free" implementation would be a large undertaking. Ideally I'd =0A=
like to see Marvell involved with producing one but so far they've not =0A=
been interested whenever I've brought it up.=0A=
=0A=
