Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B979CCA479
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jul 2022 08:17:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbiGUIR5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jul 2022 04:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232198AbiGUIRz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jul 2022 04:17:55 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E81E7D7AF
        for <linux-clk@vger.kernel.org>; Thu, 21 Jul 2022 01:17:54 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id c22so596614wmr.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Jul 2022 01:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LnS4U70xTD5RndpC3IpS7w07CUZXggrNJFWkXeqFf+g=;
        b=bcsXl3cPziwD12F/cqYeCXDt5Q33OX113ksfbpr7U6u5NaGA4jxO1MBcclqS9/9x6j
         C/HW3H5C6yqIkp4H0q2K97q03zz2LIY7Tjqqs4PD1vAAdRNnTwuGRfTuq7HRfkveZQbV
         gbPs7f1jYpKHGZ3Xyn7tRKBJSWGx1TpdEX2vF6kExUAdRbNtMRaKdd9u8/EhU5vmcYMO
         VoJc9RZE7OfIxhcpxu5X1/oUpKQxBUcJDNjDJc388fJo/iv9QiHnYyNu0tLYNrkQ2p8h
         SjV50lLi6FoFY4ycW2LOOWqfVF9ogMVAdGCHaQY0H2VffPUk4jcXYzhi7pCl5JOWhg5H
         UMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LnS4U70xTD5RndpC3IpS7w07CUZXggrNJFWkXeqFf+g=;
        b=tMozmfCCIt/QHqAK2l0l39fbhDgFmNcl/KIEfhqRV1kVmVR01XjbLNSsHyKA+6gG72
         rJbPlDKYKx43toLEu1LCHJZgL7dmfzVPaZo85fRZWA7PATFLb7+lsMI8yTZYfrNQZQNw
         rWJysev7/otMiHEghBuBauDRRQzS/msgkJYCi4mpyNkrrH5NqtuKRzoN+KtzSqaF9Dzb
         uKPjmCEUlzT9tb5oGKKXL2VJyGF+BrUAwUbgOdygG04L1DmBkDQseY/B7Uq4yFbOdnaG
         NXSYrWuCv90JLZWboiQQqk99amyDSLQXtWzBrBOXOU4yh1LAKXiBviBXl6+MfOf+S2YD
         +Bvg==
X-Gm-Message-State: AJIora+AtpFSgYRat+PIQmoBfj9wMDBF9bWoKvschcaaAmQqKvBVc2//
        YJfSme81mS3AGi5BNTfYkvndIQ==
X-Google-Smtp-Source: AGRyM1tZapHSOqd9rZaA9FThLwuD/+wlnEQp2GVkGsMTRyiuMws0EMy36pd8Y5pNYI4ym5zS2U3nYw==
X-Received: by 2002:a05:600c:591:b0:3a3:205f:e2ca with SMTP id o17-20020a05600c059100b003a3205fe2camr7036614wmd.147.1658391473141;
        Thu, 21 Jul 2022 01:17:53 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b0039db31f6372sm2247237wmq.2.2022.07.21.01.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 01:17:52 -0700 (PDT)
Date:   Thu, 21 Jul 2022 11:17:51 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [RFC PATCH 1/4] clk: Use clk_core_unlink_consumer on __clk_put
Message-ID: <YtkLr9DJLO215gBJ@linaro.org>
References: <20220707100309.1357663-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707100309.1357663-1-abel.vesa@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-07-07 13:03:06, Abel Vesa wrote:
> For consistency, use clk_core_unlink_consumer rather then hlist_del
> directly, on __clk_put. Prepare lock is already acquired at that point.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Gentle ping.

> ---
>  drivers/clk/clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 7fc191c15507..e1d8245866b1 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4347,7 +4347,7 @@ void __clk_put(struct clk *clk)
>  		clk->exclusive_count = 0;
>  	}
>
> -	hlist_del(&clk->clks_node);
> +	clk_core_unlink_consumer(clk);
>  	if (clk->min_rate > clk->core->req_rate ||
>  	    clk->max_rate < clk->core->req_rate)
>  		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
> --
> 2.34.3
>
