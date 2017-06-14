Return-Path: <t-kristo@ti.com>
Subject: Re: [GIT PULL] clk: ti: clkctrl support for 4.13 merge window
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        linux-clk
	<linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>
References: <6d66f78a-5d39-6396-c492-b79a687ce58a@ti.com>
 <20170614173237.GB20170@codeaurora.org>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <ee8f9ff4-831c-1999-175e-12608a954cfb@ti.com>
Date: Wed, 14 Jun 2017 20:40:53 +0300
MIME-Version: 1.0
In-Reply-To: <20170614173237.GB20170@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 14/06/17 20:32, Stephen Boyd wrote:
> On 06/08, Tero Kristo wrote:
>> Hi Stephen, Mike,
>>
>> This pull contains the v3 of the clkctrl base driver support posted
>> couple of weeks back, with Tony's acks added to patch #2 and #4.
>>
>> -Tero
>>
> 
> drivers/clk/ti/clkctrl.c:252
> _ti_clkctrl_clk_register() warn: possible memory leak of 'clkctrl_clk'
> drivers/clk/ti/clkctrl.c:264
> _ti_clkctrl_clk_register() warn: possible memory leak of 'clkctrl_clk'
> drivers/clk/ti/clkctrl.c:466
> _ti_omap4_clkctrl_setup() warn: possible memory leak of 'clkctrl_clk'
> drivers/clk/ti/clkctrl.c:473
> _ti_omap4_clkctrl_setup() warn: possible memory leak of 'clkctrl_clk'
> 
> Can these be silenced with some follow up patch? I'll hold off on
> the pull until you can take a look.
> 

What is the tool you use to get these?

They seem like valid warnings though, some cleanup could be used for the 
dynamic memory handling. I'll fix these tomorrow.

-Tero
