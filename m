Return-Path: <linux-kernel-owner@vger.kernel.org>
Subject: Re: [PATCH 2/2] clk: rockchip: remove ROCKCHIP_SOFTRST_HIWORD_MASK
 for rockchip platform
To: Xing Zheng <zhengxing@rock-chips.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
References: <1464915288-10877-1-git-send-email-shawn.lin@rock-chips.com>
 <5750DC85.4040400@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
From: Shawn Lin <shawn.lin@kernel-upstream.org>
Message-ID: <7fdf43a9-58d4-d6a8-d863-a7e265c93a06@kernel-upstream.org>
Date: Fri, 3 Jun 2016 11:35:32 +0800
MIME-Version: 1.0
In-Reply-To: <5750DC85.4040400@rock-chips.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

在 2016/6/3 9:25, Xing Zheng 写道:
> Hi Shawn,
>
> On 2016年06月03日 08:54, Shawn Lin wrote:
>> I check all the Socs including RK2928/3000/3066/3028X/316X/312X/
>> 3190/3188/3228/3368/3399/3036, and find all of them use high 16-bit
>> as write mask. Obviously we don't need ROCKCHIP_SOFTRST_HIWORD_MASK
>> any more(actually I don't know why we need it before). This patch
>> removes it to simplify the code and save a little cpu cycle when calling
>> assert or deassert callback.
> In my opinion, this flag can be used for compatibility, we can not
> ensure that our SoCs will not use the 32bit SOFTRST_CONs in future.
>
> Thanks.

Thanks for sharing your thought.

I'm not 100% sure, but I'm 99% sure about we won't let
it happened. You have to consider the backward compatibility
rather than the future ones. If you got a chip with 10 bit, or
8bit for SOFTRST_CONX, so how do you wanna deal with it?
Should we now add  ROCKCHIP_SOFTRST_X_BIT_MASK?  :)

