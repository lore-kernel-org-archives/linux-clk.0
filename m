Return-Path: <dinguyen@kernel.org>
Subject: Re: commit 5146e0b05963 is causing a kernel crash on SoCFPGA
To: Masahiro Yamada <yamada.masahiro@socionext.com>
References: <56B9507B.9000201@kernel.org>
 <CAK7LNASSex+Nfpzp-=FGbo7eKCteamvyX_DyZaeRenhpF72ZdQ@mail.gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <56B9BB41.3080001@kernel.org>
Date: Tue, 9 Feb 2016 04:11:13 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNASSex+Nfpzp-=FGbo7eKCteamvyX_DyZaeRenhpF72ZdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Masahiro,

On 02/08/2016 10:00 PM, Masahiro Yamada wrote:
> Hi Dinh,
> 
> Thanks for your report.
> 
> 
> 2016-02-09 11:35 GMT+09:00 Dinh Nguyen <dinguyen@kernel.org>:
>> Hi Stephen,
>>
>> It appears that commit 5146e0b05966 "clk: simplify __clk_init_parent()"
>> that is currently in linux-next is causing the following kernel crash on
>> SoCFGPA[1].
>>
>> I have bisected to this commit and doing a revert of the commit fixes
>> the issue.
> 
> 
> Could you check if the following simple patch fixes your problem?
> 
> 
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1662,7 +1662,7 @@ static struct clk_core *__clk_init_parent(struct
> clk_core *core)
>  {
>         u8 index = 0;
> 
> -       if (core->ops->get_parent)
> +       if (core->num_parents > 1 && core->ops->get_parent)
>                 index = core->ops->get_parent(core->hw);
> 
>         return clk_core_get_parent_by_index(core, index);
> 
> 

Yes, the above patch fixes the problem and the SoCFPGA board is able to
boot.

> 
> 
> Let me ask one more question.
> 
> Do SoCFPGA clocks define .get_parent callback even if num_parents <= 1 ?
> 
> 
> I just skimmed over driver/clk/socfpga/clk-gate.c
> and found it defines .get_parent().
> 
> I think a gating clock is usually single-parent (so not need to have
> .get_parent),
> but I am not sure if this is the case.
> 

Yes, .get_parent call back is define when num_parents = 1. If you take a
look at socfpga.dtsi, the main_pll of type "altr,socfpga-pll-clk" only
has 1 parent, osc1. But the periph_pll and sdram_pll, also of type
"altr,socfpga-pll-clk" has > 1 parents.

Dinh
