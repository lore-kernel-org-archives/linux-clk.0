Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:37137 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753500AbeCFNjF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Mar 2018 08:39:05 -0500
Subject: Re: [PATCH v2 2/6] clk: samsung: Add Exynos5 sub-CMU clock driver
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-id: <bd1675ce-864f-ea58-299e-c79a79724dd1@samsung.com>
Date: Tue, 06 Mar 2018 14:38:59 +0100
MIME-version: 1.0
In-reply-to: <acdefd0b-8b6e-d783-e0dc-fe5eabee6dc2@samsung.com>
Content-type: text/plain; charset="utf-8"; format="flowed"
References: <20180226125355.9052-1-m.szyprowski@samsung.com>
        <CGME20180226125402eucas1p1ac3e0a5853218cd77f469864f70ae89d@eucas1p1.samsung.com>
        <20180226125355.9052-3-m.szyprowski@samsung.com>
        <acdefd0b-8b6e-d783-e0dc-fe5eabee6dc2@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Sylwester,

On 2018-03-06 14:31, Sylwester Nawrocki wrote:
> On 02/26/2018 01:53 PM, Marek Szyprowski wrote:
>> Exynos5250/5420/5800 have only one clock constroller, but some of their
>> clock depends on respective power domains. Handling integration of clock
>> controller and power domain can be done using runtime PM feature of CCF
>> framework. This however needs a separate struct device for each power
>> domain. This patch adds such separate driver for a group of such clocks,
>> which can be instantiated more than once, each time for a different
>> power domain.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos5-subcmu.c | 185 +++++++++++++++++++++++++++++++
>>   drivers/clk/samsung/clk-exynos5-subcmu.h |  26 +++++
>>   2 files changed, 211 insertions(+)
>>   create mode 100644 drivers/clk/samsung/clk-exynos5-subcmu.c
>>   create mode 100644 drivers/clk/samsung/clk-exynos5-subcmu.h
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.c b/drivers/clk/samsung/clk-exynos5-subcmu.c
>> new file mode 100644
>> index 000000000000..41bf5c3cf178
>> --- /dev/null
>> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.c
>> @@ -0,0 +1,185 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// Copyright (c) 2018 Samsung Electronics Co., Ltd.
>> +// Author: Marek Szyprowski <m.szyprowski@samsung.com>
>> +// Common Clock Framework support for Exynos5 power-domain dependent clocks
>> +
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include "clk.h"
>> +#include "clk-exynos5-subcmu.h"
>> +
>> +static struct samsung_clk_provider *ctx;
>> +static const struct exynos5_subcmu_info *cmu;
>> +static int nr_cmus;
>> +
>> +static void samsung_ext_clk_save(void __iomem *base,
> static void exynos5_subcmu_clk_save(... ? If something is generic, then I would
> expect it to be found in drivers/clk/samsung/clk.c.
>
>> +				 struct samsung_clk_ext_reg_dump *rd,
>> +				 unsigned int num_regs)
>> +{
>> +	for (; num_regs > 0; --num_regs, ++rd) {
>> +		rd->save = readl(base + rd->offset);
>> +		writel((rd->save & ~rd->mask) | rd->value, base + rd->offset);
>> +		rd->save &= rd->mask;
>> +	}
>> +};
>> +
>> +static void samsung_ext_clk_restore(void __iomem *base,
> And similarly static void exynos5_subcmu_clk_restore(... ?
>
>> +				    struct samsung_clk_ext_reg_dump *rd,
>> +				    unsigned int num_regs)
>> +{
>> +	for (; num_regs > 0; --num_regs, ++rd)
>> +		writel((readl(base + rd->offset) & ~rd->mask) | rd->save,
>> +		       base + rd->offset);
>> +}
>> +
>> +static void samsung_clk_defer_gate(struct samsung_clk_provider *ctx,
>> +			      const struct samsung_gate_clock *list, int nr_clk)
>> +{
>> +	while (nr_clk--)
>> +		samsung_clk_add_lookup(ctx, ERR_PTR(-EPROBE_DEFER), list++->id);
>> +}
>> +
>> +/*
>> + * Pass the needed clock provider context and register sub-CMU clocks
>> + *
>> + * NOTE: This function has to be called from the main, OF_CLK_DECLARE-
>> + * initialized clock provider driver. This happens very early during boot
>> + * process. Then this driver, during core_initcall registers two platform
>> + * drivers: one which binds to the same device-tree node as OF_CLK_DECLARE
>> + * driver and second, for handling its per-domain child-devices. Those
>> + * platform drivers are bound to their devices a bit later in arch_initcall,
>> + * when OF-core populates all device-tree nodes.
>> + */
>> +void exynos5_subcmus_init(struct samsung_clk_provider *_ctx, int _nr_cmus,
>> +			  const struct exynos5_subcmu_info *_cmu)
>> +{
>> +	ctx = _ctx;
>> +	cmu = _cmu;
>> +	nr_cmus = _nr_cmus;
>> +
>> +	for (; _nr_cmus--; _cmu++) {
>> +		samsung_clk_defer_gate(ctx, _cmu->gate_clks, _cmu->nr_gate_clks);
> Why this is needed only for gate clocks and not for all clocks handled
> by the subcmu?

Because only gate clocks are exported for DT lookup and only those can 
be requested
by clk_get().

>> +		samsung_ext_clk_save(ctx->reg_base, _cmu->suspend_regs,
>> +				     _cmu->nr_suspend_regs);
>> +	}
>> +}
>> +
>> +static int __maybe_unused exynos5_clk_subcmu_suspend(struct device *dev)
> exynos5_subcmu_suspend ?
>
>> +{
>> +	struct exynos5_subcmu_info *info = dev_get_drvdata(dev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ctx->lock, flags);
>> +	samsung_ext_clk_save(ctx->reg_base, info->suspend_regs,
>> +			     info->nr_suspend_regs);
>> +	spin_unlock_irqrestore(&ctx->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused exynos5_clk_subcmu_resume(struct device *dev)
> exynos5_subcmu_resume ?
>
>> +{
>> +	struct exynos5_subcmu_info *info = dev_get_drvdata(dev);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ctx->lock, flags);
>> +	samsung_ext_clk_restore(ctx->reg_base, info->suspend_regs,
>> +				info->nr_suspend_regs);
>> +	spin_unlock_irqrestore(&ctx->lock, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init exynos5_clk_subcmu_probe(struct platform_device *pdev)
> exynos5_subcmu_probe() ?
>
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct exynos5_subcmu_info *info = dev_get_drvdata(dev);
>> +
>> +	pm_runtime_set_suspended(dev);
>> +	pm_runtime_enable(dev);
>> +	pm_runtime_get(dev);
>> +
>> +	ctx->dev = dev;
>> +	samsung_clk_register_div(ctx, info->div_clks, info->nr_div_clks);
>> +	samsung_clk_register_gate(ctx, info->gate_clks, info->nr_gate_clks);
>> +	ctx->dev = NULL;
>> +
>> +	pm_runtime_put_sync(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops exynos5_clk_subcmu_pm_ops = {
> exynos5_subcmu_pm_ops ?
>
>> +	SET_RUNTIME_PM_OPS(exynos5_clk_subcmu_suspend,
>> +			   exynos5_clk_subcmu_resume, NULL)
>> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +				     pm_runtime_force_resume)
>> +};
>> +
>> +static struct platform_driver exynos5_clk_subcmu_driver __refdata = {
> exynos5_subcmu_driver ?
>
>> +	.driver	= {
>> +		.name = "exynos5-clock-subcmu",
> "exynos5-subcmu" ?
>
>> +		.suppress_bind_attrs = true,
>> +		.pm = &exynos5_clk_subcmu_pm_ops,
>> +	},
>> +	.probe = exynos5_clk_subcmu_probe,
>> +};
>> +
>> +static int __init exynos5_clk_register_subcmu_drv(struct device *parent,
> This function registers device, not a driver so perhaps rename it to
> exynos5_clk_register_subcmu() or exynos5_clk_register_subcmu_dev()?
>
>> +					 const struct exynos5_subcmu_info *info,
>> +						  struct device_node *pd_node)
>> +{
>> +	struct of_phandle_args genpdspec = { .np = pd_node };
>> +	struct platform_device *pdev;
>> +
>> +	pdev = platform_device_alloc(info->pd_name, -1);
>> +	pdev->dev.parent = parent;
>> +	pdev->driver_override = "exynos5-clock-subcmu";
>> +	platform_set_drvdata(pdev, (void *)info);
>> +	of_genpd_add_device(&genpdspec, &pdev->dev);
>> +	platform_device_add(pdev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __init exynos5_clk_probe(struct platform_device *pdev)
>> +{
>> +	struct device_node *np;
>> +	const char *name;
>> +	int i;
>> +
>> +	for_each_compatible_node(np, NULL, "samsung,exynos4210-pd") {
>> +		if (of_property_read_string(np, "label", &name) < 0)
>> +			continue;
>> +		for (i = 0; i < nr_cmus; i++)
>> +			if (strcmp(cmu[i].pd_name, name) == 0)
>> +				exynos5_clk_register_subcmu_drv(&pdev->dev,
>> +								&cmu[i], np);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id exynos5_clk_of_match[] = {
>> +	{ },
>> +};
>> +
>> +static struct platform_driver exynos5_clk_driver __refdata = {
>> +	.driver	= {
>> +		.name = "exynos5-clock",
>> +		.of_match_table = exynos5_clk_of_match,
>> +		.suppress_bind_attrs = true,
>> +	},
>> +	.probe = exynos5_clk_probe,
>> +};
>> +
>> +static int __init exynos5_clk_drv_init(void)
>> +{
>> +	platform_driver_register(&exynos5_clk_driver);
>> +	platform_driver_register(&exynos5_clk_subcmu_driver);
>> +	return 0;
>> +}
>> +core_initcall(exynos5_clk_drv_init);
>> diff --git a/drivers/clk/samsung/clk-exynos5-subcmu.h b/drivers/clk/samsung/clk-exynos5-subcmu.h
>> new file mode 100644
>> index 000000000000..364ca4051d9e
>> --- /dev/null
>> +++ b/drivers/clk/samsung/clk-exynos5-subcmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef __CLK_EXYNOS5_SUBCMU_H
>> +#define __CLK_EXYNOS5_SUBCMU_H
>> +
>> +struct samsung_clk_ext_reg_dump {
>   struct	exynos5_subcmu_reg_dump ?
>
>> +	u32 offset;
>> +	u32 value;
>> +	u32 mask;
>> +	u32 save;
>> +};

I will send v3 with the simplified function/structure names then.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

