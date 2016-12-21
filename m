Return-Path: <sboyd@codeaurora.org>
Date: Wed, 21 Dec 2016 14:53:44 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] clk: renesas: mstp: Support 8-bit registers for
 r7s72100
Message-ID: <20161221225344.GI5423@codeaurora.org>
References: <20161215170027.28411-1-chris.brandt@renesas.com>
 <CAMuHMdXxiH5ryerpCnDirOXf=b-Gw5R8gJrj4Kk8NmM_3FYBqw@mail.gmail.com>
 <20161220225552.GE5423@codeaurora.org>
 <CAMuHMdWR7NE4zkN6eyR9=OZT6Bh63QtRmsnd-Xeoc4+7xaLJQg@mail.gmail.com>
 <SG2PR06MB116559EE20D18336D26392D38A930@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <SG2PR06MB116559EE20D18336D26392D38A930@SG2PR06MB1165.apcprd06.prod.outlook.com>
List-ID: <linux-clk.vger.kernel.org>

On 12/21, Chris Brandt wrote:
> On December 21, 2016, Geert Uytterhoeven wrote:
> > >> Mike/Stephen: as this is a fix for stable (v3.16+), can you please
> > >> take it directly?
> > >
> > > Sure, is it a fix for something that has been exposed as a problem in
> > > this merge window? Just trying to gauge the urgency of merging this.
> > 
> > No, I don't think it has been exposed by changes in this merge window (the
> > only RZ/A1 changes were the enablement of SDHI and MMC).
> > Chris, can you please confirm?
> 
> That's correct. In reality, none of the existing RZ/A1 drivers in the kernel
> should have ever worked (ETH, SPI, I2C, MTU2, etc...) because on chip reset
> all the peripheral clocks are turned off.
> 
> However...like Geert mentioned...the boot loader was turning everything on
> shortly after reset so even though the clock driver never worked, it made
> it seems so. Oops.
> 
> Of course now going forward, I use a modified boot loader to turn everything
> back off (except the serial console) so I can confirm that clock gating is
> really working.
> 

Ok, it seems like a more urgent fix due to the fact that the
bootloader update has caused the drivers to stop working. I'll
make sure to send it as a fix this release cycle.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
