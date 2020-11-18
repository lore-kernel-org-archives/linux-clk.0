Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC98C64E7A
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 15:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A4C22476A
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 15:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xx6D+0Ym"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbgKRPa3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Nov 2020 10:30:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727382AbgKRPa2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Nov 2020 10:30:28 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390C3C061A51
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 07:30:28 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id f16so2078014otl.11
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 07:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kiEcFfelocfnhd2oKnW85K0Bs8+YfhezxKsPupYgoVA=;
        b=Xx6D+0YmDe8+tDzPY4xh3axjXWUigyE0t6cfxv7hcF5EUuiy/ygtvyfrw/olSohMT/
         TMhyF1T8cRnhC8qaHpLXWfc0jiEmJy6yMdXRPc4Vdn6UiCRUAQluv58WRuAa9dqeJqJs
         qMjxWb6E84fvjWn2CxUZCKex1qlpVSb3ErINLyy8OLPtYIrLhk+lFgHBojwLis4d8O5E
         R4c3k/QgjKWre5QgpcpJxqu62RzMglsh7rm/pxUeBjLfHgh1ZHzaeBQ8RqiOTJ35vE5I
         A8Rpr5IPI228F7JBjwuEDjOE9KVIYhS+TDrNDL/E+9nUUFtWfZLOxNpR9QVKcNk9CRUA
         jHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kiEcFfelocfnhd2oKnW85K0Bs8+YfhezxKsPupYgoVA=;
        b=ih6qlZjVSe+ELnOZPJhRfRwOM4L3Bp7bDNZhzPZXcs5yHrCy7YcdNdu4AMt9CVLEzs
         fG8pdimweGKcGISyG8cQb4J6VIIQApPOKchsDAUEGiPv1SjgJO4AhEfuLjebpkA2OOQg
         19q8CnuvUmpI1+ek9uk1vabuOOMzofVFaUzYas6wA3IsVvtabAzuOojPtPqYfLu7hdyR
         sTpf6d2M/0esHRF14Co7eQSA7+nMhsoOVbzAKqVZP5PiUPcDAWGDCwxFF6pnNB4bZ6EZ
         ZC/XnucGN7+YKWBSjFUdOLXytwisw3eLy1xC/i0QtOjEQ4XJ6I3llh23dWVkwDFWcx6d
         g4vA==
X-Gm-Message-State: AOAM530Lv/sA6MQAbXekZpeEGIxuVf7xzFVcwyCf200g/OlTM5qLAKex
        9JYNvMqSzq3TJSRL7S2fH9TCXw==
X-Google-Smtp-Source: ABdhPJwT6i2eu4Z8eoQlgamaU/3w0ODZywHhThqnmRn/orCMAdSnT63f00YFJ9sjJ8dFOGwUmRpn/g==
X-Received: by 2002:a9d:7cd6:: with SMTP id r22mr7033207otn.355.1605713427580;
        Wed, 18 Nov 2020 07:30:27 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 68sm7606075oto.71.2020.11.18.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 07:30:26 -0800 (PST)
Date:   Wed, 18 Nov 2020 09:30:25 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: Add support for SDX55 RPMh clocks
Message-ID: <20201118153025.GJ8532@builder.lan>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-5-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105104817.15715-5-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 05 Nov 04:48 CST 2020, Manivannan Sadhasivam wrote:

> Add support for following clocks maintained by RPMh in SDX55 SoCs.
> 
> * BI TCXO
> * RF_CLK1
> * RF_CLK1_AO
> * RF_CLK2
> * RF_CLK2_AO
> * QPIC (Qualcomm Technologies, Inc. Parallel Interface Controller)
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/clk-rpmh.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index e2c669b08aff..fb72db957721 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -432,6 +432,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
>  	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
>  };
>  
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
> +DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
> +DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
> +
> +static struct clk_hw *sdx55_rpmh_clocks[] = {
> +	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
> +	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
> +	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
> +	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
> +	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
> +	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
> +	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
> +};
> +
> +static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
> +	.clks = sdx55_rpmh_clocks,
> +	.num_clks = ARRAY_SIZE(sdx55_rpmh_clocks),
> +};
> +
>  static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
>  					 void *data)
>  {
> @@ -517,6 +536,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
>  static const struct of_device_id clk_rpmh_match_table[] = {
>  	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
>  	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
> +	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
>  	{ .compatible = "qcom,sm8150-rpmh-clk", .data = &clk_rpmh_sm8150},
>  	{ .compatible = "qcom,sm8250-rpmh-clk", .data = &clk_rpmh_sm8250},
>  	{ }
> -- 
> 2.17.1
> 
