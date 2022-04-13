Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8DDC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 13 Apr 2022 02:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbiDMCqr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Apr 2022 22:46:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbiDMCqq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Apr 2022 22:46:46 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E47B55
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 19:44:26 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id v19-20020a056820101300b0032488bb70f5so133069oor.5
        for <linux-clk@vger.kernel.org>; Tue, 12 Apr 2022 19:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ePuF99ZQsPkil9GX0AgbmUAzZ/0vVpKw5QlJV5IaEOw=;
        b=auhdYgrw1giEddLLQeUMPaTanFfto1Mcu57WxQhgUxU4j5jCd+oWQex9u5hV/GEddO
         Z8NpT88ggydbzZbtrX4xAwinjRFTpBEOCzGstEJohhnDWSGH1H9TDSeYkmp8td/abiKr
         HuFMLt3Lyw0u+BpXhiH9o9JFZfDDaO0zWXcBz5FDWIFp9QKJ6K1LgJo3/NTTiXSWSOKJ
         DRTBjhibfYoJmHRdQ2u8f1z6byGneqyWXhUDYgkcmSQCJq/Hp9BSC9jMN3G2DJECPPJE
         HfYsKXPuTyt9/pqHyIQvCpt17rzk8hN/J3ooNRfBP5Q3RaY1mFQeCVbgAWmd4Cr5iYeD
         amIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ePuF99ZQsPkil9GX0AgbmUAzZ/0vVpKw5QlJV5IaEOw=;
        b=IbIrR2cNKdGzL3kggsEcpLtRl1V4dMGRGALJ792dNfMErsHkqhMyhT6EPxxJrOR2dl
         LpZSjYCCj4wgjtjqNGnUI7ctUo+EYok1btlHzGWzDOThwx+7+hhJ5opdt06fq58G+XHx
         aqAsSHXS4TiyGhx8JftKP/dsrF5gQ22Dro6TyTT/MLR+avbn3zR9iJhFNAvdASy9opTJ
         7FOoxDUrKTMWv9Qxd32djRXaSNzLr4ppx3Lyrirc4mqHYgTARRWt6MuhM2oGKitbnjG2
         jqJsb9fwwqd8usqXlz+uevwqsIoXZ60wYziW9nTuMasmHpTHpEiHcT01tQt1uHeo/6FJ
         CPVw==
X-Gm-Message-State: AOAM531Kry3gQ3gkQqkj7JICp6SMIzg/SWhvvI/NcXsa2s+omMeIyR9C
        Khmo47TMCNl+1JfnemR/3/X40g==
X-Google-Smtp-Source: ABdhPJwNu3V6uJ1BYxqoGhgkSj8XmJIyKjDTePzzz08VSUt4DpAdr9qMIJAIbp2wwje0G2+q7ZYBLQ==
X-Received: by 2002:a4a:896d:0:b0:329:1695:acc6 with SMTP id g42-20020a4a896d000000b003291695acc6mr12865655ooi.27.1649817865436;
        Tue, 12 Apr 2022 19:44:25 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c3-20020a056808138300b002f76b9a9ef6sm13590949oiw.10.2022.04.12.19.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 19:44:24 -0700 (PDT)
Date:   Tue, 12 Apr 2022 21:44:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: clk-alpha-pll: export lucid evo PLL
 configuration interfaces
Message-ID: <YlY5B3mkVpjN/iZ2@builder.lan>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
 <20220314114249.1636641-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314114249.1636641-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 14 Mar 06:42 CDT 2022, Vladimir Zapolskiy wrote:

> The change exports lucid evo PLL configuration and control functions
> to clock controller drivers.
> 

I think this should say that you add support for Lucid EVO, not just
that you export them.

Thanks,
Bjorn

> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 65 ++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  5 ++-
>  2 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 47879ee5a677..54bad5277802 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -191,8 +191,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
>  
>  /* LUCID EVO PLL specific settings and offsets */
> +#define LUCID_EVO_PCAL_NOT_DONE		BIT(8)
>  #define LUCID_EVO_ENABLE_VOTE_RUN       BIT(25)
>  #define LUCID_EVO_PLL_L_VAL_MASK        GENMASK(15, 0)
> +#define LUCID_EVO_PLL_CAL_L_VAL_SHIFT	16
>  
>  /* ZONDA PLL specific */
>  #define ZONDA_PLL_OUT_MASK	0xf
> @@ -1994,6 +1996,33 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>  
> +void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +				 const struct alpha_pll_config *config)
> +{
> +	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l |
> +			(TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT));
> +
> +	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
> +
> +	/* Disable PLL output */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
> +
> +	/* Set operation mode to STANDBY */
> +	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
> +
> +	/* Place the PLL in STANDBY mode */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +}
> +EXPORT_SYMBOL_GPL(clk_lucid_evo_pll_configure);
> +
>  static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
>  {
>  	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> @@ -2079,6 +2108,31 @@ static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
>  	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
>  }
>  
> +static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
> +{
> +	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> +	struct clk_hw *p;
> +	u32 val = 0;
> +	int ret;
> +
> +	/* Return early if calibration is not needed. */
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +	if (!(val & LUCID_EVO_PCAL_NOT_DONE))
> +		return 0;
> +
> +	p = clk_hw_get_parent(hw);
> +	if (!p)
> +		return -EINVAL;
> +
> +	ret = alpha_pll_lucid_evo_enable(hw);
> +	if (ret)
> +		return ret;
> +
> +	alpha_pll_lucid_evo_disable(hw);
> +
> +	return 0;
> +}
> +
>  static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
>  						     unsigned long parent_rate)
>  {
> @@ -2114,3 +2168,14 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops = {
>  	.set_rate = clk_lucid_evo_pll_postdiv_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_evo_ops);
> +
> +const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
> +	.prepare = alpha_pll_lucid_evo_prepare,
> +	.enable = alpha_pll_lucid_evo_enable,
> +	.disable = alpha_pll_lucid_evo_disable,
> +	.is_enabled = clk_trion_pll_is_enabled,
> +	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
> +	.round_rate = clk_alpha_pll_round_rate,
> +	.set_rate = alpha_pll_lucid_5lpe_set_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 6e9907deaf30..0b7a6859ca2c 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -152,6 +152,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
>  
>  extern const struct clk_ops clk_alpha_pll_zonda_ops;
>  #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
> +
> +extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
>  extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
>  extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
>  
> @@ -168,6 +170,7 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  
>  void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
> -
> +void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +				 const struct alpha_pll_config *config);
>  
>  #endif
> -- 
> 2.33.0
> 
