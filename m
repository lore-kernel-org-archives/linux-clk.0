Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33602 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966570AbeCSQuU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Mar 2018 12:50:20 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ilia Lin <ilialin@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@codeaurora.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1518616792-29028-8-git-send-email-ilialin@codeaurora.org>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, robh@kernel.org, will.deacon@arm.com,
        amit.kucheria@linaro.org, tfinkel@codeaurora.org,
        ilialin@codeaurora.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org>
 <1518616792-29028-8-git-send-email-ilialin@codeaurora.org>
Message-ID: <152147821849.242365.7709382599118820578@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 07/10] clk: qcom: clk-cpu-8996: Prepare PLLs on probe
Date: Mon, 19 Mar 2018 09:50:18 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Ilia Lin (2018-02-14 05:59:49)
> The PLLs must be prepared enabled during the probe to be
> accessible by the OPPs. Otherwise an OPP may switch
> to non-enabled clock.

Sounds like an OPP problem.

> 
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> ---
>  drivers/clk/qcom/clk-cpu-8996.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
> index 854f327..b0a3b73 100644
> --- a/drivers/clk/qcom/clk-cpu-8996.c
> +++ b/drivers/clk/qcom/clk-cpu-8996.c
> @@ -15,7 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> -
> +#include <linux/clk-provider.h>

Please leave a newline between linux/* and local includes.

>  #include "clk-alpha-pll.h"
>  
>  #define VCO(a, b, c) { \
> @@ -376,6 +376,18 @@ struct clk_hw_clks {
>         clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
>         clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
>  
> +       /* Enable all PLLs and alt PLLs */
> +       clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
> +       clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
> +       clk_prepare_enable(pwrcl_pll.clkr.hw.clk);
> +       clk_prepare_enable(perfcl_pll.clkr.hw.clk);

And this can't be done by the cpufreq-dt driver?

> +
> +       /* Set initial boot frequencies for power/perf PLLs */
> +       clk_set_rate(pwrcl_alt_pll.clkr.hw.clk, 652800000);
> +       clk_set_rate(perfcl_alt_pll.clkr.hw.clk, 652800000);
> +       clk_set_rate(pwrcl_pll.clkr.hw.clk, 652800000);
> +       clk_set_rate(perfcl_pll.clkr.hw.clk, 652800000);

We have assigned rates in DT for this.

> +
>         ret = clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
>         if (ret)
>                 return ret;
