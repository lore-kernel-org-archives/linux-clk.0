Return-Path: <shawnguo@kernel.org>
Date: Tue, 3 May 2016 20:37:19 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dong Aisheng <dongas86@gmail.com>
Cc: Adrian Alonso <aalonso@freescale.com>,
	Frank Li <Frank.Li@freescale.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Stefan Agner <stefan@agner.ch>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Anson Huang <b20788@freescale.com>, linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] clk: imx: fix ahb clock mux 1
Message-ID: <20160503123718.GG5874@tiger>
References: <1461877623-26838-1-git-send-email-stefan@agner.ch>
 <20160503083253.GC5874@tiger>
 <CAA+hA=Rkfii=Mi-NuESpX8E3W37+PnCxa464yOAe5dYMgpt43g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAA+hA=Rkfii=Mi-NuESpX8E3W37+PnCxa464yOAe5dYMgpt43g@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, May 03, 2016 at 06:50:21PM +0800, Dong Aisheng wrote:
> Hi Shawn,
> 
> On Tue, May 3, 2016 at 4:32 PM, Shawn Guo <shawnguo@kernel.org> wrote:
> > On Thu, Apr 28, 2016 at 02:07:03PM -0700, Stefan Agner wrote:
> >> The clock parent of the AHB root clock when using mux option 1
> >> is the SYS PLL 270MHz clock. This is specified in  Table 5-11
> >> Clock Root Table of the i.MX 7Dual Applications Processor
> >> Reference Manual.
> >>
> >> While it could be a documentation error, the 270MHz parent is
> >> also mentioned in the boot ROM configuration in Table 6-28: The
> >> clock is by default at 135MHz due to a POST_PODF value of 1
> >> (=> divider of 2).
> >>
> >> Signed-off-by: Stefan Agner <stefan@agner.ch>
> >
> > Anson, Frank,
> >
> > Can you guys confirm this change is correct?
> >
> 
> I just checked the doc,
> it's correct the parent should be SYS_PLL_PFD2(270Mhz).
> It's a documentation error of early version and it's already fixed
> in latest internal doc.

Thanks for the confirmation.

Shawn
