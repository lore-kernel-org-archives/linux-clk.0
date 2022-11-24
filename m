Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76799C43217
	for <linux-clk@archiver.kernel.org>; Thu, 24 Nov 2022 13:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiKXNyt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Nov 2022 08:54:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbiKXNyt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Nov 2022 08:54:49 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDF0F5A1B
        for <linux-clk@vger.kernel.org>; Thu, 24 Nov 2022 05:54:45 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bp15so2621391lfb.13
        for <linux-clk@vger.kernel.org>; Thu, 24 Nov 2022 05:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+VY7crvbExdAc/2TYALZSt7S7bugh6YNFAMaaLjUNFw=;
        b=MihJQTZSvAkkrEAWnJD457DPFL4qeqpPdiMEO/x2xSkemAbV2YhRCeL29rDTYzQQwa
         0JE2Uq/zGiEYwO6Bw7m1v9TQF93WHxOh3HNooXZ1ymCWofwy1T0VexbhflduvDALWxrw
         VqHATD0NQHJ8JK7F8oAGiQtPiw+UypuDevJgsqDItEPR9fx83iAgw8+MybcH5o4fkPVq
         5/PZnIq4ogCnSashyaoshSkL99yAfBBR37PAB7FKJjY12tky6YicL+4KBXXVc5BMEywX
         l/hEJTTGMiErVjBr5ljGnhPp+AyaJGWuC/tcCOjN9L6q9ObQhm+o0KwgrTTPRRaZv6jr
         /b5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+VY7crvbExdAc/2TYALZSt7S7bugh6YNFAMaaLjUNFw=;
        b=3CYXL2Nkhu0Y9OUxFLpjoAsBfVOkpuq2ZXrs4bcsfoT5VoAwOvIfjlhXCcVQYgIfAu
         aaGUooAdVg/rdMH8+JSn/vpm8FefeI2agjnhHpoe5XmQzwtskXsT1IeAShxJuia+lIW7
         vvjCib0YxOnoF9pT+UUoMKkGaFpzCNBcew9rNkTGjO+vhZLoNxuz/1lIetpmcnD5c5J2
         pPksZqCHmTYmm2pQ8uACFR9qBB9x3JMLQNWMFeYY7rWCH42jkYjT+SF1O1KOvHZ/hRNp
         UKsTFVfznP7zgSj99zLagjJwQ3Hu0uFn9eSJHHUcwWW7Xn1qhFjVagVZedhaLiK0hF3P
         Hhxw==
X-Gm-Message-State: ANoB5pnKBErXUflkatdZGuKxcVeCGYg5WNHeyH9USRl/2ReM1FOMN/2l
        xvjKmfxcb91wqyu1HV6+UnUOhw==
X-Google-Smtp-Source: AA0mqf5vlrt8QgqNYBCNwPtmhdVADuoxYpe0R730tZANHrSzCtVLDy7r8sKENxv/bAQeSdkhPOLEKg==
X-Received: by 2002:a19:6b09:0:b0:48a:b5ef:c49d with SMTP id d9-20020a196b09000000b0048ab5efc49dmr5243756lfa.313.1669298084161;
        Thu, 24 Nov 2022 05:54:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a12-20020ac25e6c000000b004b0a1e77cb2sm128662lfr.137.2022.11.24.05.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 05:54:43 -0800 (PST)
Message-ID: <4c24b52e-81f9-ff0d-38aa-fa5ae3296f5d@linaro.org>
Date:   Thu, 24 Nov 2022 14:54:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/2] clocking-wizard: Add versal clocking wizard
 support
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org
Cc:     git@amd.com, devicetree@vger.kernel.org, michal.simek@xilinx.com,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com
References: <20221122121255.6823-1-shubhrajyoti.datta@amd.com>
 <20221122121255.6823-3-shubhrajyoti.datta@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221122121255.6823-3-shubhrajyoti.datta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/11/2022 13:12, Shubhrajyoti Datta wrote:
