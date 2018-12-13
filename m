Return-Path: <SRS0=bPXJ=OW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,T_MIXED_ES,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE298C65BAE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:41:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8FC0720811
	for <linux-clk@archiver.kernel.org>; Thu, 13 Dec 2018 11:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="FEFhHWsl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FC0720811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbeLMLlN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Dec 2018 06:41:13 -0500
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17031 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbeLMLlM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Dec 2018 06:41:12 -0500
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c1245510000>; Thu, 13 Dec 2018 03:41:05 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 13 Dec 2018 03:41:10 -0800
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 13 Dec 2018 03:41:10 -0800
Received: from [10.26.11.125] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 13 Dec
 2018 11:41:07 +0000
Subject: Re: [PATCH V2 07/21] clk: tegra: dfll: support PWM regulator control
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-8-josephl@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <42e5746b-8484-8c2d-f871-5ad17e576f32@nvidia.com>
Date:   Thu, 13 Dec 2018 11:41:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181213093438.29621-8-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1544701266; bh=f3i0WnJ243Paixjfsg7KyQ0FXYUl1QIn0mxjbbUykUw=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=FEFhHWsly7vS1z/NtuclyxfdXdKqEAEOezNBsVrZKjlp5FWWuqYvIhBmBvWbrsNzl
         8O1L/72+B8kKkNGWRM+ec/RgAPNadjGdSqSKy4FJwbX6YaTab7TbZPdRSr3u9AS3am
         88V1tbZMXxF8jEULzkysDT1vilfq8k8RlfP+n8v7u147GdQRGMSEbtj0c49Hg0NW6e
         xSdz1IEIIlijMOos8EBBo8Y5q/MtW3LMuuSVrcAC4vHlof+YdcGKTRfMIIlZDCXlPG
         r0WcVEnY8AGfAi8InZcX3JO7T/KfHSAsxfkBAuJvkWDboMF4qCQm9dWx7rEDa7uAuz
         vlr1Z9lKqCmSA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/12/2018 09:34, Joseph Lo wrote:
