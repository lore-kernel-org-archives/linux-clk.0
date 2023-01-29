Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F073CC61D97
	for <linux-clk@archiver.kernel.org>; Sun, 29 Jan 2023 17:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbjA2RdY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Jan 2023 12:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbjA2RdX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Jan 2023 12:33:23 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE731CF79
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:33:22 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso3878101wms.4
        for <linux-clk@vger.kernel.org>; Sun, 29 Jan 2023 09:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wyrcsnAJHQLkBlEAUJbUxZ4oBTO6M9vjc3Y9RD/6oo=;
        b=A2aCms+n4YGcmWdYSolPFAmhpBx4MfpP/uNc36PhvKi+hDlVvvTofhGmC91yPqhTA0
         SxhxAiI7bZjVRVn/fp+CrSWr9uyOl7PkuCdvYpclssE5Oz5QYYdShz6XLRhGEUN8DPHk
         ZJ+xlAGBygNfFsPBnzAEzvYL9dUw7s3W9YJd0FGTI7fT2sdFwcKb35EpFsL0L7V/qQMw
         TWqOGYT8FLtATgtG8tTxNTxUalJfrEd/LAk1nvq4W8VCxZJXzi7ngdEBQToDcZ8s/B8t
         /00RqQnOFUrbxBUxbCwQGAeHkjRVBDxeRNXqd2IU0I7wnKVy3vjNpp0TrAFr2QNP3PFw
         1rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wyrcsnAJHQLkBlEAUJbUxZ4oBTO6M9vjc3Y9RD/6oo=;
        b=zAQf4UyJFuSpnM8QjOyIYaMwed6/bMaksHM1zBuQwCTGZEfh56uAvnG1ammFcHGtmb
         B9bzJR3Zwawvxg6tK+pzZCYK/aV/o/se6MRy3yo6B4blX+YkBmKTOO5Qoj6ZqTpQ8WSn
         5oxkatcUPj3jsQvbbYIczGLtp3JeJ955RNXdAwYyyqbmoFHhh6zgzxD2zJE6tPbdTB06
         RuEcZyLweypC1UYXlIUtrFj+8e6uyVgVlXwqbqkA98ac/NIPhLJNVuJIFM5g2FWDIBQB
         nVF7dFkFgTdsO2JH56W/To+ebsjTQ3hWSGwC19kjZKqe4YpJ1998CpK3Dok5dC6CCSUO
         QEtg==
X-Gm-Message-State: AFqh2kpjmItsJSsZkuqg7QBkysFq3qjwCXdmALtdKR83+08LSaw4mMtu
        8JvEWrCGRxWwyJ2zH03DOEuWXg==
X-Google-Smtp-Source: AMrXdXver1JGBIfb2pGmO6LeMB6HuNti4ktes8+wCf0byQntuAF3rUL80tvcDCbnMTI8fcz2upbGzw==
X-Received: by 2002:a05:600c:19d0:b0:3dc:c05:9db6 with SMTP id u16-20020a05600c19d000b003dc0c059db6mr22791193wmq.33.1675013600853;
        Sun, 29 Jan 2023 09:33:20 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id f9-20020a7bcd09000000b003dc54344764sm2220396wmj.48.2023.01.29.09.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 09:33:20 -0800 (PST)
Date:   Sun, 29 Jan 2023 19:33:19 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 14/19] clk: imx: add imx_obtain_fixed_of_clock()
Message-ID: <Y9at37jsgpy9RiNT@linaro.org>
References: <20230117061453.3723649-1-o.rempel@pengutronix.de>
 <20230117061453.3723649-15-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117061453.3723649-15-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-17 07:14:48, Oleksij Rempel wrote:
> Add imx_obtain_fixed_of_clock() to optionally add clock not configured in
> the devicetree.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk.c | 14 ++++++++++++++
>  drivers/clk/imx/clk.h |  3 +++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk.c b/drivers/clk/imx/clk.c
> index b636cc099d96..5f1f729008ee 100644
> --- a/drivers/clk/imx/clk.c
> +++ b/drivers/clk/imx/clk.c
> @@ -110,6 +110,20 @@ struct clk_hw *imx_obtain_fixed_clock_hw(
>  	return __clk_get_hw(clk);
>  }
>  
> +struct clk_hw *imx_obtain_fixed_of_clock(struct device_node *np,
> +					 const char *name, unsigned long rate)
> +{
> +	struct clk *clk = of_clk_get_by_name(np, name);
> +	struct clk_hw *hw;
> +
> +	if (IS_ERR(clk))
> +		hw = imx_obtain_fixed_clock_hw(name, rate);
> +	else
> +		hw = __clk_get_hw(clk);
> +
> +	return hw;
> +}
> +
>  struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name)
>  {
>  	struct clk *clk;
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index 801213109697..f0a24cd54d1c 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -288,6 +288,9 @@ struct clk * imx_obtain_fixed_clock(
>  struct clk_hw *imx_obtain_fixed_clock_hw(
>  			const char *name, unsigned long rate);
>  
> +struct clk_hw *imx_obtain_fixed_of_clock(struct device_node *np,
> +					 const char *name, unsigned long rate);
> +
>  struct clk_hw *imx_get_clk_hw_by_name(struct device_node *np, const char *name);
>  
>  struct clk_hw *imx_clk_hw_gate_exclusive(const char *name, const char *parent,
> -- 
> 2.30.2
> 
