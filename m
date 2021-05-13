Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D50C433ED
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:13:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25EC961434
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:13:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhEMHOx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 03:14:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:39292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhEMHOv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 May 2021 03:14:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98FB0611AE;
        Thu, 13 May 2021 07:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620890022;
        bh=7dyt5M7OKNVCy6nLD03KxlqFvvlzfiTMGoyZcrpAAQI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uwnTCsS1ZiBhURnxrWicOxBfR62156cxebih6TMNcdRzr2zGN6SWz1MCKGUbS4k/M
         yirZt/hk3crqcSCeVqFECUG+S0fEk0bXXN+WQdW6JlSFDRu13OiPC3MwxdbhcI6DkO
         zgS3Vj708P4qAZvRyWrQejWknHYJZL/QMOPnwBWKxviv7LYDVfam1th+OjtsqNkjeQ
         A9yN03C4gIF+QfRoqeWRCNj70qdDWBH3fG7ONVLs4fs0rj4WyT5Gq+hwicSySZaL4t
         lsvL71UAj9LYaf+pZaMrPfBEz84fhW8l7TPcqGB5FRbUBErU5b6HCnLKbEHfhZasIg
         lb/6CWUtTGMhw==
Date:   Thu, 13 May 2021 10:13:38 +0300
From:   Abel Vesa <abelvesa@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org
Subject: Re: [PATCH 5/6] clk: imx8qxp: add clock valid checking mechnism
Message-ID: <YJzRolRFt5+aVyFX@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-5-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423033334.3317992-5-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-23 11:33:33, Dong Aisheng wrote:
> clk-imx8qxp is a common SCU clock driver used by both QM and QXP

Do you think we should maybe rename it to clk-imx8qdx ?
Might be confusing though. If we leave it like it is, people
will be looking for clk-imx8qm and get frustrated. But then maybe
the same thing would happen with the 8qdx. I have no clue what to
do with the naming here.

