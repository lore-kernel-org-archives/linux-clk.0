Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933276AbeBUQT7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Feb 2018 11:19:59 -0500
MIME-Version: 1.0
In-Reply-To: <20180221101527.25554-3-m.szyprowski@samsung.com>
References: <CGME20180221101533eucas1p27bcfd237d2c851402b3e99248fec5a6c@eucas1p2.samsung.com>
 <20180221101527.25554-1-m.szyprowski@samsung.com> <20180221101527.25554-3-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 21 Feb 2018 17:19:55 +0100
Message-ID: <CAJKOXPfeJFY7+YES-cOyhGrvyU+q3h2NHu+LwirApLtjKTyfEA@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: samsung: Add Exynos5x sub-CMU clock driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 21, 2018 at 11:15 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Exynos5250/5420/5800 have only one clock constroller, but some of their
> clock depends on respective power domains. Handling integration of clock
> controller and power domain can be done using runtime PM feature of CCF
> framework. This however needs a separate struct device for each power
> domain. This patch adds such separate driver for group such clocks,

"driver to group"?

> which can be instantiated more than once, each time for a different
> power domain.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5x-subcmu.c | 180 ++++++++++++++++++++++++++++++

In some other places we call entire family "exynos5" so maybe let's
follow the convention instead of "5x"? In the name of file and all the
variables/names later?

>  drivers/clk/samsung/clk-exynos5x-subcmu.h |  30 +++++
>  2 files changed, 210 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos5x-subcmu.c
>  create mode 100644 drivers/clk/samsung/clk-exynos5x-subcmu.h
>
> diff --git a/drivers/clk/samsung/clk-exynos5x-subcmu.c b/drivers/clk/samsung/clk-exynos5x-subcmu.c
> new file mode 100644
> index 000000000000..9ff6d5d17f57
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos5x-subcmu.c
> @@ -0,0 +1,180 @@
> +/*
> + * Copyright (c) 2018 Samsung Electronics Co., Ltd.
> + * Author: Marek Szyprowski <m.szyprowski@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

Use SPDX identifier instead of license text.

> + *
> + * Common Clock Framework support for Exynos5x power-domain dependent
> + * sub-CMUs
> + */
> +
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "clk.h"
> +#include "clk-exynos5x-subcmu.h"
> +
> +static struct samsung_clk_provider *ctx;
> +static const struct samsung_5x_subcmu_info *cmu;
> +static int nr_cmus;

core_initcall here will register this and subcmu drivers. The probe of
this driver will populate devices for subcmus. From next patch - the
initcall of clock driver - will initialize the subcmus, also touching
these statics.

Is my understanding correct?

Quite complicated init system... plus static variables. Are you sure
there are no concurrency issues?

