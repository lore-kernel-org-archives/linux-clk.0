Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D60CC65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0D1C420870
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:18:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="bVQGHAe+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D1C420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbeLMLSZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 06:18:25 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:9489 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbeLMLSZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 06:18:25 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c123ffc0001>; Thu, 13 Dec 2018 03:18:20 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 03:18:24 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 13 Dec 2018 03:18:24 -0800
Received: from [10.26.11.125] (172.20.13.39) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 11:18:22 +0000
Subject: Re: [PATCH V2 06/21] clk: tegra: dfll: CVB calculation alignment with
 the regulator
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-7-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <ce41aec0-64a7-03ca-e6ce-80c0c58e5a7d@nvidia.com>
Date:   Thu, 13 Dec 2018 11:18:20 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213093438.29621-7-josephl@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544699900; bh=Vbz3tmjdFwpJvmZ+jlw3DUWSkr7W5Hizzlsxesx0A30=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=bVQGHAe+Q/IEcJx8YOIsZtQcCN3AADjH64RnsO1rIM3Cox33TrKhpJjuS9IXF7SnK
         2+Z/No6ITCJOUotoYtDXHqrlZbDyxLJ0R/Fw2o9MeTJaIXTVzcWdnB2SdTqov+fOcf
         eWrRn6T7dLf18prbfA+1KJj8kFwdTsXoddBQTbUJWaER/aK8Fbzg7NPbp2eIVfTRuX
         CnGzTpZsPyClJ8TlBmfF7eYuFRoLPq0U3+cOPxS/hSnsqOQQZGwl4ldzPv4s5OFxXR
         UGzDP8t7qX/5CqCRlWyyNWYG7tqrUvS6/J55onwAwcNcI32d0JsetHUx4HHx0RRmA9
         j14Q+U9l1z9Zw==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> The CVB table contains calibration data for the CPU DFLL based on
> process characterization. The regulator step and offset parameters depend
> on the regulator supplying vdd-cpu, not on the specific Tegra SKU.
> 
> When using a PWM controlled regulator, the voltage step and offset are
> determined by the regulator type in use. This is specified in DT. When
> using an I2C controlled regulator, we can retrieve them from CPU regulator
> Then pass this information to the CVB table calculation function.
> 
> Based on the work done of "Peter De Schrijver <pdeschrijver@nvidia.com>"
> and "Alex Frid <afrid@nvidia.com>".
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - use the updated DT binding string for parsing
>  - update the mechanism for geting regulator data from DT (PWM mode) or
>  regulator (I2C mode)
> ---
>  drivers/clk/tegra/clk-dfll.h               |  6 ++-
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 57 ++++++++++++++++++++--
>  drivers/clk/tegra/cvb.c                    | 12 +++--
>  drivers/clk/tegra/cvb.h                    |  6 +--
>  4 files changed, 67 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.h b/drivers/clk/tegra/clk-dfll.h
> index 83352c8078f2..ecc43cb9b6f1 100644
> --- a/drivers/clk/tegra/clk-dfll.h
> +++ b/drivers/clk/tegra/clk-dfll.h
> @@ -1,6 +1,6 @@
>  /*
>   * clk-dfll.h - prototypes and macros for the Tegra DFLL clocksource driver
> - * Copyright (C) 2013 NVIDIA Corporation.  All rights reserved.
> + * Copyright (C) 2013-2018 NVIDIA Corporation.  All rights reserved.
>   *
>   * Aleksandr Frid <afrid@nvidia.com>
>   * Paul Walmsley <pwalmsley@nvidia.com>
> @@ -22,11 +22,14 @@
>  #include <linux/reset.h>
>  #include <linux/types.h>
>  
> +#include "cvb.h"
> +
>  /**
>   * struct tegra_dfll_soc_data - SoC-specific hooks/integration for the DFLL driver
>   * @dev: struct device * that holds the OPP table for the DFLL
>   * @max_freq: maximum frequency supported on this SoC
>   * @cvb: CPU frequency table for this SoC
> + * @alignment: parameters of the regulator step and offset
>   * @init_clock_trimmers: callback to initialize clock trimmers
>   * @set_clock_trimmers_high: callback to tune clock trimmers for high voltage
>   * @set_clock_trimmers_low: callback to tune clock trimmers for low voltage
> @@ -35,6 +38,7 @@ struct tegra_dfll_soc_data {
>  	struct device *dev;
>  	unsigned long max_freq;
>  	const struct cvb_table *cvb;
> +	struct rail_alignment alignment;
>  
>  	void (*init_clock_trimmers)(void);
>  	void (*set_clock_trimmers_high)(void);
> diff --git a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> index 1a2cc113e5c8..189b5e20ee4e 100644
> --- a/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> +++ b/drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
> @@ -23,6 +23,7 @@
>  #include <linux/init.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  #include <soc/tegra/fuse.h>
>  
>  #include "clk.h"
> @@ -50,9 +51,6 @@ static const struct cvb_table tegra124_cpu_cvb_tables[] = {
>  		.process_id = -1,
>  		.min_millivolts = 900,
>  		.max_millivolts = 1260,
> -		.alignment = {
> -			.step_uv = 10000, /* 10mV */
> -		},
>  		.speedo_scale = 100,
>  		.voltage_scale = 1000,
>  		.entries = {
> @@ -105,11 +103,45 @@ static const struct of_device_id tegra124_dfll_fcpu_of_match[] = {
>  	{ },
>  };
>  
> +static void get_alignment_from_dt(struct device *dev,
> +				  struct rail_alignment *align)
> +{
> +	align->step_uv = 0;
> +	align->offset_uv = 0;
> +
> +	if (of_property_read_u32(dev->of_node,
> +				 "nvidia,pwm-voltage-step-microvolts",
> +				 &align->step_uv))
> +		align->step_uv = 0;

Not sure why it is necessary to initialise this again on failure.

> +
> +	if (of_property_read_u32(dev->of_node,
> +				 "nvidia,pwm-min-microvolts",
> +				 &align->offset_uv))
> +		align->offset_uv = 0;

Same here.

> +}
> +
> +static int get_alignment_from_regulator(struct device *dev,
> +					 struct rail_alignment *align)
> +{
> +	struct regulator *reg = devm_regulator_get(dev, "vdd-cpu");
> +
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	align->offset_uv = regulator_list_voltage(reg, 0);
> +	align->step_uv = regulator_get_linear_step(reg);
> +
> +	devm_regulator_put(reg);
> +
> +	return 0;
> +}
> +
>  static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>  {
>  	int process_id, speedo_id, speedo_value, err;
>  	struct tegra_dfll_soc_data *soc;
>  	const struct dfll_fcpu_data *fcpu_data;
> +	struct rail_alignment align;
>  
>  	fcpu_data = of_device_get_match_data(&pdev->dev);
>  	if (!fcpu_data)
> @@ -135,12 +167,27 @@ static int tegra124_dfll_fcpu_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	if (of_property_read_bool(pdev->dev.of_node, "nvidia,pwm-to-pmic")) {
> +		get_alignment_from_dt(&pdev->dev, &align);
> +	} else {
> +		err = get_alignment_from_regulator(&pdev->dev, &align);
> +		if (err == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;

Why not return any error here? The print below maybe misleading.

> +	}
> +
> +	if (!align.step_uv) {
> +		dev_err(&pdev->dev, "missing step uv\n");
> +		return -EINVAL;
> +	}
> +

Cheers
Jon

-- 
nvpublic
