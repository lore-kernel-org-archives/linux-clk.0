Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64CBFC11F68
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 15:00:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 486DF6142C
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 15:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235660AbhF3PDD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 11:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235504AbhF3PDC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 11:03:02 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80638C061756
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 08:00:32 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s17so3419838oij.0
        for <linux-clk@vger.kernel.org>; Wed, 30 Jun 2021 08:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FXVON6UbQqGkLPMTAZ705DncSqnWs/KJ6hi9B+B7iEA=;
        b=BCdSFyncUkYSn+RAF0inhWzw5hfvKsy7Rq0z3ymrOlxDRQcfr0eDprK5y8SLjpDKTm
         SRNifrQOzs0HIIabCQg6Uld3ud2rzdrF6rs/u/QTvpZ6d1SOSdtTImxeFRNaQbrAL304
         /TPfgoI1jGhhFWsc/9Od8Tc6jwnSSPaaqStGNwu6NLJ4XaQTwMgOBBQCZDaqKuc8Gkd0
         hf4nJ6EjpqNMeWsAD/wC37LRvfzg4cJojOtHhw3cJEEemY6LwA6/TSpkBPmxZe72YAS2
         f4ZYRL5ugiq6BiktJzU1CkeKHExwHjo+6XuCwmjU/m7eZdysVWtvbedIV9GtSUx68NAH
         MD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FXVON6UbQqGkLPMTAZ705DncSqnWs/KJ6hi9B+B7iEA=;
        b=EBvvAop/EnrJt412GfitWUgi1Lm1wGglpLOkzNkWM/oNnCHQz+vFPVQUSP1CQbwsPd
         C9b1ukp6PKxnNOnstchvpOkpwYl22A1x6wCy2kEcsVumCNjQJ0+MDxtdjVSAOU7rPW26
         iGBUzrhGfR3RLeMPAU1E4hXM4Pzg131xjeY6XQJt2hACevEDtXr3Pj80ZN8cgLwusDRy
         SYw2HuJVjp6Ot880gKMxLzGnxu8hA8MoHW1VSquV17GS9cFyhRmkLm/xXsFZCG0/5qGE
         H8qXXQ6l4aJdz8FJEpEVclVnyTHVL4z0xfJLNYSDYXbMyoRFrUVlc09RYv38bqLeSsRV
         Ixfw==
X-Gm-Message-State: AOAM531mwi7sZYo1/GFALpQLFe3JNRCO2OM9WRJrRfkJnMzFqBsODbFE
        jtF2Kb7+J1oJtpFurJRhq31MJw==
X-Google-Smtp-Source: ABdhPJzNKiXR125pZK+K/v/cxzouxQWFjeB5S15bysaD6y142DEGtsFzzZ9qxyZhOhDXKOlq9AZcEw==
X-Received: by 2002:aca:ad52:: with SMTP id w79mr12866589oie.86.1625065231559;
        Wed, 30 Jun 2021 08:00:31 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5sm4494248oot.29.2021.06.30.08.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jun 2021 08:00:30 -0700 (PDT)
Date:   Wed, 30 Jun 2021 10:00:28 -0500
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
Subject: Re: [PATCH 3/6] clk: qcom: gdsc: enable optional power domain support
Message-ID: <YNyHDAHk6ad/XCGl@yoga>
References: <20210630133149.3204290-1-dmitry.baryshkov@linaro.org>
 <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210630133149.3204290-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 30 Jun 08:31 CDT 2021, Dmitry Baryshkov wrote:

> On sm8250 dispcc and videocc registers are powered up by the MMCX power
> domain. Currently we used a regulator to enable this domain on demand,
> however this has some consequences, as genpd code is not reentrant.
> 
> Teach Qualcomm clock controller code about setting up power domains and
> using them for gdsc control.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

There's a proposal to add a generic binding for statically assigning a
performance states here:

https://lore.kernel.org/linux-arm-msm/1622095949-2014-1-git-send-email-rnayak@codeaurora.org/


But that said, do you really need this?

The requirement for driving MMCX to LOW_SVS on SM8250 (and NOM on
SM8150/SC8180x) seems to only come from the fact that you push MDP_CLK
to 460MHz in &mdss.

But then in &mdss_mdp you do the same using an opp-table based on the
actual MDP_CLK, which per its power-domains will scale MMCX accordingly.


So wouldn't it be sufficient to ensure that MDSS_GDSC is parented by
MMCX and then use opp-tables associated with the devices that scales the
clock and thereby actually carries the "required-opps".


I presume your testing indicates that it doesn't matter on sm8250, but
as stated above, 460MHz on sm8150/sc8180x requires nominal, so per your
suggestion we'd have to vote nominal in &mdss, which means that if the
DPU decides to go to 200MHz the &mdss will still keep the voltage at
NOM, even though the DPU's opp-table says that LOW_SVS is sufficient.

