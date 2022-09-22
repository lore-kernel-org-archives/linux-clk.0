Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D062EC6FA90
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 07:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbiIVHYg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:24:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230024AbiIVHYe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 03:24:34 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6BDC01
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:24:29 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x27so13309961lfu.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fVcE2reQEfaEop4WRxdK1mO72Ip3uJjJkJGgaluoDsM=;
        b=MSlRGljboTuGCdg3YEgOuKZBwTHCYcmzhnbgNphcxRdZyyfnwC664T8n53L+7Kb5A1
         cBjGVu/xWbq4oUq8SLl+K3rsUKIyb/pAPtYAe6Ak01fZY6SfyZEnTaLs/z3BMKPjkSgv
         vjmGQIgs1lLjxNx/uTL+ut/giC8XhZcsQwMrTBvzpBex0lB1/0LvbylWJluy/Ic3INLQ
         SjlutBZR81gnaEMn5Jc0oha2px1AkGagITF9BddZQkinMio1PuFwtZLaGSUmLItkLHzB
         1LEDnf+uCMw/DTWJNW0akGZdDtngxnSDEMs68J10o1m+HzEjBBsp1pp6Xc4Uce8MuQ5O
         YqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fVcE2reQEfaEop4WRxdK1mO72Ip3uJjJkJGgaluoDsM=;
        b=CVkb7mr/bt/ME8pgHkpYZ+H3BIlb0y8gWJJJ6FHfLTXKcUV79DJdTBWx72cuWN8mHR
         NjLS99EL2tOoHJHR9PHjlegPj7k4izc6CC+DRIyoTx9+5PyseBKcJTnIDC5PRzmpRihM
         AghEKZNQoC4V01vrFV3klzGaHMacpTDHHeVL/Iq1ApM55AQYwdCbgD58DJrSPH+ulpaS
         Q65ilAxNXU2JMvv7vORuX16D0xw1QpazWXP4d/TBujP4FaThVh+GUB2OIZ1+brqt04mH
         ueLvU/b/rjzkGtn8Xnnr3cSzjOC4yQCeDv9FjFuQBNAojVsej2LTMnu0EC8t4rJrzNsF
         2iGw==
X-Gm-Message-State: ACrzQf3IeV8PTa5jgegu4zrDWuloMlQ6M0YUCnkq5OX4Hd0YNwO1tCok
        u1QCGe04l2MDslYe9XqdbNKELA==
X-Google-Smtp-Source: AMsMyM5zA8VBFZmHafhekY2Y0dpCwQNF2kNCm9Hgz6tvQd/1QC+mRy8x/sO+uaHu1Mn31n8rO9wtGA==
X-Received: by 2002:a05:6512:370c:b0:49f:c4fb:8706 with SMTP id z12-20020a056512370c00b0049fc4fb8706mr723544lfr.635.1663831468306;
        Thu, 22 Sep 2022 00:24:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j5-20020a2e6e05000000b0026c59d3f557sm769428ljc.33.2022.09.22.00.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:24:27 -0700 (PDT)
Message-ID: <c74b4ab7-e307-482b-c4fc-0a7a1e39d6d1@linaro.org>
Date:   Thu, 22 Sep 2022 09:24:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 11/17] drm/mediatek: hdmi: add mt8195 support
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-11-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-11-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Adds hdmi and hdmi-ddc support for mt8195.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>


> +static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_hdmi_ddc *ddc;
> +	int ret;
> +
> +	ddc = devm_kzalloc(dev, sizeof(struct mtk_hdmi_ddc), GFP_KERNEL);
> +	if (!ddc)
> +		return -ENOMEM;
> +
> +	ddc->regs = syscon_regmap_lookup_by_compatible("mediatek,mt8195-hdmi");

That's not how you get regmaps. If you the driver grows, are you going
to grow the list to e.g. 10 syscon_regmap_lookup_by_compatible() calls?
This has to be by phandle.

Best regards,
Krzysztof

