Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65EE5C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 15:08:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbiGFPIe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jul 2022 11:08:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbiGFPIU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jul 2022 11:08:20 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFB7326569
        for <linux-clk@vger.kernel.org>; Wed,  6 Jul 2022 08:08:18 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id o19-20020a05600c4fd300b003a0489f414cso9142706wmq.4
        for <linux-clk@vger.kernel.org>; Wed, 06 Jul 2022 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TbP0pdHnPrM+ouGZkcA/VEgDW4UJQvTk7vLH9xNZObg=;
        b=IJq4gEtiTBgqd6KWJWBbKv2TPoHt99rC4NLQtdItczQ1y+MmeEP6fwS5Uh9l9JSj6a
         R11ojWCiVINF9F0Yl0FOpfLjwb4Bv59VT6JPM5er3Gq1jxsQ3zJ4G5BfjpXX4VO4SN5f
         +kK4xyhvnDfYmqv25lHwjKXKmPkd5q0b9RQZjfYoLXFIuAJm6YY9mGEhymiV7ioj/bD1
         dUo1G7Y8YJZQEYQ0xbMOUUbDnsirMAYLYT3DFU56Rc5w90XmF7+TfJTb609EKYhA+pm8
         e/giTKkwSjfSUT4bzyxhixfJyhFUe3bIvARGCEpme9s2lL2K9UdfdY7trfZK2DTpt8qt
         e6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TbP0pdHnPrM+ouGZkcA/VEgDW4UJQvTk7vLH9xNZObg=;
        b=ywUePm89UGEhNXDmAQHrszAUMVF4G1YIHrYIp7RlQnHEuV6NGYnLRkoYEVPUKoecGS
         gvbNn7Zz1BkbnW0XbFZ1D/l4fCKmQ+iD4wjmFGt1GxL38zt77rAUx7WYjryj6eEcZLuK
         8mU3Mu1NdaIzR0M3eMkHnjRaATOl/jGvsXxNHZQfoVWPO53/dTPxJCBf4UCD87kAUJl6
         5ck/GDcjmoIvlwsINgy5ltz1gpNGywpPx8aSvctYesSKP1L325vZ8bqTQatmR3/R64On
         jlvGjLVkCrcvmJzcTkkOsSK2n9nOXFbNfvk3Fk50rb2hkC7taRAuqYofTVl5ZVe7TrQF
         XYYQ==
X-Gm-Message-State: AJIora8JW7TqV88QJi/+MZ/eSgmTAw5kElk+AY+Wpjkw2AbXM7DVh7UG
        F5LFPyMboHWCkMpCKWz2bun08w==
X-Google-Smtp-Source: AGRyM1uGG0ewtPXWfcllw80dByjPMwdwNd8zLJCX7giMogiZUR7jCqN1Olu4VSXFEGiD3ycFpSGtmg==
X-Received: by 2002:a05:600c:3591:b0:3a0:563a:49d3 with SMTP id p17-20020a05600c359100b003a0563a49d3mr40932058wmq.60.1657120097258;
        Wed, 06 Jul 2022 08:08:17 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id y15-20020a5d4acf000000b0021b9c520953sm35856542wrs.64.2022.07.06.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 08:08:16 -0700 (PDT)
Date:   Wed, 6 Jul 2022 18:08:15 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFC] clk: Add clk_hw based provider enable/disable API
Message-ID: <YsWlX0YtKoMkd/Qw@linaro.org>
References: <20220704185733.1288578-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704185733.1288578-1-abel.vesa@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-07-04 21:57:33, Abel Vesa wrote:
> Sometimes, a clock needs to be enabled or disabled by the provider,
> without actually touching the enable count. For example, a clock
> provider driver might choose to disable some unused clocks on sync state
> callback rather than on the default clk_disable_unused. Such clocks are
> usually enabled by bootloader and need to stay ungated until some driver
> built as module probes. So add clk_hw enable/disable to allow the clock
> provider drivers to disable such clocks on sync state callback.
>

Ignore this one please.

There is a new RFC here:
https://lore.kernel.org/lkml/20220706150411.708213-1-abel.vesa@linaro.org/

> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/clk.c            | 25 +++++++++++++++++++++++++
>  include/linux/clk-provider.h |  2 ++
>  2 files changed, 27 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f00d4c1158d7..a727cffb6bba 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1011,6 +1011,17 @@ void clk_disable(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_disable);
>
> +void clk_hw_disable(const struct clk_hw *hw)
> +{
> +	struct clk_core *core = hw->core;
> +
> +	trace_clk_disable(core);
> +	if (core->ops->disable)
> +		core->ops->disable(core->hw);
> +	trace_clk_disable_complete(core);
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_disable);
> +
>  static int clk_core_enable(struct clk_core *core)
>  {
>  	int ret = 0;
> @@ -1176,6 +1187,20 @@ int clk_enable(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_enable);
>
> +int clk_hw_enable(const struct clk_hw *hw)
> +{
> +	struct clk_core *core = hw->core;
> +	int ret = 0;
> +
> +	trace_clk_enable(core);
> +	if (core->ops->enable)
> +		ret = core->ops->enable(core->hw);
> +	trace_clk_enable_complete(core);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_enable);
> +
>  /**
>   * clk_is_enabled_when_prepared - indicate if preparing a clock also enables it.
>   * @clk: clock source
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index c10dc4c659e2..0f9968a7a6d2 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1212,6 +1212,8 @@ unsigned long clk_hw_get_flags(const struct clk_hw *hw);
>  bool clk_hw_is_prepared(const struct clk_hw *hw);
>  bool clk_hw_rate_is_protected(const struct clk_hw *hw);
>  bool clk_hw_is_enabled(const struct clk_hw *hw);
> +int clk_hw_enable(const struct clk_hw *hw);
> +void clk_hw_disable(const struct clk_hw *hw);
>  bool __clk_is_enabled(struct clk *clk);
>  struct clk *__clk_lookup(const char *name);
>  int __clk_mux_determine_rate(struct clk_hw *hw,
> --
> 2.34.3
>
