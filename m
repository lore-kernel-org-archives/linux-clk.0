Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63BF0C56201
	for <linux-clk@archiver.kernel.org>; Sun, 22 Nov 2020 04:21:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0230520781
	for <linux-clk@archiver.kernel.org>; Sun, 22 Nov 2020 04:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gF+/WXrZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbgKVEVQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Nov 2020 23:21:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgKVEVQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Nov 2020 23:21:16 -0500
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com [IPv6:2607:f8b0:4864:20::c42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B99C0613D2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2020 20:21:15 -0800 (PST)
Received: by mail-oo1-xc42.google.com with SMTP id y3so3202324ooq.2
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2020 20:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OYohcQP098ylvBYISkee6mm40H7Iz7E4qk9gVli2edU=;
        b=gF+/WXrZzx5XpcYakXWPQ+oU06Gsa9hIFUAfMhzRCPUZ/HZf2820Zlqj7eNff86FqI
         hN09KUnDQoPTAs+wXn5+UigHnS5hcwLx2UHakXmaxutidYRb0CnSjn+AQSd93ce5YlV5
         ZbCDDf2mlyD5ZD/9x/vVn0p3Eu7+ihJmEGc8BIBH1uCHo8XCIXneFRh+Ci0CxJmZALeV
         shqdS6J65s66jtL5u7N2LqYveWlA212pSus56NW2L68dxChLmcOq1HH9GzpPvgFCzlX3
         WDUt4GZzYsi7dLPCkc0JrJs1L3UwqW828DM98e/O7GTr/A+Vc29Oo2ix16JbBWoUMVOw
         7PfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OYohcQP098ylvBYISkee6mm40H7Iz7E4qk9gVli2edU=;
        b=PEPe3z6wijzUH+oGZJWP/SorQhzdzs4D+8fKcLelgreajW+703LId2gle8QILpddAx
         TkqXOxhKdUjl7ke7hQxcnv90G0z5Kr/U7acdKrMWmV9k5+E+BNCDSkzYzB7c1dUYZy6k
         NR5ILunnnuCuMTuW/se6D/RaOZcY9s1hRi+gNp4p3czMxfeWgoygDMcR2qJFSs3AZFSH
         qIF6aZyljMZCZEcGx0DLx9MKHNyeogQzgzjuUl4VQGMJwjiIe7uDjCETWBQaPfQ3KLQy
         cs9tJu5E064ElWtIqehTDNlsCjQhyyRP82o7j36o1v6vQTQcEhR+bHDMqQIA2dNFmXKY
         Ostw==
X-Gm-Message-State: AOAM532hHWSuigzp8FBxyJQrp1qyqqXBcGd3ZIoOGcZX12k6sk9sYjce
        wX5Hseok4f8BZUul9SsVckpbpmLQI3gyKA==
X-Google-Smtp-Source: ABdhPJyw+lA5KBgYAes6cikhFdSosDtOcl6zRLvK1AJiOWPdXkJeWMvILDdxySvNLQKwzZhq/81C6g==
X-Received: by 2002:a4a:5857:: with SMTP id f84mr18792335oob.34.1606018875244;
        Sat, 21 Nov 2020 20:21:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q132sm4794180oia.46.2020.11.21.20.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 20:21:14 -0800 (PST)
Date:   Sat, 21 Nov 2020 22:21:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Taniya Das <tdas@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH] clk: qcom: camcc-sc7180: Use runtime PM ops instead of
 clk ones
Message-ID: <20201122042112.GF95182@builder.lan>
References: <20201114174408.579047-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201114174408.579047-1-sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 14 Nov 11:44 CST 2020, Stephen Boyd wrote:

> Let's call pm_runtime_get() here instead of calling the PM clk APIs
> directly. This avoids a compilation problem on CONFIG_PM=n where the
> pm_clk_runtime_{resume,suspend}() functions don't exist and covers the
> intent, i.e. enable the clks for this device so we can program PLL
> settings.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Taniya Das <tdas@codeaurora.org>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Fixes: 15d09e830bbc ("clk: qcom: camcc: Add camera clock controller driver for SC7180")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/camcc-sc7180.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
> index f51bf5b6decc..dbac5651ab85 100644
> --- a/drivers/clk/qcom/camcc-sc7180.c
> +++ b/drivers/clk/qcom/camcc-sc7180.c
> @@ -1669,16 +1669,14 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
>  		goto disable_pm_runtime;
>  	}
>  
> -	ret = pm_clk_runtime_resume(&pdev->dev);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev, "pm runtime resume failed\n");
> +	ret = pm_runtime_get(&pdev->dev);
> +	if (ret)
>  		goto destroy_pm_clk;
> -	}
>  
>  	regmap = qcom_cc_map(pdev, &cam_cc_sc7180_desc);
>  	if (IS_ERR(regmap)) {
>  		ret = PTR_ERR(regmap);
> -		pm_clk_runtime_suspend(&pdev->dev);
> +		pm_runtime_put(&pdev->dev);
>  		goto destroy_pm_clk;
>  	}
>  
> @@ -1688,9 +1686,7 @@ static int cam_cc_sc7180_probe(struct platform_device *pdev)
>  	clk_fabia_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
>  
>  	ret = qcom_cc_really_probe(pdev, &cam_cc_sc7180_desc, regmap);
> -
> -	pm_clk_runtime_suspend(&pdev->dev);
> -
> +	pm_runtime_put(&pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "Failed to register CAM CC clocks\n");
>  		goto destroy_pm_clk;
> -- 
> https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
> 
