Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:51472 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751769AbcDVFuk (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2016 01:50:40 -0400
Subject: Re: [RESEND PATCH v4] clk/axs10x: Add I2S PLL clock driver
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
	"sboyd@codeaurora.org" <sboyd@codeaurora.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>
References: <50c75be8ecab225a1dd49628a173d211a02755b2.1459791946.git.joabreu@synopsys.com>
 <20160415234631.GB4690@codeaurora.org> <5714B763.8010109@synopsys.com>
 <5714C9BA.8040004@synopsys.com> <5715F6AC.7090501@synopsys.com>
 <20160420015451.GH15324@codeaurora.org> <5717503F.7020806@synopsys.com>
 <1461168765.3149.31.camel@synopsys.com> <5718A298.50601@synopsys.com>
 <1461241114.2928.4.camel@synopsys.com>
CC: Carlos Palminha <CARLOS.PALMINHA@synopsys.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Vineet Gupta <Vineet.Gupta1@synopsys.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-snps-arc@lists.infradead.org"
	<linux-snps-arc@lists.infradead.org>
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-ID: <5719BB9C.6010800@synopsys.com>
Date: Fri, 22 Apr 2016 11:20:20 +0530
MIME-Version: 1.0
In-Reply-To: <1461241114.2928.4.camel@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thursday 21 April 2016 05:48 PM, Alexey Brodkin wrote:
> Hi Jose,
> 
> On Thu, 2016-04-21 at 10:51 +0100, Jose Abreu wrote:
>> Hi Alexey,
> 
> 
>>>>> Otherwise, I still prefer two DTS files for the two different FPGA
>>>>> versions. At the least, please use ioremap for any pointers that
>>>>> you readl/writel here.
>>>>>
>>>>> Beyond that, we should have a fixed rate source clk somewhere in
>>>>> the software view of the clk tree, because that reflects reality.
>>>>> Hardcoding the parent rate in the structure works, but doesn't
>>>>> properly express the clk tree.
>>>>>
>>>> Can I use a property in the DT to pass this reference clock? something like this:
>>>>     snps,parent-freq = <0xFBED9 27000000>, <0x0 28224000>; /* Tuple
>>>> <fpga-version reference-clock-freq>, fpga-version = 0 is default */
>>>>
>>>> Or use a parent clock? like:
>>>>     clk {
>>>>         compatible = "fixed-clock";
>>>>         clock-frequency = <27000000>;
>>>>         #clock-cells = <0>;
>>>>         snps,fpga-version = <0xFBED9>;
>>>>     }
>>>>
>>>> It is important to distinguish between the different versions automatically, is
>>>> any of these solutions ok?
>>> I do like that solution with a master clock but with some fine-tuning
>>> for simplification.
>>>
>>> We'll add master clock node for I2S as a fixed clock like that:
>>> ------------------->8------------------
>>> 	i2s_master_clock: clk {
>>> 		#clock-cells = <0>;
>>> 		compatible = "fixed-clock";
>>> 		clock-frequency = <27000000>;
>>> 	};
>>> ------------------->8------------------
>>>
>>> Note there's no mention of MB version, just a value of the frequency.
>>> And in the driver itself value of that master clock will be used for
>>> population of "pll_clk->ref_clk" directly.
>>>
>>> These are benefits we'll get with that approach:
>>>  [1] We escape any IOs not related to our clock device (I mean
>>>      "snps,i2s-pll-clock") itself.
>>>  [2] We'll use whatever reference clock value is given.
>>>      I.e. we'll be able to do a fix-up of that reference clock
>>>      value early in platform code depending on HW we're running on.
>>>      That's what people do here and there.
>>>  [3] Remember another clock driver for AXS10x board is right around
>>>      the corner. I mean the one for ARC PGU which uses exactly the same
>>>      master clock. So one fixup as mentioned above will work
>>>      at once for 2 clock drivers.
>>>
>>> Let me know if above makes sense.
>> That approach can't be used because the reference clock value will change in the
>> next firmware release.  The new release will have a reference clock of 28224000
>> Hz instead of the usual 27000000 Hz, so we need to have a way to distinguish
>> between them. Because of that we can't have only one master clock unless you
>> state to users that they have to change the reference clock value when using the
>> new firmware release. Stephen suggested to use two DT files (one for each
>> firmware release), but as Vineet said this would be annoying to the user so I am
>> trying to use another solution so that only one DT file is required.
> 
> Ok reference clock will change.
> But I may guess we'll still be able to determine at least that new
> firmware version in run-time, right? If so we'll update a fix-up in
> early axs10x platform code so that reference clock will be set as 28224000 Hz.


Please no - lets not bolt-in more hacks and instead try do this cleanly if
possible. And from other discusions it seems there might be a way. The readl
approach seems fine to me (with ioremap) if that is what it takes.


> And indeed 2 DT files is a no go - we want to run the same one binary
> (with built-in .dtb) on all flavors of AXS boards.

Right - 2 DT is not acceptable unless we are feeling bored and want more emails
for AXS board support :-)

 And fix-up I'm talking about
> will actually do transformation of .dtb early on kernel boot process so that will
> be a complete equivalent of different DT files.
> 
> -Alexey--
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

