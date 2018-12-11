Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4026BC07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 08:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEA232081B
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 08:48:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="RivmLC4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA232081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbeLKIs4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 03:48:56 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14097 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726094AbeLKIs4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 03:48:56 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c0f79f30000>; Tue, 11 Dec 2018 00:48:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 11 Dec 2018 00:48:54 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 11 Dec 2018 00:48:54 -0800
Received: from [10.19.108.132] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 11 Dec
 2018 08:48:52 +0000
Subject: Re: [PATCH 11/19] cpufreq: tegra124: do not handle the CPU rail
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        <linux-pm@vger.kernel.org>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-12-josephl@nvidia.com>
 <71da59ef-fbac-fdce-7348-6a6e23f077e3@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <e531d398-247e-201a-b78d-18858c3846b8@nvidia.com>
Date:   Tue, 11 Dec 2018 16:48:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <71da59ef-fbac-fdce-7348-6a6e23f077e3@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544518131; bh=MwfFj+D+H1BcD4yXbfa9Lw9vmZgFaKLK0bWOxOS0D5A=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=RivmLC4bJ3N0ydRLbpJR5xVwWWxBAjwH0VEGKTJjcopUFA/4i48Y6+Yg3J0r1RIgt
         CyCgem0ZNQjZUWCZrq7xquPAP43cBWdSebiLfQQLQ/+n9OYLwHN0OlQg9tZo4Si/Qp
         5EcklkuK3iBfs6141LOqE/6lWE1UL2p76pjbvv1s19hhuf8m0YV0UMoALVyIPXIIRX
         K5dRuCtsl7AwuyGvNSSZvonuUYJYqCR3c6YtPHUnswnXHoRtcJ87FgFXebPx/6s01/
         UzMoA+IQEZZU18QAqPcELU0Px9Q09sGIAwCcyfdeG2OrqXREBwFOdBQ/3JdN1Ardz1
         bteQNmhTvFZxw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/7/18 10:49 PM, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
