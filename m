Return-Path: <SRS0=Vpf0=Q2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB9EC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 06:58:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 09D3621848
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 06:58:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dD7HD1ki"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbfBSG6I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Feb 2019 01:58:08 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35482 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfBSG6I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Feb 2019 01:58:08 -0500
Received: by mail-pl1-f195.google.com with SMTP id p8so9960048plo.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Feb 2019 22:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oXxacdY9ThFpAuLyv3osq2Hgttdw7/AxemmbxEzeg4U=;
        b=dD7HD1ki4Ovf6RzgRT6fCgYiNUTeVEXQq7pO9KKNVM/GA/GFpMZwZEszMZS5sXraC9
         P4ppSsU7SJH/ktM6oSl/YKcXE6mkvkyIO35Q8kcI105CAVrKWdoZvKYgBU/KyFgPl2KT
         GI0o3twcCNXzzc43GURWIVaJYOSMg70KLMnavB4rJbVN7MHQlu27kNWKPwGJRVunTdSA
         OUeaRFll1W+rgVNcMoAZQK6YAQCIiUL7jq5Z0Gm+vf1qn8OlpILBQqh1MS82TrXPnfSV
         zXSSv0bwpza1fIdMofi/W2eK18y3Et1Iaic3xJ3udrAk3dyG6QQwY0JRubwdA1HdmlA5
         egtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oXxacdY9ThFpAuLyv3osq2Hgttdw7/AxemmbxEzeg4U=;
        b=FeVB6A/NP9xQOm/LMXisaVtAjDZFtETWWQHHuvIqI2onAcbp5j5hpDbqctkbf65dTT
         GLzMKfNM8NGqb4w9Cu/J5Yg1ntVdV5F3Y5/FFFqJ2q9dOSlbKBlraVKSLiE98nYpI320
         P0bdgmgbSK4aISIjddw2I8uiZZZLBbTw8BS/UMhNK8iFB6+ptOicu6e2cqhlIzqtG/ad
         dhWHN3cDs3jDtuya3NiEmNiUrtxVPYY3965VU0kxuznkAaclLY5fMq5W5B4rhtCtYH/j
         B0CZhkwufre7O3PT5ECM3/6ov4V6uDQblhYVGwRLauMnPCKEiAEcdjJIF5SQR9L0VlkO
         C1WQ==
X-Gm-Message-State: AHQUAuYadBMshq43qaiq7OSZdHDpTTG9tXPh/2xyKotilo7PbKznMyeu
        Y8bZ6mU0D2v0CHDJbY9debjecQ==
X-Google-Smtp-Source: AHgI3Ib+Gu4pNNFPv4ZuW7Z9K3Q1dx5pKcQMcB+Rf9OGKWCbrprDLeeA83OT3r4NdVOI8VGvOpfmlg==
X-Received: by 2002:a17:902:b101:: with SMTP id q1mr29392748plr.135.1550559487314;
        Mon, 18 Feb 2019 22:58:07 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p2sm18851983pgs.7.2019.02.18.22.58.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 22:58:06 -0800 (PST)
Date:   Mon, 18 Feb 2019 22:58:03 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/8] clk: qcom: Add WCSS Q6DSP clock controller for
 QCS404
Message-ID: <20190219065803.GF13018@tuxbook-pro>
References: <20190202152626.1006-1-govinds@codeaurora.org>
 <20190202152626.1006-5-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202152626.1006-5-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 02 Feb 07:26 PST 2019, Govind Singh wrote:

> Add support for the WCSS QDSP clock control used on qcs404
> based devices. This would allow wcss remoteproc driver to
> control the required WCSS QDSP clock/reset controls to
> bring the subsystem out of reset and shutdown the WCSS QDSP.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig          |   8 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/common.c         |  20 +++
>  drivers/clk/qcom/common.h         |   3 +-
>  drivers/clk/qcom/lpasscc-sdm845.c |  23 +--
>  drivers/clk/qcom/wcsscc-qcs404.c  | 282 ++++++++++++++++++++++++++++++
>  6 files changed, 315 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 23ceadc2c115..ffa240c4dd20 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -222,6 +222,14 @@ config QCS_GCC_404
>  	  Say Y if you want to use multimedia devices or peripheral
>  	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
>  
> +config QCS_WCSSCC_404
> +	tristate "QCS404 WCSS Clock Controller"

The name of this hardware block seems to be "Q6SSTOP", so I do not think
this driver should be named "wcsscc" - even if that's what its used for.

