Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C47DC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:55:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F20592086D
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 12:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="g0m+k7BL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F20592086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728875AbeLMMzh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 07:55:37 -0500
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12293 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728803AbeLMMzh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 07:55:37 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1256c40000>; Thu, 13 Dec 2018 04:55:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 04:55:35 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 04:55:35 -0800
Received: from [10.26.11.125] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 12:55:32 +0000
Subject: Re: [PATCH V2 12/21] cpufreq: tegra124: do not handle the CPU rail
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-13-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <83b2b2cd-7db5-5a5d-1c9e-9fe70afd6b4a@nvidia.com>
Date:   Thu, 13 Dec 2018 12:55:29 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213093438.29621-13-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544705732; bh=hH4bdOk9vapZeGAOsCAVTaT3yoK1zzWkBv7B09Ov/wE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=g0m+k7BLOE7Y+pZqRydBfx/aYD8IXvbvxfL+7eNP9oTHRkfDr4+jkLvvVspaTaQ9x
         sjL19SetwzMVUM4YS2+DTqrYYOUZq/gmQvpAySOsPlEme3ftqFB0wUSF5oi9mLROP4
         3P1Zg3CTeg30yhKpHOPhH4HE3fgBDc/g+fq0Kz+/IP3o+cj3cJsmw/3As0353n9Ynp
         4ve9BPZqKjTFEp7v6yptvqGnyO04tZD36swTdoXmAh0RsloSZlptbzGFCdXRR8bfGt
         gyNYD4TwgTsL+ddGcbVBSkYn5kAtRMnxOeMtr5WC7RkAlKyplAiYc7zL8OZvlairHv
         RmnbIB+vAZ2dA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> The Tegra124 cpufreq driver has no information to handle the Vdd-CPU
> rail. So this driver shouldn't handle for the CPU clock switching from
> DFLL to other PLL clocks. It was designed to work on DFLL clock only,
> which handle the frequency/voltage scaling in the background.
> 
> This patch removes the driver dependency of the CPU rail, as well as not
> allow it to be built as a module and remove the removal function. So it
> can keep working on DFLL clock.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - update the commit message since we change the driver not able to be
>  built as a module and remove the removal function in V2
> ---
>  drivers/cpufreq/Kconfig.arm        |  4 +--
>  drivers/cpufreq/tegra124-cpufreq.c | 41 ++----------------------------
>  2 files changed, 4 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index 4e1131ef85ae..1d83b6e81222 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -261,8 +261,8 @@ config ARM_TEGRA20_CPUFREQ
>  	  This adds the CPUFreq driver support for Tegra20 SOCs.
>  
>  config ARM_TEGRA124_CPUFREQ
> -	tristate "Tegra124 CPUFreq support"
> -	depends on ARCH_TEGRA && CPUFREQ_DT && REGULATOR
> +	bool "Tegra124 CPUFreq support"
> +	depends on ARCH_TEGRA && CPUFREQ_DT
>  	default y
>  	help
>  	  This adds the CPUFreq driver support for Tegra124 SOCs.
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 43530254201a..a1bfde0a7950 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -22,11 +22,9 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
> -#include <linux/regulator/consumer.h>
>  #include <linux/types.h>
>  
>  struct tegra124_cpufreq_priv {
> -	struct regulator *vdd_cpu_reg;
>  	struct clk *cpu_clk;
>  	struct clk *pllp_clk;
>  	struct clk *pllx_clk;
> @@ -60,14 +58,6 @@ static int tegra124_cpu_switch_to_dfll(struct tegra124_cpufreq_priv *priv)
>  	return ret;
>  }
>  
> -static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv)
> -{
> -	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
> -	clk_disable_unprepare(priv->dfll_clk);
> -	regulator_sync_voltage(priv->vdd_cpu_reg);
> -	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
> -}
> -
>  static int tegra124_cpufreq_probe(struct platform_device *pdev)
>  {
>  	struct tegra124_cpufreq_priv *priv;
> @@ -88,16 +78,10 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>  	if (!np)
>  		return -ENODEV;
>  
> -	priv->vdd_cpu_reg = regulator_get(cpu_dev, "vdd-cpu");
> -	if (IS_ERR(priv->vdd_cpu_reg)) {
> -		ret = PTR_ERR(priv->vdd_cpu_reg);
> -		goto out_put_np;
> -	}
> -
>  	priv->cpu_clk = of_clk_get_by_name(np, "cpu_g");
>  	if (IS_ERR(priv->cpu_clk)) {
>  		ret = PTR_ERR(priv->cpu_clk);
> -		goto out_put_vdd_cpu_reg;
> +		goto out_put_np;
>  	}
>  
>  	priv->dfll_clk = of_clk_get_by_name(np, "dfll");
> @@ -129,15 +113,13 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>  		platform_device_register_full(&cpufreq_dt_devinfo);
>  	if (IS_ERR(priv->cpufreq_dt_pdev)) {
>  		ret = PTR_ERR(priv->cpufreq_dt_pdev);
> -		goto out_switch_to_pllx;
> +		goto out_put_pllp_clk;
>  	}
>  
>  	platform_set_drvdata(pdev, priv);
>  
>  	return 0;
>  
> -out_switch_to_pllx:
> -	tegra124_cpu_switch_to_pllx(priv);
>  out_put_pllp_clk:
>  	clk_put(priv->pllp_clk);
>  out_put_pllx_clk:
> @@ -146,34 +128,15 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>  	clk_put(priv->dfll_clk);
>  out_put_cpu_clk:
>  	clk_put(priv->cpu_clk);
> -out_put_vdd_cpu_reg:
> -	regulator_put(priv->vdd_cpu_reg);
>  out_put_np:
>  	of_node_put(np);
>  
>  	return ret;
>  }
>  
> -static int tegra124_cpufreq_remove(struct platform_device *pdev)
> -{
> -	struct tegra124_cpufreq_priv *priv = platform_get_drvdata(pdev);
> -
> -	platform_device_unregister(priv->cpufreq_dt_pdev);
> -	tegra124_cpu_switch_to_pllx(priv);
> -
> -	clk_put(priv->pllp_clk);
> -	clk_put(priv->pllx_clk);
> -	clk_put(priv->dfll_clk);
> -	clk_put(priv->cpu_clk);
> -	regulator_put(priv->vdd_cpu_reg);
> -
> -	return 0;
> -}
> -
>  static struct platform_driver tegra124_cpufreq_platdrv = {
>  	.driver.name	= "cpufreq-tegra124",
>  	.probe		= tegra124_cpufreq_probe,
> -	.remove		= tegra124_cpufreq_remove,
>  };
>  
>  static int __init tegra_cpufreq_init(void)
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