> +
> +static void samsung_ext_clk_save(void __iomem *base,
> +                                   struct samsung_clk_ext_reg_dump *rd,
> +                                   unsigned int num_regs)
> +{
> +       for (; num_regs > 0; --num_regs, ++rd) {
> +               rd->save = readl(base + rd->offset);
> +               writel((rd->save & ~rd->mask) | rd->value, base + rd->offset);
> +               rd->save &= rd->mask;
> +       }
> +};
> +
> +static void samsung_ext_clk_restore(void __iomem *base,
> +                                   struct samsung_clk_ext_reg_dump *rd,
> +                                   unsigned int num_regs)
> +{
> +       for (; num_regs > 0; --num_regs, ++rd)
> +               writel((readl(base + rd->offset) & ~rd->mask) | rd->save,
> +                      base + rd->offset);
> +}
> +
> +static int __maybe_unused exynos5x_clk_subcmu_suspend(struct device *dev)
> +{
> +       struct samsung_5x_subcmu_info *info = dev_get_drvdata(dev);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ctx->lock, flags);
> +       samsung_ext_clk_save(ctx->reg_base, info->suspend_regs,
> +                            info->nr_suspend_regs);
> +       spin_unlock_irqrestore(&ctx->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused exynos5x_clk_subcmu_resume(struct device *dev)
> +{
> +       struct samsung_5x_subcmu_info *info = dev_get_drvdata(dev);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&ctx->lock, flags);
> +       samsung_ext_clk_restore(ctx->reg_base, info->suspend_regs,
> +                               info->nr_suspend_regs);
> +       spin_unlock_irqrestore(&ctx->lock, flags);
> +
> +       return 0;
> +}
> +
> +static void samsung_clk_defer_gate(struct samsung_clk_provider *ctx,
> +                         const struct samsung_gate_clock *list, int nr_clk)
> +{
> +       while (nr_clk--)
> +               samsung_clk_add_lookup(ctx, ERR_PTR(-EPROBE_DEFER), list++->id);
> +}
> +
> +void samsung_clk_subcmus_init(struct samsung_clk_provider *_ctx, int _nr_cmus,
> +                             const struct samsung_5x_subcmu_info *_cmu)
> +{
> +       ctx = _ctx;
> +       cmu = _cmu;
> +       nr_cmus = _nr_cmus;
> +
> +       for (; _nr_cmus--; _cmu++) {
> +               samsung_clk_defer_gate(ctx, _cmu->gate_clks, _cmu->nr_gate_clks);
> +               samsung_ext_clk_save(ctx->reg_base, _cmu->suspend_regs,
> +                                    _cmu->nr_suspend_regs);
> +       }
> +}
> +
> +static int __init exynos5x_clk_subcmu_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct samsung_5x_subcmu_info *info = dev_get_drvdata(dev);
> +
> +       pm_runtime_set_suspended(dev);
> +       pm_runtime_enable(dev);
> +       pm_runtime_get(dev);
> +
> +       ctx->dev = dev;
> +       samsung_clk_register_div(ctx, info->div_clks, info->nr_div_clks);
> +       samsung_clk_register_gate(ctx, info->gate_clks, info->nr_gate_clks);
> +       ctx->dev = NULL;
> +
> +       pm_runtime_put_sync(dev);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops exynos5x_disp_pm_ops = {
> +       SET_RUNTIME_PM_OPS(exynos5x_clk_subcmu_suspend,
> +                          exynos5x_clk_subcmu_resume, NULL)
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +                                    pm_runtime_force_resume)
> +};
> +
> +static struct platform_driver exynos5x_clk_subcmu_driver __refdata = {
> +       .driver = {
> +               .name = "exynos5x-clock-subcmu",
> +               .suppress_bind_attrs = true,
> +               .pm = &exynos5x_disp_pm_ops,
> +       },
> +       .probe = exynos5x_clk_subcmu_probe,
> +};
> +
> +static int __init exynos_5x_clk_register_subcmu(struct device *parent,
> +                                           const struct samsung_5x_subcmu_info *info,
> +                                               struct device_node *pd_node)
> +{
> +       struct of_phandle_args genpdspec = { .np = pd_node };
> +       struct platform_device *pdev;
> +
> +       pdev = platform_device_alloc(info->pd_name, -1);
> +       pdev->dev.parent = parent;
> +       pdev->driver_override = "exynos5x-clock-subcmu";
> +       platform_set_drvdata(pdev, (void *)info);
> +       of_genpd_add_device(&genpdspec, &pdev->dev);
> +       platform_device_add(pdev);
> +
> +       return 0;
> +}
> +
> +static int __init exynos5x_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *np;
> +       const char *name;
> +       int i;
> +
> +       for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
> +               if (of_property_read_string(np, "label", &name) < 0)
> +                       continue;
> +               for (i = 0; i < nr_cmus; i++)
> +                       if (strcmp(cmu[i].pd_name, name) == 0)
> +                               exynos_5x_clk_register_subcmu(&pdev->dev,
> +                                                             &cmu[i], np);
> +       }
> +       return 0;
> +}
> +
> +static const struct of_device_id exynos5x_clk_of_match[] = {
> +       { },
> +};
> +
> +static struct platform_driver exynos5x_clk_driver __refdata = {
> +       .driver = {
> +               .name = "exynos5x-clock",
> +               .of_match_table = exynos5x_clk_of_match,
> +               .suppress_bind_attrs = true,
> +       },
> +       .probe = exynos5x_clk_probe,
> +};
> +
> +static int __init exynos5x_clk_drv_init(void)
> +{
> +       platform_driver_register(&exynos5x_clk_driver);
> +       platform_driver_register(&exynos5x_clk_subcmu_driver);
> +       return 0;
> +}
> +core_initcall(exynos5x_clk_drv_init);
> diff --git a/drivers/clk/samsung/clk-exynos5x-subcmu.h b/drivers/clk/samsung/clk-exynos5x-subcmu.h
> new file mode 100644
> index 000000000000..b44c238e54fa
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos5x-subcmu.h
> @@ -0,0 +1,30 @@
> +/*
> + * Copyright (c) 2018 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

SPDX as well plus a include guard.

BR,
Krzysztof
