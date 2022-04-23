Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CAAC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 03:46:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbiDWDtX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Apr 2022 23:49:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232480AbiDWDtW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 23:49:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02ECA17E18
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 20:46:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32790B8321B
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43CBC385A0;
        Sat, 23 Apr 2022 03:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650685583;
        bh=YLzs5s4lLztnRlDZKqhpcWJHoPUDsk6VtO9zdUf/k+Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kpIA2+8xSZvCenAFE38BHreBCWUB8Zg6jH+jmTbZmo5Iw0iQXoi+/6e5gTbBO53ec
         mZWmB/jaCWgAdyzj0iwLEQRwIRQDEi9l6PQbRhLM7CbTHZEFZ1qPPHCdi9gsmxhbtb
         wcz3iQl3OUMhP/OuJhdBV/xVGXiHZIR4l+kZfwlPV8LPwQW1zMzgEhVCYO04gNoesp
         kvHrfVvbGsWKJm1aLMsWzQP99o2DMrHFLAC+/MTDB1TVJl90EL3FgfWrTSLQZaf94D
         LP/jLnG6/WuMjOBbUsZVoaVmwTrDnChasQ6CBfj3c7OeW2nGw57kkU19i0ZBxQuTUU
         YxY1fm7B5/P8g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220408091037.2041955-15-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech> <20220408091037.2041955-15-maxime@cerno.tech>
Subject: Re: [PATCH 14/22] clk: Introduce clk_hw_init_rate_request()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Fri, 22 Apr 2022 20:46:21 -0700
User-Agent: alot/0.10
Message-Id: <20220423034623.A43CBC385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-04-08 02:10:29)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 399080456e45..83dd5f1df0b9 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1396,6 +1396,26 @@ static void clk_core_init_rate_req(struct clk_core=
 * const core,
>         }
>  }
> =20
> +/**
> + * clk_hw_init_rate_request - Initializes a clk_rate_request
> + * @hw: the clk for which we want to submit a rate request
> + * @req: the clk_rate_request structure we want to initialise
> + * @rate: the rate which is to be requested
> + *
> + * Initializes and fills a clk_rate_request structure to submit to

s/and fills//

> + * __clk_determine_rate or similar functions.

__clk_determine_rate()

> + */
> +void clk_hw_init_rate_request(struct clk_hw * const hw,

I don't get why it isn't 'const struct clk_hw *hw', but it looks to be
following clk_core_init_rate_req() so that can be figured out later.
Please remove the const from here regardless; it's not doing anything.

> +                             struct clk_rate_request *req,
> +                             unsigned long rate)
> +{
> +       if (WARN_ON(!hw || !req))

Why would you call it without those two items? Another copy/paste from
clk_core_init_rate_req()?

> +               return;
> +
> +       clk_core_init_rate_req(hw->core, req, rate);
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
> +
>  static bool clk_core_can_round(struct clk_core * const core)
>  {
>         return core->ops->determine_rate || core->ops->round_rate;
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index c10dc4c659e2..39e4ed301ec5 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -42,6 +42,8 @@ struct dentry;
>   * struct clk_rate_request - Structure encoding the clk constraints that
>   * a clock user might require.
>   *
> + * Should be initialized by calling clk_hw_init_rate_request().

How is that enforced?

This has only become a problem after commit 948fb0969eae ("clk: Always
clamp the rounded rate") from what I can tell. I guess we can't skip the
clamp when both min/max are zero though because it may be stack junk?
But I looked at all the call sites and either they zero initialize the
whole struct (qcom) or they copy the req from what is passed into the
determine_rate clk_op (others). So we could simply not clamp if both
values are equal to zero and then qcom would be happy, but that has been
fixed by setting the min/max to 0 and max instead. That leaves the other
users, which already copy what is being passed in, i.e. what is done by
clk_core_init_rate_req().

I guess my question is who is going to use this? And if we can't even
enforce that it is used then it feels like we shouldn't add it. Maybe it
can be useful to cleanup the core request initialization logic because
it's sort of spread out but probably not as a clk_hw API.

> + *
>   * @rate:              Requested clock rate. This field will be adjusted=
 by
>   *                     clock drivers according to hardware capabilities.
>   * @min_rate:          Minimum rate imposed by clk users.
