Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A51C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  9 Dec 2021 18:39:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhLISmw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Dec 2021 13:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbhLISmv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Dec 2021 13:42:51 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1730EC061746
        for <linux-clk@vger.kernel.org>; Thu,  9 Dec 2021 10:39:18 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so7093886oto.13
        for <linux-clk@vger.kernel.org>; Thu, 09 Dec 2021 10:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3Sn2+7MDJO3cjYGn8rzHVVGgbKOroIrbj25OALkURQ0=;
        b=RektemzBcVJ+OueCG11Q6mbEt6SCJb7yk7K91WMvCsuwEMclDw/TOu/ALHkvDw3hNN
         kxTVvwm1IQoOxovWXmYhvy4pdIsCw4OOQyALJjbinC2YiwccJ4flSBKzY+hiiebrv+5H
         enlqMV75rl46RgdtkHjz9cCbI7PZDE0nUtbu4le7R6JZa3rJVB3Yr10o+1WhjGxGrL/e
         ZMMiemBidsR6lqLO1TppJO6fyMBpzhwTgM5oc4BalhZQbYgBNnCk9CkdQ9z0KcE5xr4b
         7eHJGDbb/jNVuZpoHOpZRUwSXYW9S5O/IxnL1EnKE9/k6QljKqZfXb59IxqsFLFgxD8w
         y/fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3Sn2+7MDJO3cjYGn8rzHVVGgbKOroIrbj25OALkURQ0=;
        b=7Y+OYvvVK1TWW+S/LOvi6Jvr4r9JRKe6QY5/A49CX7bhg3EohOFDmTgqxVUULp5kmd
         4qJk7keCyiawQSNDbWMwaMq/5z4BKKCgs6PimvZR0aSLRGIynvDcKhRukqDuZ8hKycVz
         BO0Sp2ORbZpyHh6CDgXRBAajRzvL6sYd+4lpRjl4ADeK7/yb6Ez5JIwp+FMIEctR/xXZ
         u1Yx3yV0i/4vmrWIi9ns0BoE30r3fGC8K4Sor6g+02cU8d3BM2VjzkskJavqz3KV06K8
         x9E1/SQoWQMXH6b/JJPIhqbGu0mXvZ47ovuzpwzwHXo9PxxHv1VVkKrsjB2sqyQl9Wep
         dfig==
X-Gm-Message-State: AOAM530whRVDmc3AJtkgAlfDNCup3YxbtfNztMrWJQhM38jn3mEsGWGl
        VMGjmRNh1IwKs4vHtt6m7Q3XSw==
X-Google-Smtp-Source: ABdhPJxz1XTm0VpC6tKn9XVTH26bVDpJeZGMyEZWt8PIxc/YVR1WqWX9PkiTbHf0xBp/2srjqBx/AQ==
X-Received: by 2002:a05:6830:2806:: with SMTP id w6mr6980232otu.382.1639075157381;
        Thu, 09 Dec 2021 10:39:17 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id bg38sm143272oib.40.2021.12.09.10.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 10:39:16 -0800 (PST)
Date:   Thu, 9 Dec 2021 10:40:39 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park
 disp_cc_mdss_mdp_clk_src
Message-ID: <YbJNp+tnD6kEQAzt@ripper>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:

> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> was enabled by the bootloader, part it to the TCXO clock source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 735adfefc379..f2afbba7bc72 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
>  
>  	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>  
> +	/* Park disp_cc_mdss_mdp_clk_src */
> +	clk_rcg2_park_safely(regmap, 0x2088, 0);

Today booting the system with "clk_ignore_unused" will give you a
working efifb up until the point where the display driver kicks in and
reinitializes the hardware state - which during development might be
indefinite.

If we blindly cut the mdp_clk_src here that will no longer be possible.

Regards,
Bjorn

> +
>  	/* Enable hardware clock gating for DSI and MDP clocks */
>  	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
>  
> -- 
> 2.33.0
> 
