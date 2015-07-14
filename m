Return-Path: <t-kristo@ti.com>
Message-ID: <55A56C5E.2000309@ti.com>
Date: Tue, 14 Jul 2015 23:09:02 +0300
From: Tero Kristo <t-kristo@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Mike Turquette <mturquette@baylibre.com>,
        "tony@atomide.com"
	<tony@atomide.com>, Paul Walmsley <paul@pwsan.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [GIT PULL] clk: ti: clock driver code migration to drivers
References: <55A4CE41.9070909@ti.com> <55A5630E.8030901@codeaurora.org>
In-Reply-To: <55A5630E.8030901@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/14/2015 10:29 PM, Stephen Boyd wrote:
> On 07/14/2015 01:54 AM, Tero Kristo wrote:
>> The following changes since commit
>> bc0195aad0daa2ad5b0d76cce22b167bc3435590:
>>
>>   Linux 4.2-rc2 (2015-07-12 15:10:30 -0700)
>
> Why did this get rebased onto v4.2-rc2? I thought it was all ready to go
> based on v4.1-rc2? If possible leave it on v4.1-rc2 please.

You mean 4.2-rc1 I guess...? Or do you really mean the old 4.1-rc2....?

>
>>
>> are available in the git repository at:
>>
>>   git@github.com:t-kristo/linux-pm.git for-4.3/ti-clk-move
>
> Also I can't fetch this. Please give a public URL and not the one you
> use for github.

Oh sorry about that, git request-pull does this automatically. I'll 
update my script to use public URL.

>
> I fetched the for-4.2/ti-clk-move branch and did a test merge and fixed
> up omap3_noncore_dpll_determine_rate() and
> omap4_dpll_regm4xen_determine_rate() for the new determine rate
> signature and it looks like things are still compiling. So please redo
> the tag for that branch.

Yea I can send a new pull-request tomorrow once my question is 
clarified. The code in the two branches is identical regarding the clock 
code changes, and both can be considered immutable and ready for pull if 
need be.

-Tero

>
> ----8<-----
>
> diff --cc include/linux/clk/ti.h
> index 448b4f87b9eb,f1838256fbaa..000000000000
> --- a/include/linux/clk/ti.h
> +++ b/include/linux/clk/ti.h
> diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
> index d4d232fd89bc..d8aafd333058 100644
> --- a/drivers/clk/ti/clock.h
> +++ b/drivers/clk/ti/clock.h
> @@ -250,12 +250,8 @@ int omap3_noncore_dpll_set_rate_and_parent(struct
> clk_hw *hw,
>                          unsigned long rate,
>                          unsigned long parent_rate,
>                          u8 index);
> -long omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
> -                       unsigned long rate,
> -                       unsigned long min_rate,
> -                       unsigned long max_rate,
> -                       unsigned long *best_parent_rate,
> -                       struct clk_hw **best_parent_clk);
> +int omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
> +                      struct clk_rate_request *req);
>   long omap2_dpll_round_rate(struct clk_hw *hw, unsigned long target_rate,
>                  unsigned long *parent_rate);
>   unsigned long omap3_clkoutx2_recalc(struct clk_hw *hw,
> @@ -273,12 +269,8 @@ unsigned long omap4_dpll_regm4xen_recalc(struct
> clk_hw *hw,
>   long omap4_dpll_regm4xen_round_rate(struct clk_hw *hw,
>                       unsigned long target_rate,
>                       unsigned long *parent_rate);
> -long omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
> -                    unsigned long rate,
> -                    unsigned long min_rate,
> -                    unsigned long max_rate,
> -                    unsigned long *best_parent_rate,
> -                    struct clk_hw **best_parent_clk);
> +int omap4_dpll_regm4xen_determine_rate(struct clk_hw *hw,
> +                       struct clk_rate_request *req);
>
>   extern struct ti_clk_ll_ops *ti_clk_ll_ops;
>
>
