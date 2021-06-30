Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3A6C11F68
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 17:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9DF0661477
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 17:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhF3RP3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 13:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232416AbhF3RP3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 13:15:29 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95E31C0617AD
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 10:13:00 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id e1-20020a0568200601b029024ea261f0ccso553355oow.2
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 10:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1PcDWvee9bUH7pg+nGywm20C3Cp3QodJWy+afb8JOg4=;
        b=cIVQP8WArttqeme2sjcZ5p4ey/hPMw7C47lQNAAXfh+TgLFvZMgc4dAVNb76VdHrqo
         0o1LvgQu77Iu5wN+p+6Sm5aWwBMJP5rFwqlCf2fPoX/TNYDeEYP2taD3GG+ILOmiDkJo
         xbGgLI9u8y/PSSR35Cuq2N0eXUzOec2jdUzlSPBrBxGu/jXE1eVhUO/wkM0NUuuAASBu
         0IKZQZ3Stf6CAWoJZBydu5Eo2s4E3GrOfbVOmKyc2v/6+/HR07/OeZOhkrlFNiZQbfPq
         dPhu2O+LwA8McwZ8/B605urviHFjj/bd1b8Acgp8++dpONRfbLHyL/2MPoHH1SZRTu+0
         89+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1PcDWvee9bUH7pg+nGywm20C3Cp3QodJWy+afb8JOg4=;
        b=ksNiV+HFXhrC106KDyArlZ1PjAJyrb+c3cbniD9/UJAkQxuLHprQnarN1BCNyenIWM
         /IE4hUQHDxd/jrsHG9UvYO5E4T0CauVxaHydYqxw2BcjsHmL2q0nhaNf1G0/JczcHi1N
         y+1Ms1qesUJWWLYPEAaerTheykuAY+eruHQDMDWJrlqTrtLoCC3lH0+JwMHYh66KXS3m
         gTXOQYobB74pUGtiEukyEm+H/L1ysy10fhb5Z6O0CTDI+SEVq9eF+uNPoJ03LiTnxBLW
         BmnWU62Pt6PTpo1TNCICSFxB6hEAXf9/zxinbOnjJMtQ3QUpbdc2Bvh7WHylW4kbqghX
         EdvA==
X-Gm-Message-State: AOAM5300CiSepzeBgRAaDu76R3BGLHmqAi4b5Ha7M30bgliSqx08bWez
        U6vFf5XKDzVyunEVLttO6zkQkg==
X-Google-Smtp-Source: ABdhPJwCIYAg8vaTdpP1GMZHBSZ8mMoWCn4ZsLh6dNl06XEl9BNV2v7msSvuVQEB3/NRA+0hFJvi8Q==
X-Received: by 2002:a4a:e709:: with SMTP id y9mr6124509oou.64.1625073179861;
        Wed, 30 Jun 2021 10:12:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v203sm4785401oib.37.2021.06.30.10.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 10:12:59 -0700 (PDT)
Date:   Wed, 30 Jun 2021 12:12:56 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] clk: qcom: dispcc-sm8250: stop using mmcx regulator
Message-ID: <YNymGEQnwGlFMaIr@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630133149.3204290-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:

> Now as the common qcom clock controller code has been taught about power
> domains, stop mentioning mmcx supply as a way to power up the clock
> controller's gdsc.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index de09cd5c209f..dfbfe64b12f6 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -955,7 +955,6 @@ static struct gdsc mdss_gdsc = {
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.flags = HW_CTRL,
> -	.supply = "mmcx",
>  };
>  
>  static struct clk_regmap *disp_cc_sm8250_clocks[] = {
> -- 
> 2.30.2
> 
