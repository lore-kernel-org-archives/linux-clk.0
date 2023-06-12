Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7801C7EE23
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 08:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjFLI7P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjFLI6q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 04:58:46 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE7CD198A
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:56:15 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f736e0c9a8so29452665e9.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686560174; x=1689152174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jVRTwGgKGl4a4Zo7uIaoBDe6/ptNLhX3bptPescW/iw=;
        b=Q2lf7UGhNRcILWMxAxi9VfBzYBx0QVent5H2kFf4tKSR1oZjlUv9RxfSvXILMurRxm
         C0lKNutj5Wo1Ep+dsNWlQRekt7eiEJBk5OG3g3GPfOwF0+AjZOJxMzYq+vGzYgc3i4/S
         TJ3ci0BYKX1hI8Y0nBWXPfS9X7bH3/iSEaunvc3UT2saVLzX3pom4oBySJpTJ+daRtQo
         VliCUEJGWx4YCGQeURFFL8yQYd2QOmuZjKeU0foL8zkIflnlw46J1TkfNErQMZfAkBXF
         gRaRP7+aYXgCqLi7Y+Z+VmTe2hrZOZ3MjV3M7wUXI8uuGNaKMMe1QR/BdHJPRpQg1w/d
         vs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686560174; x=1689152174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVRTwGgKGl4a4Zo7uIaoBDe6/ptNLhX3bptPescW/iw=;
        b=i/ImQQWHVRSDiDMi0jsl0h6y4a/gggiuvndRtp4zBgvZcVyjztLJ5FYSeIhsF6BB2J
         fgRcX6UAPWmJmdxObc91SQM5LAGbutnjy6oxXbvAq3V9E2v2ol3R0pSE6f1ZcvAwCPUt
         4WQQS9G1CqHcr01j+NzRZaEQeCmcolDlzHmoJzhsL3/iiRWWUfXLq43R5HkMvDsTyzsw
         Ykch2oCjX9zYFyLiU/Y27rK+mMkc1e1jlExn1jCIUyCOFFCXs3AB/PFV9zkjumBUlYD3
         S11Yi2NrniD0wHm5X2vHx+rZJzZfjFZ/GAmmNzY+PWaU2/jEcH2Z3r2wNBYg3fdCK4L7
         XdOw==
X-Gm-Message-State: AC+VfDzJ78Om95oO1YF0GdGDTUIyiUq+N34lRVmauEzGJJtphmD+QexQ
        EfLZ71IIUaCerzNCHyiM8onsNg==
X-Google-Smtp-Source: ACHHUZ4ZOAtbFn1YEd0HmE3TKRcQ+ih6TCml/KPwQenKsAMM35mpC5GarysaEzLUP6EY1ovje3kW/A==
X-Received: by 2002:a05:600c:210d:b0:3f5:d313:db5e with SMTP id u13-20020a05600c210d00b003f5d313db5emr5332639wml.15.1686560174144;
        Mon, 12 Jun 2023 01:56:14 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c0b5400b003f4266965fbsm10797472wmr.5.2023.06.12.01.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:56:13 -0700 (PDT)
Date:   Mon, 12 Jun 2023 11:56:12 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-clk@vger.kernel.org, aford@beaconembedded.com,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: imx: composite-8m: Add imx8m_divider_determine_rate
Message-ID: <ZIbdrLyBUwtgY2HE@linaro.org>
References: <20230506195325.876871-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230506195325.876871-1-aford173@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-05-06 14:53:25, Adam Ford wrote:
> Currently, certain clocks are derrived as a divider from their
> parent clock.  For some clocks, even when CLK_SET_RATE_PARENT
> is set, the parent clock is not properly set which can lead
> to some relatively inaccurate clock values.
> 
> Unlike imx/clk-composite-93 and imx/clk-divider-gate, it
> cannot rely on calling a standard determine_rate function,
> because the 8m composite clocks have a pre-divider and
> post-divider. Because of this, a custom determine_rate
> function is necessary to determine the maximum clock
> division which is equivalent to pre-divider * the
> post-divider.
> 
> With this added, the system can attempt to adjust the parent rate
> when the proper flags are set which can lead to a more precise clock
> value.
> 
> On the imx8mplus, no clock changes are present.
> On the Mini and Nano, this can help achieve more accurate
> lcdif clocks. When trying to get a pixel clock of 31.500MHz
> on an imx8m Nano, the clocks divided the 594MHz down, but
> left the parent rate untouched which caused a calulation error.
> 
> Before:
> video_pll              594000000
>   video_pll_bypass     594000000
>     video_pll_out      594000000
>       disp_pixel       31263158
>         disp_pixel_clk 31263158
> 
> Variance = -236842 Hz
> 
> After this patch:
> video_pll               31500000
>   video_pll_bypass      31500000
>     video_pll_out       31500000
>       disp_pixel        31500000
>         disp_pixel_clk  31500000
> 
> Variance = 0 Hz
> 
> All other clocks rates and parent were the same.
> Similar results on imx8mm were found.
> 
> Fixes: 690dccc4a0bf ("Revert "clk: imx: composite-8m: Add support to determine_rate"")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> V2:  Fix build warning found by build bot and fix prediv_value
>      and div_value because the values stored are the divisor - 1,
>      so we need to add 1 to the values to be correct.
> 
> diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
> index cbf0d7955a00..7a6e3ce97133 100644
> --- a/drivers/clk/imx/clk-composite-8m.c
> +++ b/drivers/clk/imx/clk-composite-8m.c
> @@ -119,10 +119,41 @@ static int imx8m_clk_composite_divider_set_rate(struct clk_hw *hw,
>  	return ret;
>  }
>  
> +static int imx8m_divider_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	int prediv_value;
> +	int div_value;
> +
> +	/* if read only, just return current value */
> +	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> +		u32 val;
> +
> +		val = readl(divider->reg);
> +		prediv_value = val >> divider->shift;
> +		prediv_value &= clk_div_mask(divider->width);
> +		prediv_value++;
> +
> +		div_value = val >> PCG_DIV_SHIFT;
> +		div_value &= clk_div_mask(PCG_DIV_WIDTH);
> +		div_value++;
> +
> +		return divider_ro_determine_rate(hw, req, divider->table,
> +						 PCG_PREDIV_WIDTH + PCG_DIV_WIDTH,
> +						 divider->flags, prediv_value * div_value);
> +	}
> +
> +	return divider_determine_rate(hw, req, divider->table,
> +				      PCG_PREDIV_WIDTH + PCG_DIV_WIDTH,
> +				      divider->flags);
> +}
> +
>  static const struct clk_ops imx8m_clk_composite_divider_ops = {
>  	.recalc_rate = imx8m_clk_composite_divider_recalc_rate,
>  	.round_rate = imx8m_clk_composite_divider_round_rate,
>  	.set_rate = imx8m_clk_composite_divider_set_rate,
> +	.determine_rate = imx8m_divider_determine_rate,
>  };
>  
>  static u8 imx8m_clk_composite_mux_get_parent(struct clk_hw *hw)
> -- 
> 2.39.2
> 
