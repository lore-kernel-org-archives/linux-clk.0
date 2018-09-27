Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH 00/11] clk: ti: clkctrl data split based on clkdm
 boundaries
To: Tony Lindgren <tony@atomide.com>
CC: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-omap@vger.kernel.org>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
 <20180904153657.GB5662@atomide.com> <20180926191301.GX5662@atomide.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <e4e90740-393f-edaf-947c-aa1010ab79a3@ti.com>
Date: Thu, 27 Sep 2018 09:31:10 +0300
MIME-Version: 1.0
In-Reply-To: <20180926191301.GX5662@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 26/09/18 22:13, Tony Lindgren wrote:
> Hi,
> 
> * Tony Lindgren <tony@atomide.com> [180904 15:41]:
>> * Tero Kristo <t-kristo@ti.com> [180831 15:11]:
>>> Hi,
>>>
>>> This series splits up the clkctrl data for TI SoCs based on clockdomain
>>> boundaries, instead of the current CM boundaries. For rest of the SoCs,
>>> the CM boundaries are actually the same as clockdomains, only am3/am4/dra7
>>> are mutants.
>>>
>>> This is done in preparation for better supporting Tony's upcoming
>>> interconnect driver data introduction for these SoCs.
>>>
>>> One thing to note is that we maintain backwards compatibility with this
>>> series, the compat data is introduced temporarily for this purpose. The
>>> compat data can be ditched after couple of release cycles when nobody
>>> needs it anymore.
>>>
>>> The series can be applied independently, as the compat data support
>>> makes care that the switch is only done once DT changes are in place.
>>
>> When this is ready for merging, can you guys please set up an
>> immutable branch against v4.19-rc1 with the drivers/clk changes
>> for me to merge in too?
>>
>> I've tested this on am335x and am437x so far and it works fine
>> for me, so for the whole series:
>>
>> Tested-by: Tony Lindgren <tony@atomide.com>
> 
> Any news on getting this into Linux next and merged? The
> immutable is still needed too for the dts changes.
> 

This is currently blocked from my side, as the patch [1] from Johan got 
in clk-next is conflicting with my series. Asked Stephen for either 
dropping that patch and letting me pick it up but no response so far.

[1] https://lkml.org/lkml/2018/8/22/160

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
