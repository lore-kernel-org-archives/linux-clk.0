Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAF0C0015E
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 07:34:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjGYHeJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 03:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230182AbjGYHdr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 03:33:47 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84BA3ABD
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:30:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so13011550a12.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690270221; x=1690875021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BF2uC5c9tOKGK7l9S99eAFOrdaqXLFdjtMQI23eQj7w=;
        b=lTbzbQyQUnTlDAjfI0Op0YN2Y2bkEPizJaK0wuFwDW4CjCQFzUD0MSVszlWoaZMnyq
         TfoAbbZ4Z16Awyy2Ixt6qO+tsQb4RkOtb9et2nQd+9NQ+1gCwvFj4VZvmmXtDEv/pHOp
         vLf/IfjpsYpGLbEGHOizGAIPlk0fKgpMRiIYJi/VdCOyKti/5gcvFENvliQR0w26KRt+
         FW7zjoYpzaD03m/gon3/LowvZPYOonuC/N2sdn5cWxy0z7Gnzhb7E6cFzGxIzMZjtQC+
         AFFiKt3YDJRVkD6fQAmD/oiu5RKV+z8ql54uFzJ7zrG0ihVM0lZ9Wmr3i3+bv/HOr/bR
         0OBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270221; x=1690875021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BF2uC5c9tOKGK7l9S99eAFOrdaqXLFdjtMQI23eQj7w=;
        b=gzINn8Y9zGjrSVbGRaj2zt930j2ELhCVyBwsP3a0Bm2+x+jMksma1Ak98jYCmV26x1
         9yzFuFcvOMlnnaFhCQ/+IMfvRnOvKWZ41J9wLwXp7uL+XvfqmIIOpoH2iTb/MROJVr6I
         WbL1P/Iruv6WBmZvVqhZ5R3xk2datjUnudmJ31CQthQPRuWp0Umjk+FbhHxZ6m/C99Pa
         nUN/Ww3UtNO1PBL3APQGSCG/jhCT071rrdAF4gi8ETeJETtX3I9+xNIUOOg7a08Af+AH
         qi6S2PV+iciojb8AMdt2UHNzE//5C6q3Xfx3Na9NNKGPvlNN2E73HfMoPgC0dvJoYrSe
         jVsg==
X-Gm-Message-State: ABy/qLaqkEU0W+MjrubJ9hEgzGjBo/tvgmOHvTFchsvfJzoXXsQvad/K
        i1PX/5EnbutgwSrWJRdFpnyU6w==
X-Google-Smtp-Source: APBJJlGvfmo2Yl6ar0tqyDOppXT3JcsYsLA0KbWaEqBcJIm4psVlhwo2YOjFg6RH/TkYX9BEkVu0iQ==
X-Received: by 2002:a17:906:7946:b0:98d:ebb7:a8b0 with SMTP id l6-20020a170906794600b0098debb7a8b0mr1785125ejo.14.1690270221274;
        Tue, 25 Jul 2023 00:30:21 -0700 (PDT)
Received: from linaro.org ([82.78.74.213])
        by smtp.gmail.com with ESMTPSA id r7-20020a170906c28700b0099b42c90830sm7757643ejz.36.2023.07.25.00.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 00:30:20 -0700 (PDT)
Date:   Tue, 25 Jul 2023 10:30:18 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/13] clk: imx: clk-imx8qxp-lpcg: Convert to
 devm_platform_ioremap_resource()
Message-ID: <ZL96ClxGXSSJaXTj@linaro.org>
References: <20230705065313.67043-1-frank.li@vivo.com>
 <20230705065313.67043-8-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705065313.67043-8-frank.li@vivo.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-07-05 14:53:08, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index 5e31a6a24b3a..e0ee9a2572d0 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -183,7 +183,6 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  	unsigned int bit_offset[IMX_LPCG_MAX_CLKS];
>  	struct clk_hw_onecell_data *clk_data;
>  	struct clk_hw **clk_hws;
> -	struct resource *res;
>  	void __iomem *base;
>  	int count;
>  	int idx;
> @@ -193,8 +192,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  	if (!of_device_is_compatible(np, "fsl,imx8qxp-lpcg"))
>  		return -EINVAL;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.39.0
> 
