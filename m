Return-Path: <zhang.lyra@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171205232844.GB4283@codeaurora.org>
References: <20171120033816.28414-1-chunyan.zhang@spreadtrum.com>
 <20171120191219.GD18379@codeaurora.org> <CAAfSe-s9qbRXBMZGbAuWXqhFr4Bt9LSv6=uvYCUW+UhdpcNKcg@mail.gmail.com>
 <CAAfSe-sd=+7BrBab_gsOK5RTe2uDx0HztC3LM1k7VbRf7azz7A@mail.gmail.com> <20171205232844.GB4283@codeaurora.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Wed, 6 Dec 2017 15:38:47 +0800
Message-ID: <CAAfSe-sr_THp1PhVGG-ZENQwVGVizNxjqweffbgtXmDZ56=+cw@mail.gmail.com>
Subject: Re: [PATCH] clk: fix a panic error caused by accessing NULL pointer
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Chunyan Zhang <chunyan.zhang@spreadtrum.com>,
	Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Cai Li <cai.li@spreadtrum.com>,
	Orson Zhai <orson.zhai@spreadtrum.com>, Ben Li <ben.li@spreadtrum.com>,
	Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 6 December 2017 at 07:28, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 11/21, Chunyan Zhang wrote:
>> On 21 November 2017 at 16:57, Chunyan Zhang <zhang.lyra@gmail.com> wrote:
>> > On 21 November 2017 at 03:12, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> >> On 11/20, Chunyan Zhang wrote:
>> >>> From: Cai Li <cai.li@spreadtrum.com>
>> >>>
>> >>> In some cases the clock parent would be set NULL when doing re-parent,
>> >>> it will cause a NULL pointer accessing if clk_set trace event is enabled,
>> >>> since the trace event function would not check the input parameter.
>> >>>
>> >>> Signed-off-by: Cai Li <cai.li@spreadtrum.com>
>> >>> Signed-off-by: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
>> >>
>> >> Fixes: tag?
>> >>
>> >>> ---
>> >>>  drivers/clk/clk.c | 9 ++++-----
>> >>>  1 file changed, 4 insertions(+), 5 deletions(-)
>> >>>
>> >>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> >>> index c8d83ac..64efaf0 100644
>> >>> --- a/drivers/clk/clk.c
>> >>> +++ b/drivers/clk/clk.c
>> >>> @@ -1242,13 +1242,12 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
>> >>>
>> >>>       old_parent = __clk_set_parent_before(core, parent);
>> >>>
>> >>> -     trace_clk_set_parent(core, parent);
>> >>> -
>> >>>       /* change clock input source */
>> >>> -     if (parent && core->ops->set_parent)
>> >>> +     if (parent && core->ops->set_parent) {
>> >>> +             trace_clk_set_parent(core, parent);
>> >>>               ret = core->ops->set_parent(core->hw, p_index);
>> >>> -
>> >>> -     trace_clk_set_parent_complete(core, parent);
>> >>> +             trace_clk_set_parent_complete(core, parent);
>> >>> +     }
>> >>
>> >> Is the problem that parent may be NULL and the tracepoint
>> >> dereferences it?
>> >
>> > Yes, I think that probably is uncommon usage though, it revealed that
>> > the tracepoint could be stronger :)
>>
>> The reason we need to set the parent as NULL is to disable the clk for
>> the purpose of saving power.
>
> Do you have drivers calling set_parent with NULL to save power?
> Seems sort of odd. Why not do something when disabling the clk in

It's a mux clk in the same address area with a device, when powerring
off the device module, the registers of this mux are reset with
default value by hardware.  When the device resumed afterward, the mux
clock needs to recover its previous clk parent, but the clk core would
find it is setting a same clk parent, the function
clk_core_set_parent() [1] will return directly without writing the
exact register to set the parent again.

So setting the clk parent with NULL is just a workaround, we will
appreciate if you have other better solution for us.

Thanks,
Chunyan

[1] http://elixir.free-electrons.com/linux/v4.15-rc1/source/drivers/clk/clk.c#L1886

> clk_disable() path instead? Either way, I'll apply the patch to
> clk-fixes.
>
> --
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project
