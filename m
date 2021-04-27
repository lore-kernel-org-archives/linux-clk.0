Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9DBCC433B4
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 16:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DBD6613D9
	for <linux-clk@archiver.kernel.org>; Tue, 27 Apr 2021 16:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhD0Q5H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Apr 2021 12:57:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbhD0Q5A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Apr 2021 12:57:00 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBEEC061574
        for <linux-clk@vger.kernel.org>; Tue, 27 Apr 2021 09:56:15 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id g4-20020a9d6b040000b029029debbbb3ecso22926734otp.7
        for <linux-clk@vger.kernel.org>; Tue, 27 Apr 2021 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QRk2LvR9iUeYUREemfpr9zlZCwG60wzOzlEIrhDF+Sg=;
        b=Mg+t1ygXrSkyxRN21CcAGfN2N/VQdb4dgdgUfkavIbfI2gQgU7S8Nbe51ZwxofMVDU
         DYxBPwjRWZ9tS+Ug6DYhw2NAiUv7Uslduh4g+ydfGiIYOYTm/odkCkywuPwLZvHhj001
         Nj76hMs3eS3KfwykOKdI2OhQ9LHIhLJEa84Ta/11rYHscKb0aXmkdvrQWm8lFW9/FG8q
         nAyilNN4zPagDYfM4X7VhKJ1MgX3WwBwb1a6EpknAj709oogxffAOByohP4Q44tOELnZ
         bffkB0gpXwabU1fluAFKfXzyPFet69d8VhnZp1pwISPsVuVy1ffFomb3a2pu7YyCEwsj
         R44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QRk2LvR9iUeYUREemfpr9zlZCwG60wzOzlEIrhDF+Sg=;
        b=sxVX80cHiTr5FSR8YfYox9A2/Af28rhFEcD+Z2GlG4uyAGaoq5OhZvtCQK2w7JNYZh
         +UF4nqF3NuJ4G07d3OCPNXp4+dqw/B6vE5CwmnUgf03/gujEysI2LtUPlDSYagXxBZSh
         nweINt0KeLZNH3VJRjC72/kFj++eU0shSkxgoiYMxmPLyNueetNKBqcseW/43VvOR/sp
         MxJO7wAOZD7Dr3aZP9CHVqGexVVWepvReTtoAVXgQC9PBhhZCCZk/GChqrNp5HLocPbv
         yhpR/dWgqHB64kUelIDPLog7/UTelPUIqGOeJQfSTaNfoOVIA0cPbmj2jpuFZqYOIUdU
         WS7A==
X-Gm-Message-State: AOAM531X2oQSkOUzpMDYYlvZ/R5CwoF6oD1Qqw5CeL1lX4kByFYczdtl
        ULc17LRM/fUZESXPoMOO9omTHQ==
X-Google-Smtp-Source: ABdhPJx6aYECW2V68OVpAtpfvKHO13slnZFmPrq/7DqZK4gwjAfbgfVW4NSwSDtRTK5yExrvhCPV2g==
X-Received: by 2002:a05:6830:2004:: with SMTP id e4mr20470372otp.78.1619542574606;
        Tue, 27 Apr 2021 09:56:14 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q189sm90658oih.25.2021.04.27.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Apr 2021 09:56:14 -0700 (PDT)
Date:   Tue, 27 Apr 2021 11:56:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Uwe Kleine-K?nig <uwe@kleine-koenig.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Simplify usage of dev_err_probe()
Message-ID: <20210427165612.GH1908499@yoga>
References: <20210427164522.2886825-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210427164522.2886825-1-uwe@kleine-koenig.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 27 Apr 11:45 CDT 2021, Uwe Kleine-K?nig wrote:

> dev_err_probe() returns the error code passed as second parameter. Also if
> the error code is -EPROBE_DEFER dev_err_probe() is silent, so there is no
> need to check for this value before calling dev_err_probe().
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
>  drivers/clk/qcom/apcs-sdx55.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/clk/qcom/apcs-sdx55.c b/drivers/clk/qcom/apcs-sdx55.c
> index d0edabebf9c2..6810637f32e3 100644
> --- a/drivers/clk/qcom/apcs-sdx55.c
> +++ b/drivers/clk/qcom/apcs-sdx55.c
> @@ -56,10 +56,8 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	regmap = dev_get_regmap(parent, NULL);
> -	if (!regmap) {
> -		dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
> -		return -ENODEV;
> -	}
> +	if (!regmap)
> +		return dev_err_probe(dev, -ENODEV, "Failed to get parent regmap\n");
>  
>  	a7cc = devm_kzalloc(dev, sizeof(*a7cc), GFP_KERNEL);
>  	if (!a7cc)
> @@ -80,19 +78,15 @@ static int qcom_apcs_sdx55_clk_probe(struct platform_device *pdev)
>  	a7cc->parent_map = apcs_mux_clk_parent_map;
>  
>  	a7cc->pclk = devm_clk_get(parent, "pll");
> -	if (IS_ERR(a7cc->pclk)) {
> -		ret = PTR_ERR(a7cc->pclk);
> -		if (ret != -EPROBE_DEFER)
> -			dev_err_probe(dev, ret, "Failed to get PLL clk\n");
> -		return ret;
> -	}
> +	if (IS_ERR(a7cc->pclk))
> +		return dev_err_probe(dev, PTR_ERR(a7cc->pclk),
> +				     "Failed to get PLL clk\n");
>  
>  	a7cc->clk_nb.notifier_call = a7cc_notifier_cb;
>  	ret = clk_notifier_register(a7cc->pclk, &a7cc->clk_nb);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to register clock notifier\n");
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to register clock notifier\n");
>  
>  	ret = devm_clk_register_regmap(dev, &a7cc->clkr);
>  	if (ret) {
> -- 
> 2.30.2
> 
