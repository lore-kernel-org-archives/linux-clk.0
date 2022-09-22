Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAEBC6FA82
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 07:21:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiIVHVF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:21:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbiIVHU6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 03:20:58 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 210B1D12D1
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:20:51 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x27so13297784lfu.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=TPd1M8oBjHnNozp05d671P5pFiuRlsalsS4w6miNryU=;
        b=DEJqWRMQjOJQ8++nLzN9KbMQNg31pNbXrNYPjUYeHJxeulmWbiO3uwjEydrBT8enpx
         5sS2fPSXu9nqh8I/U4KFSjfV3G927s/rv1tqmj11Z2hF3kMbAnVU2AD+yP09o57fyrB4
         3cJUgnwaYKiaus3XEQp1bZ/IX9OrFDM730VMEIsL18ne6cBc8bpe+z91516vR0rgCpTP
         AiRjBaf+dMkrbqac4f8myV0JWSpk4Ag1fPfLQclSe47PPYVhP9hqgVE/2t3wrtFREca9
         Dd1w0tMisqyJRSHK931fl/LPYRhJH7/SXY2e8WeY+Ypjx66EOWYGyniBFn6hR7Q3Zlzw
         uVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=TPd1M8oBjHnNozp05d671P5pFiuRlsalsS4w6miNryU=;
        b=UPpBl8QSVOfI9/IB3kjstW7loB3+DC3PyCuuq7qWngPSeqeHWix+b3rl3xxeuv+abf
         vjBC80rJZN93J4ZPIw2qHe4ufV1nnWaqaNd+PPCbsW6ZnDjg9JXoWlUv2Y/F6Cbw13u0
         UMPCTbhRuaoctZcCB5k91YJ7n4HX2/dqp3+aDyWcnNgQlUjq+bagH1Lb8g7qngnq3vwf
         WnhKSeS8JYPL7e5RUWJ5DlwgoHbsaF7NOhJGCfnyONX8qpEbZarIQBhmbdNLyt9b8GFF
         hNBwG0GF91VFdk3acv9u6vheBIh3PW1tS4j5KSR6BGBUaiHh2S7Jgv3G8BsC4FZi2hfj
         BXSw==
X-Gm-Message-State: ACrzQf0xLUNAVOVEqMUg/feIGZ4zmpDT+s6vPvbiB92P42Y2jh8ZHb/W
        OXAnmP4epQ8YIRprXwtlyiCJXQ==
X-Google-Smtp-Source: AMsMyM55t1rNZFbd9M//L345bj9ZqSPstb512C/ND5LsTPVxSfYeiy0p88QI81OjW4xD1dRYCtEUEg==
X-Received: by 2002:a05:6512:3187:b0:49e:6607:3a75 with SMTP id i7-20020a056512318700b0049e66073a75mr681890lfe.28.1663831249033;
        Thu, 22 Sep 2022 00:20:49 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a199209000000b00492e570e036sm801300lfd.54.2022.09.22.00.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:20:48 -0700 (PDT)
Message-ID: <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
Date:   Thu, 22 Sep 2022 09:20:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
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
 <20220919-v1-17-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-17-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add dpi support to enable the HDMI path.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 72049a530ae1..27f029ca760b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -820,6 +820,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	  .data = (void *)MTK_DPI },
>  	{ .compatible = "mediatek,mt8192-dpi",
>  	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8195-dpi",
> +	  .data = (void *)MTK_DPI },

It's compatible with the others. You don't need more compatibles.

Best regards,
Krzysztof

