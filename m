Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727331AbeH3Km7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Aug 2018 06:42:59 -0400
MIME-Version: 1.0
References: <CGME20180829155059eucas1p16fecde00348e0a2e6707aaf2a76320be@eucas1p1.samsung.com>
 <20180829155046.29359-1-m.szyprowski@samsung.com> <20180829155046.29359-4-m.szyprowski@samsung.com>
In-Reply-To: <20180829155046.29359-4-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 30 Aug 2018 08:42:08 +0200
Message-ID: <CAJKOXPfP5zshtEsk81-0bM97jLYrDiW2BNg58Uf9pBz55bHZXQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] clk: samsung: s3c2412: Use generic helper for
 handling suspend/resume
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
> Replace common suspend/resume handling code by generic helper.
> No functional change.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s3c2412.c | 43 ++-----------------------------
>  1 file changed, 2 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
> index 6bc94d3aff78..dd1159050a5a 100644
> --- a/drivers/clk/samsung/clk-s3c2412.c
> +++ b/drivers/clk/samsung/clk-s3c2412.c
> @@ -11,7 +11,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/syscore_ops.h>
>  #include <linux/reboot.h>
>
>  #include <dt-bindings/clock/s3c2412.h>
> @@ -29,9 +28,6 @@
>
>  static void __iomem *reg_base;
>
> -#ifdef CONFIG_PM_SLEEP
> -static struct samsung_clk_reg_dump *s3c2412_save;
> -
>  /*
>   * list of controller registers to be saved and restored during a
>   * suspend/resume cycle.
> @@ -45,42 +41,6 @@ static unsigned long s3c2412_clk_regs[] __initdata = {
>         CLKSRC,

Did you try building without PM_SLEEP? Now this will be included
always so you might have to mark it __maybe_unused.

Best regards,
Krzysztof

>  };
>
> -static int s3c2412_clk_suspend(void)
> -{
> -       samsung_clk_save(reg_base, s3c2412_save,
> -                               ARRAY_SIZE(s3c2412_clk_regs));
> -
> -       return 0;
> -}
> -
> -static void s3c2412_clk_resume(void)
> -{
> -       samsung_clk_restore(reg_base, s3c2412_save,
> -                               ARRAY_SIZE(s3c2412_clk_regs));
> -}
> -
> -static struct syscore_ops s3c2412_clk_syscore_ops = {
> -       .suspend = s3c2412_clk_suspend,
> -       .resume = s3c2412_clk_resume,
> -};
> -
> -static void __init s3c2412_clk_sleep_init(void)
> -{
> -       s3c2412_save = samsung_clk_alloc_reg_dump(s3c2412_clk_regs,
> -                                               ARRAY_SIZE(s3c2412_clk_regs));
> -       if (!s3c2412_save) {
> -               pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
> -                       __func__);
> -               return;
> -       }
> -
> -       register_syscore_ops(&s3c2412_clk_syscore_ops);
> -       return;
> -}
> -#else
> -static void __init s3c2412_clk_sleep_init(void) {}
> -#endif
> -
>  static struct clk_div_table divxti_d[] = {
>         { .val = 0, .div = 1 },
>         { .val = 1, .div = 2 },
> @@ -278,7 +238,8 @@ void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
>         samsung_clk_register_alias(ctx, s3c2412_aliases,
>                                    ARRAY_SIZE(s3c2412_aliases));
>
> -       s3c2412_clk_sleep_init();
> +       samsung_clk_sleep_init(reg_base, s3c2412_clk_regs,
> +                              ARRAY_SIZE(s3c2412_clk_regs));
>
>         samsung_clk_of_add_provider(np, ctx);
>
> --
> 2.17.1
>