>> The Tegra124 cpufreq driver has no information to handle the Vdd-CPU
>> rail. So the driver shouldn't handle for the CPU clock switching from
>> DFLL to other PLL clocks. It was designed to work on DFLL clock only,
>> which handle the frequency/voltage scaling in the background. This
>> patch removes the driver dependency of the CPU rail.
>>
>> Cc: Viresh Kumar <viresh.kumar@linaro.org>
>> Cc: linux-pm@vger.kernel.org
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>>   drivers/cpufreq/Kconfig.arm        |  2 +-
>>   drivers/cpufreq/tegra124-cpufreq.c | 26 ++------------------------
>>   2 files changed, 3 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>> index 4e1131ef85ae..a609f8820c47 100644
>> --- a/drivers/cpufreq/Kconfig.arm
>> +++ b/drivers/cpufreq/Kconfig.arm
>> @@ -262,7 +262,7 @@ config ARM_TEGRA20_CPUFREQ
>>   
>>   config ARM_TEGRA124_CPUFREQ
>>   	tristate "Tegra124 CPUFreq support"
>> -	depends on ARCH_TEGRA && CPUFREQ_DT && REGULATOR
>> +	depends on ARCH_TEGRA && CPUFREQ_DT
>>   	default y
>>   	help
>>   	  This adds the CPUFreq driver support for Tegra124 SOCs.
>> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
>> index 43530254201a..448d00763d00 100644
>> --- a/drivers/cpufreq/tegra124-cpufreq.c
>> +++ b/drivers/cpufreq/tegra124-cpufreq.c
>> @@ -22,11 +22,9 @@
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_opp.h>
>> -#include <linux/regulator/consumer.h>
>>   #include <linux/types.h>
>>   
>>   struct tegra124_cpufreq_priv {
>> -	struct regulator *vdd_cpu_reg;
>>   	struct clk *cpu_clk;
>>   	struct clk *pllp_clk;
>>   	struct clk *pllx_clk;
>> @@ -60,14 +58,6 @@ static int tegra124_cpu_switch_to_dfll(struct tegra124_cpufreq_priv *priv)
>>   	return ret;
>>   }
>>   
>> -static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv)
>> -{
>> -	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
>> -	clk_disable_unprepare(priv->dfll_clk);
>> -	regulator_sync_voltage(priv->vdd_cpu_reg);
>> -	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
>> -}
>> -
>>   static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>   {
>>   	struct tegra124_cpufreq_priv *priv;
>> @@ -88,16 +78,10 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>   	if (!np)
>>   		return -ENODEV;
>>   
>> -	priv->vdd_cpu_reg = regulator_get(cpu_dev, "vdd-cpu");
>> -	if (IS_ERR(priv->vdd_cpu_reg)) {
>> -		ret = PTR_ERR(priv->vdd_cpu_reg);
>> -		goto out_put_np;
>> -	}
>> -
>>   	priv->cpu_clk = of_clk_get_by_name(np, "cpu_g");
>>   	if (IS_ERR(priv->cpu_clk)) {
>>   		ret = PTR_ERR(priv->cpu_clk);
>> -		goto out_put_vdd_cpu_reg;
>> +		goto out_put_np;
>>   	}
>>   
>>   	priv->dfll_clk = of_clk_get_by_name(np, "dfll");
>> @@ -129,15 +113,13 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>   		platform_device_register_full(&cpufreq_dt_devinfo);
>>   	if (IS_ERR(priv->cpufreq_dt_pdev)) {
>>   		ret = PTR_ERR(priv->cpufreq_dt_pdev);
>> -		goto out_switch_to_pllx;
>> +		goto out_put_pllp_clk;
>>   	}
>>   
>>   	platform_set_drvdata(pdev, priv);
>>   
>>   	return 0;
>>   
>> -out_switch_to_pllx:
>> -	tegra124_cpu_switch_to_pllx(priv);
>>   out_put_pllp_clk:
>>   	clk_put(priv->pllp_clk);
>>   out_put_pllx_clk:
>> @@ -146,8 +128,6 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>   	clk_put(priv->dfll_clk);
>>   out_put_cpu_clk:
>>   	clk_put(priv->cpu_clk);
>> -out_put_vdd_cpu_reg:
>> -	regulator_put(priv->vdd_cpu_reg);
>>   out_put_np:
>>   	of_node_put(np);
>>   
>> @@ -159,13 +139,11 @@ static int tegra124_cpufreq_remove(struct platform_device *pdev)
>>   	struct tegra124_cpufreq_priv *priv = platform_get_drvdata(pdev);
>>   
>>   	platform_device_unregister(priv->cpufreq_dt_pdev);
>> -	tegra124_cpu_switch_to_pllx(priv);
>>   
>>   	clk_put(priv->pllp_clk);
>>   	clk_put(priv->pllx_clk);
>>   	clk_put(priv->dfll_clk);
>>   	clk_put(priv->cpu_clk);
>> -	regulator_put(priv->vdd_cpu_reg);
> 
> I see what you are saying and while this does appear to be broken, it
> also does not seem right that if we load and unload this driver the CPU
> clock parent will remain as the DFLL clock. Can't we query the voltage
> of the vdd-cpu regulator before we switch and then restore it before we
> switch back? >
> I am just trying to understand if there is no way to switch back? If not
> then maybe we should not allow this driver to be built as a module and
> remove the removal function altogether.

No, we shouldn't switch back to PLL clock once we switched to DFLL 
clock. The reason is that the PLL clock applies to different 
voltage/freq table. That may not match the table, we are using for DFLL 
clock. The cclkg is designed to work on DFLL only.The safest way here is 
remaining the cclkg on DFLL closed-loop mode or switching to open-loop 
mode. Make it always work on DFLL closed-loop mode is better.

By default the configuration is built-in now. Sounds good to me to fix 
the configuration option and remove the removal function.

Thanks,
Joseph
