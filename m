Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24C7C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 17:46:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE38522B3F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jan 2021 17:46:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731130AbhAYRqI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jan 2021 12:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730492AbhAYROT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jan 2021 12:14:19 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73B4DC06174A
        for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2021 09:13:37 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id h192so15560965oib.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Jan 2021 09:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/I3oxK4amWeY6JM4WB4hq97bbAQje0bKtzkLMEKFCM0=;
        b=dIaqdQaule2cx9LNlLLl50ARGJBLDuPdOExdVL4U1RE3BZA1xYHUP6R7lYMsLonzWF
         afyExQRqwODpYNJRYUv/xWEnI+Bt4M2sBJplPIO74Rv0UZQFY/sq4PRRXUsxwnyb5VoU
         tl7DENuM3t8UR0b0MfUuhLo9cUCNEQ7cfeZo8wwYK+Ifc2fX9O1vFpuIDgzyM/i6KvRm
         Av/TydVeMMVbMwBQjP8GBf7UHHzRphyjlT3SyPiwofLtB08x7ys+L17BiOJdCjPb7oET
         KzzT0KLKDMW//KUbcM799OKEepqFF6Do+99oavPYOFbLQQ4dN3DWhuZSTUQ99+4WzqqW
         wm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/I3oxK4amWeY6JM4WB4hq97bbAQje0bKtzkLMEKFCM0=;
        b=XuulzbQQhY1OjoT9IPuWUamsgLlpSh0mwpG2xxbuaFYaTCX2551Y/Ge/Q/Pt8dE5M7
         ii8VteuJLgrEnhqhWqXJOQXGyAjGngGt1wsm9uuTI3Vz119rMtkqEqCeQx0bu/ZfFnIg
         hl7xYKgelYeq8Vw2wLMITjQU4vTTdPK24lSGB9lkN9tVlhpPzqcP1JGDT5SvODrD56RH
         cYpe8ws2rXjH/x/AZqe9KFBFPZcawO6MMomnYp4Aq0QEnlb4iPfQfiWrqNu5D6p/y74q
         iUyscBK0Y59eIG5z0HlA8XhZuRWUcm8K6JIZNoKQGus7VAgx+VvX6E3w51eWyiELzgnw
         RfEQ==
X-Gm-Message-State: AOAM530W7uJURt0IzToxH5KXw+zrvRwSd4kvR6/qbX0HXkA3U/rwK8Gu
        OtqQssT9DP6R5CmLXtPGagT1mg==
X-Google-Smtp-Source: ABdhPJwWHHl92I1orCm3swRqt//ofsW/9z3B+zRrv1KNBe58xYdZqc01bzkh7ZocorwUb6+00aFgsg==
X-Received: by 2002:aca:afd7:: with SMTP id y206mr744441oie.51.1611594816845;
        Mon, 25 Jan 2021 09:13:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 66sm2687017otw.75.2021.01.25.09.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 09:13:36 -0800 (PST)
Date:   Mon, 25 Jan 2021 11:13:34 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] clk: qcom: clk-alpha-pll: replace regval with val
Message-ID: <YA78PvE4hDLc2Lo9@builder.lan>
References: <20210118044321.2571775-1-vkoul@kernel.org>
 <20210118044321.2571775-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210118044321.2571775-2-vkoul@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun 17 Jan 22:43 CST 2021, Vinod Koul wrote:

> Driver uses regval variable for holding register values, replace with a
> shorter one val
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 21c357c26ec4..f7721088494c 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -777,15 +777,15 @@ static long alpha_pll_huayra_round_rate(struct clk_hw *hw, unsigned long rate,
>  static int trion_pll_is_enabled(struct clk_alpha_pll *pll,
>  				struct regmap *regmap)
>  {
> -	u32 mode_regval, opmode_regval;
> +	u32 mode_val, opmode_val;
>  	int ret;
>  
> -	ret = regmap_read(regmap, PLL_MODE(pll), &mode_regval);
> -	ret |= regmap_read(regmap, PLL_OPMODE(pll), &opmode_regval);
> +	ret = regmap_read(regmap, PLL_MODE(pll), &mode_val);
> +	ret |= regmap_read(regmap, PLL_OPMODE(pll), &opmode_val);
>  	if (ret)
>  		return 0;
>  
> -	return ((opmode_regval & PLL_RUN) && (mode_regval & PLL_OUTCTRL));
> +	return ((opmode_val & PLL_RUN) && (mode_val & PLL_OUTCTRL));
>  }
>  
>  static int clk_trion_pll_is_enabled(struct clk_hw *hw)
> @@ -1445,12 +1445,12 @@ EXPORT_SYMBOL_GPL(clk_trion_pll_configure);
>  static int __alpha_pll_trion_prepare(struct clk_hw *hw, u32 pcal_done)
>  {
>  	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
> -	u32 regval;
> +	u32 val;
>  	int ret;
>  
>  	/* Return early if calibration is not needed. */
> -	regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &regval);
> -	if (regval & pcal_done)
> +	regmap_read(pll->clkr.regmap, PLL_STATUS(pll), &val);
> +	if (val & pcal_done)
>  		return 0;
>  
>  	/* On/off to calibrate */
> @@ -1476,7 +1476,7 @@ static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
>  {
>  	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
>  	unsigned long rrate;
> -	u32 regval, l, alpha_width = pll_alpha_width(pll);
> +	u32 val, l, alpha_width = pll_alpha_width(pll);
>  	u64 a;
>  	int ret;
>  
> @@ -1497,8 +1497,8 @@ static int alpha_pll_trion_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  	/* Wait for 2 reference cycles before checking the ACK bit. */
>  	udelay(1);
> -	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &regval);
> -	if (!(regval & ALPHA_PLL_ACK_LATCH)) {
> +	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
> +	if (!(val & ALPHA_PLL_ACK_LATCH)) {
>  		pr_err("Lucid PLL latch failed. Output may be unstable!\n");
>  		return -EINVAL;
>  	}
> -- 
> 2.26.2
> 
