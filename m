Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA47C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Feb 2022 03:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbiBXD6x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 22:58:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiBXD6w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 22:58:52 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298F625A97A
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:58:23 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id x193so1308760oix.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 19:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/rHiMAZ7RH310gYheZGBklR98lgCQetqEuPG8BVoGnc=;
        b=HtVFWkzVcB22eS57Hsfut1l+77KIhq5/gbM5SHBvkuOE6GFtyFNtp1XsuwdvAW83X3
         ibivk9VPRmP4U3z6bsgxysubOwl5aG/g5HS7qpv/tqtOUBJTvHwsMqPSTeAEP/MVC6OO
         /6maTp2IRezoW92bw/VggdtfKvzpkQb8C2DUxQA4OmG4Lmw/r52TndslRuaa1rU1/IG4
         jALk5HVeFaTImVEzZrIBRBEVnosnnF2TH2khXCmjESDUHliCT6/6azAc6K8jK9Js3sZn
         lUVyp5ogTAVlShTSNzT1uV7YczjAr0Ws4Zt8R5eNq2Y0t9d/47OkROwPRmjYV6iwIBkE
         k8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/rHiMAZ7RH310gYheZGBklR98lgCQetqEuPG8BVoGnc=;
        b=EkUxWSVYbcSK+Rsmr5cZ/UO86vnVweOGF5Kwh+32PCiy/R4W+baTAY969Dbzdi1erg
         ODYKtoUCd+zAKCNevP/YlJsat138qPDFkPGN5jbUYoNsb3YOD4sMrJTH6Man0WlYRXaV
         pann7f4LqLtpi9LqYTxiMaYPxnPYwfFphKrp7MzsUsHQwi8Bwqas87YgSzISNYfgvtLF
         kg20Cp6/Ijjxx90wKgRyktl+BHuVf3JqZ9DEaS1YDO7jNzK3GSYBGV7ODDixrXWKSpoQ
         cJGtkEMDeKu+5BD0vcAT67rwK7732toSyzz/IWYPkae4vPFlBKOlOZJw/8bSUPCY/FOG
         iuXg==
X-Gm-Message-State: AOAM532zar6JQyH/n3Ox8OwBVcOCAWJTzyfFwK9ihmM1BhV/78lCd/YR
        F2lnSq7reZS2b0/5b8UV6YJp+Q==
X-Google-Smtp-Source: ABdhPJz9NXg0iE9mEWe1XINNAqvGIzk1n7sIHTLoP3qwnqauuCzLd4tE/sYDSuaZtsdh0GeiDf9iig==
X-Received: by 2002:a05:6808:1707:b0:2ce:6a75:b883 with SMTP id bc7-20020a056808170700b002ce6a75b883mr382885oib.330.1645675102514;
        Wed, 23 Feb 2022 19:58:22 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s6sm912678oap.32.2022.02.23.19.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 19:58:21 -0800 (PST)
Date:   Wed, 23 Feb 2022 21:58:20 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/16] clk: qcom: clk-rcg: add clk_rcg_floor_ops ops
Message-ID: <YhcCXGWJhMBDCp6k@builder.lan>
References: <20220217235703.26641-1-ansuelsmth@gmail.com>
 <20220217235703.26641-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220217235703.26641-11-ansuelsmth@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 17 Feb 17:56 CST 2022, Ansuel Smith wrote:

> Add clk_rcg_floor_ops for clock that can't provide a stable freq and
> require to use a floor freq to provide the requested frequency.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>  drivers/clk/qcom/clk-rcg.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg.c b/drivers/clk/qcom/clk-rcg.c
> index a9d181d6be21..88845baa7f84 100644
> --- a/drivers/clk/qcom/clk-rcg.c
> +++ b/drivers/clk/qcom/clk-rcg.c
> @@ -526,6 +526,19 @@ static int clk_rcg_set_rate(struct clk_hw *hw, unsigned long rate,
>  	return __clk_rcg_set_rate(rcg, f);
>  }
>  
> +static int clk_rcg_set_floor_rate(struct clk_hw *hw, unsigned long rate,
> +				  unsigned long parent_rate)
> +{
> +	struct clk_rcg *rcg = to_clk_rcg(hw);
> +	const struct freq_tbl *f;
> +
> +	f = qcom_find_freq_floor(rcg->freq_tbl, rate);
> +	if (!f)
> +		return -EINVAL;
> +
> +	return __clk_rcg_set_rate(rcg, f);
> +}
> +
>  static int clk_rcg_bypass_set_rate(struct clk_hw *hw, unsigned long rate,
>  				unsigned long parent_rate)
>  {
> @@ -816,6 +829,17 @@ const struct clk_ops clk_rcg_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg_ops);
>  
> +const struct clk_ops clk_rcg_floor_ops = {
> +	.enable = clk_enable_regmap,
> +	.disable = clk_disable_regmap,
> +	.get_parent = clk_rcg_get_parent,
> +	.set_parent = clk_rcg_set_parent,
> +	.recalc_rate = clk_rcg_recalc_rate,
> +	.determine_rate = clk_rcg_determine_rate,
> +	.set_rate = clk_rcg_set_floor_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg_floor_ops);
> +
>  const struct clk_ops clk_rcg_bypass_ops = {
>  	.enable = clk_enable_regmap,
>  	.disable = clk_disable_regmap,
> -- 
> 2.34.1
> 
