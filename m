Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:44782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1165737AbdDXGxv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Apr 2017 02:53:51 -0400
MIME-Version: 1.0
In-Reply-To: <1493016143-21569-3-git-send-email-m.szyprowski@samsung.com>
References: <CGME20170424064229eucas1p2367a90a36b5bcb99f48a24e72b29a629@eucas1p2.samsung.com>
 <1493016143-21569-1-git-send-email-m.szyprowski@samsung.com> <1493016143-21569-3-git-send-email-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 24 Apr 2017 08:53:20 +0200
Message-ID: <CAJKOXPdDBsqHp-qXFFjcK10PUb_Vo1q6DsdgerYW4j+9ESpxfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: samsung: Add local variable to match it purpose
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Apr 24, 2017 at 8:42 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Add new variable to avoid using clk pointer for different purposes across
> the exynos_register_cpu_clock() function. This will help in future rewrite
> for the new clk_hw API.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-cpu.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-cpu.c b/drivers/clk/samsung/clk-cpu.c
> index 8bf7e805fd34..6e1c6007e721 100644
> --- a/drivers/clk/samsung/clk-cpu.c
> +++ b/drivers/clk/samsung/clk-cpu.c
> @@ -410,6 +410,7 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>  {
>         struct exynos_cpuclk *cpuclk;
>         struct clk_init_data init;
> +       struct clk *parent_clk;
>         struct clk *clk;
>         int ret = 0;
>
> @@ -440,15 +441,15 @@ int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>                 goto free_cpuclk;
>         }
>
> -       clk = __clk_lookup(parent);
> -       if (!clk) {
> +       parent_clk = __clk_lookup(parent);
> +       if (!parent_clk) {
>                 pr_err("%s: could not lookup parent clock %s\n",
>                                 __func__, parent);
>                 ret = -EINVAL;
>                 goto free_cpuclk;
>         }
>
> -       ret = clk_notifier_register(clk, &cpuclk->clk_nb);
> +       ret = clk_notifier_register(parent_clk, &cpuclk->clk_nb);
>         if (ret) {
>                 pr_err("%s: failed to register clock notifier for %s\n",
>                                 __func__, name);

You can also remove one clk_lookup and just use "parent_clk" in error path:

478 unregister_clk_nb:
479         clk_notifier_unregister(__clk_lookup(parent), &cpuclk->clk_nb);

Best regards,
Krzysztof
