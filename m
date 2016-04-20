Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:54074 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751069AbcDTQM4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 20 Apr 2016 12:12:56 -0400
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>
CC: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org"
	<linux-snps-arc@lists.infradead.org>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
Date: Wed, 20 Apr 2016 16:12:50 +0000
Message-ID: <1461168765.3149.31.camel@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
	 <20160415234631.GB4690@codeaurora.org> <5714B763.8010109@synopsys.com>
	 <5714C9BA.8040004@synopsys.com> <5715F6AC.7090501@synopsys.com>
	 <20160420015451.GH15324@codeaurora.org> <5717503F.7020806@synopsys.com>
In-Reply-To: <5717503F.7020806@synopsys.com>
Content-Type: text/plain; charset="utf-7"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Jose, Stephen,

On Wed, 2016-04-20 at 10:47 +-0100, Jose Abreu wrote:
+AD4- Hi Stephen,
+AD4- 
+AD4- 
+AD4- On 20-04-2016 02:54, Stephen Boyd wrote:
+AD4- +AD4- 
+AD4- +AD4- On 04/19, Jose Abreu wrote:
+AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- +AEA-Stephen: can you give some input so that I can submit a v6?
+AD4- +AD4- +AD4- 
+AD4- +AD4- I don't prefer putting the second register in the same DT node,
+AD4- +AD4- but that's really up to the DT reviewers to approve such a
+AD4- +AD4- design. The current binding has been acked by Rob right?
+AD4- Yes.
+AD4- 
+AD4- +AD4- 
+AD4- +AD4- Assuming the new binding is acked/reviewed then that solution is
+AD4- +AD4- fine.
+AD4- Ok, will then use the DT to pass the FPGA version register.

We won't need to know FPGA version at all I think.
Read my comment below.

+AD4- +AD4- 
+AD4- +AD4- Otherwise, I still prefer two DTS files for the two different FPGA
+AD4- +AD4- versions. At the least, please use ioremap for any pointers that
+AD4- +AD4- you readl/writel here.
+AD4- +AD4- 
+AD4- +AD4- Beyond that, we should have a fixed rate source clk somewhere in
+AD4- +AD4- the software view of the clk tree, because that reflects reality.
+AD4- +AD4- Hardcoding the parent rate in the structure works, but doesn't
+AD4- +AD4- properly express the clk tree.
+AD4- +AD4- 
+AD4- Can I use a property in the DT to pass this reference clock? something like this:
+AD4- +AKAAoACgAKA-snps,parent-freq +AD0- +ADw-0xFBED9 27000000+AD4-, +ADw-0x0 28224000+AD4AOw- /+ACo- Tuple
+AD4- +ADw-fpga-version reference-clock-freq+AD4-, fpga-version +AD0- 0 is default +ACo-/
+AD4- 
+AD4- Or use a parent clock? like:
+AD4- +AKAAoACgAKA-clk +AHs-
+AD4- +AKAAoACgAKAAoACgAKAAoA-compatible +AD0- +ACI-fixed-clock+ACIAOw-
+AD4- +AKAAoACgAKAAoACgAKAAoA-clock-frequency +AD0- +ADw-27000000+AD4AOw-
+AD4- +AKAAoACgAKAAoACgAKAAoAAj-clock-cells +AD0- +ADw-0+AD4AOw-
+AD4- +AKAAoACgAKAAoACgAKAAoA-snps,fpga-version +AD0- +ADw-0xFBED9+AD4AOw-
+AD4- +AKAAoACgAKAAfQ-
+AD4- 
+AD4- It is important to distinguish between the different versions automatically, is
+AD4- any of these solutions ok?

I do like that solution with a master clock but with some fine-tuning
for simplification.

We'll add master clock node for I2S as a fixed clock like that:
-------------------+AD4-8------------------
	i2s+AF8-master+AF8-clock: clk +AHs-
		+ACM-clock-cells +AD0- +ADw-0+AD4AOw-
		compatible +AD0- +ACI-fixed-clock+ACIAOw-
		clock-frequency +AD0- +ADw-27000000+AD4AOw-
	+AH0AOw-
-------------------+AD4-8------------------

Note there's no mention of MB version, just a value of the frequency.
And in the driver itself value of that master clock will be used for
population of +ACI-pll+AF8-clk-+AD4-ref+AF8-clk+ACI- directly.

These are benefits we'll get with that approach:
+AKAAWw-1+AF0- We escape any IOs not related to our clock device (I mean
+AKA- +AKA- +AKAAIg-snps,i2s-pll-clock+ACI-) itself.
+AKAAWw-2+AF0- We'll use whatever reference clock value is given.
+AKA- +AKA- +AKA-I.e. we'll be able to do a fix-up of that reference clock
+AKA- +AKA- +AKA-value early in platform code depending on HW we're running on.
+AKA- +AKA- +AKA-That's what people do here and there.
+AKAAWw-3+AF0- Remember another clock driver for AXS10x board is right around
+AKA- +AKA- +AKA-the corner. I mean the one for ARC PGU which uses exactly the same
+AKA- +AKA- +AKA-master clock. So one fixup as mentioned above will work
+AKA- +AKA- +AKA-at once for 2 clock drivers.

Let me know if above makes sense.

-Alexey