> The DFLL hardware supports two modes (I2C and PWM) for voltage control
> when requesting a frequency. In this patch, we introduce PWM mode support.
> 
> To support that, we re-organize the LUT for unifying the table for both
> cases of I2C and PWM mode. And generate that based on regulator info.
> For the PWM-based regulator, we get this info from DT. And do the same as
> the case of I2C LUT, which can help to map the PMIC voltage ID and voltages
> that the regulator supported.
> 
> The other parts are the support code for initializing the DFLL hardware
> to support PWM mode. Also, the register debugfs file is slightly
> reworked to only show the i2c registers when I2C mode is in use.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *V2:
>  - move reg_init_uV to be with the PWM related variables
>  - fix the variable type to 'unsigned long' if it needs to catch the
>  return value from 'dev_pm_opp_get_voltage'
>  - update to use lut_uv table for LUT look up. This makes the generic
>  lut_uv table to work with both PWM and I2C mode.
> ---
>  drivers/clk/tegra/clk-dfll.c | 435 +++++++++++++++++++++++++++++------
>  1 file changed, 369 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 609e363dabf8..72e02898006c 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -1,7 +1,7 @@
>  /*
>   * clk-dfll.c - Tegra DFLL clock source common code
>   *
> - * Copyright (C) 2012-2014 NVIDIA Corporation. All rights reserved.
> + * Copyright (C) 2012-2018 NVIDIA Corporation. All rights reserved.
>   *
>   * Aleksandr Frid <afrid@nvidia.com>
>   * Paul Walmsley <pwalmsley@nvidia.com>
> @@ -47,6 +47,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/pm_opp.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> @@ -243,6 +244,12 @@ enum dfll_tune_range {
>  	DFLL_TUNE_LOW = 1,
>  };
>  
> +
> +enum tegra_dfll_pmu_if {
> +	TEGRA_DFLL_PMU_I2C = 0,
> +	TEGRA_DFLL_PMU_PWM = 1,
> +};
> +
>  /**
>   * struct dfll_rate_req - target DFLL rate request data
>   * @rate: target frequency, after the postscaling
> @@ -300,10 +307,19 @@ struct tegra_dfll {
>  	u32				i2c_reg;
>  	u32				i2c_slave_addr;
>  
> -	/* i2c_lut array entries are regulator framework selectors */
> -	unsigned			i2c_lut[MAX_DFLL_VOLTAGES];
> -	int				i2c_lut_size;
> -	u8				lut_min, lut_max, lut_safe;
> +	/* lut array entries are regulator framework selectors or PWM values*/
> +	unsigned			lut[MAX_DFLL_VOLTAGES];
> +	unsigned long			lut_uv[MAX_DFLL_VOLTAGES];
> +	int				lut_size;
> +	u8				lut_bottom, lut_min, lut_max, lut_safe;
> +
> +	/* PWM interface */
> +	enum tegra_dfll_pmu_if		pmu_if;
> +	unsigned long			pwm_rate;
> +	struct pinctrl			*pwm_pin;
> +	struct pinctrl_state		*pwm_enable_state;
> +	struct pinctrl_state		*pwm_disable_state;
> +	u32				reg_init_uV;
>  };
>  
>  #define clk_hw_to_dfll(_hw) container_of(_hw, struct tegra_dfll, dfll_clk_hw)
> @@ -489,6 +505,34 @@ static void dfll_set_mode(struct tegra_dfll *td,
>  	dfll_wmb(td);
>  }
>  
> +/*
> + * DVCO rate control
> + */
> +
> +static unsigned long get_dvco_rate_below(struct tegra_dfll *td, u8 out_min)
> +{
> +	struct dev_pm_opp *opp;
> +	unsigned long rate, prev_rate;
> +	unsigned long uv, min_uv;
> +
> +	min_uv = td->lut_uv[out_min];
> +	for (rate = 0, prev_rate = 0; ; rate++) {
> +		opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
> +		if (IS_ERR(opp))
> +			break;
> +
> +		uv = dev_pm_opp_get_voltage(opp);
> +		dev_pm_opp_put(opp);
> +
> +		if (uv && uv > min_uv)
> +			return prev_rate;
> +
> +		prev_rate = rate;
> +	}
> +
> +	return prev_rate;
> +}
> +
>  /*
>   * DFLL-to-I2C controller interface
>   */
> @@ -518,6 +562,118 @@ static int dfll_i2c_set_output_enabled(struct tegra_dfll *td, bool enable)
>  	return 0;
>  }
>  
> +
> +/*
> + * DFLL-to-PWM controller interface
> + */
> +
> +/**
> + * dfll_pwm_set_output_enabled - enable/disable PWM voltage requests
> + * @td: DFLL instance
> + * @enable: whether to enable or disable the PWM voltage requests
> + *
> + * Set the master enable control for PWM control value updates. If disabled,
> + * then the PWM signal is not driven. Also configure the PWM output pad
> + * to the appropriate state.
> + */
> +static int dfll_pwm_set_output_enabled(struct tegra_dfll *td, bool enable)
> +{
> +	int ret;
> +	u32 val, div;
> +
> +	if (enable) {
> +		ret = pinctrl_select_state(td->pwm_pin, td->pwm_enable_state);
> +		if (ret < 0) {
> +			dev_err(td->dev, "setting enable state failed\n");
> +			return -EINVAL;
> +		}
> +		val = dfll_readl(td, DFLL_OUTPUT_CFG);
> +		val &= ~DFLL_OUTPUT_CFG_PWM_DIV_MASK;
> +		div = DIV_ROUND_UP(td->ref_rate, td->pwm_rate);
> +		val |= (div << DFLL_OUTPUT_CFG_PWM_DIV_SHIFT)
> +				& DFLL_OUTPUT_CFG_PWM_DIV_MASK;
> +		dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +		dfll_wmb(td);
> +
> +		val |= DFLL_OUTPUT_CFG_PWM_ENABLE;
> +		dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +		dfll_wmb(td);
> +	} else {
> +		ret = pinctrl_select_state(td->pwm_pin, td->pwm_disable_state);
> +		if (ret < 0)
> +			dev_warn(td->dev, "setting disable state failed\n");
> +
> +		val = dfll_readl(td, DFLL_OUTPUT_CFG);
> +		val &= ~DFLL_OUTPUT_CFG_PWM_ENABLE;
> +		dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +		dfll_wmb(td);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * dfll_set_force_output_value - set fixed value for force output
> + * @td: DFLL instance
> + * @out_val: value to force output
> + *
> + * Set the fixed value for force output, DFLL will output this value when
> + * force output is enabled.
> + */
> +static u32 dfll_set_force_output_value(struct tegra_dfll *td, u8 out_val)
> +{
> +	u32 val = dfll_readl(td, DFLL_OUTPUT_FORCE);
> +
> +	val = (val & DFLL_OUTPUT_FORCE_ENABLE) | (out_val & OUT_MASK);
> +	dfll_writel(td, val, DFLL_OUTPUT_FORCE);
> +	dfll_wmb(td);
> +
> +	return dfll_readl(td, DFLL_OUTPUT_FORCE);
> +}
> +
> +/**
> + * dfll_set_force_output_enabled - enable/disable force output
> + * @td: DFLL instance
> + * @enable: whether to enable or disable the force output
> + *
> + * Set the enable control for fouce output with fixed value.
> + */
> +static void dfll_set_force_output_enabled(struct tegra_dfll *td, bool enable)
> +{
> +	u32 val = dfll_readl(td, DFLL_OUTPUT_FORCE);
> +
> +	if (enable)
> +		val |= DFLL_OUTPUT_FORCE_ENABLE;
> +	else
> +		val &= ~DFLL_OUTPUT_FORCE_ENABLE;
> +
> +	dfll_writel(td, val, DFLL_OUTPUT_FORCE);
> +	dfll_wmb(td);
> +}
> +
> +/**
> + * dfll_force_output - force output a fixed value
> + * @td: DFLL instance
> + * @out_sel: value to force output
> + *
> + * Set the fixed value for force output, DFLL will output this value.
> + */
> +static int dfll_force_output(struct tegra_dfll *td, unsigned int out_sel)
> +{
> +	u32 val;
> +
> +	if (out_sel > OUT_MASK)
> +		return -EINVAL;
> +
> +	val = dfll_set_force_output_value(td, out_sel);
> +	if ((td->mode < DFLL_CLOSED_LOOP) &&
> +	    !(val & DFLL_OUTPUT_FORCE_ENABLE)) {
> +		dfll_set_force_output_enabled(td, true);
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * dfll_load_lut - load the voltage lookup table
>   * @td: struct tegra_dfll *
> @@ -539,7 +695,7 @@ static void dfll_load_i2c_lut(struct tegra_dfll *td)
>  			lut_index = i;
>  
>  		val = regulator_list_hardware_vsel(td->vdd_reg,
> -						     td->i2c_lut[lut_index]);
> +						     td->lut[lut_index]);
>  		__raw_writel(val, td->lut_base + i * 4);
>  	}
>  
> @@ -594,24 +750,41 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>  {
>  	u32 val;
>  
> -	td->lut_min = 0;
> -	td->lut_max = td->i2c_lut_size - 1;
> -	td->lut_safe = td->lut_min + 1;
> +	td->lut_min = td->lut_bottom;
> +	td->lut_max = td->lut_size - 1;
> +	td->lut_safe = td->lut_min + (td->lut_min < td->lut_max ? 1 : 0);
> +
> +	/* clear DFLL_OUTPUT_CFG before setting new value */
> +	dfll_writel(td, 0, DFLL_OUTPUT_CFG);
> +	dfll_wmb(td);
>  
> -	dfll_i2c_writel(td, 0, DFLL_OUTPUT_CFG);
>  	val = (td->lut_safe << DFLL_OUTPUT_CFG_SAFE_SHIFT) |
> -		(td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
> -		(td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
> -	dfll_i2c_writel(td, val, DFLL_OUTPUT_CFG);
> -	dfll_i2c_wmb(td);
> +	      (td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
> +	      (td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
> +	dfll_writel(td, val, DFLL_OUTPUT_CFG);
> +	dfll_wmb(td);
>  
>  	dfll_writel(td, 0, DFLL_OUTPUT_FORCE);
>  	dfll_i2c_writel(td, 0, DFLL_INTR_EN);
>  	dfll_i2c_writel(td, DFLL_INTR_MAX_MASK | DFLL_INTR_MIN_MASK,
>  			DFLL_INTR_STS);
>  
> -	dfll_load_i2c_lut(td);
> -	dfll_init_i2c_if(td);
> +	if (td->pmu_if == TEGRA_DFLL_PMU_PWM) {
> +		int vinit = td->reg_init_uV;

This should be u32.

> +		int vstep = td->soc->alignment.step_uv;
> +		int vmin = td->lut_uv[0];

This should be unsigned long.

> +
> +		/* set initial voltage */
> +		if ((vinit >= vmin) && vstep) {
> +			unsigned int vsel;
> +
> +			vsel = DIV_ROUND_UP((vinit - vmin), vstep);
> +			dfll_force_output(td, vsel);
> +		}
> +	} else {
> +		dfll_load_i2c_lut(td);
> +		dfll_init_i2c_if(td);
> +	}
>  }
>  
>  /*
> @@ -640,8 +813,8 @@ static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>  	uv = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);
>  
> -	for (i = 0; i < td->i2c_lut_size; i++) {
> -		if (regulator_list_voltage(td->vdd_reg, td->i2c_lut[i]) == uv)
> +	for (i = td->lut_bottom; i < td->lut_size; i++) {
> +		if (td->lut_uv[i] >= uv)

I think that we need to fix the type for 'uv' in this function while we
are at it.

Cheers
Jon

-- 
nvpublic
