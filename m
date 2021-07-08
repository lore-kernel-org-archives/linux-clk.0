Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA0DC07E96
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jul 2021 04:03:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3831361CC4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Jul 2021 04:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhGHEFv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Jul 2021 00:05:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhGHEFu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Jul 2021 00:05:50 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68054C061574
        for <linux-clk@vger.kernel.org>; Wed,  7 Jul 2021 21:03:09 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 59-20020a9d0ac10000b0290462f0ab0800so4533971otq.11
        for <linux-clk@vger.kernel.org>; Wed, 07 Jul 2021 21:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LI3mWvB8lqUFGvKYUXsvMTLD9MEpZDie47p/GO3vV7o=;
        b=dfDisRytYYc6d3VLj+BMhvLmtLfEklteHqskcBCPXxy4TdDU2KNo8oUc1tdtzSMU18
         0g8z9h1Yg6I82liAWNJOnBZzRLfXTOXCRNX71n521CkwN5feUYd/EjOeC26eHQ+UC79A
         KgZUVuk8RgQ7plPKn+DF+MTn8lAN28ZZSaXoOYqgANNQJmLshvBu8zNKSYUxnha0BPIk
         6XvJpq1mJT9ILgODnZ78ZhcxlhsCD/rgmwQym6Si+wDtXad0dXSIbzH+At23qZH0CrWr
         YI0853Z16xoA6bzhyaNSYUt9WGBg1PlfmjWvGpbJrIjsLtWMNiCQzsJNlpJ0p6/oCMOQ
         /G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LI3mWvB8lqUFGvKYUXsvMTLD9MEpZDie47p/GO3vV7o=;
        b=Tz3QSs5gnzdgTwgwLsRwlvV6zYADtQNBXv9bGn7ii9nmBgdiCwJsF6RfjzJ316lXnz
         KoE2Q//Cf5V/QcRdDMLeiNKiO3l447OMG64Z+r9RIKRGuH0ZUJXjbGMNjDYkzZ0snPIp
         Kf882fyaDXnJIeZg9ob0lgIxki1TPZGBjKVO22mnXntNMK46QWMYhPIOC9ieVUPV99Gg
         nvtOo7qJ6ZuQRL5RWsGTgzxZs/s9HE+Ipv7HZnt9SYzhD/Kke/Plafu+LrLVlA61FFED
         2n5XZ6Dq3boTkzJ13/sdhJTjM8ioxLwZZJ+y43+DgWDEk/lOYIZ8u28mqGZaEm+LyAAT
         dx9g==
X-Gm-Message-State: AOAM532o2Wm5HwuISOWcZ3qnnFSUNlP7u5GX1Ja7E+HC5w5ImnmEIz2y
        jXKASAEZAFy2Pi7DSbTu7gQAxA==
X-Google-Smtp-Source: ABdhPJxhFdzn1V5BN2rsi6/9LciGzGQyVOAZEWx2F9EgznLWW75+n9cE4ygA1eiC1sIthtWvESEn2Q==
X-Received: by 2002:a05:6830:22d6:: with SMTP id q22mr21753964otc.40.1625716988743;
        Wed, 07 Jul 2021 21:03:08 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h3sm265711oti.34.2021.07.07.21.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 21:03:08 -0700 (PDT)
Date:   Wed, 7 Jul 2021 23:03:06 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        dmitry.baryshkov@linaro.org, jonathan@marek.ca,
        robert.foss@linaro.org
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm8250: Fix absent mmcx regulator
 reference
Message-ID: <YOZ4+ptO+eQbmxal@yoga>
References: <20210708010839.692242-1-bryan.odonoghue@linaro.org>
 <20210708010839.692242-2-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210708010839.692242-2-bryan.odonoghue@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 07 Jul 20:08 CDT 2021, Bryan O'Donoghue wrote:

> The current implementation omits the necessary mmcx supply, which means if
> you are running the code for this block and a prior clock driver, like say
> the videocc hasn't run, then a reset will be generated the first time we
> touch these registers.
> 
> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver for SM8250")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

camcc isn't enabled in the upstream dts yet and I expect that we're
going to conclude on defining these GDSCs as subdomains of the cc's
power-domain in time for v5.15.

I don't mind if Stephen picks this to make sure the driver is
functional, but I will hold off on the dts change.

Regards,
Bjorn

> ---
>  drivers/clk/qcom/camcc-sm8250.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 439eaafdcc86..c51112546bfc 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -2212,6 +2212,7 @@ static struct gdsc bps_gdsc = {
>  	},
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc ipe_0_gdsc = {
> @@ -2221,6 +2222,7 @@ static struct gdsc ipe_0_gdsc = {
>  	},
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc sbi_gdsc = {
> @@ -2230,6 +2232,7 @@ static struct gdsc sbi_gdsc = {
>  	},
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc ife_0_gdsc = {
> @@ -2239,6 +2242,7 @@ static struct gdsc ife_0_gdsc = {
>  	},
>  	.flags = POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc ife_1_gdsc = {
> @@ -2248,6 +2252,7 @@ static struct gdsc ife_1_gdsc = {
>  	},
>  	.flags = POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct gdsc titan_top_gdsc = {
> @@ -2257,6 +2262,7 @@ static struct gdsc titan_top_gdsc = {
>  	},
>  	.flags = POLL_CFG_GDSCR,
>  	.pwrsts = PWRSTS_OFF_ON,
> +	.supply = "mmcx",
>  };
>  
>  static struct clk_regmap *cam_cc_sm8250_clocks[] = {
> -- 
> 2.30.1
> 
