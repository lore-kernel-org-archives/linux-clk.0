Return-Path: <Jose.Abreu@synopsys.com>
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	Stephen Boyd <sboyd@codeaurora.org>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <20160415234631.GB4690@codeaurora.org> <5714B763.8010109@synopsys.com>
 <5714C9BA.8040004@synopsys.com>
CC: Jose Abreu <Jose.Abreu@synopsys.com>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-snps-arc@lists.infradead.org>,
	<CARLOS.PALMINHA@synopsys.com>, <Alexey.Brodkin@synopsys.com>,
	<mturquette@baylibre.com>
From: Jose Abreu <Jose.Abreu@synopsys.com>
Message-ID: <5715F6AC.7090501@synopsys.com>
Date: Tue, 19 Apr 2016 10:13:16 +0100
MIME-Version: 1.0
In-Reply-To: <5714C9BA.8040004@synopsys.com>
Content-Type: text/plain; charset="windows-1252"
List-ID: <linux-clk.vger.kernel.org>

Hi Vineet,


On 18-04-2016 12:49, Vineet Gupta wrote:
> On Monday 18 April 2016 04:00 PM, Jose Abreu wrote:
>>>> +	if (readl((void *)FPGA_VER_INFO) <= FPGA_VER_27M) {
>>>> Please don't readl directly from addresses. I think I mentioned
>>>> that before and didn't get back to you when you replied asking
>>>> for other solutions. I still think a proper DT is in order
>>>> instead of doing this check for ref_clk.
>> I think that the DT approach would be better but I also think that using two DT
>> files with only one change between them is not viable. I can see some alternatives:
>>     1) Pass the region of FPGA version in reg field of DT so that writel is not
>> directly used;
>>     2) Create a dummy parent clock driver that reads from FPGA version register
>> and returns the rate;
>>     3) Last resort: Use two DT files for each FPGA version.
>>
>> @Vineet, @Alexey: Can you give some suggestions?
>>
>> Some background:
>> We are expecting a new firmware release for the AXS board that will change the
>> reference clock value of the I2S PLL from 27MHz to 28.224MHz. Due to this change
>> the dividers of this PLL will change. Right now I am directly reading from the
>> FPGA version register but Stephen suggested to use a DT approach so that this
>> rate is declared as parent clock. This would be a good solution but would
>> require the usage of two different DT files (one for the current firmware and
>> another for the new firmware), which I think is not ideal. What is your opinion?
>> Some other solutions are listed above.
> Consider this my ignorance of clk drivers, what exactly is the problem with that
> readl() for FPGA ver. Having 2 versions of DT is annoyance for sure, but the
> bigger headache is that it still won't help cases of users mixing and matching
> boards and DT. IMO this runtime check is pretty nice and will support both types
> of boards with exact same code/DT !
>
> FWIW, both solutions #1 and #3 seem to imply a different DT - no ?

Solution 1 only requires that the FPGA version register is declared in the DT,
something like this:
    i2s_clock@100a0 {
        compatible = "snps,axs10x-i2s-pll-clock";
        reg = <0x100a0 0x10 0x11230 0x04>;
        #clock-cells = <0>;
    };

And then the region is io-remapped. This solution would discard the direct readl
from the address and would still be compatible with the different firmwares
using the same DT.

Solution 3 is the alternative that Stephen suggested which requires two
different DT's.

>
> And I really don't see how #2 makes things more elegant/abstracted w.r.t clk
> framework ?

Yes, solution 2 is more of a workaround and is not the best by far.

>
> So I prefer what you had before.
> -Vineet

@Stephen: can you give some input so that I can submit a v6?

Best regards,
Jose Miguel Abreu
