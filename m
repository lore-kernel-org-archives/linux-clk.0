Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DE1C25B07
	for <linux-clk@archiver.kernel.org>; Sat,  6 Aug 2022 15:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbiHFPK7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 6 Aug 2022 11:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiHFPK6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 Aug 2022 11:10:58 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73EB811441
        for <linux-clk@vger.kernel.org>; Sat,  6 Aug 2022 08:10:56 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id t2so5029449ply.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Aug 2022 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nEw8DioIsZsw9Lxm4vVux8Gwg2rPrBpy7AqY3jBwj5o=;
        b=kvIEr95+JwC4phiy+fhiYF624DS4Ow5MH7+uzZn5wz+Ks8YF8JxFn+GAL8kVLmo6ow
         yk9ltMX5Hi2V43eedL16SkRHH4qO9HnwyEsXRbQopCbzk6NY8mZ95MMXYZCet1bxWKap
         lW/BGLlod8p4oFFmifYZMUOFiOZRZteEzRl4tsSxS0ro3uQk7nHnpZqrFLQB5NpeatVB
         ET8W3mnqoZ/WhXI7Y1npeKBwRQhBNSBvvM+adhlh9OHP/45lO7diqBuGOnjZevykUtrK
         x+oPCLCftG3T2+DMvfPbi+Rzjwv8WnnNzgFO9pEpxVaHpl96YhfPz4HEX2MlyhaTLcH7
         LUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nEw8DioIsZsw9Lxm4vVux8Gwg2rPrBpy7AqY3jBwj5o=;
        b=Dv8fFXOAY7S/7i4UAFPoaCGzFVhL/AQl/o4yMxRE6qvejNEsqhWBBI9b5BADGhakop
         bdrLPj7J1N0DDXCQLPiCKh8fO56o08s1a5WJJILDublZhjqb0cMEAflaokd53/ThbW+H
         erU+qcKVH1a2MNE0n7INygtTba5dtUP9RcbwjThYqNgwLeDIdfwU4BnuYHhwet/oKqPi
         VZY/j0Fa8CZ+oNwidGvJXGkTtbGjN6L3A+AGMnhgeJnoyB4JTKjvjWhI/tTyhKM5KmsY
         NgRnZNzkQ5WRTatsRUJz4wSbBuXHY2/CO2vV31I50BN7GxWWVQQIWY8RUCs6/fw1msQW
         P/lw==
X-Gm-Message-State: ACgBeo3NM7IN3u/MklJ6AEPbOi0i+erxgEw8CKzoLM8vejI5yRVoICny
        wmyDH3p3KehHovLpJfQAjdA9
X-Google-Smtp-Source: AA6agR4VGRFre7BjReOSNXOBR3OOJN8Xe3WI6xX1+Bpm3cAkaTTVHaydbOlN72xeobkruUIlhMfrDw==
X-Received: by 2002:a17:90b:1c82:b0:1ee:eb41:b141 with SMTP id oo2-20020a17090b1c8200b001eeeb41b141mr13008438pjb.143.1659798655896;
        Sat, 06 Aug 2022 08:10:55 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d50400b0016f12cc0ecdsm5189798plg.274.2022.08.06.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 08:10:55 -0700 (PDT)
Date:   Sat, 6 Aug 2022 20:40:49 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: gcc-sc8280xp: keep PCIe power-domains always-on
Message-ID: <20220806151049.GI14384@thinkpad>
References: <20220805121250.10347-1-johan+linaro@kernel.org>
 <20220805121250.10347-2-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805121250.10347-2-johan+linaro@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 05, 2022 at 02:12:49PM +0200, Johan Hovold wrote:
> The Qualcomm PCIe driver does not yet implement suspend so to keep the
> PCIe power domains always-on for now to avoid crashing during resume.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/gcc-sc8280xp.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index a2f3ffcc5849..eaeada42e13a 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -6768,6 +6768,10 @@ static struct gdsc pcie_1_tunnel_gdsc = {
>  	.flags = VOTABLE,
>  };
>  
> +/*
> + * The Qualcomm PCIe driver does not yet implement suspend so to keep the
> + * PCIe power domains always-on for now.
> + */
>  static struct gdsc pcie_2a_gdsc = {
>  	.gdscr = 0x9d004,
>  	.collapse_ctrl = 0x52128,
> @@ -6776,7 +6780,7 @@ static struct gdsc pcie_2a_gdsc = {
>  		.name = "pcie_2a_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_2b_gdsc = {
> @@ -6787,7 +6791,7 @@ static struct gdsc pcie_2b_gdsc = {
>  		.name = "pcie_2b_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_3a_gdsc = {
> @@ -6798,7 +6802,7 @@ static struct gdsc pcie_3a_gdsc = {
>  		.name = "pcie_3a_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_3b_gdsc = {
> @@ -6809,7 +6813,7 @@ static struct gdsc pcie_3b_gdsc = {
>  		.name = "pcie_3b_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc pcie_4_gdsc = {
> @@ -6820,7 +6824,7 @@ static struct gdsc pcie_4_gdsc = {
>  		.name = "pcie_4_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = VOTABLE,
> +	.flags = VOTABLE | ALWAYS_ON,
>  };
>  
>  static struct gdsc ufs_card_gdsc = {
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
