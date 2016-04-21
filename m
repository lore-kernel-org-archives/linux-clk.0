Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]:47628 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752490AbcDUOQC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2016 10:16:02 -0400
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: Jose Abreu <Jose.Abreu@synopsys.com>
CC: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org"
	<linux-snps-arc@lists.infradead.org>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
Date: Thu, 21 Apr 2016 14:15:55 +0000
Message-ID: <1461248149.2928.26.camel@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
	 <20160415234631.GB4690@codeaurora.org> <5714B763.8010109@synopsys.com>
	 <5714C9BA.8040004@synopsys.com> <5715F6AC.7090501@synopsys.com>
	 <20160420015451.GH15324@codeaurora.org> <5717503F.7020806@synopsys.com>
	 <1461168765.3149.31.camel@synopsys.com> <5718A298.50601@synopsys.com>
	 <1461241114.2928.4.camel@synopsys.com> <5718D13B.2040906@synopsys.com>
In-Reply-To: <5718D13B.2040906@synopsys.com>
Content-Type: text/plain; charset="utf-7"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Jose,

On Thu, 2016-04-21 at 14:10 +-0100, Jose Abreu wrote:
+AD4- Hi Alexey,
+AD4- 
+AD4- 
+AD4- On 21-04-2016 13:18, Alexey Brodkin wrote:
+AD4- +AD4- 
+AD4- +AD4- Hi Jose,
+AD4- +AD4- 
+AD4- +AD4- On Thu, 2016-04-21 at 10:51 +-0100, Jose Abreu wrote:
+AD4- +AD4- +AD4- 
+AD4- +AD4- +AD4- Hi Alexey,
+AD4- +AD4- +AD4AoA-
+AD4- +AD4- Ok reference clock will change.
+AD4- +AD4- But I may guess we'll still be able to determine at least that new
+AD4- +AD4- firmware version in run-time, right? If so we'll update a fix-up in
+AD4- +AD4- early axs10x platform code so that reference clock will be set as 28224000 Hz.
+AD4- Yes, there is a register where the FPGA version date is encoded, we can use that
+AD4- to check which firmware is used (if date +ADwAPQ- old+AF8-firmware+AF8-date then
+AD4- clock+AD0-27000000+ADs- else clock+AD0-28224000). If that fix is acceptable it could be a
+AD4- good solution without having to use custom parameters in the DT (no need to
+AD4- encode the different clocks and we would only use one master clock) but I am not
+AD4- sure where and how this can be encoded and I don't know how to change the DT on
+AD4- runtime. Can you give me some guidelines?

Take a look here -+AKA-http://git.kernel.org/cgit/linux/kernel/git/vgupta/arc.git/commit/arch/arc/plat-axs10x/axs10x.c?h+AD0-for
-next+ACY-id+AD0-5cd0f5102753a7405548d0c66c11a2a0a05bbf2e

We do something very similar here - we're patching in run-time
core frequency that was specified in .dts.

And in the very same way one will be able to do fix-ups for other
clocks.

Moreover I would propose to think about that fix-up as of completely
separate topic. I.e. in your driver for AXS' I2S clock just use a new
reference +ACI-fixed-clock+ACI- (that you'll add in +ACI-axs10x+AF8-mb.dtsi+ACI- as a part of
your driver submission). And once your driver gets accepted we'll work on
fix-up in axs10x platform.

This way we'll move with smaller steps and hopefully will get things done
sooner.

+AD4- +AD4- And indeed 2 DT files is a no go - we want to run the same one binary
+AD4- +AD4- (with built-in .dtb) on all flavors of AXS boards. And fix-up I'm talking about
+AD4- +AD4- will actually do transformation of .dtb early on kernel boot process so that will
+AD4- +AD4- be a complete equivalent of different DT files.
+AD4- And doing modifications on the DT can cause some misdirections to users.

What do you mean here? What kind of problems do you expect to face?

+AD4- Besides, we would have clock specific functions in init procedures which is
+AD4- precisely what we are trying to avoid by submitting this driver.

You're talking about fixups above here?

-Alexey