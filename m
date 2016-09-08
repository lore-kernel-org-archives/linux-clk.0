Return-Path: <mars.cheng@mediatek.com>
Message-ID: <1473343836.1896.17.camel@mtkswgap22>
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: add mt6797 support
From: Mars Cheng <mars.cheng@mediatek.com>
To: Marc Zyngier <marc.zyngier@arm.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Erin Lo <erin.lo@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
	<linux-clk@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>, Loda Choui
	<loda.chou@mediatek.com>, Miles Chen <miles.chen@mediatek.com>, Scott Shu
	<scott.shu@mediatek.com>, Jades Shih <jades.shih@mediatek.com>, "Yingjoe
 Chen" <yingjoe.chen@mediatek.com>, My Chuang <my.chuang@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <wsd_upstream@mediatek.com>
Date: Thu, 8 Sep 2016 22:10:36 +0800
In-Reply-To: <57D16470.6050100@arm.com>
References: <1473331794-27542-1-git-send-email-mars.cheng@mediatek.com>
	 <1473331794-27542-4-git-send-email-mars.cheng@mediatek.com>
	 <57D16470.6050100@arm.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: mars.cheng@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Thu, 2016-09-08 at 14:15 +0100, Marc Zyngier wrote:
> On 08/09/16 11:49, Mars Cheng wrote:
> > This adds basic chip support for MT6797 SoC.
> > 
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > ---
[...]
> 
> > +	gic: interrupt-controller@19000000 {
> > +		compatible = "arm,gic-v3";
> > +		#interrupt-cells = <3>;
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +		interrupt-controller;
> > +		reg = <0 0x19000000 0 0x10000>,    /* GICD */
> > +		      <0 0x19200000 0 0x200000>,   /* GICR */
> > +		      <0 0x10240000 0 0x2000>;     /* GICC */
> 
> Where are the GICV and GICH regions? No ITS?

Have confirmed with our HW guys, there is no GICV, GICH, nor ITS in our
GIC design.

Thanks.
> 
> Thanks,
> 
> 	M.
