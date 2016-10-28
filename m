Return-Path: <lho@apm.com>
MIME-Version: 1.0
In-Reply-To: <83c41979-96a0-27bb-4e5a-329396ab296a@redhat.com>
References: <1477673978-15424-1-git-send-email-labbott@redhat.com>
 <CAPw-ZT=XYA3Q=nYC649iC41eebC8fqMsiOaG+O8mhP24D4JN5Q@mail.gmail.com> <83c41979-96a0-27bb-4e5a-329396ab296a@redhat.com>
From: Loc Ho <lho@apm.com>
Date: Fri, 28 Oct 2016 10:11:27 -0700
Message-ID: <CAPw-ZT=Zmvy3GVCYfDx4RO-BN8Ot209MfCuoF9rnih8vXzKdKw@mail.gmail.com>
Subject: Re: [PATCHv2] clk: xgene: Don't call __pa on ioremaped address
To: Laura Abbott <labbott@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

>>
>>> ioremaped addresses are not linearly mapped so the physical
>>> address can not be figured out via __pa. More generally, there
>>> is no guarantee that backing value of an ioremapped address
>>> is a physical address at all. The value here is only used
>>> for debugging so just drop the call to __pa on the ioremapped
>>> address.
>>>
>>> Fixes: 6ae5fd381251 ("clk: xgene: Silence sparse warnings")
>>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>>> ---
>>> v2: Fix up one more format string
>>>
>>> I put the fixes tag to match with the cleanup that was done.
>>> If there is interest in this fix for pre-4.2 kernels for
>>> stable, I can submit a patch for that as well.
>>> ---
>>>  drivers/clk/clk-xgene.c | 10 ++++------
>>>  1 file changed, 4 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
>>> index 3433132..1e67655 100644
>>> --- a/drivers/clk/clk-xgene.c
>>> +++ b/drivers/clk/clk-xgene.c
>>> @@ -243,22 +243,20 @@ static int xgene_clk_enable(struct clk_hw *hw)
>>>         struct xgene_clk *pclk = to_xgene_clk(hw);
>>>         unsigned long flags = 0;
>>>         u32 data;
>>> -       phys_addr_t reg;
>>>
>>>         if (pclk->lock)
>>>                 spin_lock_irqsave(pclk->lock, flags);
>>>
>>>         if (pclk->param.csr_reg != NULL) {
>>>                 pr_debug("%s clock enabled\n", clk_hw_get_name(hw));
>>> -               reg = __pa(pclk->param.csr_reg);
>>>                 /* First enable the clock */
>>>                 data = xgene_clk_read(pclk->param.csr_reg +
>>>                                         pclk->param.reg_clk_offset);
>>>                 data |= pclk->param.reg_clk_mask;
>>>                 xgene_clk_write(data, pclk->param.csr_reg +
>>>                                         pclk->param.reg_clk_offset);
>>> -               pr_debug("%s clock PADDR base %pa clk offset 0x%08X mask
>>> 0x%08X value 0x%08X\n",
>>> -                       clk_hw_get_name(hw), &reg,
>>> +               pr_debug("%s clk offset 0x%08X mask 0x%08X value
>>> 0x%08X\n",
>>> +                       clk_hw_get_name(hw),
>>>                         pclk->param.reg_clk_offset,
>>> pclk->param.reg_clk_mask,
>>>                         data);
>>>
>>> @@ -268,8 +266,8 @@ static int xgene_clk_enable(struct clk_hw *hw)
>>>                 data &= ~pclk->param.reg_csr_mask;
>>>                 xgene_clk_write(data, pclk->param.csr_reg +
>>>                                         pclk->param.reg_csr_offset);
>>> -               pr_debug("%s CSR RESET PADDR base %pa csr offset 0x%08X
>>> mask 0x%08X value 0x%08X\n",
>>> -                       clk_hw_get_name(hw), &reg,
>>> +               pr_debug("%s csr offset 0x%08X mask 0x%08X value
>>> 0x%08X\n",
>>> +                       clk_hw_get_name(hw),
>>>                         pclk->param.reg_csr_offset,
>>> pclk->param.reg_csr_mask,
>>>                         data);
>>>         }
>>
>>
>>
>> The code looks fine to me. May be overly cautious here. Do you have a
>> board to test this out?
>>
>> -Loc
>>
>
> Yes, that was how I caught the problem. There are no errors that I
> can see with this patch applied.

Acked-by: Loc Ho <lho@apm.com>

-Loc
