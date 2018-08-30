Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55498 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725752AbeH3EAH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 00:00:07 -0400
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5B8733A4.60103@samsung.com>
Date: Thu, 30 Aug 2018 09:00:36 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 01/10] clk: samsung: Remove excessive include
In-reply-to: <20180829155046.29359-2-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155059eucas1p28a20924521edaa4c9bd3d9683d0f2d0d@eucas1p2.samsung.com>
        <20180829155046.29359-2-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2018년 08월 30일 00:50, Marek Szyprowski wrote:
> Exynos Audio SubSystem and Exynos3250 clock drivers don't use any syscore
> function, so don't include linux/syscore_ops.h in their code.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 1 -
>  drivers/clk/samsung/clk-exynos3250.c   | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
> index f659c5cbf1d5..8f8a0f9fc842 100644
> --- a/drivers/clk/samsung/clk-exynos-audss.c
> +++ b/drivers/clk/samsung/clk-exynos-audss.c
> @@ -15,7 +15,6 @@
>  #include <linux/clk-provider.h>
>  #include <linux/of_address.h>
>  #include <linux/of_device.h>
> -#include <linux/syscore_ops.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
> index 27c9d23657b3..0e9a41a4cac8 100644
> --- a/drivers/clk/samsung/clk-exynos3250.c
> +++ b/drivers/clk/samsung/clk-exynos3250.c
> @@ -12,7 +12,6 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> -#include <linux/syscore_ops.h>
>  
>  #include <dt-bindings/clock/exynos3250.h>
>  
> 

I tested kernel build. There are no warning and break.

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
