Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6912AEB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 16 Jun 2023 08:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343755AbjFPIny (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Jun 2023 04:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343706AbjFPInv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Jun 2023 04:43:51 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE5AF30CB
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 01:43:45 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-985b04c47c3so57229666b.1
        for <linux-clk@vger.kernel.org>; Fri, 16 Jun 2023 01:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686905024; x=1689497024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4uTs7FnJFXFKLzC/P4qYa/B1cEUkKIPyzVP/HrU79w=;
        b=Vd+/fffm1Uc8+qGgYcYHzDB2xIqMW5bL4ViQV8/368o6TiCAFco68clq30DTFuymu6
         LXtkPZW8X705V85I/4+vh/080wgkXWz/DEguJe6ewmXdukW2zpURCO3cLSbO3/WgDCq9
         ovt3WcQvTbajSUE+z0Wfm/8lCiH8hM35TCEu2/9Y8L11KEyVuHAo9r59Ugt9bivmTe7k
         DvNwaqjjiJjDp3Ie19Shk7me32pGoWYXKHnkWfVI3eSBUOKXnd5xROfO57MAikISuguy
         8+h6knuri0btoFT/M4HF44VgICvdNtLXBmT5qzYlX+aCSN8GRQwvw4vUP5qOMrEZiTPl
         LN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686905024; x=1689497024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x4uTs7FnJFXFKLzC/P4qYa/B1cEUkKIPyzVP/HrU79w=;
        b=gFT94yOaI0vvSd+TXNkeUXHBUQm0uw/DexdjVJR3xcKcoGIgORCEnlXM9kQPZBRxBE
         IeeKPt/dL+wxdVBs46NIKttUAxM0DRVuItL5zX8uBcO6/dKG/js1cMREaV7ui37ggJnn
         5hf3zHDoNSPjaIT+L6itwh+eTs2toIH6OwP/Lv9q+grE1rXd6vdjlaLtkCvuXxDzVIHC
         K+Qp682wSScLiGo7vvlvF/Bm1P6jsi1Ibi3vWHG1+04dhXyNlVPrIsi2hNcHt0acnvgZ
         ByxXQ7oQ3fQYZtW/WtN1duwM5njfEzxbUgxyIW4hQX6GVzRPn+7cMeXU1n7kSY0UFNkq
         4Piw==
X-Gm-Message-State: AC+VfDzbADv7nahsA6P0GOCVaK+aKpE7LSlBLUhHibcGDwhJv/Go935m
        cCrfYUFdfJUkrD6Ul6U6ZN9skg==
X-Google-Smtp-Source: ACHHUZ4h5oKJwDdIEew4cO4SDJba08vuXA+fsfymmQgCUsDf2tPbwnu7yYD1mZpP8w3z5/ngP/FaEA==
X-Received: by 2002:a17:907:7290:b0:96b:48d2:1997 with SMTP id dt16-20020a170907729000b0096b48d21997mr1218630ejc.65.1686905024280;
        Fri, 16 Jun 2023 01:43:44 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:802c:7f03:2fe0:bd27:d746])
        by smtp.gmail.com with ESMTPSA id ot25-20020a170906ccd900b00965f5d778e3sm10387696ejb.120.2023.06.16.01.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 01:43:43 -0700 (PDT)
Date:   Fri, 16 Jun 2023 10:43:42 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        wenst@chromium.org, u.kleine-koenig@pengutronix.de,
        miles.chen@mediatek.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 2/3] clk: mediatek: clk-mt8173-apmixedsys: Fix return
 value for of_iomap() error
Message-ID: <20230616084342.4liggsixa7a3w32k@blmsp>
References: <20230615122051.546985-1-angelogioacchino.delregno@collabora.com>
 <20230615122051.546985-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230615122051.546985-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 15, 2023 at 02:20:50PM +0200, AngeloGioacchino Del Regno wrote:
> The of_iomap() function returns NULL in case of error so usage of
> PTR_ERR() is wrong!
> Change that to return -ENOMEM in case of failure.
> 
> Fixes: 41138fbf876c ("clk: mediatek: mt8173: Migrate to platform driver and common probe")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

> ---
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> index daa2856d1ab7..ba1386e70a24 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -148,7 +148,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  
>  	base = of_iomap(node, 0);
>  	if (!base)
> -		return PTR_ERR(base);
> +		return -ENOMEM;
>  
>  	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
>  	if (IS_ERR_OR_NULL(clk_data))
> -- 
> 2.40.1
> 
