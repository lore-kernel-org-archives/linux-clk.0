Return-Path: <sboyd@codeaurora.org>
Date: Fri, 3 Mar 2017 15:50:09 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2] clk/axs10x: introduce AXS10X pll driver
Message-ID: <20170303235005.GV25384@codeaurora.org>
References: <1487682670-4164-1-git-send-email-vzakhar@synopsys.com>
 <1488547113.2557.44.camel@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1488547113.2557.44.camel@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/03, Vlad Zakharov wrote:
> Hi Michael, Stephen,
> 
> On Tue, 2017-02-21 at 16:11 +0300, Vlad Zakharov wrote:
> > AXS10X boards manages it's clocks using various PLLs. These PLL has same
> > dividers and corresponding control registers mapped to different addresses.
> > So we add one common driver for such PLLs.
> > 
> > Each PLL on AXS10X board consist of three dividers: IDIV, FBDIV and
> > ODIV. Output clock value is managed using these dividers.
> > 
> > We add pre-defined tables with supported rate values and appropriate
> > configurations of IDIV, FBDIV and ODIV for each value.
> > 
> > As of today we add support for PLLs that generate clock for the
> > following devices:
> >  * ARC core on AXC CPU tiles.
> >  * ARC PGU on ARC SDP Mainboard.
> > and more to come later.
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
> > Signed-off-by: Jose Abreu <joabreu@synopsys.com>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> 
> Maybe you have any comments or remarks about this patch? And if you don't could you please apply it.
> 

I haven't reviewed it yet. The merge window is upon us right now
so I'll probably get to going through the queue this weekend/next
week.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
