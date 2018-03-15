Return-Path: <t-kristo@ti.com>
Subject: Re: [GIT PULL] TI clock changes for 4.17
To: Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
CC: linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>
References: <06cc5fe8-cecd-2b6c-415d-74f533c75be0@ti.com>
 <152106412431.179530.18028994453678074314@swboyd.mtv.corp.google.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <28179265-c129-7797-84b5-9bca7f2d411d@ti.com>
Date: Thu, 15 Mar 2018 08:49:59 +0200
MIME-Version: 1.0
In-Reply-To: <152106412431.179530.18028994453678074314@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 14/03/18 23:48, Stephen Boyd wrote:
> Quoting Tero Kristo (2018-03-08 02:13:38)
>> Hi Stephen, Michael,
>>
>> These patches are targeted for 4.17 merge window. I grouped both
>> omap+keystone clock changes into single pull request.
>>
> 
> Thanks. Pulled into clk-next. BTW, I see that some of the 'basic' clk
> type code in TI driver isn't used anymore. Is there a plan to delete
> that code in the future? For example, drivers/clk/ti/divider.c has
> ti_clk_build_component_div() that nobody uses.

I've kept that legacy code around for now, as I've been contemplating if 
we should move over to have the clock data within the driver instead of 
having pure DT clocks. Any thoughts on that?

I can send patches once the next merge is over to remove all unused code 
though, we can find the removed code from history if it is ever needed 
for something.

-Tero

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
