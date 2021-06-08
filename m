Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FFFC47082
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jun 2021 14:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67D5D61185
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jun 2021 14:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbhFHOrW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Jun 2021 10:47:22 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:41622 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbhFHOrU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Jun 2021 10:47:20 -0400
Received: by mail-wr1-f54.google.com with SMTP id o3so3491075wri.8;
        Tue, 08 Jun 2021 07:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rtkVCqFclfnOcLFY42eNuHtMCdPaEEdnvA/5RSK3Neo=;
        b=OUBXvCeD9OYornl3soOahgtmJcOzVqmQiEVx8GLNnhQuBh2bwNzCaqw8RBb/k6zO3D
         CuYPShloxujbXmPALdD+GCxeavHtP17oyXahd/gGrQVldj/uumS09uDAhWm89qQZ+dHX
         nBzE0JIpC+zEowOd8QhzXELVmkxc9/Pp9gr93zSGv4A4d9c5BJJLZCgIgS4Re1cEi1dp
         hAyxW0WKBZ6N3fMC9Y2P4+ql7VUzQsje0PzORNy3R794+lb8j/5vpGRd8GK47ti/ve7N
         2FEYq1uQDhFbuJT3H7MX/+vpVG+zsB7Eu+2w2YsvJ9AsCQQd5mdKwwQQKGiK39qZsR8f
         SPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rtkVCqFclfnOcLFY42eNuHtMCdPaEEdnvA/5RSK3Neo=;
        b=eej3amf+kfp6FqNgli+0e0eXNrVvGKm5HOYjNd9jOyefN0j27lhVb8tKBNOkoYWIa3
         pdYWl8Iqt9r/inSvGkoDKQFPpFibYouP3nK+QAK6LhuUr+NJyyhuPIfZaIiGO9Kp3Sjz
         QqGv5yXoM4cEzIrewfTIB1g+6S0v67ty9YuVhb5akY1HwPcrFvlX/Q1xnHfUUB6xNmG7
         vCHIyAdLkek+kNbKddv1PBXEtuokjydR2w7ZM3Lsw4vie7rUCqjNLVuw4Gz9DmFD8Tzd
         brLmk2OhoCY18hQpPD6Ea5ZgQL1/08gK6fr9eF6SGOt4m0g4AUWiEuFU8WqeacOs6II1
         +S4Q==
X-Gm-Message-State: AOAM531WIjDvjrDQc2iFl6xzKdaxggZZiNCWK3HyPNpYyH7n/L+muDFa
        LV3BxfB1G3IluTKr7riDNX8=
X-Google-Smtp-Source: ABdhPJxTX/UEWVJz18ubogTqfMHuCm7GF5j5zRHG8OHa8ANdDbrg50wM2tHe4ZD5CIkI91tVAv1Vnw==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr23839945wrn.413.1623163466265;
        Tue, 08 Jun 2021 07:44:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id j1sm17886775wmi.44.2021.06.08.07.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 07:44:25 -0700 (PDT)
Subject: Re: [PATCH v9 18/22] clk: mediatek: Add MT8192 mmsys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-19-chun-jie.chen@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7520a10b-b362-03d4-e41b-e2098ae26621@gmail.com>
Date:   Tue, 8 Jun 2021 16:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210524122053.17155-19-chun-jie.chen@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 24/05/2021 14:20, Chun-Jie Chen wrote:
> Add MT8192 mmsys clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig         |   6 ++
>  drivers/clk/mediatek/Makefile        |   1 +
>  drivers/clk/mediatek/clk-mt8192-mm.c | 108 +++++++++++++++++++++++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
> 
[...]
> +
> +static int clk_mt8192_mm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
> +	if (r)
> +		return r;
> +
> +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
> +static struct platform_driver clk_mt8192_mm_drv = {
> +	.probe = clk_mt8192_mm_probe,
> +	.driver = {
> +		.name = "clk-mt8192-mm",
> +	},
> +};

Did you had a look at drivers/soc/mediatek/mtk-mmsys.c? How is the MMSYS
different from all the other SoCs? I suppose it is not. Please don't just
implement the clock drivers, but check in existing code how they play together
with the HW they are for. MediaTek unfortunately has the design to add the clock
registers in the address space of the IP block that needs this registers. Which
makes it more complicated to implement clock driver in the first place.

Regards,
Matthias
