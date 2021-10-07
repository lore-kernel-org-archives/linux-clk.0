Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC3DC433F5
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 15:09:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB67C61175
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 15:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242262AbhJGPLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 11:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242339AbhJGPLh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 11:11:37 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81609C061746
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 08:09:43 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id c6-20020a9d2786000000b005471981d559so7853559otb.5
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 08:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FYo7EHL9Mnnw2Pbk+sbyOdAsnHyB2q2PGgm3gbch2Zs=;
        b=GSAPPny7p8tF7CCsB6kbvbd2ym7QhbkVo/wy5rOviFww/h4f1kDF4kIISUlaHF4W2G
         xzLmY5ZtE9Hnc6Q7o/Z24Ql/OFV7QnoMHyk/XUqsHdtdq0kwCk+hoYECOZ1aaSVZ+rdT
         EugahHFFl4QD/SPU9buzW2KTceq7iMOLgDD1p3TSlj8GQJgOsujSTkmwnjK1EkPCLAao
         k+x1UzWJjbtpezKU+yLgx3t66xaNGBZpKsOYi4+sTmNROrmzuIjsGQUMttff3wKTfExp
         Wcxre0Qtba9lOpqWQTrjyjfo2V1bogeZRk1B8p20vKti4yIX+ONu+JHz+gNGX+CF7ekG
         URlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FYo7EHL9Mnnw2Pbk+sbyOdAsnHyB2q2PGgm3gbch2Zs=;
        b=clnaT39BQ/UI0bbpm+FQTFEK1mNIHKn+CZE5SKJl8ngKClNMYMSXm/laLC/94+MfNU
         uZF4Y9Qm6po8TJP52/NAT1SEwfyYdVHba1ECNavmwqHkelqiLKpv1/xf5W+UEiiIqpqR
         7KFNkq3F6HymSVqVrdfdcSxGGIVvUNwF9pDeK8OYf7SU9MSOxrniehyGKwmjvKKyz49n
         yBm8f6RU+xHdR4fm6qDne3sztYR5JVGJRCDjjiD6s+81MRDfYe49kEyDlXLcck1ac9Lg
         8ArozBfunR5JALow1xoTqA3JLZA617QGDwxZBKTxryq+ymzBE3CiV0GmSJ9mRdehaILv
         pv7w==
X-Gm-Message-State: AOAM53032ptNTlN9MsESS80oXP1AYB1ptxr73sQ9g8H3yhO7wX53RhQa
        qe8Hr9hoZUfYpPORjWAU0tsQ7w==
X-Google-Smtp-Source: ABdhPJwfQ6v0FMSxUb9rF8iRJwwenr7bymU5Cb6SGJlz3nh/XOmbJu6ChIlLPj1/n+hssOFvTFsJPg==
X-Received: by 2002:a05:6830:1ae3:: with SMTP id c3mr2025514otd.185.1633619382749;
        Thu, 07 Oct 2021 08:09:42 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id j10sm4623946oog.39.2021.10.07.08.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 08:09:42 -0700 (PDT)
Date:   Thu, 7 Oct 2021 08:11:22 -0700
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
Subject: Re: [PATCH v7 5/8] clk: qcom: gdsc: enable optional power domain
 support
Message-ID: <YV8OGqMMEUu4mZLu@ripper>
References: <20210829154757.784699-1-dmitry.baryshkov@linaro.org>
 <20210829154757.784699-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210829154757.784699-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun 29 Aug 08:47 PDT 2021, Dmitry Baryshkov wrote:

> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Currently we use a regulator to enable this domain on demand,
> however this has some consequences, as genpd code is not reentrant.
> 
> Make gdsc code also use pm_runtime calls to ensure that registers are
> accessible during the gdsc_enable/gdsc_disable operations.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/gdsc.c | 51 ++++++++++++++++++++++++++++++++++++++---
>  drivers/clk/qcom/gdsc.h |  2 ++
>  2 files changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 4ece326ea233..7e1dd8ccfa38 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/reset-controller.h>
> @@ -50,6 +51,22 @@ enum gdsc_status {
>  	GDSC_ON
>  };
>  
> +static int gdsc_pm_runtime_get(struct gdsc *sc)
> +{
> +	if (!sc->dev)
> +		return 0;
> +
> +	return pm_runtime_resume_and_get(sc->dev);
> +}
> +
> +static int gdsc_pm_runtime_put(struct gdsc *sc)
> +{
> +	if (!sc->dev)
> +		return 0;
> +
> +	return pm_runtime_put_sync(sc->dev);
> +}
> +
>  /* Returns 1 if GDSC status is status, 0 if not, and < 0 on error */
>  static int gdsc_check_status(struct gdsc *sc, enum gdsc_status status)
>  {
> @@ -232,9 +249,8 @@ static void gdsc_retain_ff_on(struct gdsc *sc)
>  	regmap_update_bits(sc->regmap, sc->gdscr, mask, mask);
>  }
>  
> -static int gdsc_enable(struct generic_pm_domain *domain)
> +static int _gdsc_enable(struct gdsc *sc)
>  {
> -	struct gdsc *sc = domain_to_gdsc(domain);
>  	int ret;
>  
>  	if (sc->pwrsts == PWRSTS_ON)
> @@ -290,11 +306,22 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>  	return 0;
>  }
>  
> -static int gdsc_disable(struct generic_pm_domain *domain)
> +static int gdsc_enable(struct generic_pm_domain *domain)
>  {
>  	struct gdsc *sc = domain_to_gdsc(domain);
>  	int ret;
>  
> +	ret = gdsc_pm_runtime_get(sc);
> +	if (ret)
> +		return ret;
> +
> +	return _gdsc_enable(sc);
> +}
> +
> +static int _gdsc_disable(struct gdsc *sc)
> +{
> +	int ret;
> +
>  	if (sc->pwrsts == PWRSTS_ON)
>  		return gdsc_assert_reset(sc);
>  
> @@ -329,6 +356,18 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>  	return 0;
>  }
>  
> +static int gdsc_disable(struct generic_pm_domain *domain)
> +{
> +	struct gdsc *sc = domain_to_gdsc(domain);
> +	int ret;
> +
> +	ret = _gdsc_disable(sc);
> +
> +	gdsc_pm_runtime_put(sc);
> +
> +	return ret;
> +}
> +
>  static int gdsc_init(struct gdsc *sc)
>  {
>  	u32 mask, val;
> @@ -443,6 +482,8 @@ int gdsc_register(struct gdsc_desc *desc,
>  	for (i = 0; i < num; i++) {
>  		if (!scs[i])
>  			continue;
> +		if (pm_runtime_enabled(dev))
> +			scs[i]->dev = dev;
>  		scs[i]->regmap = regmap;
>  		scs[i]->rcdev = rcdev;
>  		ret = gdsc_init(scs[i]);
> @@ -457,6 +498,8 @@ int gdsc_register(struct gdsc_desc *desc,
>  			continue;
>  		if (scs[i]->parent)
>  			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> +			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
>  	}
>  
>  	return of_genpd_add_provider_onecell(dev->of_node, data);
> @@ -475,6 +518,8 @@ void gdsc_unregister(struct gdsc_desc *desc)
>  			continue;
>  		if (scs[i]->parent)
>  			pm_genpd_remove_subdomain(scs[i]->parent, &scs[i]->pd);
> +		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> +			pm_genpd_remove_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
>  	}
>  	of_genpd_del_provider(dev->of_node);
>  }
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 5bb396b344d1..702d47a87af6 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -25,6 +25,7 @@ struct reset_controller_dev;
>   * @resets: ids of resets associated with this gdsc
>   * @reset_count: number of @resets
>   * @rcdev: reset controller
> + * @dev: the device holding the GDSC, used for pm_runtime calls
>   */
>  struct gdsc {
>  	struct generic_pm_domain	pd;
> @@ -58,6 +59,7 @@ struct gdsc {
>  
>  	const char 			*supply;
>  	struct regulator		*rsupply;
> +	struct device 			*dev;
>  };
>  
>  struct gdsc_desc {
> -- 
> 2.33.0
> 
