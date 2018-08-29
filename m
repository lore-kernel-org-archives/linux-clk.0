Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20400 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbeH3DUa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 23:20:30 -0400
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5B872A66.1050403@samsung.com>
Date: Thu, 30 Aug 2018 08:21:10 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] clk: samsung: Use NOIRQ stage for Exynos5433 clocks
 suspend/resume
In-reply-to: <20180829160013.9447-2-m.szyprowski@samsung.com>
References: <20180829160013.9447-1-m.szyprowski@samsung.com>
        <CGME20180829160024eucas1p1049ff966800cdc44e876d546978df399@eucas1p1.samsung.com>
        <20180829160013.9447-2-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On 2018년 08월 30일 01:00, Marek Szyprowski wrote:
> Clocks should be suspended as late as possible and resumed as early as
> possible to let other drivers do their own suspend/resume tasks. NOIRQ
> callbacks better suit this requirement.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index 162de44df099..426980514e67 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -5630,7 +5630,7 @@ static const struct of_device_id exynos5433_cmu_of_match[] = {
>  static const struct dev_pm_ops exynos5433_cmu_pm_ops = {
>  	SET_RUNTIME_PM_OPS(exynos5433_cmu_suspend, exynos5433_cmu_resume,
>  			   NULL)
> -	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>  				     pm_runtime_force_resume)
>  };
>  
> 

The suspend_noirq callback for devices are called right before
entering the suspend and then resume_noirq callback for device
are called right after wakeup from suspend.

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
