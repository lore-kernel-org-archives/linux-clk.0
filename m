Return-Path: <Chris.Packham@alliedtelesis.co.nz>
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Jason Cooper
	<jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] Updates for Marvell Switch SoCs
Date: Tue, 7 Mar 2017 19:38:32 +0000
Message-ID: <b2dc1865150d46a4b64c0522480bdec6@svr-chch-ex1.atlnz.lc>
References: <20170216085041.28337-1-chris.packham@alliedtelesis.co.nz>
 <87bmtdovwr.fsf@free-electrons.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Gregory,=0A=
=0A=
On 08/03/17 06:10, Gregory CLEMENT wrote:=0A=
> Hi Chris,=0A=
>=0A=
>  On jeu., f=E9vr. 16 2017, Chris Packham <chris.packham@alliedtelesis.co.=
nz> wrote:=0A=
>=0A=
>> Shortly after I posted my last series I got access to a more recent=0A=
>> Marvell SDK which had some device tree support for the switch SoCs I'd=
=0A=
>> been wanting. It was still based on an older kernel but it was a huge=0A=
>> improvement over what came before.=0A=
>>=0A=
>> Patch 1/6 is a typo I noticed after my initial series was applied.=0A=
>>=0A=
>> Patch 2/6 is a bit of a cleanup. I did initially struggle with how to=0A=
>> access individual parts of the DFX block as well as retaining a handle o=
n=0A=
>> the entire thing for the switch driver to use.=0A=
>>=0A=
>> Patch 3/6 is a re-jig of the dtsi files which is needed by 5/6. This is=
=0A=
>> required because I need to use the coreclk label on a different node. It=
=0A=
>> also means I don't have to disable nodes for blocks that only exist on=
=0A=
>> the Armada-XP.=0A=
>>=0A=
>> Patch 4/6, 5/6 are split from the previous versions.=0A=
>>=0A=
>> Patch 6/6 is the device tree portion of a change already in clk-next.=0A=
>=0A=
>=0A=
> I applied patches 2, 3 and 6 on mvebu/dt with the acked-by from Rob when=
=0A=
> he gave it.=0A=
>=0A=
> Patch 1 is already part of 4.11-rc1.=0A=
>=0A=
> For patch 4 and 5 I understand that either we don't need it or it should=
=0A=
> be a updated version so I skipped them.=0A=
>=0A=
=0A=
That's correct, thanks.=0A=
=0A=
