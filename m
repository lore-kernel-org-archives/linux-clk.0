Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529BFC636C9
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 20:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 375A16128C
	for <linux-clk@archiver.kernel.org>; Thu, 15 Jul 2021 20:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238195AbhGOUFJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Jul 2021 16:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241460AbhGOUFE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Jul 2021 16:05:04 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437A2C061786
        for <linux-clk@vger.kernel.org>; Thu, 15 Jul 2021 12:50:05 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id e1-20020a9d63c10000b02904b8b87ecc43so7458989otl.4
        for <linux-clk@vger.kernel.org>; Thu, 15 Jul 2021 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1YLndUxOOPY8Sr1BrjsF6xRwJEfXRqU5cb5ChMJ5I0o=;
        b=ilM60R3oL3fDNSoPOqAJo5H35jI1pAxERRGZ5FINwozVhTWmMylm937FoNsNZTIjiS
         30eNAyBpalxY4OOTjNnkD99GOF/6FWeBndVDgRvCR2xzb9sTVCjQGhbGAlf+/DCCGc0W
         NvPxl0gogn2ggL2LlYKjxdhLbhm14N78sa2wv+kc0J/ch7Eao8UME4PAEC+cMPxlaP42
         khyDc356azAy6rU8fsgmnmijQCNRd53mEEWVNZSVBwyIV/KNgP+jfFaYYXA5vFiuWn6T
         ms8Dr4nZmkCotxEFSfFDLU8OJOSa3Vc/J4dYsfv/bjCfqZp5bIv2SnMGn5xSMQaaGxJx
         6Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1YLndUxOOPY8Sr1BrjsF6xRwJEfXRqU5cb5ChMJ5I0o=;
        b=QcAaL4qCxQtq1NXdU5f85w5g+SEBuFslMLbeqpgXghrnhfTBmQamoqcl4qnq2Y/eIq
         ZhdMeibUmLQbsIlhAAX8fkYr9NvT0kExJHCLZRtxJLZNl/Unc64+VytjFoPlSyjx49qK
         ltPtFy9viSzDlpOkoo0W10hAwon/TnkfKRMJ730LDvxz2tte+HQgcGtYURLoS9rcVqvY
         Vlm2RFC7rJPlArWSrAeo+PA+XQYGk3OmdRCpoltylfkYt6FOIPQOy3w3Y4PRUiY+U9O0
         H4D/J9QAxPZIftfZcOGAinfhE5kdtEDk+oLv2nFauSkZJdB7Twtcs2gRnUjBrqLgtJAH
         4Yow==
X-Gm-Message-State: AOAM530GMdSqlK6P4gaQ9V9Hv5sRSJO34BmB+N1Jc21F3bJXgLMI6Ytk
        icbTI1/GaDZ23MctXf1HQYVBaA==
X-Google-Smtp-Source: ABdhPJyZwjUMocwsEorC/bB3r5mo2VUVVLxjfj5HSITW72ekMa51Ktj/ONyzjy5RdWjjIN7e3VghaQ==
X-Received: by 2002:a05:6830:2366:: with SMTP id r6mr5013660oth.188.1626378604584;
        Thu, 15 Jul 2021 12:50:04 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c11sm1279191oot.25.2021.07.15.12.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:50:04 -0700 (PDT)
Date:   Thu, 15 Jul 2021 14:50:01 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc:     agross@kernel.org, linus.walleij@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH 2/5] clk: qcom: Add SDX65 GCC support
Message-ID: <YPCRadKzQRZdtOfO@yoga>
References: <20210709200339.17638-1-quic_vamslank@quicinc.com>
 <20210709200339.17638-3-quic_vamslank@quicinc.com>
 <YOkTVXcZpSRUE+Wy@yoga>
 <20210715184325.GB6897@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210715184325.GB6897@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 15 Jul 13:43 CDT 2021, Vamsi Krishna Lanka wrote:

