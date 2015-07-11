Return-Path: <k.kozlowski.k@gmail.com>
Return-Path: <k.kozlowski.k@gmail.com>
Sender: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k@gmail.com>
Message-ID: <55A0C0A6.8060600@samsung.com>
Date: Sat, 11 Jul 2015 16:07:18 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
 Mike Turquette <mturquette@baylibre.com>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 22/45] clk: samsung: Properly include clk.h and clkdev.h
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org> <1436571223-10959-23-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436571223-10959-23-git-send-email-sboyd@codeaurora.org>
Content-Type: text/plain; charset=iso-8859-2
List-ID: <linux-clk.vger.kernel.org>

W dniu 11.07.2015 o 08:33, Stephen Boyd pisze:
> Clock provider drivers generally shouldn't include clk.h because
> it's the consumer API. Only include clk.h in files that are
> using it. The clkdev.h header isn't always used either, so remove
> it and add in slab.h where files were relying on it to include
> slab for them.
> 
> Cc: Chanwoo Choi <cw00.choi@samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/samsung/clk-cpu.c           | 3 +++
>  drivers/clk/samsung/clk-exynos-audss.c  | 3 ++-
>  drivers/clk/samsung/clk-exynos-clkout.c | 2 +-
>  drivers/clk/samsung/clk-exynos3250.c    | 2 --
>  drivers/clk/samsung/clk-exynos4.c       | 2 +-
>  drivers/clk/samsung/clk-exynos4415.c    | 2 --
>  drivers/clk/samsung/clk-exynos5250.c    | 2 --
>  drivers/clk/samsung/clk-exynos5260.c    | 2 --
>  drivers/clk/samsung/clk-exynos5410.c    | 2 --
>  drivers/clk/samsung/clk-exynos5420.c    | 3 +--
>  drivers/clk/samsung/clk-exynos5433.c    | 2 --
>  drivers/clk/samsung/clk-exynos5440.c    | 2 --
>  drivers/clk/samsung/clk-exynos7.c       | 2 --
>  drivers/clk/samsung/clk-pll.c           | 2 ++
>  drivers/clk/samsung/clk-s3c2410.c       | 2 --
>  drivers/clk/samsung/clk-s3c2412.c       | 2 --
>  drivers/clk/samsung/clk-s3c2443.c       | 2 --
>  drivers/clk/samsung/clk-s3c64xx.c       | 2 --
>  drivers/clk/samsung/clk-s5pv210.c       | 2 --
>  drivers/clk/samsung/clk.c               | 4 ++++
>  drivers/clk/samsung/clk.h               | 3 ++-
>  21 files changed, 16 insertions(+), 32 deletions(-)

One comment at the end.

(...)

> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 0117238391d6..f38a6c49f744 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -11,6 +11,10 @@
>   * clock framework for Samsung platforms.
>  */
>  
> +#include <linux/slab.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/of_address.h>
>  #include <linux/syscore_ops.h>
>  
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index b775fc29caa5..aa872d2c5105 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -13,10 +13,11 @@
>  #ifndef __SAMSUNG_CLK_H
>  #define __SAMSUNG_CLK_H
>  
> -#include <linux/clkdev.h>
>  #include <linux/clk-provider.h>
>  #include "clk-pll.h"
>  
> +struct clk;
> +

Hmmm... why? Including clk-provider (which declares struct clk in your
last patch) is not sufficient?

Best regards,
Krzysztof

>  /**
>   * struct samsung_clk_provider: information about clock provider
>   * @reg_base: virtual address for the register base.
> 
