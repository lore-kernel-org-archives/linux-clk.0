Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29318 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725758AbeH3FKD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 01:10:03 -0400
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5B8743F9.8010908@samsung.com>
Date: Thu, 30 Aug 2018 10:10:17 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 02/10] clk: samsung: s3c2410: Use generic helper for
 handling suspend/resume
In-reply-to: <20180829155046.29359-3-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155059eucas1p26a0ea66a0fc96c73cdd60648b82bd23e@eucas1p2.samsung.com>
        <20180829155046.29359-3-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Marek,

On 2018년 08월 30일 00:50, Marek Szyprowski wrote:
> Replace common suspend/resume handling code by generic helper.
> No functional change.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s3c2410.c | 43 ++-----------------------------
>  1 file changed, 2 insertions(+), 41 deletions(-)
> 

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>


> diff --git a/drivers/clk/samsung/clk-s3c2410.c b/drivers/clk/samsung/clk-s3c2410.c
> index a9c887475054..8cb868f06257 100644
> --- a/drivers/clk/samsung/clk-s3c2410.c
> +++ b/drivers/clk/samsung/clk-s3c2410.c
> @@ -11,7 +11,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> -#include <linux/syscore_ops.h>
>  
>  #include <dt-bindings/clock/s3c2410.h>
>  
> @@ -40,9 +39,6 @@ enum s3c2410_plls {
>  
>  static void __iomem *reg_base;
>  
> -#ifdef CONFIG_PM_SLEEP
> -static struct samsung_clk_reg_dump *s3c2410_save;
> -
>  /*
>   * list of controller registers to be saved and restored during a
>   * suspend/resume cycle.
> @@ -57,42 +53,6 @@ static unsigned long s3c2410_clk_regs[] __initdata = {
>  	CAMDIVN,
>  };
>  
> -static int s3c2410_clk_suspend(void)
> -{
> -	samsung_clk_save(reg_base, s3c2410_save,
> -				ARRAY_SIZE(s3c2410_clk_regs));
> -
> -	return 0;
> -}
> -
> -static void s3c2410_clk_resume(void)
> -{
> -	samsung_clk_restore(reg_base, s3c2410_save,
> -				ARRAY_SIZE(s3c2410_clk_regs));
> -}
> -
> -static struct syscore_ops s3c2410_clk_syscore_ops = {
> -	.suspend = s3c2410_clk_suspend,
> -	.resume = s3c2410_clk_resume,
> -};
> -
> -static void __init s3c2410_clk_sleep_init(void)
> -{
> -	s3c2410_save = samsung_clk_alloc_reg_dump(s3c2410_clk_regs,
> -						ARRAY_SIZE(s3c2410_clk_regs));
> -	if (!s3c2410_save) {
> -		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
> -			__func__);
> -		return;
> -	}
> -
> -	register_syscore_ops(&s3c2410_clk_syscore_ops);
> -	return;
> -}
> -#else
> -static void __init s3c2410_clk_sleep_init(void) {}
> -#endif
> -
>  PNAME(fclk_p) = { "mpll", "div_slow" };
>  
>  static struct samsung_mux_clock s3c2410_common_muxes[] __initdata = {
> @@ -461,7 +421,8 @@ void __init s3c2410_common_clk_init(struct device_node *np, unsigned long xti_f,
>  			ARRAY_SIZE(s3c244x_common_aliases));
>  	}
>  
> -	s3c2410_clk_sleep_init();
> +	samsung_clk_sleep_init(reg_base, s3c2410_clk_regs,
> +			       ARRAY_SIZE(s3c2410_clk_regs));
>  
>  	samsung_clk_of_add_provider(np, ctx);
>  }
> 

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
