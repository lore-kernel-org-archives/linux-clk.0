Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C499C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 10:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234103AbjADK5k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Jan 2023 05:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239139AbjADK4y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jan 2023 05:56:54 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B797537387
        for <linux-clk@vger.kernel.org>; Wed,  4 Jan 2023 02:55:38 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id tz12so81647803ejc.9
        for <linux-clk@vger.kernel.org>; Wed, 04 Jan 2023 02:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYzNoKOy+4Ii/LBgF/mqJWtZMgLq9NsSywUWEWmmIBU=;
        b=edVmHyF7sb/2wuzsN3dhIkbzzgEA7XkjqiNTyvjd5yf+K0cH1RAMXPTC0INzE+prR5
         HWytGWkKI1lHWok7rPx/qHYvm/+mOhPaneyN1SkvHfaeMpK2VfaH3GHLWBCU0/QgGN/n
         fypz7aZGG3DyGltQC0KyYnVtaYvPf8nTGWQuPrMluxYhu5AHAzbCRlc7ZHrv/F7P4ZP9
         DQUdksqsdmc8hb+GztiI7cQyg6YlzM0Jl90XAxav2BQZYY21ANq3vpzBOnLagcLYqprB
         1rF5HlbuCk8nmjImqDsE5wS33sh8ZHRI+ohYaI6FYY4pMgbwqz/D9EMAAHUTP20BCtwE
         ek5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYzNoKOy+4Ii/LBgF/mqJWtZMgLq9NsSywUWEWmmIBU=;
        b=wNHoXcoO6nQk9XXJGM92434VVUCb/wv68TcihDsH2IVOA8/OcLfj+CQf+vNC8d+Vtq
         SuNMxZpxVO02C/Mv8mR7fXycG4jiAVFESGlgUvMRX/t/vEQIIqWBTxFcv7YhwV9lrSul
         x+0rwrL0N9yNI09Nh2f+dOFn0JAEY5WhtHZPKrlbVEp3U2lk1xJSoyK9GBRGj/VnyrN2
         xLKgAc4i2h0qzqJxyA8F7DdljdVzZwQHlqki8ozXywKUoxJG7WeZOQn11PfI1rFPLEUP
         nFAu8987CGrBI3oALFC4E4LyQ3vSotEJAAxB6BOSS4vPiIX+td3fS1ISeOOmilcunsSh
         /MBQ==
X-Gm-Message-State: AFqh2krywjirHOpYa++ryaSKCtnxEBakUL++R1KWUl1sIH7RXxAXOZNq
        nALAa+ZzKy8NaAHM4I73wmoe1w==
X-Google-Smtp-Source: AMrXdXtQXDvrP8Mm03QChyYcDDMYRpcDK1+orbzA94rpqde8WE46kHwaMtlBv9hBg6y++hjtgUpmAQ==
X-Received: by 2002:a17:906:240f:b0:78d:f454:386d with SMTP id z15-20020a170906240f00b0078df454386dmr42633339eja.42.1672829737263;
        Wed, 04 Jan 2023 02:55:37 -0800 (PST)
Received: from blmsp ([2001:4091:a245:805c:8713:84e4:2a9e:cbe8])
        by smtp.gmail.com with ESMTPSA id mj26-20020a170906af9a00b0073d71792c8dsm15153714ejb.180.2023.01.04.02.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 02:55:36 -0800 (PST)
Date:   Wed, 4 Jan 2023 11:55:35 +0100
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        wenst@chromium.org, johnson.wang@mediatek.com,
        miles.chen@mediatek.com, fparent@baylibre.com,
        chun-jie.chen@mediatek.com, sam.shih@mediatek.com,
        y.oudjana@protonmail.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, ryder.lee@kernel.org,
        daniel@makrotopia.org, jose.exposito89@gmail.com,
        yangyingliang@huawei.com, pablo.sun@mediatek.com,
        weiyi.lu@mediatek.com, ikjn@chromium.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCH v2 01/23] clk: mediatek: mt8192: Correctly unregister and
 free clocks on failure