> On Fri, Jul 09, 2021 at 10:26:13PM -0500, Bjorn Andersson wrote:
> > On Fri 09 Jul 15:03 CDT 2021, quic_vamslank@quicinc.com wrote:
> > 
> > > From: Vamsi krishna Lanka <quic_vamslank@quicinc.com>
> > > 
> > > Add Global Clock Controller (GCC) support for SDX65 SoCs from Qualcomm.
> > > 
> > 
> > This doesn't mention the fact that you add a new PLL type. I do however
> > think you should do that in a separate commit, preceding the gcc driver
> > patch.
> 
> Sure, will do.
> 
> > 
> > > Signed-off-by: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
> > > ---
> > >  drivers/clk/qcom/Kconfig         |    8 +
> > >  drivers/clk/qcom/Makefile        |    1 +
> > >  drivers/clk/qcom/clk-alpha-pll.c |  170 +++
> > >  drivers/clk/qcom/clk-alpha-pll.h |    4 +
> > >  drivers/clk/qcom/clk-rcg.h       |    4 +
> > >  drivers/clk/qcom/gcc-sdx65.c     | 1648 ++++++++++++++++++++++++++++++
> > >  6 files changed, 1835 insertions(+)
> > >  create mode 100644 drivers/clk/qcom/gcc-sdx65.c
> > [..]
> > > diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> > > index 99efcc7f8d88..33a7fe992207 100644
> > > --- a/drivers/clk/qcom/clk-rcg.h
> > > +++ b/drivers/clk/qcom/clk-rcg.h
> > > @@ -149,6 +149,10 @@ struct clk_rcg2 {
> > >  	const struct freq_tbl	*freq_tbl;
> > >  	struct clk_regmap	clkr;
> > >  	u8			cfg_off;
> > > +	u8                      flags;
> > > +#define FORCE_ENABLE_RCG        BIT(0)
> > 
> > Unused.
> 
> Will remove.
> 
> > 
> > > +#define HW_CLK_CTRL_MODE        BIT(1)
> > 
> > We don't implement HW_CLK_CTRL_MODE upstream yet, so you shouldn't
> > specify it for your clocks - or just add the definefor it.
> > 
> > > +#define DFS_SUPPORT             BIT(2)
> > 
> > Unused.
> 
> Will remove.
> 
> > 
> > >  };
> > >  
> > >  #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> > > diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
> > [..]
> > > +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> > > +	.offset = 0x0,
> > > +	.post_div_shift = 10,
> > > +	.post_div_table = post_div_table_gpll0_out_even,
> > > +	.num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
> > > +	.width = 4,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_EVO],
> > > +	.clkr.hw.init = &(struct clk_init_data){
> > > +		.name = "gpll0_out_even",
> > > +		.parent_data = &(const struct clk_parent_data){
> > 
> > A parent_data with a single .hw is better specified using parent_hws.
> 
> Sure, will use parent_hws.
> 
> > 
> > > +			.hw = &gpll0.clkr.hw,
> > > +		},
> > > +		.num_parents = 1,
> > > +		.ops = &clk_alpha_pll_postdiv_lucid_evo_ops,
> > > +	},
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_0[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL0_OUT_EVEN, 6 },
> > > +	{ P_CORE_BI_PLL_TEST_SE, 7 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_0[] = {
> > > +	{ .fw_name = "bi_tcxo" },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll0_out_even.clkr.hw },
> > > +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > > +};
> > 
> > Nice to see that you use clk_parent_data, fw_name and hw right from the
> > start.
> > 
> > We typically remove core_bi_pll_test_se from the various parent lists,
> > as this is not something that's expected to be ever used. Please do the
> > same.
> 
> Sorry, I couldn't completely follow. Should I remove core_bi_pll_test_se from
> both fw_name and name ? 
> 

Yes, please drop "core_bi_pll_test_se" (and hence P_CORE_BI_PLL_TEST_SE)
throughout the driver.

Thanks,
Bjorn

> > 
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
> > > +	{ .fw_name = "bi_tcxo_ao" },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll0_out_even.clkr.hw },
> > > +	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > > +};
> > [..]
> > > +static struct clk_regmap *gcc_sdx65_clocks[] = {
> > > +	[GCC_AHB_PCIE_LINK_CLK] = &gcc_ahb_pcie_link_clk.clkr,
> > > +	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
> > > +	[GCC_BLSP1_QUP1_I2C_APPS_CLK] = &gcc_blsp1_qup1_i2c_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP1_I2C_APPS_CLK_SRC] =
> > > +		&gcc_blsp1_qup1_i2c_apps_clk_src.clkr,
> > 
> > Skip the line wrap.
> 
> Done.
> 
> > 
> > > +	[GCC_BLSP1_QUP1_SPI_APPS_CLK] = &gcc_blsp1_qup1_spi_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP1_SPI_APPS_CLK_SRC] =
> > > +		&gcc_blsp1_qup1_spi_apps_clk_src.clkr,
> > > +	[GCC_BLSP1_QUP2_I2C_APPS_CLK] = &gcc_blsp1_qup2_i2c_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP2_I2C_APPS_CLK_SRC] =
> > > +		&gcc_blsp1_qup2_i2c_apps_clk_src.clkr,
> > > +	[GCC_BLSP1_QUP2_SPI_APPS_CLK] = &gcc_blsp1_qup2_spi_apps_clk.clkr,
> > > +	[GCC_BLSP1_QUP2_SPI_APPS_CLK_SRC] =
> > [..]
> > > +static int gcc_sdx65_probe(struct platform_device *pdev)
> > > +{
> > > +	struct regmap *regmap;
> > > +	int ret;
> > > +
> > > +	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
> > > +	if (IS_ERR(regmap))
> > > +		return PTR_ERR(regmap);
> > > +	/*
> > > +	 * Keep the clocks always-ON as they are critical to the functioning
> > > +	 * of the system:
> > > +	 * GCC_SYS_NOC_CPUSS_AHB_CLK, GCC_CPUSS_AHB_CLK, GCC_CPUSS_GNOC_CLK
> > > +	 */
> > > +	regmap_update_bits(regmap, 0x6d008, BIT(0), BIT(0));
> > > +	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21));
> > > +	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22));
> > > +
> > > +	ret = qcom_cc_really_probe(pdev, &gcc_sdx65_desc, regmap);
> > 
> > Just "return qcom_cc_really_probe()"
> 
> Done.
> 
