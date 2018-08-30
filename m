Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726169AbeH3K3u (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Aug 2018 06:29:50 -0400
MIME-Version: 1.0
References: <CGME20180829160024eucas1p1049ff966800cdc44e876d546978df399@eucas1p1.samsung.com>
 <20180829160013.9447-1-m.szyprowski@samsung.com> <20180829160013.9447-2-m.szyprowski@samsung.com>
In-Reply-To: <20180829160013.9447-2-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 30 Aug 2018 08:29:03 +0200
Message-ID: <CAJKOXPeHkbYA6hE+YfgdogiH48zXpFrqauhgmGCDYQs=Dt-iyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
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

On Wed, 29 Aug 2018 at 18:00, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Clocks should be suspended as late as possible and resumed as early as
> possible to let other drivers do their own suspend/resume tasks. NOIRQ
> callbacks better suit this requirement.

I think that's not a good reason to use the noirq versions. These are
to solve the races with interrupt handlers, not to manually order
callbacks.

Best regards,
Krzysztof


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
>         SET_RUNTIME_PM_OPS(exynos5433_cmu_suspend, exynos5433_cmu_resume,
>                            NULL)
> -       SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>                                      pm_runtime_force_resume)
>  };
>
> --
> 2.17.1
>
