Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C41C7EE43
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jun 2023 08:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjFLI2m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jun 2023 04:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbjFLI21 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jun 2023 04:28:27 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB3F10C3
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:27:33 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-977e7d6945aso736036966b.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Jun 2023 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686558452; x=1689150452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5bIDTjXQH5L90i2XX/gTWlQ9d360txShID6EFAAOrY=;
        b=DUsTQM0th5Nt72TsPog0YPlk3jJf7qdzxGpDnRsqn00kTMcFqgmfL31vivrO+ze6H1
         cmbnAw7QNvB1j9nx5dYJL1hqw8FMk3pGTA+gljxF4xgzcnaPbq/I6SWfFociaO5Owt4P
         nPuQg+Mg0ZRVLnYdy94HiLehqk8ntN1mJ7UW1MWUddSc2WYLYX/N/7gQ4gclTuuXogXO
         zuQaXbeJsdnVB5MPS6ZPl/t9PngoYCtuT7hqsMM1uUqPDDblnT+8lqdtfUkMEczQQsa7
         y5ZWUs6MMQHtpziktzvIb6jFGEQfVS8hNenrZCZTjbOjNXepH1T/hsD7cM9U2MKiOtZt
         5mPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686558452; x=1689150452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5bIDTjXQH5L90i2XX/gTWlQ9d360txShID6EFAAOrY=;
        b=FzYc0EIUbA/cvqfGlbt+B8t34f48Vy2jTNPLmLHwPcTM3RwP/N8653JnjQ7T9RHz42
         UHhd16Ak+kvCVqDA6AbB4PzzrPJIyFcJ1bKrnIEIy4cB2bJv4sWKEyi6bvprOR751fRs
         XOgtfkOmM0mDto6Jcd4Z7xAtMy6Bi8GKZppG9z7br9wZslDCIigQD8VrWiCqAHHAxq+M
         l7B7+NuJqt8K7qdSvDdmefG7c/+0vSJ8Bt/tND3mmI+YOeIjDAduAGw8IxP9fgR9BgLk
         lfnor05XqVhtqTSEWVhrmC8zsdq7x9bvcrkrb0CvNSayu4U5P3oQJCcpGBF6SwLrm30o
         i+uQ==
X-Gm-Message-State: AC+VfDzXMHaCEC1RC/4ZsgtsqV5dF0IDQfnuBTL/IEellQGHsOI0vbx7
        y8KxN2CKu2WdOKqBB/FVozrz1Q==
X-Google-Smtp-Source: ACHHUZ780bHh0/qlAhme+NUUhtBLlL2dWKyBMTEzWXXJYLswBXHMMVxwYZNy/VEf+HHZyoSdMvP2OA==
X-Received: by 2002:a17:906:7303:b0:974:61dc:107c with SMTP id di3-20020a170906730300b0097461dc107cmr9378908ejc.44.1686558452294;
        Mon, 12 Jun 2023 01:27:32 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id f27-20020a170906391b00b0097888b3b5a7sm4850523eje.31.2023.06.12.01.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:27:31 -0700 (PDT)
Date:   Mon, 12 Jun 2023 11:27:30 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Yuxing Liu <lyx2022@hust.edu.cn>
Cc:     Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        hust-os-kernel-patches@googlegroups.com,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: clk-imx8mp: improve error handling in
 imx8mp_clocks_probe()
Message-ID: <ZIbW8uqb/8X8qY7h@linaro.org>
References: <20230503070607.2462-1-lyx2022@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230503070607.2462-1-lyx2022@hust.edu.cn>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-05-03 07:06:07, Yuxing Liu wrote:
> Replace of_iomap() and kzalloc() with devm_of_iomap() and devm_kzalloc()
> which can automatically release the related memory when the device
> or driver is removed or unloaded to avoid potential memory leak.
> 
> In this case, iounmap(anatop_base) in line 427,433 are removed
> as manual release is not required.
> 
> Besides, referring to clk-imx8mq.c, check the return code of
> of_clk_add_hw_provider, if it returns negtive, print error info
> and unregister hws, which makes the program more robust.
> 
> Fixes: 9c140d992676 ("clk: imx: Add support for i.MX8MP clock driver")
> Signed-off-by: Yuxing Liu <lyx2022@hust.edu.cn>
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> This issue is found by static analysis and remains untested.
> ---
>  drivers/clk/imx/clk-imx8mp.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 3253589851ff..de7d2d2176be 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -414,25 +414,22 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np;
>  	void __iomem *anatop_base, *ccm_base;
> +	int err;
>  
>  	np = of_find_compatible_node(NULL, NULL, "fsl,imx8mp-anatop");
> -	anatop_base = of_iomap(np, 0);
> +	anatop_base = devm_of_iomap(dev, np, 0, NULL);
>  	of_node_put(np);
> -	if (WARN_ON(!anatop_base))
> -		return -ENOMEM;
> +	if (WARN_ON(IS_ERR(anatop_base)))
> +		return PTR_ERR(anatop_base);
>  
>  	np = dev->of_node;
>  	ccm_base = devm_platform_ioremap_resource(pdev, 0);
> -	if (WARN_ON(IS_ERR(ccm_base))) {
> -		iounmap(anatop_base);
> +	if (WARN_ON(IS_ERR(ccm_base)))
>  		return PTR_ERR(ccm_base);
> -	}
>  
> -	clk_hw_data = kzalloc(struct_size(clk_hw_data, hws, IMX8MP_CLK_END), GFP_KERNEL);
> -	if (WARN_ON(!clk_hw_data)) {
> -		iounmap(anatop_base);
> +	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, IMX8MP_CLK_END), GFP_KERNEL);
> +	if (WARN_ON(!clk_hw_data))
>  		return -ENOMEM;
> -	}
>  
>  	clk_hw_data->num = IMX8MP_CLK_END;
>  	hws = clk_hw_data->hws;
> @@ -721,7 +718,12 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  
>  	imx_check_clk_hws(hws, IMX8MP_CLK_END);
>  
> -	of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
> +	err = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register hws for i.MX8MP\n");
> +		imx_unregister_hw_clocks(hws, IMX8MP_CLK_END);
> +		return err;
> +	}
>  
>  	imx_register_uart_clocks();
>  
> -- 
> 2.34.1
> 
