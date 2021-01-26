Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99806C433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5149522B2C
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405593AbhAZOA7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:00:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405660AbhAZOAQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 09:00:16 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9B6C061A31
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 05:59:36 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id k8so16232413otr.8
        for <linux-clk@vger.kernel.org>; Tue, 26 Jan 2021 05:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YTsupxga+KtJHJ2/NwGiOg8d0eBxSmIPJj1rUhYEku0=;
        b=yZ54dQI7WHPKCbJ+/b1AnRgCgElbV/u79mPNAInoK/gifKSkO/cgksWh5+YswXIUkB
         X66rUBm/PkWwkTrXbSReCtBrnOhvjVVXExV7yfeos0jPSQtjTz/uvEuZBr5hZDojhvWw
         HjbWc2KUBDg7j66deFQaLawYvG8xk7JH/zhjA9WomtqszMWICRrnb75pOLKC70hxQ7E6
         7IF7FmTP1IrI8um/tg2lYWbR9IdUBZ0wsrhKjQxosu9T0zTJ2efRETym6gkwsr5+1l85
         BD1XHMN6NXPUh9Rt1Yi4Vpo4e57AGV60/0R6oGQZm2sVDLhOy6h9V3cK+mRs98Tt67CK
         S0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YTsupxga+KtJHJ2/NwGiOg8d0eBxSmIPJj1rUhYEku0=;
        b=JAl2Gmjg+NaFnwoKIBgKwUtLFZ/A2SjYLDbKn5toPDVXAfXgiGQIATeX9ryWz3Rm0H
         fmKqa3yzjgG2G6bZMUk6ZH2TBe2Qy9qdu6zF+RHivK1Mq897rS91t8rVnBYYWIuHB2IY
         n1FowhdAR4AxRa6qC8Tt7iEVD9Qi8hCZQAz7Nu91NnoJ7aaxed+Nr4tmszEaLXpvNY3x
         JHPZUGLo+IqwyRSmXAMZP+xHBxPQElkmLb4C+R+t1+W2WKkZfrffia3gKSJ4qx4qWCpr
         orlwEO9WCXmkMJYa8C3pY4kuxf/8cpY+82dRBdAEkgHcfWBg7VHyOPj1WZ0yvZTy7ZJ+
         yHAA==
X-Gm-Message-State: AOAM530Lv2BvwbPh0PQ6TfOeFs79RZRJR3SwVmM9ndcVPL8021JGeuc+
        dXImpAoh4dv9/veiQpEHiBuy0w==
X-Google-Smtp-Source: ABdhPJymcp9pMAiu4zVhoCug/E78peraXZ+L6YX6ZbPuuw5jYLiWmahXMCax5kRqBawVjHCZAWMf+g==
X-Received: by 2002:a05:6830:1614:: with SMTP id g20mr3941554otr.77.1611669575430;
        Tue, 26 Jan 2021 05:59:35 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z3sm4126369ota.80.2021.01.26.05.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 05:59:34 -0800 (PST)
Date:   Tue, 26 Jan 2021 07:59:32 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 04/21] clk: qcom: clk-regmap: Provide missing description
 for 'devm_clk_register_regmap()'s dev param
Message-ID: <20210126135932.GC1241218@yoga>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
 <20210126124540.3320214-5-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126124540.3320214-5-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 26 Jan 06:45 CST 2021, Lee Jones wrote:

> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/clk/qcom/clk-regmap.c:97: warning: Function parameter or member 'dev' not described in 'devm_clk_register_regmap'
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-clk@vger.kernel.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/qcom/clk-regmap.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/clk-regmap.c b/drivers/clk/qcom/clk-regmap.c
> index ce80db27ccf2a..92ac4e0d7dbe2 100644
> --- a/drivers/clk/qcom/clk-regmap.c
> +++ b/drivers/clk/qcom/clk-regmap.c
> @@ -87,6 +87,7 @@ EXPORT_SYMBOL_GPL(clk_disable_regmap);
>  /**
>   * devm_clk_register_regmap - register a clk_regmap clock
>   *
> + * @dev: reference to the caller's device
>   * @rclk: clk to operate on
>   *
>   * Clocks that use regmap for their register I/O should register their
> -- 
> 2.25.1
> 
