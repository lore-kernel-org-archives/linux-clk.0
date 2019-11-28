Return-Path: <SRS0=Uxw9=ZU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88562C432C0
	for <linux-clk@archiver.kernel.org>; Thu, 28 Nov 2019 18:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CD942176D
	for <linux-clk@archiver.kernel.org>; Thu, 28 Nov 2019 18:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vUB2s48D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbfK1S4e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Nov 2019 13:56:34 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40043 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfK1S4e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Nov 2019 13:56:34 -0500
Received: by mail-pg1-f196.google.com with SMTP id e17so13245439pgd.7
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2019 10:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=X4s7u42R7m21KqCIzun+91e/z6/pprds5iyeLMuyZjA=;
        b=vUB2s48DwSj1GeQUCGhfF5En4oEF5BAUepS1PETwANDFYI6SLRvYbpWrBj2npf+IZ9
         LS4x3I/x1nDuNYx7xa84RUt0Z5Zp6GyZBQwXaJW4BJfdvW12vrvOW5i41P3bw3FeNAG8
         bEhYsin1k3ynuqs/RwFg+TlExbDu+1PtJOJ/i01s7q28dE9tHwDd++4pqnz0zFNwGOWU
         yastfgisFC9blkFrOXjt9jp9F7qbKzX6URY6pf3jR1RsLlb/VNPWmvxm14pM/L4EIQLy
         IEVpM7WZyW76vfHcids/7sFLaUCw8FOJ2tV5EaHvHbsuBQD+Q5ICp0fJzk/ifIVxUZKI
         VWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=X4s7u42R7m21KqCIzun+91e/z6/pprds5iyeLMuyZjA=;
        b=DiEGiKpHLPLlMwHtiPUFLkxggSDtT38SrTS2tPEhJqh9vbv+b1Q3mMZh2D/V83vvS3
         xrUYU0FWSEOFvjhmsSKEA9mgH0BXDWXl+bRugczRXfw8XJPLfZLkDy4d+D4vgKtmQEGR
         e1UfjCq5CwV2F4PDeFfN6xkx/aq3TF+i3wP2sc63I/FudgBaU1BsJr3mTkElOvQRfm16
         Qw1TrACnyk2zYVyVfSDyq2Ik6F/QbQLNT93FdKP0n1VKAGgnaobOH9KkaoeInC+Kw89m
         x4uxI2SFvgHsL1gISeFjYAkJa1gceY5Q6SLDs3ORda+VoIWVtyxXo2rfcUeOK0fVlL1h
         8yJg==
X-Gm-Message-State: APjAAAV1NJjBPGUlMzcsTioPAAWHXCzfF7xk+W+6Z2AEyxaKXxmqSsBH
        wjndnWZ8C42erv7q/S4zYlyklg==
X-Google-Smtp-Source: APXvYqzGZz3sj0sr+yoE4xRhkabCKJUtpPxRDdtpg7LbtS4ixXYofF4Lp9bKjUaWV8tGrilbFzJ6HA==
X-Received: by 2002:aa7:9ec9:: with SMTP id r9mr1390358pfq.85.1574967393821;
        Thu, 28 Nov 2019 10:56:33 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x3sm11356267pjq.10.2019.11.28.10.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2019 10:56:33 -0800 (PST)
Date:   Thu, 28 Nov 2019 10:56:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v1] clk: Convert managed get functions to devm_add_action
 API
Message-ID: <20191128185630.GK82109@yoga>
References: <3d8a58bf-0814-1ec1-038a-10a20b9646ad@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8a58bf-0814-1ec1-038a-10a20b9646ad@free.fr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 26 Nov 08:13 PST 2019, Marc Gonzalez wrote:

> Date: Tue, 26 Nov 2019 13:56:53 +0100
> 
> Using devm_add_action_or_reset() produces simpler code and smaller
> object size:
> 
> 1 file changed, 16 insertions(+), 46 deletions(-)
> 
>     text	   data	    bss	    dec	    hex	filename
> -   1797	     80	      0	   1877	    755	drivers/clk/clk-devres.o
> +   1499	     56	      0	   1555	    613	drivers/clk/clk-devres.o
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Looks neat

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/clk-devres.c | 62 +++++++++++-----------------------------
>  1 file changed, 16 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
> index be160764911b..04379c1f203e 100644
> --- a/drivers/clk/clk-devres.c
> +++ b/drivers/clk/clk-devres.c
> @@ -4,31 +4,29 @@
>  #include <linux/export.h>
>  #include <linux/gfp.h>
>  
> -static void devm_clk_release(struct device *dev, void *res)
> +static void __clk_put(void *clk)
>  {
> -	clk_put(*(struct clk **)res);
> +	clk_put(clk);
>  }
>  
>  struct clk *devm_clk_get(struct device *dev, const char *id)
>  {
> -	struct clk **ptr, *clk;
> +	struct clk *clk = clk_get(dev, id);
>  
> -	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> -
> -	clk = clk_get(dev, id);
> -	if (!IS_ERR(clk)) {
> -		*ptr = clk;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> -	}
> +	if (!IS_ERR(clk))
> +		if (devm_add_action_or_reset(dev, __clk_put, clk))
> +			clk = ERR_PTR(-ENOMEM);
>  
>  	return clk;
>  }
>  EXPORT_SYMBOL(devm_clk_get);
>  
> +void devm_clk_put(struct device *dev, struct clk *clk)
> +{
> +	devm_release_action(dev, __clk_put, clk);
> +}
> +EXPORT_SYMBOL(devm_clk_put);
> +
>  struct clk *devm_clk_get_optional(struct device *dev, const char *id)
>  {
>  	struct clk *clk = devm_clk_get(dev, id);
> @@ -116,42 +114,14 @@ int __must_check devm_clk_bulk_get_all(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_clk_bulk_get_all);
>  
> -static int devm_clk_match(struct device *dev, void *res, void *data)
> -{
> -	struct clk **c = res;
> -	if (!c || !*c) {
> -		WARN_ON(!c || !*c);
> -		return 0;
> -	}
> -	return *c == data;
> -}
> -
> -void devm_clk_put(struct device *dev, struct clk *clk)
> -{
> -	int ret;
> -
> -	ret = devres_release(dev, devm_clk_release, devm_clk_match, clk);
> -
> -	WARN_ON(ret);
> -}
> -EXPORT_SYMBOL(devm_clk_put);
> -
>  struct clk *devm_get_clk_from_child(struct device *dev,
>  				    struct device_node *np, const char *con_id)
>  {
> -	struct clk **ptr, *clk;
> -
> -	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> -		return ERR_PTR(-ENOMEM);
> +	struct clk *clk = of_clk_get_by_name(np, con_id);
>  
> -	clk = of_clk_get_by_name(np, con_id);
> -	if (!IS_ERR(clk)) {
> -		*ptr = clk;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> -	}
> +	if (!IS_ERR(clk))
> +		if (devm_add_action_or_reset(dev, __clk_put, clk))
> +			clk = ERR_PTR(-ENOMEM);
>  
>  	return clk;
>  }
> -- 
> 2.17.1
