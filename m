Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC53C71153
	for <linux-clk@archiver.kernel.org>; Mon,  4 Sep 2023 09:48:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352676AbjIDJsL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Sep 2023 05:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbjIDJsK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Sep 2023 05:48:10 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A23DB1AC
        for <linux-clk@vger.kernel.org>; Mon,  4 Sep 2023 02:48:05 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a65f9147ccso47684166b.1
        for <linux-clk@vger.kernel.org>; Mon, 04 Sep 2023 02:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693820884; x=1694425684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0epdMrGvIaocozD28WN92DhFdwnzjDxG6GkFKqitp5c=;
        b=X3KJcH9fvRdS+vnmg8WuwZuv1QzBif8j9GE2/ODFSQgxDkpZBBC9jyHrW44JpgtU3r
         /QdSTMQtKike4+e8cTuLhuxQIfpnkmzYGBEmpkLpk++LZxfuHvX4jwdCGNt8T5aY8Nkh
         KugJMBN0FgAH9ZGxSBdKK2H6Vh+betrErBKaYaMhabvoDZAN8F/pZGUrKEMmGpI8pDCH
         rssyiZuCUta7cG5aloIv1MhYjo7SKGILIs4wyqB3L5lmAWY3l9Oz87v8ENefhsmwXaIB
         E9grNOfJbSc8lkGGvmNEsqjexTo8GL8lEuymFyiSfaIhNL0ZE+i9MJlntx+2BA9e07ot
         yv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693820884; x=1694425684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0epdMrGvIaocozD28WN92DhFdwnzjDxG6GkFKqitp5c=;
        b=OeRwFsRNdMky2J6gSSDmTuLuOPhI+uwo+ZzlC1yqTsWRatbV7LgYXMQocByNgwRMQ4
         cg43r/t6+jhW8ie+iZGGWiEGC4VQjlpbn/h4IiL8JgvVx4pg1GH1vzr6U1BBa7TXxTau
         K20yW14ZfnB+EPyAXvN80WpSjxWHSTtBuLtCqLVcglBNC/4LuP3mW068xSmkzdtqEBlM
         IJt8mNsFU0NNXiXgvO1t+Diw8tWj12WyveIi1WeOfiL91VUY4BqCReAs7Hhcxje0kv7E
         Xgb+xumHjbr4C1uIle+Ts6qFIEU8PQOcFRY+Bq/jRm+4cqBMmywXjHajxr4Z+pHbKEmm
         TfMQ==
X-Gm-Message-State: AOJu0YzrCwZIO2JiOk0pcROqruWOG+AklR++u81cF9bjY/L9NWcfm8l4
        0fo5LoukohHVCuWVOyjLTB3j1A==
X-Google-Smtp-Source: AGHT+IHqDjTOUN8MmVWa39gr2DF/D9xBYWMBEA79M3UTLu7/Zx3QJrUK2Da+M+QFZ4HycCUSamyMuw==
X-Received: by 2002:a17:907:9619:b0:99d:decd:3dde with SMTP id gb25-20020a170907961900b0099ddecd3ddemr8877234ejc.18.1693820883978;
        Mon, 04 Sep 2023 02:48:03 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:8020:2b3e:29eb:352d:d92e])
        by smtp.gmail.com with ESMTPSA id g20-20020a1709067c5400b00999bb1e01dfsm5867619ejp.52.2023.09.04.02.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 02:48:03 -0700 (PDT)
Date:   Mon, 4 Sep 2023 11:48:02 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        frank.li@vivo.com, robh@kernel.org, jamesjj.liao@mediatek.com,
        shunli.wang@mediatek.com, erin.lo@mediatek.com,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] clk: mediatek: clk-mt2701: Add check for
 mtk_alloc_clk_data
Message-ID: <20230904094802.6fasingt4m4yked3@blmsp>
References: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230901024658.23405-1-jiasheng@iscas.ac.cn>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Sep 01, 2023 at 10:46:58AM +0800, Jiasheng Jiang wrote:
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
> 
> Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

> ---
>  drivers/clk/mediatek/clk-mt2701.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
> index c81f3e33ce56..12d9560eb4ba 100644
> --- a/drivers/clk/mediatek/clk-mt2701.c
> +++ b/drivers/clk/mediatek/clk-mt2701.c
> @@ -667,6 +667,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk_data = mtk_alloc_clk_data(CLK_TOP_NR);
> +	if (!clk_data)
> +		return -ENOMEM;
>  
>  	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
>  								clk_data);
> @@ -747,6 +749,8 @@ static void __init mtk_infrasys_init_early(struct device_node *node)
>  
>  	if (!infra_clk_data) {
>  		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
> +		if (!infra_clk_data)
> +			return;
>  
>  		for (i = 0; i < CLK_INFRA_NR; i++)
>  			infra_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);
> @@ -774,6 +778,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
>  
>  	if (!infra_clk_data) {
>  		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR);
> +		if (!infra_clk_data)
> +			return -ENOMEM;
>  	} else {
>  		for (i = 0; i < CLK_INFRA_NR; i++) {
>  			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
> @@ -890,6 +896,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
>  		return PTR_ERR(base);
>  
>  	clk_data = mtk_alloc_clk_data(CLK_PERI_NR);
> +	if (!clk_data)
> +		return -ENOMEM;
>  
>  	mtk_clk_register_gates(&pdev->dev, node, peri_clks,
>  			       ARRAY_SIZE(peri_clks), clk_data);
> -- 
> 2.25.1
> 
