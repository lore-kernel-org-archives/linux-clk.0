Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF606C3F6B0
	for <linux-clk@archiver.kernel.org>; Sat,  6 Aug 2022 15:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231879AbiHFPLb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 6 Aug 2022 11:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbiHFPLa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 6 Aug 2022 11:11:30 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E2D11449
        for <linux-clk@vger.kernel.org>; Sat,  6 Aug 2022 08:11:28 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id e8-20020a17090a280800b001f2fef7886eso5412326pjd.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Aug 2022 08:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uNTrR3FasBAQMZvag/1ZkGzsFnEubFSwQWW0r3u0bpQ=;
        b=jQ5Op+/wi+m8XJza4qwokAOyy6lXE5asFJMJUNbwRNcNEFIymmE49JGYoMBxEa7yff
         7Zn2/Vw7umKF49LZDQR2rRVFmvFRaAFxlneJSIPVwWzC2Txdr0kl6DyoVkzusbnE0vEf
         BMvCgLtiwiYBFUZDoy+Kb562hLp5EYX8c9dz1W23qthlaXP5gwaY//WB9bSY31t3lxzE
         f9d4imlmrLjUN/FDWnH8nzeRBNbqRQskfX/ghz0Qzbcp7bSGQpto4/P4EZ6sBxwR0ois
         utqMf/Xqdxk/ZJZ+Lhxs58LeOVsWZW8KCV08F4yrYtmZ981kWzLh1Lkbu7P3xvVfMJSa
         FfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uNTrR3FasBAQMZvag/1ZkGzsFnEubFSwQWW0r3u0bpQ=;
        b=TmEB8LZQjQjrta4tpXJrwMtt9a19WRp64Cq1ZRA/dA8fQhoW/h1nEHG3N1/OgtrGZW
         VQNKeuQF1aijkQlsD0v1aLQFLRW0zmhroX14iSHyEBGoCsY612ZUbomT+nvs4nAELZSF
         omKtFJcQoH5cjloPflZzshL1/LIcCHK9x5BgYLKfpByPyKfsjh9nnYeRMeBfTQLp4MjQ
         2aRWD3bCnuy2U3Ryxc8GO1d9/+o8aiZm5vyaeihK5pRNBznas5D13wWR6CygCncW1Nv+
         wL6bNXzrP1uPnknex6WsS5lAXhcCncPq2UvKrJxpUgVCJCWRLDNo+sLGCNegx8aXvmEl
         tUAg==
X-Gm-Message-State: ACgBeo26fjfBobM8tdDfrVBz7lS7KhNf8k7+N9JUsntTdsT5ZVDVSxUB
        QL7GLpGnq1UoWfn41Q8PtLN+
X-Google-Smtp-Source: AA6agR7euGOAJs8f5MZrGZbmyOv6YvxueyCIXdiOeuB6GdWkadVl1S4hXJs9RUyi9GHaw/tFkthvow==
X-Received: by 2002:a17:902:eac2:b0:16d:cce2:e5c6 with SMTP id p2-20020a170902eac200b0016dcce2e5c6mr11472074pld.149.1659798688431;
        Sat, 06 Aug 2022 08:11:28 -0700 (PDT)
Received: from thinkpad ([117.202.188.20])
        by smtp.gmail.com with ESMTPSA id bc10-20020a170902930a00b0016c454598b5sm5089919plb.167.2022.08.06.08.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 08:11:28 -0700 (PDT)
Date:   Sat, 6 Aug 2022 20:41:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: gcc-sc8280xp: keep USB power-domains always-on
Message-ID: <20220806151123.GJ14384@thinkpad>
References: <20220805121250.10347-1-johan+linaro@kernel.org>
 <20220805121250.10347-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805121250.10347-3-johan+linaro@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 05, 2022 at 02:12:50PM +0200, Johan Hovold wrote:
> The Qualcomm DWC3 driver suspend implementation appears to be incomplete
> for SC8280XP so keep the USB power domains always-on for now so that the
> controller survives a suspend cycle.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/gcc-sc8280xp.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index eaeada42e13a..7768e6901dcc 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -6843,12 +6843,17 @@ static struct gdsc ufs_phy_gdsc = {
>  	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
> +/*
> + * The Qualcomm DWC3 driver suspend implementation appears to be incomplete
> + * for sc8280xp so keep the USB power domains always-on for now.
> + */
>  static struct gdsc usb30_mp_gdsc = {
>  	.gdscr = 0xab004,
>  	.pd = {
>  		.name = "usb30_mp_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = ALWAYS_ON,
>  };
>  
>  static struct gdsc usb30_prim_gdsc = {
> @@ -6857,6 +6862,7 @@ static struct gdsc usb30_prim_gdsc = {
>  		.name = "usb30_prim_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = ALWAYS_ON,
>  };
>  
>  static struct gdsc usb30_sec_gdsc = {
> @@ -6865,6 +6871,7 @@ static struct gdsc usb30_sec_gdsc = {
>  		.name = "usb30_sec_gdsc",
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = ALWAYS_ON,
>  };
>  
>  static struct clk_regmap *gcc_sc8280xp_clocks[] = {
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