Regards,
Bjorn

> ---
>  drivers/clk/qcom/common.c | 55 ++++++++++++++++++++++++++++++++++-----
>  drivers/clk/qcom/gdsc.c   |  6 +++++
>  2 files changed, 55 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 60d2a78d1395..eeb5b8c93032 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -10,6 +10,8 @@
>  #include <linux/clk-provider.h>
>  #include <linux/reset-controller.h>
>  #include <linux/of.h>
> +#include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
>  
>  #include "common.h"
>  #include "clk-rcg.h"
> @@ -76,6 +78,16 @@ qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
>  	struct resource *res;
>  	struct device *dev = &pdev->dev;
>  
> +	if (of_find_property(dev->of_node, "required-opps", NULL)) {
> +		int pd_opp;
> +
> +		pd_opp = of_get_required_opp_performance_state(dev->of_node, 0);
> +		if (pd_opp < 0)
> +			return ERR_PTR(pd_opp);
> +
> +		dev_pm_genpd_set_performance_state(dev, pd_opp);
> +	}
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(base))
> @@ -224,6 +236,11 @@ static struct clk_hw *qcom_cc_clk_hw_get(struct of_phandle_args *clkspec,
>  	return cc->rclks[idx] ? &cc->rclks[idx]->hw : NULL;
>  }
>  
> +static void qcom_cc_pm_runtime_disable(void *data)
> +{
> +	pm_runtime_disable(data);
> +}
> +
>  int qcom_cc_really_probe(struct platform_device *pdev,
>  			 const struct qcom_cc_desc *desc, struct regmap *regmap)
>  {
> @@ -236,11 +253,28 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	struct clk_regmap **rclks = desc->clks;
>  	size_t num_clk_hws = desc->num_clk_hws;
>  	struct clk_hw **clk_hws = desc->clk_hws;
> +	bool use_pm = false;
>  
>  	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
>  	if (!cc)
>  		return -ENOMEM;
>  
> +	if (of_find_property(dev->of_node, "required-opps", NULL)) {
> +		use_pm = true;
> +
> +		pm_runtime_enable(dev);
> +		ret = pm_runtime_get_sync(dev);
> +		if (ret < 0) {
> +			pm_runtime_put(dev);
> +			pm_runtime_disable(dev);
> +			return ret;
> +		}
> +
> +		ret = devm_add_action_or_reset(dev, qcom_cc_pm_runtime_disable, dev);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
>  	reset->rcdev.ops = &qcom_reset_ops;
> @@ -251,7 +285,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  
>  	ret = devm_reset_controller_register(dev, &reset->rcdev);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
>  	if (desc->gdscs && desc->num_gdscs) {
>  		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
> @@ -262,11 +296,11 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  		scd->num = desc->num_gdscs;
>  		ret = gdsc_register(scd, &reset->rcdev, regmap);
>  		if (ret)
> -			return ret;
> +			goto err;
>  		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
>  					       scd);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	cc->rclks = rclks;
> @@ -277,7 +311,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  	for (i = 0; i < num_clk_hws; i++) {
>  		ret = devm_clk_hw_register(dev, clk_hws[i]);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	for (i = 0; i < num_clks; i++) {
> @@ -286,14 +320,23 @@ int qcom_cc_really_probe(struct platform_device *pdev,
>  
>  		ret = devm_clk_register_regmap(dev, rclks[i]);
>  		if (ret)
> -			return ret;
> +			goto err;
>  	}
>  
>  	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
>  	if (ret)
> -		return ret;
> +		goto err;
> +
> +	if (use_pm)
> +		pm_runtime_put(dev);
>  
>  	return 0;
> +
> +err:
> +	if (use_pm)
> +		pm_runtime_put(dev);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
>  
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 51ed640e527b..40c384bda4fc 100644
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
> @@ -237,6 +238,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>  	struct gdsc *sc = domain_to_gdsc(domain);
>  	int ret;
>  
> +	pm_runtime_get_sync(domain->dev.parent);
> +
>  	if (sc->pwrsts == PWRSTS_ON)
>  		return gdsc_deassert_reset(sc);
>  
> @@ -326,6 +329,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>  	if (sc->flags & CLAMP_IO)
>  		gdsc_assert_clamp_io(sc);
>  
> +	pm_runtime_put(domain->dev.parent);
> +
>  	return 0;
>  }
>  
> @@ -427,6 +432,7 @@ int gdsc_register(struct gdsc_desc *desc,
>  			continue;
>  		scs[i]->regmap = regmap;
>  		scs[i]->rcdev = rcdev;
> +		scs[i]->pd.dev.parent = desc->dev;
>  		ret = gdsc_init(scs[i]);
>  		if (ret)
>  			return ret;
> -- 
> 2.30.2
> 
