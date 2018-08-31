Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:46118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727559AbeHaTHT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 31 Aug 2018 15:07:19 -0400
MIME-Version: 1.0
References: <CGME20180829155102eucas1p1ca7a26c10847dcb585f01b54657e29cb@eucas1p1.samsung.com>
 <20180829155046.29359-1-m.szyprowski@samsung.com> <20180829155046.29359-9-m.szyprowski@samsung.com>
In-Reply-To: <20180829155046.29359-9-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 31 Aug 2018 16:59:13 +0200
Message-ID: <CAJKOXPd=34gskzntUUpnKrZBVPN0pMXnC-0g7Q=YECJWPuDwmw@mail.gmail.com>
Subject: Re: [PATCH 08/10] clk: samsung: Add support for setting registers
 state before suspend
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
        <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Some registers of clock controller have to be set to certain values before
> entering system suspend state. Till now drivers did that on their own,
> but it will be easier to handle it by generic code and let drivers simply
> to provide the list of registers and their state.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk.c | 23 +++++++++++++----------
>  drivers/clk/samsung/clk.h | 18 ++++++++++++++++--
>  2 files changed, 29 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 8634884aa11c..ab467a7f973a 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -290,9 +290,12 @@ static int samsung_clk_suspend(void)
>  {
>         struct samsung_clock_reg_cache *reg_cache;
>
> -       list_for_each_entry(reg_cache, &clock_reg_cache_list, node)
> +       list_for_each_entry(reg_cache, &clock_reg_cache_list, node) {
>                 samsung_clk_save(reg_cache->reg_base, reg_cache->rdump,
>                                 reg_cache->rd_num);
> +               samsung_clk_restore(reg_cache->reg_base, reg_cache->rsuspend,
> +                               reg_cache->rsuspend_num);
> +       }
>         return 0;
>  }
>
> @@ -310,9 +313,11 @@ static struct syscore_ops samsung_clk_syscore_ops = {
>         .resume = samsung_clk_resume,
>  };
>
> -void samsung_clk_sleep_init(void __iomem *reg_base,
> +void samsung_clk_sleep_init2(void __iomem *reg_base,

Like Chanwoo, I also do not like the init2. Quite frankly, I do not
see what problem you want to solve it by adding "2" suffix - not
touching Exynos5433 code? In such case more meaningful prefix would be
better. But I think this should be avoided especially that in patch
9/10 you use both of them.

Separate topic - It is getting confusing. The existing Exynos5433 code
has support for suspend_regs (used in its device-level runtime PM) and
here you are extending generic code on syscore level. Maybe this could
be unified somehow?

Best regards,
Krzysztof
