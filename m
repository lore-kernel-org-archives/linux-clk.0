Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50026E92719
	for <linux-clk@archiver.kernel.org>; Thu,  5 Oct 2023 17:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbjJERkJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Oct 2023 13:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbjJERkB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Oct 2023 13:40:01 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6CBDE
        for <linux-clk@vger.kernel.org>; Thu,  5 Oct 2023 10:39:49 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c6052422acso12755ad.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Oct 2023 10:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696527589; x=1697132389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IXODrEGswDBHgZt3EC36Idp+LKyU6nTpAzOo1uX2Tbo=;
        b=cvpAYGbp30c0Q9flMLgxUpDsjTg3LMfeWkl8mAJ+UjYblZUZbG4AHF3pQu8KK5e6nn
         WF2MqzPQ2/TplzXSz8axz/XmxzdsqIPTTyZG2boReLy7qR4Ryzs6lyJjCE6jxYZFJF9g
         csnIc7QpU/OLhI9OVS4V3yptopGOnkner2hZRviR9iboUgRseGrZrnPyfx7FvcO0WS+j
         edUy9MCfUmpn78J401oOGAD6+iw2OF3F3WnIT+ZUZGilY9HJ0BGDNpqXL6uwt0QKfOEP
         XmLyQYanXINmSdAMKwZhqfGvgURLcC7HcWlGlwaV+GwmsPpcQSpfkMDpDWAvQB2svv/g
         tSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696527589; x=1697132389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXODrEGswDBHgZt3EC36Idp+LKyU6nTpAzOo1uX2Tbo=;
        b=Jnrjf0YWm34H013iGyEeOFYRn9KDnWcx0vFsZL01+7x4MY84ZqeNGS/zntVdU7hxXW
         NYcdzisJgsqPob0y/1AmnuWNDWpKYikQHjAcCLCuxKz5TkSIzxpbcYdvi9+dyyQ3ICDl
         +NJfyzKE+DCrqUlPuquwSo9s/6LwJwS3Cm/8Whzeg8f+ulwrSWi50wKv2e1WNgsnvxQy
         jJfQbcOmhhCvi/FbMfxpiC9XOPzvNdJ+06iVtvPI8jMq8V4t5LMBq0DXgB9LoSM2kro3
         EF13tKAGfXh2nUYVHs44HfhfFk1pGsRsLSSMLFf8Fwi4Go2/SYr49HQ9GikiPTBy68IL
         9F2g==
X-Gm-Message-State: AOJu0YyXsJQCSGwnzy+Gpw0ul8IhcSOJJrP1P+1ufwtKSRyzQqGK59sf
        e9lhDbrcb2AsiVALPJElMabBbg==
X-Google-Smtp-Source: AGHT+IFvigfflXUA9HwY9N7eYv+zsvKrsN9xemzqOgeiVvG2YkDU2e3seNYkty+sv2qmvZvZeQ4iYQ==
X-Received: by 2002:a17:902:d4c8:b0:1c3:5df4:a778 with SMTP id o8-20020a170902d4c800b001c35df4a778mr161516plg.13.1696527588397;
        Thu, 05 Oct 2023 10:39:48 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902c11300b001b896686c78sm2005265pli.66.2023.10.05.10.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 10:39:47 -0700 (PDT)
Date:   Thu, 5 Oct 2023 10:39:44 -0700
From:   William McVicker <willmcvicker@google.com>
To:     Peter Griffin <peter.griffin@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com
Subject: Re: [PATCH 12/21] clk: samsung: clk-pll: Add support for
 pll_{0516,0517,518}
Message-ID: <ZR704FEUwYpq5sFJ@google.com>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
 <20231005155618.700312-13-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005155618.700312-13-peter.griffin@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/05/2023, Peter Griffin wrote:
> Thesee plls are found in the Tensor gs101 SoC found in the Pixel 6.

nit: Thesee -> These

> 
> pll0516x: Integrer PLL with high frequency
> pll0517x: Integrer PLL with middle frequency
> pll0518x: Integrer PLL with low frequency

nit: Integrer -> Integer?

Regards,
Will

> 
> PLL0516x
> FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)
> 
> PLL0517x and PLL0518x
> FOUT = (MDIV * FIN)/PDIV*2^SDIV)
> 
> The PLLs are similar enough to pll_0822x that the same code can handle
> both. The main difference is the change in the fout formula for the
> high frequency 0516 pll.
> 
> Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
> MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.
> 
> When defining the PLL the "con" parameter should be set to CON3
> register, like this
> 
> PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>     PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
>     NULL),
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/clk-pll.c | 9 ++++++++-
>  drivers/clk/samsung/clk-pll.h | 3 +++
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 74934c6182ce..4ef9fea2a425 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
>  	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
>  	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
>  
> -	fvco *= mdiv;
> +	if (pll->type == pll_0516x)
> +		fvco = fvco * 2 * mdiv;
> +	else
> +		fvco *= mdiv;
> +
>  	do_div(fvco, (pdiv << sdiv));
>  
>  	return (unsigned long)fvco;
> @@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>  	case pll_1417x:
>  	case pll_0818x:
>  	case pll_0822x:
> +	case pll_0516x:
> +	case pll_0517x:
> +	case pll_0518x:
>  		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
>  		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
>  		if (!pll->rate_table)
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index 0725d485c6ee..ffd3d52c0dec 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -38,6 +38,9 @@ enum samsung_pll_type {
>  	pll_0822x,
>  	pll_0831x,
>  	pll_142xx,
> +	pll_0516x,
> +	pll_0517x,
> +	pll_0518x,
>  };
>  
>  #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
> -- 
> 2.42.0.582.g8ccd20d70d-goog
> 