Everything else looks OK to me.

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> platforms. The clock numbers vary a bit between those two platforms.
> This patch introduces a mechanism to only register the valid clocks
> for one platform by checking the clk resource id table.
> 
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  drivers/clk/imx/Makefile           |  3 +-
>  drivers/clk/imx/clk-imx8qxp-rsrc.c | 89 ++++++++++++++++++++++++++++++
>  drivers/clk/imx/clk-imx8qxp.c      |  9 ++-
>  drivers/clk/imx/clk-scu.c          | 33 ++++++++++-
>  drivers/clk/imx/clk-scu.h          | 11 +++-
>  5 files changed, 137 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/clk/imx/clk-imx8qxp-rsrc.c
> 
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index dd6a737d060b..2fdd2fff16c7 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -27,7 +27,8 @@ obj-$(CONFIG_CLK_IMX8MP) += clk-imx8mp.o
>  obj-$(CONFIG_CLK_IMX8MQ) += clk-imx8mq.o
>  
>  obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
> -clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o
> +clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o \
> +				     clk-imx8qxp-rsrc.o
>  clk-imx-lpcg-scu-$(CONFIG_CLK_IMX8QXP) += clk-lpcg-scu.o clk-imx8qxp-lpcg.o
>  
>  obj-$(CONFIG_CLK_IMX1)   += clk-imx1.o
> diff --git a/drivers/clk/imx/clk-imx8qxp-rsrc.c b/drivers/clk/imx/clk-imx8qxp-rsrc.c
> new file mode 100644
> index 000000000000..ab66811ba9c1
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8qxp-rsrc.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + *	Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +#include "clk-scu.h"
> +
> +/* Keep sorted in the ascending order */
> +static u32 imx8qxp_clk_scu_rsrc_table[] = {
> +	IMX_SC_R_DC_0_VIDEO0,
> +	IMX_SC_R_DC_0_VIDEO1,
> +	IMX_SC_R_DC_0,
> +	IMX_SC_R_DC_0_PLL_0,
> +	IMX_SC_R_DC_0_PLL_1,
> +	IMX_SC_R_SPI_0,
> +	IMX_SC_R_SPI_1,
> +	IMX_SC_R_SPI_2,
> +	IMX_SC_R_SPI_3,
> +	IMX_SC_R_UART_0,
> +	IMX_SC_R_UART_1,
> +	IMX_SC_R_UART_2,
> +	IMX_SC_R_UART_3,
> +	IMX_SC_R_I2C_0,
> +	IMX_SC_R_I2C_1,
> +	IMX_SC_R_I2C_2,
> +	IMX_SC_R_I2C_3,
> +	IMX_SC_R_ADC_0,
> +	IMX_SC_R_FTM_0,
> +	IMX_SC_R_FTM_1,
> +	IMX_SC_R_CAN_0,
> +	IMX_SC_R_GPU_0_PID0,
> +	IMX_SC_R_LCD_0,
> +	IMX_SC_R_LCD_0_PWM_0,
> +	IMX_SC_R_PWM_0,
> +	IMX_SC_R_PWM_1,
> +	IMX_SC_R_PWM_2,
> +	IMX_SC_R_PWM_3,
> +	IMX_SC_R_PWM_4,
> +	IMX_SC_R_PWM_5,
> +	IMX_SC_R_PWM_6,
> +	IMX_SC_R_PWM_7,
> +	IMX_SC_R_GPT_0,
> +	IMX_SC_R_GPT_1,
> +	IMX_SC_R_GPT_2,
> +	IMX_SC_R_GPT_3,
> +	IMX_SC_R_GPT_4,
> +	IMX_SC_R_FSPI_0,
> +	IMX_SC_R_FSPI_1,
> +	IMX_SC_R_SDHC_0,
> +	IMX_SC_R_SDHC_1,
> +	IMX_SC_R_SDHC_2,
> +	IMX_SC_R_ENET_0,
> +	IMX_SC_R_ENET_1,
> +	IMX_SC_R_MLB_0,
> +	IMX_SC_R_USB_2,
> +	IMX_SC_R_NAND,
> +	IMX_SC_R_LVDS_0,
> +	IMX_SC_R_LVDS_1,
> +	IMX_SC_R_M4_0_I2C,
> +	IMX_SC_R_ELCDIF_PLL,
> +	IMX_SC_R_AUDIO_PLL_0,
> +	IMX_SC_R_PI_0,
> +	IMX_SC_R_PI_0_PLL,
> +	IMX_SC_R_MIPI_0,
> +	IMX_SC_R_MIPI_0_PWM_0,
> +	IMX_SC_R_MIPI_0_I2C_0,
> +	IMX_SC_R_MIPI_0_I2C_1,
> +	IMX_SC_R_MIPI_1,
> +	IMX_SC_R_MIPI_1_PWM_0,
> +	IMX_SC_R_MIPI_1_I2C_0,
> +	IMX_SC_R_MIPI_1_I2C_1,
> +	IMX_SC_R_CSI_0,
> +	IMX_SC_R_CSI_0_PWM_0,
> +	IMX_SC_R_CSI_0_I2C_0,
> +	IMX_SC_R_AUDIO_PLL_1,
> +	IMX_SC_R_AUDIO_CLK_0,
> +	IMX_SC_R_AUDIO_CLK_1,
> +	IMX_SC_R_A35,
> +	IMX_SC_R_VPU_DEC_0,
> +	IMX_SC_R_VPU_ENC_0,
> +};
> +
> +const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp = {
> +	.rsrc = imx8qxp_clk_scu_rsrc_table,
> +	.num = ARRAY_SIZE(imx8qxp_clk_scu_rsrc_table),
> +};
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index d17b418ac577..9e35ae45b3a0 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Copyright 2018 NXP
> + * Copyright 2018-2021 NXP
>   *	Dong Aisheng <aisheng.dong@nxp.com>
>   */
>  
> @@ -9,6 +9,7 @@
>  #include <linux/io.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  
> @@ -27,9 +28,11 @@ static const char *dc0_sels[] = {
>  static int imx8qxp_clk_probe(struct platform_device *pdev)
>  {
>  	struct device_node *ccm_node = pdev->dev.of_node;
> +	const struct imx_clk_scu_rsrc_table *rsrc_table;
>  	int ret;
>  
> -	ret = imx_clk_scu_init(ccm_node);
> +	rsrc_table = of_device_get_match_data(&pdev->dev);
> +	ret = imx_clk_scu_init(ccm_node, rsrc_table);
>  	if (ret)
>  		return ret;
>  
> @@ -130,7 +133,7 @@ static int imx8qxp_clk_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id imx8qxp_match[] = {
>  	{ .compatible = "fsl,scu-clk", },
> -	{ .compatible = "fsl,imx8qxp-clk", },
> +	{ .compatible = "fsl,imx8qxp-clk", &imx_clk_scu_rsrc_imx8qxp, },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index cff0e1bd7030..02044d48d9bc 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -1,11 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * Copyright 2018 NXP
> + * Copyright 2018-2021 NXP
>   *   Dong Aisheng <aisheng.dong@nxp.com>
>   */
>  
>  #include <dt-bindings/firmware/imx/rsrc.h>
>  #include <linux/arm-smccc.h>
> +#include <linux/bsearch.h>
>  #include <linux/clk-provider.h>
>  #include <linux/err.h>
>  #include <linux/of_platform.h>
> @@ -22,6 +23,7 @@
>  static struct imx_sc_ipc *ccm_ipc_handle;
>  static struct device_node *pd_np;
>  static struct platform_driver imx_clk_scu_driver;
> +static const struct imx_clk_scu_rsrc_table *rsrc_table;
>  
>  struct imx_scu_clk_node {
>  	const char *name;
> @@ -167,7 +169,26 @@ static inline struct clk_scu *to_clk_scu(struct clk_hw *hw)
>  	return container_of(hw, struct clk_scu, hw);
>  }
>  
> -int imx_clk_scu_init(struct device_node *np)
> +static inline int imx_scu_clk_search_cmp(const void *rsrc, const void *rsrc_p)
> +{
> +	return *(u32 *)rsrc - *(u32 *)rsrc_p;
> +}
> +
> +static bool imx_scu_clk_is_valid(u32 rsrc_id)
> +{
> +	void *p;
> +
> +	if (!rsrc_table)
> +		return true;
> +
> +	p = bsearch(&rsrc_id, rsrc_table->rsrc, rsrc_table->num,
> +		    sizeof(rsrc_table->rsrc[0]), imx_scu_clk_search_cmp);
> +
> +	return p != NULL;
> +}
> +
> +int imx_clk_scu_init(struct device_node *np,
> +		     const struct imx_clk_scu_rsrc_table *data)
>  {
>  	u32 clk_cells;
>  	int ret, i;
> @@ -186,6 +207,8 @@ int imx_clk_scu_init(struct device_node *np)
>  		pd_np = of_find_compatible_node(NULL, NULL, "fsl,scu-pd");
>  		if (!pd_np)
>  			return -EINVAL;
> +
> +		rsrc_table = data;
>  	}
>  
>  	return platform_driver_register(&imx_clk_scu_driver);
> @@ -582,6 +605,9 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
>  	struct platform_device *pdev;
>  	int ret;
>  
> +	if (!imx_scu_clk_is_valid(rsrc_id))
> +		return ERR_PTR(-EINVAL);
> +
>  	pdev = platform_device_alloc(name, PLATFORM_DEVID_NONE);
>  	if (!pdev) {
>  		pr_err("%s: failed to allocate scu clk dev rsrc %d type %d\n",
> @@ -749,6 +775,9 @@ struct clk_hw *__imx_clk_gpr_scu(const char *name, const char * const *parent_na
>  	if (!clk_node)
>  		return ERR_PTR(-ENOMEM);
>  
> +	if (!imx_scu_clk_is_valid(rsrc_id))
> +		return ERR_PTR(-EINVAL);
> +
>  	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
>  	if (!clk) {
>  		kfree(clk_node);
> diff --git a/drivers/clk/imx/clk-scu.h b/drivers/clk/imx/clk-scu.h
> index 8ebee0cb0fe6..bcacd8b1d1ab 100644
> --- a/drivers/clk/imx/clk-scu.h
> +++ b/drivers/clk/imx/clk-scu.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0+ */
>  /*
> - * Copyright 2018 NXP
> + * Copyright 2018-2021 NXP
>   *   Dong Aisheng <aisheng.dong@nxp.com>
>   */
>  
> @@ -14,10 +14,17 @@
>  #define IMX_SCU_GPR_CLK_DIV	BIT(1)
>  #define IMX_SCU_GPR_CLK_MUX	BIT(2)
>  
> +struct imx_clk_scu_rsrc_table {
> +	const u32 *rsrc;
> +	u8 num;
> +};
> +
>  extern struct list_head imx_scu_clks[];
>  extern const struct dev_pm_ops imx_clk_lpcg_scu_pm_ops;
> +extern const struct imx_clk_scu_rsrc_table imx_clk_scu_rsrc_imx8qxp;
>  
> -int imx_clk_scu_init(struct device_node *np);
> +int imx_clk_scu_init(struct device_node *np,
> +		     const struct imx_clk_scu_rsrc_table *data);
>  struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
>  				      void *data);
>  struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
> -- 
> 2.25.1
> 