> The Clocking Wizard for Versal adaptive compute acceleration platforms.
> Add Versal clocking wizard support. The driver supports configurable
> number of outputs.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
> 
> Changes in v3:
> rename the clocks to clk_in1 and s_axi_clk in driver
> 
> Changes in v2:
> rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in driver
> update the warn
> Update the compatible to reflect versal
> 
>  drivers/clk/xilinx/Kconfig                   |  13 +
>  drivers/clk/xilinx/Makefile                  |   1 +
>  drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c | 739 +++++++++++++++++++
>  3 files changed, 753 insertions(+)
>  create mode 100644 drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c
> 
> diff --git a/drivers/clk/xilinx/Kconfig b/drivers/clk/xilinx/Kconfig
> index f205522c40ff..dd8e4a733d0b 100644
> --- a/drivers/clk/xilinx/Kconfig
> +++ b/drivers/clk/xilinx/Kconfig
> @@ -29,3 +29,16 @@ config COMMON_CLK_XLNX_CLKWZRD
>  
>  	  If unsure, say N.
>  
> +config COMMON_CLK_XLNX_CLKWZRD_V
> +	tristate "Xilinx Versal Clocking Wizard"
> +	depends on COMMON_CLK && OF
> +	depends on HAS_IOMEM
> +	help
> +	  Support for the Versal Xilinx Clocking Wizard IP core clock generator.
> +	  This driver supports the Versal Xilinx clocking wizard programmable clock
> +	  synthesizer. The number of output is configurable in the design.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called clk-xlnx-clock-wizard-v.
> diff --git a/drivers/clk/xilinx/Makefile b/drivers/clk/xilinx/Makefile
> index 7ac1789c6b1b..9e7e1c1c026c 100644
> --- a/drivers/clk/xilinx/Makefile
> +++ b/drivers/clk/xilinx/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_XILINX_VCU)	+= xlnx_vcu.o
> +obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD_V)	+= clk-xlnx-clock-wizard-v.o
>  obj-$(CONFIG_COMMON_CLK_XLNX_CLKWZRD)	+= clk-xlnx-clock-wizard.o
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c
> new file mode 100644
> index 000000000000..9afbbd5a2d15
> --- /dev/null
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c
> @@ -0,0 +1,739 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Xilinx Versal Clocking Wizard driver
> + *
> + * Copyright (C) 2022, Advanced Micro Devices, Inc.
> + *
> + * Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define WZRD_NUM_OUTPUTS	7
> +#define WZRD_ACLK_MAX_FREQ	250000000UL
> +
> +#define WZRD_CLK_CFG_REG(n)	(0x330 + 4 * (n))
> +
> +#define WZRD_CLKFBOUT_1		0
> +#define WZRD_CLKFBOUT_2		1
> +#define WZRD_CLKOUT0_1		2
> +#define WZRD_CLKOUT0_2		3
> +#define WZRD_DESKEW_2		20
> +#define WZRD_DIVCLK		21
> +#define WZRD_CLKFBOUT_4		51
> +#define WZRD_CLKFBOUT_3		48
> +#define WZRD_DUTY_CYCLE		2
> +#define WZRD_O_DIV		4
> +
> +#define WZRD_CLKFBOUT_FRAC_EN	BIT(1)
> +#define WZRD_CLKFBOUT_PREDIV2	(BIT(11) | BIT(12) | BIT(9))
> +#define WZRD_MULT_PREDIV2	(BIT(10) | BIT(9) | BIT(12))
> +#define WZRD_CLKFBOUT_EDGE	BIT(8)
> +#define WZRD_P5EN		BIT(13)
> +#define WZRD_P5EN_SHIFT		13
> +#define WZRD_P5FEDGE		BIT(15)
> +#define WZRD_DIVCLK_EDGE	BIT(10)
> +#define WZRD_P5FEDGE_SHIFT	15
> +#define WZRD_CLKOUT0_PREDIV2	BIT(11)
> +#define WZRD_EDGE_SHIFT		8
> +
> +#define WZRD_CLKFBOUT_L_SHIFT	0
> +#define WZRD_CLKFBOUT_H_SHIFT	8
> +#define WZRD_CLKFBOUT_L_MASK	GENMASK(7, 0)
> +#define WZRD_CLKFBOUT_H_MASK	GENMASK(15, 8)
> +#define WZRD_CLKFBOUT_FRAC_SHIFT	16
> +#define WZRD_CLKFBOUT_FRAC_MASK		GENMASK(5, 0)
> +#define WZRD_DIVCLK_DIVIDE_MASK		GENMASK(7, 0)
> +#define WZRD_CLKOUT_DIVIDE_SHIFT	0
> +#define WZRD_CLKOUT_DIVIDE_WIDTH	8
> +#define WZRD_CLKOUT_DIVIDE_MASK		GENMASK(7, 0)
> +#define WZRD_CLKOUT_FRAC_SHIFT		8
> +#define WZRD_CLKOUT_FRAC_MASK		0x3ff
> +
> +#define WZRD_DR_MAX_INT_DIV_VALUE	32767
> +#define WZRD_DR_STATUS_REG_OFFSET	0x04
> +#define WZRD_DR_LOCK_BIT_MASK		BIT(0)
> +#define WZRD_DR_INIT_REG_OFFSET		0x14
> +#define WZRD_DR_DIV_TO_PHASE_OFFSET	4
> +#define WZRD_DR_BEGIN_DYNA_RECONF	0x03
> +#define WZRD_MIN_ERR			500000
> +#define WZRD_USEC_POLL			10
> +#define WZRD_TIMEOUT_POLL		1000
> +#define WZRD_FRAC_GRADIENT		64
> +#define PREDIV2_MULT			2
> +
> +#define DIV_O				1
> +#define DIV_ALL				3
> +
> +#define WZRD_M_MIN			4
> +#define WZRD_M_MAX			432
> +#define WZRD_D_MIN			1
> +#define WZRD_D_MAX			123
> +#define WZRD_VCO_MIN			2160000000UL
> +#define WZRD_VCO_MAX			4320000000UL
> +#define WZRD_O_MIN			2
> +#define WZRD_O_MAX			511
> +
> +/* Extract divider instance from clock hardware instance */
> +#define to_clk_wzrd_divider(_hw) container_of(_hw, struct clk_wzrd_divider, hw)
> +
> +enum clk_wzrd_int_clks {
> +	wzrd_clk_mul,
> +	wzrd_clk_mul_div,
> +	wzrd_clk_int_max
> +};
> +
> +/**
> + * struct clk_wzrd - Clock wizard private data structure
> + *
> + * @clk_data:		Clock data
> + * @nb:			Notifier block
> + * @base:		Memory base
> + * @clk_in1:		Handle to input clock 'clk_in1'
> + * @axi_clk:		Handle to input clock 's_axi_aclk'
> + * @clks_internal:	Internal clocks
> + * @clkout:		Output clocks
> + */
> +struct clk_wzrd {
> +	struct clk_onecell_data clk_data;
> +	struct notifier_block nb;
> +	void __iomem *base;
> +	struct clk *clk_in1;
> +	struct clk *axi_clk;
> +	struct clk *clks_internal[wzrd_clk_int_max];
> +	struct clk *clkout[WZRD_NUM_OUTPUTS];
> +};

This is so similar to existing driver, so no to duplicating drivers.
Integrate.

Best regards,
Krzysztof