Message-ID: <20230104105535.j7zasooq5u2xgng6@blmsp>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
 <20221223094259.87373-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221223094259.87373-2-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Angelo,

On Fri, Dec 23, 2022 at 10:42:37AM +0100, AngeloGioacchino Del Regno wrote:
> If anything fails during probe of the clock controller(s), unregister
> (and kfree!) whatever we have previously registered to leave with a
> clean state and prevent leaks.
> 
> Fixes: 710573dee31b ("clk: mediatek: Add MT8192 basic clocks support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8192.c | 72 ++++++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
> index 0e88588b2c49..eff66ca6c6a7 100644
> --- a/drivers/clk/mediatek/clk-mt8192.c
> +++ b/drivers/clk/mediatek/clk-mt8192.c
> @@ -1100,27 +1100,61 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
> -	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
> -	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> -	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node, &mt8192_clk_lock,
> -			       top_clk_data);
> -	mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
> -				    top_clk_data);
> -	mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
> -				    top_clk_data);
> -	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
> +	r = mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
>  	if (r)
>  		return r;
>  
> +	r = mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
> +	if (r)
> +		goto unregister_fixed_clks;
> +
> +	r = mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> +	if (r)
> +		goto unregister_early_factors;
> +
> +	r = mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node,
> +				   &mt8192_clk_lock, top_clk_data);
> +	if (r)
> +		goto unregister_factors;
> +
> +	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
> +					&mt8192_clk_lock, top_clk_data);
> +	if (r)
> +		goto unregister_muxes;
> +
> +	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
> +					&mt8192_clk_lock, top_clk_data);
> +	if (r)
> +		goto unregister_top_composites;
> +
> +	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
> +	if (r)
> +		goto unregister_adj_divs_composites;
> +
>  	r = clk_mt8192_reg_mfg_mux_notifier(&pdev->dev,
>  					    top_clk_data->hws[CLK_TOP_MFG_PLL_SEL]->clk);
>  	if (r)
> -		return r;
> -
> +		goto unregister_gates;
>  
>  	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get,
>  				      top_clk_data);

I think you may have missed this one. If of_clk_add_hw_provider fails
you should unregister all of the above, right?

Otherwise:
Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

> +
> +unregister_gates:
> +	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
> +unregister_adj_divs_composites:
> +	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
> +unregister_top_composites:
> +	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
> +unregister_muxes:
> +	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
> +unregister_factors:
> +	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
> +unregister_early_factors:
> +	mtk_clk_unregister_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
> +unregister_fixed_clks:
> +	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
> +				      top_clk_data);
> +	return r;
>  }
>  
>  static int clk_mt8192_infra_probe(struct platform_device *pdev)
> @@ -1139,14 +1173,16 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
>  
>  	r = mtk_register_reset_controller_with_dev(&pdev->dev, &clk_rst_desc);
>  	if (r)
> -		goto free_clk_data;
> +		goto unregister_gates;
>  
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
> -		goto free_clk_data;
> +		goto unregister_gates;
>  
>  	return r;
>  
> +unregister_gates:
> +	mtk_clk_unregister_gates(infra_clks, ARRAY_SIZE(infra_clks), clk_data);
>  free_clk_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> @@ -1168,10 +1204,12 @@ static int clk_mt8192_peri_probe(struct platform_device *pdev)
>  
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
> -		goto free_clk_data;
> +		goto unregister_gates;
>  
>  	return r;
>  
> +unregister_gates:
> +	mtk_clk_unregister_gates(peri_clks, ARRAY_SIZE(peri_clks), clk_data);
>  free_clk_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> @@ -1194,10 +1232,12 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
>  
>  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>  	if (r)
> -		goto free_clk_data;
> +		goto unregister_gates;
>  
>  	return r;
>  
> +unregister_gates:
> +	mtk_clk_unregister_gates(apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
>  free_clk_data:
>  	mtk_free_clk_data(clk_data);
>  	return r;
> -- 
> 2.39.0
> 
