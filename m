Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH DO NOT MERGE 5/6] ARM: dts: omap4: add some sample clkctrl
 data
To: Tony Lindgren <tony@atomide.com>
References: <1486992157-10673-1-git-send-email-t-kristo@ti.com>
 <1486992157-10673-6-git-send-email-t-kristo@ti.com>
 <20170302174503.GP20572@atomide.com>
CC: <linux-clk@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <c92a6176-e749-95c3-8eeb-d9bad7a97672@ti.com>
Date: Thu, 2 Mar 2017 20:43:12 +0200
MIME-Version: 1.0
In-Reply-To: <20170302174503.GP20572@atomide.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 02/03/17 19:45, Tony Lindgren wrote:
> Hi,
>
> * Tero Kristo <t-kristo@ti.com> [170213 05:24]:
>> Adds clkctrl nodes for cm_l4per and cm_abe as example. Peripherals using
>> clocks from these nodes are modified also.
>
> Finally got around testing these. Looks like applying this patch
> breaks things for devices not using the new clocks entry?
>
> For example, SPI now breaks causing "imprecise external abort" during boot
> at least on droid 4.

If SPI is under l4per, then yes, a breakage is expected. This will cause 
a conflict with the existing hwmod data, and the new clock data, 
effectively disabling the IP clocks during boot. This patch only 
converts part of the DT data to the new format, and as such is only 
suitable for testing purposes.

I will provide a full data conversion for the DT file for 4.11-rc.

>
>> --- a/arch/arm/boot/dts/omap4.dtsi
>> +++ b/arch/arm/boot/dts/omap4.dtsi
>> +				cm_l4per: cm_l4per@0 {
>
> Above should be cm_l4per: cm_l4per@1400, right?

Yea thats a bug in this test patch. Same issue with other nodes. DT 
compiler isn't too picky about these so it works even with wrong node name.

>
>> +					compatible = "ti,omap4-cm";
>> +					reg = <0x1400 0x200>;
>> +					#address-cells = <1>;
>> +					#size-cells = <1>;
>> +					ranges = <0 0x1400 0x200>;
>> +
>> +					cm_l4per_clkctrl: cm_l4per_clkctrl@20 {
>> +						compatible = "ti,omap4-clkctrl";
>> +						reg = <0x20 0x1b0>;
>> +						#clock-cells = <2>;
>> +					};
>> +				};
>
> You should update the binding doc accordingly if the "cm_l4per@0" node
> there is not needed. I also noticed the binding doc still has
> "#clock-cells = <4>" while it should be 2.

cm_l4per is somewhat redundant right now, but we want to add 
clockdomains under that one in the future. Or, we could just add those 
directly under parent node also (cm2 in this case.)

-Tero
