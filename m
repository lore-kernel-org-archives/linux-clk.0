Return-Path: <LeoLi@freescale.com>
From: Li Leo <LeoLi@freescale.com>
To: Hou Zhiqiang <B48286@freescale.com>, Mark Rutland <mark.rutland@arm.com>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Catalin Marinas
	<Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Shaohui Xie
	<Shaohui.Xie@freescale.com>, "corbet@lwn.net" <corbet@lwn.net>, "Sharma
 Bhupesh" <bhupesh.sharma@freescale.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "wsa@the-dreams.de" <wsa@the-dreams.de>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>, "wim@iguana.be"
	<wim@iguana.be>, Wenbin Song <Wenbin.Song@freescale.com>, Scott Wood
	<scottwood@freescale.com>, Hu Vincent <Mingkai.Hu@freescale.com>
Subject: RE: [PATCH 4/6] arm64/ls1043a: add DTS for Freescale LS1043A SoC
Date: Tue, 22 Sep 2015 17:23:14 +0000
Message-ID: <DM2PR0301MB07342356008C1A50AB26FEFFBA450@DM2PR0301MB0734.namprd03.prod.outlook.com>
References: <1442838158-2964-1-git-send-email-B48286@freescale.com>
 <1442838158-2964-5-git-send-email-B48286@freescale.com>
 <20150922012403.GA1535@svinekod>
 <CY1PR0301MB078008B10188504C951076498B450@CY1PR0301MB0780.namprd03.prod.outlook.com>
In-Reply-To: <CY1PR0301MB078008B10188504C951076498B450@CY1PR0301MB0780.namprd03.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

> >
> > Hi,
> >
> > > +/memreserve/ 0x80000000 0x00010000;
> >
> > Why is this necessary?
>=20
> This memory region is pre-reserved for the spin-table/psci, although didn=
't add
> Enable method of secondary cores.

Can this be reserved by bootloader?

>=20
> > If this is necessary, please add a comment stating what this is for.
> >
> > > +               cpu@3 {
> > > +                       device_type =3D "cpu";
> > > +                       compatible =3D "arm,cortex-a53";
> > > +                       reg =3D <0x0 0x3>;
> > > +                       clocks =3D <&clockgen 1 0>;
> > > +               };
> >
> > Missing enable-method properties on all the secondary CPUs.
> >
>=20
> There are two methods (spin-table and psci) to bring up secondary cores, =
which
> one do you think is better?

Do we have the PSCI support ready in both UEFI and u-boot?  If not, we shou=
ld use spin-table for now.

Regards,
Leo
