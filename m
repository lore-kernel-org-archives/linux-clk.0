Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
To: Stephen Boyd <sboyd@codeaurora.org>, Jose Abreu <Jose.Abreu@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <20160415234631.GB4690@codeaurora.org> <5714B763.8010109@synopsys.com>
 <5714C9BA.8040004@synopsys.com> <5715F6AC.7090501@synopsys.com>
 <20160420015451.GH15324@codeaurora.org>
CC: Vineet Gupta <Vineet.Gupta1@synopsys.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
	<CARLOS.PALMINHA@synopsys.com>, <Alexey.Brodkin@synopsys.com>,
	<mturquette@baylibre.com>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <5717503F.7020806@synopsys.com>
Date: Wed, 20 Apr 2016 10:47:43 +0100
MIME-Version: 1.0
In-Reply-To: <20160420015451.GH15324@codeaurora.org>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,


On 20-04-2016 02:54, Stephen Boyd wrote:
> On 04/19, Jose Abreu wrote:
>> @Stephen: can you give some input so that I can submit a v6?
>>
> I don't prefer putting the second register in the same DT node,
> but that's really up to the DT reviewers to approve such a
> design. The current binding has been acked by Rob right?

Yes.

> Assuming the new binding is acked/reviewed then that solution is
> fine.

Ok, will then use the DT to pass the FPGA version register.

> Otherwise, I still prefer two DTS files for the two different FPGA
> versions. At the least, please use ioremap for any pointers that
> you readl/writel here.
>
> Beyond that, we should have a fixed rate source clk somewhere in
> the software view of the clk tree, because that reflects reality.
> Hardcoding the parent rate in the structure works, but doesn't
> properly express the clk tree.
>

Can I use a property in the DT to pass this reference clock? something like this:
    snps,parent-freq = <0xFBED9 27000000>, <0x0 28224000>; /* Tuple
<fpga-version reference-clock-freq>, fpga-version = 0 is default */

Or use a parent clock? like:
    clk {
        compatible = "fixed-clock";
        clock-frequency = <27000000>;
        #clock-cells = <0>;
        snps,fpga-version = <0xFBED9>;
    }

It is important to distinguish between the different versions automatically, is
any of these solutions ok?

Best regards,
Jose Miguel Abreu
