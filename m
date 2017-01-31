Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  linux-clk@vger.kernel.org,  Jason Cooper <jason@lakedaemon.net>,  Andrew Lunn <andrew@lunn.ch>,  Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,  devicetree@vger.kernel.org,  Rob Herring <robh+dt@kernel.org>,  Ian Campbell <ijc+devicetree@hellion.org.uk>,  Pawel Moll <pawel.moll@arm.com>,  Mark Rutland <mark.rutland@arm.com>,  Kumar Gala <galak@codeaurora.org>,  Nadav Haklai <nadavh@marvell.com>,  Hanna Hawa <hannah@marvell.com>,  Yehuda Yitschak <yehuday@marvell.com>,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 3/3] arm64: dts: marvell: adjust name of sd-mmc-gop clock in syscon
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1482316017-22154-4-git-send-email-thomas.petazzoni@free-electrons.com>
	<20170131114418.46e23bd4@free-electrons.com>
Date: Tue, 31 Jan 2017 11:52:40 +0100
In-Reply-To: <20170131114418.46e23bd4@free-electrons.com> (Thomas Petazzoni's
	message of "Tue, 31 Jan 2017 11:44:18 +0100")
Message-ID: <87bmun1oxz.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Thomas,
=20
 On mar., janv. 31 2017, Thomas Petazzoni <thomas.petazzoni@free-electrons.=
com> wrote:

> Hello,
>
> On Wed, 21 Dec 2016 11:26:57 +0100, Thomas Petazzoni wrote:
>> This commit adjusts the names of gatable clock #18 of the Marvell Armada
>> CP110 system controller. This clock not only controls SD/MMC, but also
>> the GOP (Group Of Ports) used for networking. So the clock is renamed to
>> {cpm,cps}-sd-mmc-gop instead of {cpm,cps}-sd-mmc.
>>=20
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> Gr=C3=A9gory, since patches 1/3 and 2/3 of this series have been applied,
> could you take this PATCH 3/3 ?

I completely missed this patch!

Now, applied on mvebu/dt64

Thanks,

Gregory



>
> Thanks!
>
> Thomas
> --=20
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

--=20
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
