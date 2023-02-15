Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC22CC636D4
	for <linux-clk@archiver.kernel.org>; Wed, 15 Feb 2023 12:24:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbjBOMYV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Feb 2023 07:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231750AbjBOMYU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Feb 2023 07:24:20 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20459360BE
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 04:24:19 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o36so13220665wms.1
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YwajgLw5rpCnjJ1GWX04nnYlZlCptWHJUsJ8npJmLw=;
        b=EMjtc5RoiZo7/FdVE1g8hyZrIFQZ6Pti6NqqN3Afza5mwQrjdmUMhW7oJtZF1QmELz
         oAl8uB6JoRkG1XzRtPHSc6Im8vh/q9bRWUcS5LR24+HJDTVN287VuyriNrJ/vM2PKfsK
         wg/hmVdfamOQhb1OjDckMPXoioKdrbGTVxbsWUy3JeYCkMsfvrubkomN/kfmV03/65TX
         36uEjBo9DX1pxqE8vjyThVrCuGLeJFFZ2A4x8v2VZdoI6GMe5JtKGBM4+YST8cio5Mb2
         1d/0KtmvkhvY76BSL0CBhb7vPg38pwtaIhbuIS8xv5IbuWCeo9zki1CSaERK2oDnz+Xs
         j54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YwajgLw5rpCnjJ1GWX04nnYlZlCptWHJUsJ8npJmLw=;
        b=j4LKvoVxC5Kbd5kxR2wGVwOpyGh4Oq8l9gvW99kcWjwozYAUxv76U3CcvjJK0pzFqx
         vV4Gd24ME9gL9Pi/gQt4E4V47DpyXziR1BeDIGw75C5GJNAJYFacKmYy5TM9LwN0zXVD
         qSpkJ1R4+V8Qvrz7X8A59n7KKWB7kBIoDICSNLjmYFW86xP0ILrBvTyZ+RESDmFgk+JD
         vBa03oE499xrmqeV/9JI1BJU61FBIbOwX+slVxoIMLb0GVkD+rSjf56fs0NH8exKoGHx
         M4Li7xXsZ9w4EMyWc4WuIlYThTKrUlF3jQB26DwQ1pRtIgMgP0N4d8lwzu2U3e5gmYCu
         wW1g==
X-Gm-Message-State: AO0yUKU6b50ij59A0QA49lROrxBPYPJnjvvwSth2KYExEZZk3byBlNtP
        4ywwNBB75Njz8qO9mveea8F1IQ==
X-Google-Smtp-Source: AK7set+AhG1msf0SDthK44D5NExgEp0Wr5rtPccuuoGRlUviAuaA3sd3k1qgdVUDkbL5OHclJRzWAg==
X-Received: by 2002:a05:600c:5386:b0:3df:9858:c039 with SMTP id hg6-20020a05600c538600b003df9858c039mr3047558wmb.14.1676463857583;
        Wed, 15 Feb 2023 04:24:17 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003dc492e4430sm2015269wms.28.2023.02.15.04.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 04:24:17 -0800 (PST)
Date:   Wed, 15 Feb 2023 14:24:15 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Kevin Groeneveld <kgroeneveld@lenbrook.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: fix recalc_rate for negative kdiv
Message-ID: <Y+zO7/GBurZwihOJ@linaro.org>
References: <20221210203835.9714-1-kgroeneveld@lenbrook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210203835.9714-1-kgroeneveld@lenbrook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-12-10 15:38:35, Kevin Groeneveld wrote:
> kdiv is a signed 16 bit value in the DEV_CTL1 register. Commit
> 53990cf9d5b4 ("clk: imx: pll14xx: consolidate rate calculation") changed
> the kdiv variable from a short int to just int. When the value read from
> the DIV_CTL1 register is assigned directly to an int the sign of the value
> is lost resulting in incorrect results when the value is negative. Adding
> a s16 cast to the register value fixes the issue.
> 
> Fixes: 53990cf9d5b4 ("clk: imx: pll14xx: consolidate rate calculation")
> Signed-off-by: Kevin Groeneveld <kgroeneveld@lenbrook.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

Stephen, can you pick this up through fixes?
> ---
>  drivers/clk/imx/clk-pll14xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 1d0f79e9c346..d12194d17b10 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -254,7 +254,7 @@ static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
>  
>  	if (pll->type == PLL_1443X) {
>  		pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> -		kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
> +		kdiv = (s16)FIELD_GET(KDIV_MASK, pll_div_ctl1);
>  	} else {
>  		kdiv = 0;
>  	}
> -- 
> 2.17.1
> 
