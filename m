Return-Path: <t-kristo@ti.com>
Subject: Re: [PATCH 0/3] clk: ti: add CLK_SET_RATE_PARENT support for clkctrl
To: Tony Lindgren <tony@atomide.com>
CC: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <linux-omap@vger.kernel.org>, <jsarha@ti.com>
References: <1519657812-15605-1-git-send-email-t-kristo@ti.com>
 <20180226220520.GI16043@atomide.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <e036e793-37f5-a6ee-4347-72d27579e278@ti.com>
Date: Tue, 27 Feb 2018 08:34:37 +0200
MIME-Version: 1.0
In-Reply-To: <20180226220520.GI16043@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 27/02/18 00:05, Tony Lindgren wrote:
> Hi,
> 
> * Tero Kristo <t-kristo@ti.com> [180226 15:11]:
>> This patch adds clock rate propagation support for clkctrl clocks. This
>> is needed on am33xx beaglebone black device at least, otherwise the
>> display does not work. Similar problem appears to be present on am43xx
>> but haven't heard of any reports of such so far, maybe Jyri can confirm
>> this?
> 
> I think I was also hitting this with the system timers with ti-sysc
> where set_parent() would fail unless the dts has the following for
> timers:
> 
> clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>;
> 
> So bit 24 instead of 0.
> 
> Hmm so should we have all the timers use bit 0 in the dtsi?
> Or default to bit 24 for all of them?

Who is going to control the clkctrl clock for the timers if you just 
control the opt clock? Also, ain't the bit 24 the clksel mux setting? 
Tweaking that would seem wrong...

If you were facing problems with setting the clock source, we could 
maybe just apply the CLK_SET_RATE_PARENT globally to all clkctrl clocks 
(modify the patch #1 in this series to always set the flag, instead of 
clecking against the CLKF_xyz flag.) Any thoughts?

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
