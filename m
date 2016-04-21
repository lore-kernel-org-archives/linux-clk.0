Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtprelay4.synopsys.com ([198.182.47.9]:33155 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751785AbcDUMSt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2016 08:18:49 -0400
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
Date: Thu, 21 Apr 2016 12:18:39 +0000
Message-ID: <1461241114.2928.4.camel@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
	 <20160415234631.GB4690@codeaurora.org> <5714B763.8010109@synopsys.com>
	 <5714C9BA.8040004@synopsys.com> <5715F6AC.7090501@synopsys.com>
	 <20160420015451.GH15324@codeaurora.org> <5717503F.7020806@synopsys.com>
	 <1461168765.3149.31.camel@synopsys.com> <5718A298.50601@synopsys.com>
In-Reply-To: <5718A298.50601@synopsys.com>
Content-Type: text/plain; charset="utf-7"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Jose,

On Thu, 2016-04-21 at 10:51 +-0100, Jose Abreu wrote:
+AD4- Hi Alexey,


+AD4- +AD4- +AD4- +AD4- Otherwise, I still prefer two DTS files for the two different FPGA
+AD4- +AD4- +AD4- +AD4- versions. At the least, please use ioremap for any pointers that
+AD4- +AD4- +AD4- +AD4- you readl/writel here.
+AD4- +AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- +AD4- Beyond that, we should have a fixed rate source clk somewhere in
+AD4- +AD4- +AD4- +AD4- the software view of the clk tree, because that reflects reality.
+AD4- +AD4- +AD4- +AD4- Hardcoding the parent rate in the structure works, but doesn't
+AD4- +AD4- +AD4- +AD4- properly express the clk tree.
+AD4- +AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- Can I use a property in the DT to pass this reference clock? something like this:
+AD4- +AD4- +AD4- +AKAAoACgAKA-snps,parent-freq +AD0- +ADw-0xFBED9 27000000+AD4-, +ADw-0x0 28224000+AD4AOw- /+ACo- Tuple
+AD4- +AD4- +AD4- +ADw-fpga-version reference-clock-freq+AD4-, fpga-version +AD0- 0 is default +ACo-/
+AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- Or use a parent clock? like:
+AD4- +AD4- +AD4- +AKAAoACgAKA-clk +AHs-
+AD4- +AD4- +AD4- +AKAAoACgAKAAoACgAKAAoA-compatible +AD0- +ACI-fixed-clock+ACIAOw-
+AD4- +AD4- +AD4- +AKAAoACgAKAAoACgAKAAoA-clock-frequency +AD0- +ADw-27000000+AD4AOw-
+AD4- +AD4- +AD4- +AKAAoACgAKAAoACgAKAAoAAj-clock-cells +AD0- +ADw-0+AD4AOw-
+AD4- +AD4- +AD4- +AKAAoACgAKAAoACgAKAAoA-snps,fpga-version +AD0- +ADw-0xFBED9+AD4AOw-
+AD4- +AD4- +AD4- +AKAAoACgAKAAfQ-
+AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- It is important to distinguish between the different versions automatically, is
+AD4- +AD4- +AD4- any of these solutions ok?
+AD4- +AD4- I do like that solution with a master clock but with some fine-tuning
+AD4- +AD4- for simplification.
+AD4- +AD4- 
+AD4- +AD4- We'll add master clock node for I2S as a fixed clock like that:
+AD4- +AD4- -------------------+AD4-8------------------
+AD4- +AD4- 	i2s+AF8-master+AF8-clock: clk +AHs-
+AD4- +AD4- 		+ACM-clock-cells +AD0- +ADw-0+AD4AOw-
+AD4- +AD4- 		compatible +AD0- +ACI-fixed-clock+ACIAOw-
+AD4- +AD4- 		clock-frequency +AD0- +ADw-27000000+AD4AOw-
+AD4- +AD4- 	+AH0AOw-
+AD4- +AD4- -------------------+AD4-8------------------
+AD4- +AD4- 
+AD4- +AD4- Note there's no mention of MB version, just a value of the frequency.
+AD4- +AD4- And in the driver itself value of that master clock will be used for
+AD4- +AD4- population of +ACI-pll+AF8-clk-+AD4-ref+AF8-clk+ACI- directly.
+AD4- +AD4- 
+AD4- +AD4- These are benefits we'll get with that approach:
+AD4- +AD4- +AKAAWw-1+AF0- We escape any IOs not related to our clock device (I mean
+AD4- +AD4- +AKAAoACgAKAAoAAi-snps,i2s-pll-clock+ACI-) itself.
+AD4- +AD4- +AKAAWw-2+AF0- We'll use whatever reference clock value is given.
+AD4- +AD4- +AKAAoACgAKAAoA-I.e. we'll be able to do a fix-up of that reference clock
+AD4- +AD4- +AKAAoACgAKAAoA-value early in platform code depending on HW we're running on.
+AD4- +AD4- +AKAAoACgAKAAoA-That's what people do here and there.
+AD4- +AD4- +AKAAWw-3+AF0- Remember another clock driver for AXS10x board is right around
+AD4- +AD4- +AKAAoACgAKAAoA-the corner. I mean the one for ARC PGU which uses exactly the same
+AD4- +AD4- +AKAAoACgAKAAoA-master clock. So one fixup as mentioned above will work
+AD4- +AD4- +AKAAoACgAKAAoA-at once for 2 clock drivers.
+AD4- +AD4- 
+AD4- +AD4- Let me know if above makes sense.
+AD4- That approach can't be used because the reference clock value will change in the
+AD4- next firmware release.+AKAAoA-The new release will have a reference clock of 28224000
+AD4- Hz instead of the usual 27000000 Hz, so we need to have a way to distinguish
+AD4- between them. Because of that we can't have only one master clock unless you
+AD4- state to users that they have to change the reference clock value when using the
+AD4- new firmware release. Stephen suggested to use two DT files (one for each
+AD4- firmware release), but as Vineet said this would be annoying to the user so I am
+AD4- trying to use another solution so that only one DT file is required.

Ok reference clock will change.
But I may guess we'll still be able to determine at least that new
firmware version in run-time, right? If so we'll update a fix-up in
early axs10x platform code so that reference clock will be set as+AKA-28224000 Hz.

And indeed 2 DT files is a no go - we want to run the same one binary
(with built-in .dtb) on all flavors of AXS boards. And fix-up I'm talking about
will actually do transformation of .dtb early on kernel boot process so that will
be a complete equivalent of different DT files.

-Alexey