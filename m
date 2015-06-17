Return-Path: <matthias.bgg@gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPw-ZTkrEVJ=9jBHUsqxab0KJaOW38xq_0mu6oeY3hnSu44Y=g@mail.gmail.com>
References: <1434525703-3936-1-git-send-email-matthias.bgg@gmail.com>
	<CAPw-ZTkrEVJ=9jBHUsqxab0KJaOW38xq_0mu6oeY3hnSu44Y=g@mail.gmail.com>
Date: Wed, 17 Jun 2015 23:22:52 +0200
Message-ID: <CABuKBeLuQV_d-htGgXN+52EznVEiQsnhZCgENoXJmuDwCDw5Lw@mail.gmail.com>
Subject: Re: [PATCH] clk: xgene: Delete duplicated name field
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Loc Ho <lho@apm.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>,
	Kumar Sankaran <ksankaran@apm.com>, Vinayak Kale <vkale@apm.com>, Feng Kan <fkan@apm.co>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2015-06-17 21:56 GMT+02:00 Loc Ho <lho@apm.com>:
> Hi,
>
> The change looks fine to me. Though, it seems like linux-next has an
> slightly modified version as a few lines didn't apply correctly.
>

That's true. The patch was build against v4.1-rc8 and the patch from
Stephen wasn't present.
I will resend based on linux-next.

Thanks,
Matthias

