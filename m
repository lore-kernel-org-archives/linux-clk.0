Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <56B9507B.9000201@kernel.org>
References: <56B9507B.9000201@kernel.org>
Date: Tue, 9 Feb 2016 13:00:47 +0900
Message-ID: <CAK7LNASSex+Nfpzp-=FGbo7eKCteamvyX_DyZaeRenhpF72ZdQ@mail.gmail.com>
Subject: Re: commit 5146e0b05963 is causing a kernel crash on SoCFPGA
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Vladimir Zapolskiy <vz@mleia.com>,
        Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Dinh,

Thanks for your report.


2016-02-09 11:35 GMT+09:00 Dinh Nguyen <dinguyen@kernel.org>:
> Hi Stephen,
>
> It appears that commit 5146e0b05966 "clk: simplify __clk_init_parent()"
> that is currently in linux-next is causing the following kernel crash on
> SoCFGPA[1].
>
> I have bisected to this commit and doing a revert of the commit fixes
> the issue.


Could you check if the following simple patch fixes your problem?


--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1662,7 +1662,7 @@ static struct clk_core *__clk_init_parent(struct
clk_core *core)
 {
        u8 index = 0;

-       if (core->ops->get_parent)
+       if (core->num_parents > 1 && core->ops->get_parent)
                index = core->ops->get_parent(core->hw);

        return clk_core_get_parent_by_index(core, index);




Let me ask one more question.

Do SoCFPGA clocks define .get_parent callback even if num_parents <= 1 ?


I just skimmed over driver/clk/socfpga/clk-gate.c
and found it defines .get_parent().

I think a gating clock is usually single-parent (so not need to have
.get_parent),
but I am not sure if this is the case.


-- 
Best Regards
Masahiro Yamada
