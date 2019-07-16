Return-Path: <SRS0=Gp7K=VN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA090C7618F
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 00:08:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 755962171F
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jul 2019 00:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xlCtHr7+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731855AbfGPAIu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Jul 2019 20:08:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35000 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730888AbfGPAIt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Jul 2019 20:08:49 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so8189782pfn.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2019 17:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Kk3hDSABrXyhJx+RdNn1+ivrgUHefpZGD1c1iLoa0N0=;
        b=xlCtHr7+WOhi6zpv0qk1hlbCtEAcsLff6PlIV7Hgg1x3nX99k9m6kINeaLrh3G6WXm
         RCGBjjJBeJP5FJBj0dQRSebDVJ1dfT2tA8UWCehnU+FDYu/oCl8q68U9+RbECeCJsRFv
         UmDLN5tXD8p+7ytzu5Bh/TaUmhywBAQE39ysW/A7JTpxMdjhTIzKDaq5AbI9dnfAPqTo
         MmveLbaO9wQpgTWVxxV845DuaDCVSckWQ+pdu0nxzG5qy8yem4LPGmI0cqOC2ckRDc22
         l51WZ9B4xYiTYeHPnqX1bC9UMLv6Zc3aK3G6sK5kWVLoON4akqQ9F4n0CvXXZYMqq8J4
         YL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Kk3hDSABrXyhJx+RdNn1+ivrgUHefpZGD1c1iLoa0N0=;
        b=sGAYlJCDxUoWNe47Q2WHxEwIvcmZj58NRJbsoZGQZqvgI8tjM7rwsg8WsKzrjWBmsf
         WFFKSHEV+SKnps/QT5V1axUjF2qXkv2NxqhbMvYWQ77i5pI3lDNYbuFn9gFBGWgxX4GU
         DOmE0ujdFB4Ust1uBqw5PoRcGrrxQePaIfRzQkI6c4qI68L/OUFNtYoSbSu0A0nJBrzf
         qMmbSvbbQfLadwaWgSW+vveuNGBoVK66lF37KgGfw72pmPzwIv+kagjsHuDmRUEqaAHS
         BDDVp10w+KFHgJZ+lYP16GKC1LSjpz1vh1PMDHUCwpFzR26dNGYGIJEaLQIXSOF1dG81
         totg==
X-Gm-Message-State: APjAAAWpE5I1Wgp2P7QKG3o3+yY2Rp36c+CaT0HwFvEXwU+wV8FDKRrc
        DzZ93T8rdWl/Jm7bAG1fGbtnJA==
X-Google-Smtp-Source: APXvYqxmRb5etB4ZLrSsh/m4KCj26VPMF/xZbe6AYHNcjVcNxM46c+cfVSVKO6XPvzqIr43bQjrWYw==
X-Received: by 2002:a63:6904:: with SMTP id e4mr2421242pgc.321.1563235728962;
        Mon, 15 Jul 2019 17:08:48 -0700 (PDT)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q126sm19513616pfq.123.2019.07.15.17.08.47
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 17:08:48 -0700 (PDT)
Date:   Mon, 15 Jul 2019 17:08:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Deepak Katragadda <dkatraga@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v3 1/3] clk: qcom: clk-alpha-pll: Remove post_div_table
 checks
Message-ID: <20190716000846.GK30636@minitux>
References: <20190625063140.17106-1-vkoul@kernel.org>
 <20190625063140.17106-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625063140.17106-2-vkoul@kernel.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 24 Jun 23:31 PDT 2019, Vinod Koul wrote:

> We want users to code properly and fix the post_div_table missing and
> not reply on core to check. So remove the post_div_table check.

s/reply/rely/

> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index b48707693ffd..2c6773188761 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -1036,11 +1036,6 @@ static unsigned long clk_alpha_pll_postdiv_fabia_recalc_rate(struct clk_hw *hw,
>  	u32 i, div = 1, val;
>  	int ret;
>  
> -	if (!pll->post_div_table) {
> -		pr_err("Missing the post_div_table for the PLL\n");
> -		return -EINVAL;
> -	}
> -
>  	ret = regmap_read(pll->clkr.regmap, PLL_USER_CTL(pll), &val);
>  	if (ret)
>  		return ret;
> @@ -1063,11 +1058,6 @@ static long clk_alpha_pll_postdiv_fabia_round_rate(struct clk_hw *hw,
>  {
>  	struct clk_alpha_pll_postdiv *pll = to_clk_alpha_pll_postdiv(hw);
>  
> -	if (!pll->post_div_table) {
> -		pr_err("Missing the post_div_table for the PLL\n");
> -		return -EINVAL;
> -	}
> -
>  	return divider_round_rate(hw, rate, prate, pll->post_div_table,
>  				pll->width, CLK_DIVIDER_ROUND_CLOSEST);
>  }
> @@ -1089,11 +1079,6 @@ static int clk_alpha_pll_postdiv_fabia_set_rate(struct clk_hw *hw,
>  	if (val & PLL_VOTE_FSM_ENA)
>  		return 0;
>  
> -	if (!pll->post_div_table) {
> -		pr_err("Missing the post_div_table for the PLL\n");
> -		return -EINVAL;
> -	}
> -
>  	div = DIV_ROUND_UP_ULL(parent_rate, rate);
>  	for (i = 0; i < pll->num_post_div; i++) {
>  		if (pll->post_div_table[i].div == div) {
> -- 
> 2.20.1
> 
