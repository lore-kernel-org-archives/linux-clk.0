Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jan 2017 11:44:18 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Jason Cooper
 <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, devicetree@vger.kernel.org, Rob
 Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar
 Gala <galak@codeaurora.org>
Cc: Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
 Yehuda Yitschak <yehuday@marvell.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 3/3] arm64: dts: marvell: adjust name of sd-mmc-gop
 clock in syscon
Message-ID: <20170131114418.46e23bd4@free-electrons.com>
In-Reply-To: <1482316017-22154-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1482316017-22154-4-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Wed, 21 Dec 2016 11:26:57 +0100, Thomas Petazzoni wrote:
> This commit adjusts the names of gatable clock #18 of the Marvell Armada
> CP110 system controller. This clock not only controls SD/MMC, but also
> the GOP (Group Of Ports) used for networking. So the clock is renamed to
> {cpm,cps}-sd-mmc-gop instead of {cpm,cps}-sd-mmc.
>=20
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Gr=C3=A9gory, since patches 1/3 and 2/3 of this series have been applied,
could you take this PATCH 3/3 ?

Thanks!

Thomas
--=20
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