> -Loc
>
> On Wed, Jun 17, 2015 at 12:21 AM, Matthias Brugger <matthias.bgg@gmail.com>
> wrote:
>>
>> X-Gene clocks implement it's name in the clock private struct.
>> This is a duplication of the name field. We can delete the field
>> and rely on the common implementation to retrieve the name.
>>
>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>> ---
>>  drivers/clk/clk-xgene.c | 28 +++++++++++++---------------
>>  1 file changed, 13 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
>> index dd8a62d..4798896 100644
>> --- a/drivers/clk/clk-xgene.c
>> +++ b/drivers/clk/clk-xgene.c
>> @@ -60,7 +60,6 @@ enum xgene_pll_type {
>>
>>  struct xgene_clk_pll {
>>         struct clk_hw   hw;
>> -       const char      *name;
>>         void __iomem    *reg;
>>         spinlock_t      *lock;
>>         u32             pll_offset;
>> @@ -75,7 +74,7 @@ static int xgene_clk_pll_is_enabled(struct clk_hw *hw)
>>         u32 data;
>>
>>         data = xgene_clk_read(pllclk->reg + pllclk->pll_offset);
>> -       pr_debug("%s pll %s\n", pllclk->name,
>> +       pr_debug("%s pll %s\n", __clk_get_name(hw->clk),
>>                 data & REGSPEC_RESET_F1_MASK ? "disabled" : "enabled");
>>
>>         return data & REGSPEC_RESET_F1_MASK ? 0 : 1;
>> @@ -113,7 +112,7 @@ static unsigned long xgene_clk_pll_recalc_rate(struct
>> clk_hw *hw,
>>                 fref = parent_rate / nref;
>>                 fvco = fref * nfb;
>>         }
>> -       pr_debug("%s pll recalc rate %ld parent %ld\n", pllclk->name,
>> +       pr_debug("%s pll recalc rate %ld parent %ld\n",
>> __clk_get_name(hw->clk),
>>                 fvco / nout, parent_rate);
>>
>>         return fvco / nout;
>> @@ -146,7 +145,6 @@ static struct clk *xgene_register_clk_pll(struct
>> device *dev,
>>         init.parent_names = parent_name ? &parent_name : NULL;
>>         init.num_parents = parent_name ? 1 : 0;
>>
>> -       apmclk->name = name;
>>         apmclk->reg = reg;
>>         apmclk->lock = lock;
>>         apmclk->pll_offset = pll_offset;
>> @@ -210,7 +208,6 @@ struct xgene_dev_parameters {
>>
>>  struct xgene_clk {
>>         struct clk_hw   hw;
>> -       const char      *name;
>>         spinlock_t      *lock;
>>         struct xgene_dev_parameters     param;
>>  };
>> @@ -227,7 +224,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
>>                 spin_lock_irqsave(pclk->lock, flags);
>>
>>         if (pclk->param.csr_reg != NULL) {
>> -               pr_debug("%s clock enabled\n", pclk->name);
>> +               pr_debug("%s clock enabled\n", __clk_get_name(hw->clk));
>>                 /* First enable the clock */
>>                 data = xgene_clk_read(pclk->param.csr_reg +
>>                                         pclk->param.reg_clk_offset);
>> @@ -235,7 +232,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
>>                 xgene_clk_write(data, pclk->param.csr_reg +
>>                                         pclk->param.reg_clk_offset);
>>                 pr_debug("%s clock PADDR base 0x%016LX clk offset 0x%08X
>> mask 0x%08X value 0x%08X\n",
>> -                       pclk->name, __pa(pclk->param.csr_reg),
>> +                       __clk_get_name(hw->clk),
>> __pa(pclk->param.csr_reg),
>>                         pclk->param.reg_clk_offset,
>> pclk->param.reg_clk_mask,
>>                         data);
>>
>> @@ -246,7 +243,7 @@ static int xgene_clk_enable(struct clk_hw *hw)
>>                 xgene_clk_write(data, pclk->param.csr_reg +
>>                                         pclk->param.reg_csr_offset);
>>                 pr_debug("%s CSR RESET PADDR base 0x%016LX csr offset
>> 0x%08X mask 0x%08X value 0x%08X\n",
>> -                       pclk->name, __pa(pclk->param.csr_reg),
>> +                       __clk_get_name(hw->clk),
>> __pa(pclk->param.csr_reg),
>>                         pclk->param.reg_csr_offset,
>> pclk->param.reg_csr_mask,
>>                         data);
>>         }
>> @@ -267,7 +264,7 @@ static void xgene_clk_disable(struct clk_hw *hw)
>>                 spin_lock_irqsave(pclk->lock, flags);
>>
>>         if (pclk->param.csr_reg != NULL) {
>> -               pr_debug("%s clock disabled\n", pclk->name);
>> +               pr_debug("%s clock disabled\n", __clk_get_name(hw->clk));
>>                 /* First put the CSR in reset */
>>                 data = xgene_clk_read(pclk->param.csr_reg +
>>                                         pclk->param.reg_csr_offset);
>> @@ -293,10 +290,10 @@ static int xgene_clk_is_enabled(struct clk_hw *hw)
>>         u32 data = 0;
>>
>>         if (pclk->param.csr_reg != NULL) {
>> -               pr_debug("%s clock checking\n", pclk->name);
>> +               pr_debug("%s clock checking\n", __clk_get_name(hw->clk));
>>                 data = xgene_clk_read(pclk->param.csr_reg +
>>                                         pclk->param.reg_clk_offset);
>> -               pr_debug("%s clock is %s\n", pclk->name,
>> +               pr_debug("%s clock is %s\n", __clk_get_name(hw->clk),
>>                         data & pclk->param.reg_clk_mask ? "enabled" :
>>                                                         "disabled");
>>         }
>> @@ -319,11 +316,13 @@ static unsigned long xgene_clk_recalc_rate(struct
>> clk_hw *hw,
>>                 data &= (1 << pclk->param.reg_divider_width) - 1;
>>
>>                 pr_debug("%s clock recalc rate %ld parent %ld\n",
>> -                       pclk->name, parent_rate / data, parent_rate);
>> +                       __clk_get_name(hw->clk),
>> +                       parent_rate / data, parent_rate);
>> +
>>                 return parent_rate / data;
>>         } else {
>>                 pr_debug("%s clock recalc rate %ld parent %ld\n",
>> -                       pclk->name, parent_rate, parent_rate);
>> +                       __clk_get_name(hw->clk), parent_rate,
>> parent_rate);
>>                 return parent_rate;
>>         }
>>  }
>> @@ -355,7 +354,7 @@ static int xgene_clk_set_rate(struct clk_hw *hw,
>> unsigned long rate,
>>                 data |= divider;
>>                 xgene_clk_write(data, pclk->param.divider_reg +
>>                                         pclk->param.reg_divider_offset);
>> -               pr_debug("%s clock set rate %ld\n", pclk->name,
>> +               pr_debug("%s clock set rate %ld\n",
>> __clk_get_name(hw->clk),
>>                         parent_rate / divider_save);
>>         } else {
>>                 divider_save = 1;
>> @@ -417,7 +416,6 @@ static struct clk *xgene_register_clk(struct device
>> *dev,
>>         init.parent_names = parent_name ? &parent_name : NULL;
>>         init.num_parents = parent_name ? 1 : 0;
>>
>> -       apmclk->name = name;
>>         apmclk->lock = lock;
>>         apmclk->hw.init = &init;
>>         apmclk->param = *parameters;
>> --
>> 1.9.1
>>
>



-- 
motzblog.wordpress.com
