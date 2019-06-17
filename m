Return-Path: <SRS0=KwYV=UQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196E2C31E44
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 04:27:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E20F2218A0
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 04:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H/R982Rw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726127AbfFQE1h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jun 2019 00:27:37 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39458 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbfFQE1h (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 00:27:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id 196so5033233pgc.6
        for <linux-clk@vger.kernel.org>; Sun, 16 Jun 2019 21:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5qgzRnTwZ7FtFwZOU+qTtQKChjBDOB5x4Llf0yxx6b8=;
        b=H/R982RwyR0I6XYbqdeqJDv1GUYVOIzWAfsvHLzIm/e/jZZZcXvLRyuPiowvWP368J
         GovOR51IK3hRrS9xCpj/xwaJd7jORnXpuS8zYaBwQI07YHFwmprSWSjXytg7+APpYxKK
         Pj3M8OB2aq7cmczvjKvUEen5RKi+B/F1UZcfqkXbDpXbN2JrtsPGmYLoEvm5CzUNDOj5
         QemIwmCj9EjD5M2LGX6O8kctyGv9HLsKu7hhUxON8/tZnW0V1YS9bZ8pwfKTI3Qhz0nM
         SQXuzUrRt/KSHcxcUumBmnPe7X+Kx023NDloZaPWTN4H5uMVEWrrQPsRraa4tvbOpmtX
         VVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5qgzRnTwZ7FtFwZOU+qTtQKChjBDOB5x4Llf0yxx6b8=;
        b=boyViaNvggu9ePMh59zt4QS5gR974RbdA64EPCkUFOSunQV/mplZbfcQPTWEOqrFeS
         EV/Uu+29bhSDS3omh2t66U+CFz/EPiQm815L+3d5EUj8qDcmksxPqmNxnxqUmdrFrx0o
         e7gH9RSnGhLJspbL6YLnzNk0/+ithddtm9BhKSO++fe+CY6IPA5W3kf369efuYSKMLDI
         ppFBYbMxtSZMGLdCbMc2z554z5ystNViNXbKeb1UFldeeXJcLFijrrRgOPy8LtErNIoq
         7FUFiunbssxQZAYHynXlDM6Xp6NhjWH8PQ+eHa1/oOshuOg7/HS1ocAYJSL2Pj/C7UTw
         7mLQ==
X-Gm-Message-State: APjAAAXD9Irhw2zGMCoA20mkd8usPzI6mK3YjpiUnlL5el7Gltha4FLj
        Tfn19ju1gqzFRlALz5mDmLlmxQ==
X-Google-Smtp-Source: APXvYqwozCNH33lvb2buafYwWs0k3/dkAS5T1YAfsM8xG7pjgIEkQGCh0uZcOBUNb6wTCKDL4bKVPg==
X-Received: by 2002:a63:1208:: with SMTP id h8mr45853756pgl.377.1560745656729;
        Sun, 16 Jun 2019 21:27:36 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id p65sm11149648pfp.58.2019.06.16.21.27.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 21:27:36 -0700 (PDT)
Date:   Sun, 16 Jun 2019 21:28:25 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: qcom: clk-alpha-pll: Remove post_div_table
 checks
Message-ID: <20190617042825.GG750@tuxbook-pro>
References: <20190612091722.9377-1-vkoul@kernel.org>
 <20190612091722.9377-3-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612091722.9377-3-vkoul@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 12 Jun 02:17 PDT 2019, Vinod Koul wrote:

> We want users to code properly and fix the post_div_table missing and
> not reply on core to check. So remove the post_div_table check.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
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