> +	select QCS_GCC_404
> +	help
> +	  Support for the WCSS clock controller on QCS404 devices.
> +	  Say Y if you want to use the WCSS branch clocks of the WCSS clock
> +	  controller to reset the WCSS subsystem.
> +
>  config SDM_GCC_845
>  	tristate "SDM845 Global Clock Controller"
>  	select QCOM_GDSC
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 8b7871a26792..264edf5a2063 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -38,6 +38,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>  obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
>  obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
> +obj-$(CONFIG_QCS_WCSSCC_404) += wcsscc-qcs404.o
>  obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
>  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
>  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index b8064a336d46..c76ea0de3eee 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -288,4 +288,24 @@ int qcom_cc_probe(struct platform_device *pdev, const struct qcom_cc_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_probe);
>  
> +int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> +			   const struct qcom_cc_desc *desc)
> +{
> +	struct regmap *regmap;
> +	struct resource *res;
> +	void __iomem *base;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
> +	base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(base))
> +		return -ENOMEM;
> +
> +	regmap = devm_regmap_init_mmio(&pdev->dev, base, desc->config);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	return qcom_cc_really_probe(pdev, desc, regmap);
> +}
> +EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> +
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
> index 00196ee15e73..d9de4730b955 100644
> --- a/drivers/clk/qcom/common.h
> +++ b/drivers/clk/qcom/common.h
> @@ -68,5 +68,6 @@ extern int qcom_cc_really_probe(struct platform_device *pdev,
>  				struct regmap *regmap);
>  extern int qcom_cc_probe(struct platform_device *pdev,
>  			 const struct qcom_cc_desc *desc);
> -
> +extern int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> +				  const struct qcom_cc_desc *desc);
>  #endif
> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c

The extraction of this common code is suitable to have in its own patch.

[..]
>  static const struct of_device_id lpass_cc_sdm845_match_table[] = {
> diff --git a/drivers/clk/qcom/wcsscc-qcs404.c b/drivers/clk/qcom/wcsscc-qcs404.c
> new file mode 100644
> index 000000000000..20306b494b2d
> --- /dev/null
> +++ b/drivers/clk/qcom/wcsscc-qcs404.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,wcss-qcs404.h>
> +
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +/* Q6SSTOP clocks. These clocks are voted
> + * by remoteproc client when loaded from
> + * user space, system hang is seen when CCF turns
> + * off unused clocks. As a temp solution use
> + * CLK_IGNORE_UNUSED flags which prevent these
> + * clocks from being gated during bootup.
> + */
> +static struct clk_branch lcc_ahbfabric_cbc_clk = {
> +	.halt_reg = 0x1b004,
> +	.halt_check = BRANCH_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x1b004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "lcc_ahbfabric_cbc_clk",
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_IGNORE_UNUSED,

I presume, from working on the Turing clock controller, that the reason
for marking this ignore-unused is so that clk_disable_unused() won't
try to access these registers with the necessary iface clock disabled.

I think we should try to actually represent this, rather than hack
around it. I will post the TuringCC shortly, to show what I did.

> +		},
> +	},
> +};
> +
[..]
> +
> +/* Q6SSTOP_QDSP6SS clock */
> +static struct clk_branch q6ss_xo_clk = {

The following three things are clocks, but they are part of the hardware
block that is the "remoteproc", so I don't think we should expose these
through the clock framework, but rather just write them from the
remoteproc driver directly.

> +	.halt_reg = 0x38,
> +	/* CLK_OFF would not toggle until WCSS is out of reset */
> +	.halt_check = BRANCH_HALT_SKIP,
> +	.clkr = {
> +		.enable_reg = 0x38,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "q6ss_xo_clk",
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_IGNORE_UNUSED,
> +		},
> +	},
> +};
> +
> +static struct clk_branch q6ss_slp_clk = {
> +	.halt_reg = 0x3c,
> +	/* CLK_OFF would not toggle until WCSS is out of reset */
> +	.halt_check = BRANCH_HALT_SKIP,
> +	.clkr = {
> +		.enable_reg = 0x3c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "q6ss_slp_clk",
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_IGNORE_UNUSED,
> +		},
> +	},
> +};
> +
> +static struct clk_branch q6sstop_q6ss_gfmux_clk_src = {
> +	.halt_reg = 0x20,
> +	.halt_check = BRANCH_VOTED,
> +	.clkr = {
> +		.enable_reg = 0x20,
> +		.enable_mask = BIT(1) | BIT(3) | BIT(8),
> +		.hw.init = &(struct clk_init_data){
> +			.name = "q6sstop_q6ss_gfmux_clk_src",
> +			.ops = &clk_branch2_ops,
> +			.flags = CLK_IGNORE_UNUSED,
> +		},
> +	},
> +};
> +
[..]
> +static int __init wcss_cc_qcs404_init(void)
> +{
> +	return platform_driver_register(&wcss_cc_qcs404_driver);
> +}
> +subsys_initcall(wcss_cc_qcs404_init);
> +
> +static void __exit wcss_cc_qcs404_exit(void)
> +{
> +	platform_driver_unregister(&wcss_cc_qcs404_driver);
> +}
> +module_exit(wcss_cc_qcs404_exit);

The remoteproc driver won't probe early, so module_platform_driver()
should do the trick.

Regards,
Bjorn
