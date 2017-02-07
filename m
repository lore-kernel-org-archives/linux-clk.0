Return-Path: <sboyd@codeaurora.org>
Date: Mon, 6 Feb 2017 17:03:08 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] clk: mvebu: Expand mv98dx3236-core-clock support
Message-ID: <20170207010308.GN25384@codeaurora.org>
References: <20170203034012.29399-1-chris.packham@alliedtelesis.co.nz>
 <20170203034012.29399-5-chris.packham@alliedtelesis.co.nz>
 <20170206231400.GM25384@codeaurora.org>
 <9974653ab84040c3b12fad075790c123@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9974653ab84040c3b12fad075790c123@svr-chch-ex1.atlnz.lc>
List-ID: <linux-clk.vger.kernel.org>

On 02/06, Chris Packham wrote:
> On 07/02/17 12:14, Stephen Boyd wrote:
> > On 02/03, Chris Packham wrote:
> >> The initial implementation in commit e120c17a70e5 ("clk: mvebu: support
> >> for 98DX3236 SoC") hardcoded a fixed value for the main PLL frequency.
> >> Port code from the Marvell supplied Linux kernel to support different
> >> PLL frequencies and provide clock gating support.
> >>
> >> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> >> ---
> >>  .../devicetree/bindings/clock/mvebu-core-clock.txt |   7 +
> >>  .../bindings/clock/mvebu-gated-clock.txt           |  11 ++
> >>  arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |  14 +-
> >>  drivers/clk/mvebu/Makefile                         |   2 +-
> >>  drivers/clk/mvebu/armada-xp.c                      |  13 --
> >>  drivers/clk/mvebu/mv98dx3236.c                     | 144 +++++++++++++++++++++
> >
> > This mixes dts and clk driver changes. Any chance it can be split
> > up and just have the clk part go through clk tree? Otherwise, I
> > can ack this if you want to take it all through arm-soc?
> 
> I'm happy to split it if it will make life easier.
> 

Well do things keep booting if the clk driver parts merge without
the associated dts changes? It's nice to maintain backwards
compatibility even for a short time to make the merge path
easier.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
