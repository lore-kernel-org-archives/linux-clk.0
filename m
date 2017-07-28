Return-Path: <sboyd@codeaurora.org>
Date: Thu, 27 Jul 2017 18:24:24 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARC: clk: introduce HSDKv1 pll driver
Message-ID: <20170728012424.GY2146@codeaurora.org>
References: <20170714153128.8945-1-Eugeniy.Paltsev@synopsys.com>
 <3d1bddbb-aaf5-ca5a-614a-5a84900feadc@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3d1bddbb-aaf5-ca5a-614a-5a84900feadc@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/27, Vineet Gupta wrote:
> Hi Stephen,
> 
> On 07/14/2017 09:01 PM, Eugeniy Paltsev wrote:
> >HSDKv1 boards manages it's clocks using various PLLs. These PLL has same
> >dividers and corresponding control registers mapped to different addresses.
> >So we add one common driver for such PLLs.
> >
> >Each PLL on HSDK board consist of three dividers: IDIV, FBDIV and
> >ODIV. Output clock value is managed using these dividers.
> >
> >We add pre-defined tables with supported rate values and appropriate
> >configurations of IDIV, FBDIV and ODIV for each value.
> >
> >As of today we add support for PLLs that generate clock for the
> >HSDKv1 arc cpus, system, ddr, AXI tunnel and hdmi.
> >
> >By this patch we add support for several plls (arc cpus pll and others),
> >so we had to use two different init types: CLK_OF_DECLARE for arc cpus pll
> >and regular probing for others plls.
> >
> >Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> 
> Gentle ping, any chance you could look at this sometime.
> 
> Thx,

Yes it's in the queue. Probably get to it tomorrow.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