>>
>> Signed-off-by: Shawn Lin<shawn.lin@rock-chips.com>
>> ---
>>
>>   drivers/clk/rockchip/clk-rk3036.c |  3 +--
>>   drivers/clk/rockchip/clk-rk3188.c |  3 +--
>>   drivers/clk/rockchip/clk-rk3228.c |  3 +--
>>   drivers/clk/rockchip/clk-rk3288.c |  3 +--
>>   drivers/clk/rockchip/clk-rk3368.c |  3 +--
>>   drivers/clk/rockchip/clk-rk3399.c |  6 ++----
>>   drivers/clk/rockchip/clk.h        |  6 ++----
>>   drivers/clk/rockchip/softrst.c    | 40
>> +++++----------------------------------
>>   8 files changed, 14 insertions(+), 53 deletions(-)
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3036.c
>> b/drivers/clk/rockchip/clk-rk3036.c
>> index 924f560..a13dfc2 100644
>> --- a/drivers/clk/rockchip/clk-rk3036.c
>> +++ b/drivers/clk/rockchip/clk-rk3036.c
>> @@ -475,8 +475,7 @@ static void __init rk3036_clk_init(struct
>> device_node *np)
>>               &rk3036_cpuclk_data, rk3036_cpuclk_rates,
>>               ARRAY_SIZE(rk3036_cpuclk_rates));
>>
>> -    rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
>> -                  ROCKCHIP_SOFTRST_HIWORD_MASK);
>> +    rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0));
>>
>>       rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL);
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3188.c
>> b/drivers/clk/rockchip/clk-rk3188.c
>> index d0e722a..4acd787 100644
>> --- a/drivers/clk/rockchip/clk-rk3188.c
>> +++ b/drivers/clk/rockchip/clk-rk3188.c
>> @@ -780,8 +780,7 @@ static struct rockchip_clk_provider *__init
>> rk3188_common_clk_init(struct device
>>       rockchip_clk_register_branches(ctx, common_clk_branches,
>>                     ARRAY_SIZE(common_clk_branches));
>>
>> -    rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
>> -                  ROCKCHIP_SOFTRST_HIWORD_MASK);
>> +    rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0));
>>
>>       rockchip_register_restart_notifier(ctx, RK2928_GLB_SRST_FST, NULL);
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3228.c
>> b/drivers/clk/rockchip/clk-rk3228.c
>> index 016bdb0..8412753 100644
>> --- a/drivers/clk/rockchip/clk-rk3228.c
>> +++ b/drivers/clk/rockchip/clk-rk3228.c
>> @@ -657,8 +657,7 @@ static void __init rk3228_clk_init(struct
>> device_node *np)
>>               &rk3228_cpuclk_data, rk3228_cpuclk_rates,
>>               ARRAY_SIZE(rk3228_cpuclk_rates));
>>
>> -    rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0),
>> -                  ROCKCHIP_SOFTRST_HIWORD_MASK);
>> +    rockchip_register_softrst(np, 9, reg_base + RK2928_SOFTRST_CON(0));
>>
>>       rockchip_register_restart_notifier(ctx, RK3228_GLB_SRST_FST, NULL);
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3288.c
>> b/drivers/clk/rockchip/clk-rk3288.c
>> index 39af05a..a779a82 100644
>> --- a/drivers/clk/rockchip/clk-rk3288.c
>> +++ b/drivers/clk/rockchip/clk-rk3288.c
>> @@ -919,8 +919,7 @@ static void __init rk3288_clk_init(struct
>> device_node *np)
>>               ARRAY_SIZE(rk3288_cpuclk_rates));
>>
>>       rockchip_register_softrst(np, 12,
>> -                  rk3288_cru_base + RK3288_SOFTRST_CON(0),
>> -                  ROCKCHIP_SOFTRST_HIWORD_MASK);
>> +                  rk3288_cru_base + RK3288_SOFTRST_CON(0));
>>
>>       rockchip_register_restart_notifier(ctx, RK3288_GLB_SRST_FST,
>>                          rk3288_clk_shutdown);
>> diff --git a/drivers/clk/rockchip/clk-rk3368.c
>> b/drivers/clk/rockchip/clk-rk3368.c
>> index 6cb474c..e0f8c73 100644
>> --- a/drivers/clk/rockchip/clk-rk3368.c
>> +++ b/drivers/clk/rockchip/clk-rk3368.c
>> @@ -905,8 +905,7 @@ static void __init rk3368_clk_init(struct
>> device_node *np)
>>               &rk3368_cpuclkl_data, rk3368_cpuclkl_rates,
>>               ARRAY_SIZE(rk3368_cpuclkl_rates));
>>
>> -    rockchip_register_softrst(np, 15, reg_base + RK3368_SOFTRST_CON(0),
>> -                  ROCKCHIP_SOFTRST_HIWORD_MASK);
>> +    rockchip_register_softrst(np, 15, reg_base + RK3368_SOFTRST_CON(0));
>>
>>       rockchip_register_restart_notifier(ctx, RK3368_GLB_SRST_FST, NULL);
>>
>> diff --git a/drivers/clk/rockchip/clk-rk3399.c
>> b/drivers/clk/rockchip/clk-rk3399.c
>> index 37c74cb..4601a5c 100644
>> --- a/drivers/clk/rockchip/clk-rk3399.c
>> +++ b/drivers/clk/rockchip/clk-rk3399.c
>> @@ -1540,8 +1540,7 @@ static void __init rk3399_clk_init(struct
>> device_node *np)
>>               &rk3399_cpuclkb_data, rk3399_cpuclkb_rates,
>>               ARRAY_SIZE(rk3399_cpuclkb_rates));
>>
>> -    rockchip_register_softrst(np, 21, reg_base + RK3399_SOFTRST_CON(0),
>> -                  ROCKCHIP_SOFTRST_HIWORD_MASK);
>> +    rockchip_register_softrst(np, 21, reg_base + RK3399_SOFTRST_CON(0));
>>
>>       rockchip_register_restart_notifier(ctx, RK3399_GLB_SRST_FST, NULL);
>>
>> @@ -1576,8 +1575,7 @@ static void __init rk3399_pmu_clk_init(struct
>> device_node *np)
>>       rockchip_clk_protect_critical(rk3399_pmucru_critical_clocks,
>>                     ARRAY_SIZE(rk3399_pmucru_critical_clocks));
>>
>> -    rockchip_register_softrst(np, 2, reg_base +
>> RK3399_PMU_SOFTRST_CON(0),
>> -                  ROCKCHIP_SOFTRST_HIWORD_MASK);
>> +    rockchip_register_softrst(np, 2, reg_base +
>> RK3399_PMU_SOFTRST_CON(0));
>>
>>       rockchip_clk_of_add_provider(np, ctx);
>>   }
>> diff --git a/drivers/clk/rockchip/clk.h b/drivers/clk/rockchip/clk.h
>> index 2194ffa..51e797c 100644
>> --- a/drivers/clk/rockchip/clk.h
>> +++ b/drivers/clk/rockchip/clk.h
>> @@ -618,16 +618,14 @@ void rockchip_clk_protect_critical(const char
>> *const clocks[], int nclocks);
>>   void rockchip_register_restart_notifier(struct rockchip_clk_provider
>> *ctx,
>>                       unsigned int reg, void (*cb)(void));
>>
>> -#define ROCKCHIP_SOFTRST_HIWORD_MASK    BIT(0)
>> -
>>   #ifdef CONFIG_RESET_CONTROLLER
>>   void rockchip_register_softrst(struct device_node *np,
>>                      unsigned int num_regs,
>> -                   void __iomem *base, u8 flags);
>> +                   void __iomem *base);
>>   #else
>>   static inline void rockchip_register_softrst(struct device_node *np,
>>                      unsigned int num_regs,
>> -                   void __iomem *base, u8 flags)
>> +                   void __iomem *base)
>>   {
>>   }
>>   #endif
>> diff --git a/drivers/clk/rockchip/softrst.c
>> b/drivers/clk/rockchip/softrst.c
>> index 21218987..d6b865f 100644
>> --- a/drivers/clk/rockchip/softrst.c
>> +++ b/drivers/clk/rockchip/softrst.c
>> @@ -24,8 +24,6 @@ struct rockchip_softrst {
>>       void __iomem            *reg_base;
>>       int                num_regs;
>>       int                num_per_reg;
>> -    u8                flags;
>> -    spinlock_t            lock;
>>   };
>>
>>   static int rockchip_softrst_assert(struct reset_controller_dev *rcdev,
>> @@ -37,20 +35,8 @@ static int rockchip_softrst_assert(struct
>> reset_controller_dev *rcdev,
>>       int bank = id / softrst->num_per_reg;
>>       int offset = id % softrst->num_per_reg;
>>
>> -    if (softrst->flags&  ROCKCHIP_SOFTRST_HIWORD_MASK) {
>> -        writel(BIT(offset) | (BIT(offset)<<  16),
>> -               softrst->reg_base + (bank * 4));
>> -    } else {
>> -        unsigned long flags;
>> -        u32 reg;
>> -
>> -        spin_lock_irqsave(&softrst->lock, flags);
>> -
>> -        reg = readl(softrst->reg_base + (bank * 4));
>> -        writel(reg | BIT(offset), softrst->reg_base + (bank * 4));
>> -
>> -        spin_unlock_irqrestore(&softrst->lock, flags);
>> -    }
>> +    writel(BIT(offset) | (BIT(offset)<<  16),
>> +           softrst->reg_base + (bank * 4));
>>
>>       return 0;
>>   }
>> @@ -64,19 +50,7 @@ static int rockchip_softrst_deassert(struct
>> reset_controller_dev *rcdev,
>>       int bank = id / softrst->num_per_reg;
>>       int offset = id % softrst->num_per_reg;
>>
>> -    if (softrst->flags&  ROCKCHIP_SOFTRST_HIWORD_MASK) {
>> -        writel((BIT(offset)<<  16), softrst->reg_base + (bank * 4));
>> -    } else {
>> -        unsigned long flags;
>> -        u32 reg;
>> -
>> -        spin_lock_irqsave(&softrst->lock, flags);
>> -
>> -        reg = readl(softrst->reg_base + (bank * 4));
>> -        writel(reg&  ~BIT(offset), softrst->reg_base + (bank * 4));
>> -
>> -        spin_unlock_irqrestore(&softrst->lock, flags);
>> -    }
>> +    writel((BIT(offset)<<  16), softrst->reg_base + (bank * 4));
>>
>>       return 0;
>>   }
>> @@ -88,7 +62,7 @@ static const struct reset_control_ops
>> rockchip_softrst_ops = {
>>
>>   void __init rockchip_register_softrst(struct device_node *np,
>>                         unsigned int num_regs,
>> -                      void __iomem *base, u8 flags)
>> +                      void __iomem *base)
>>   {
>>       struct rockchip_softrst *softrst;
>>       int ret;
>> @@ -97,13 +71,9 @@ void __init rockchip_register_softrst(struct
>> device_node *np,
>>       if (!softrst)
>>           return;
>>
>> -    spin_lock_init(&softrst->lock);
>> -
>>       softrst->reg_base = base;
>> -    softrst->flags = flags;
>>       softrst->num_regs = num_regs;
>> -    softrst->num_per_reg = (flags&  ROCKCHIP_SOFTRST_HIWORD_MASK) ? 16
>> -                                      : 32;
>> +    softrst->num_per_reg = 16;
>>
>>       softrst->rcdev.owner = THIS_MODULE;
>>       softrst->rcdev.nr_resets =  num_regs * softrst->num_per_reg;
>
>
