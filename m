Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94008C6FA90
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 07:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbiIVHTz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:19:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiIVHTv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 03:19:51 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB47518E3B
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:19:46 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f9so13194950lfr.3
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=L0CcexYvr50ry0k5LCLuUVWFoXYl8KApJv3vLCHXZiI=;
        b=b4OPSMZB6A6D9dbVJDjiKqN/SOqiPbLIKzOQK3629IC/ZBvZuPkd9QczfXkA0JnkWU
         zzJIGX/7zmeF5SFpWKqdQpqqnoExVWZwXAVE64zz8A1GRanmjz/aESunHQ1HzOPB/Gw3
         8fVd9+1Ao3KwZ2P9EbUcYA6/KV4EbKk2szlEDbf0lbcc3W9PTSkSWpSw8FtpSrAKHlel
         YoPdkZFHGs6iD18Dm0SSbHIZ6dDOcDd0g40OoocVuQZm5KO73C43Wmaiz7fwpNC03qyj
         MBXysfSJBOqJw3VH5bYZ5urmfkOip6gjcBqWVLqJTA9bi+M3qaMT/IkGPWcEJXngzIkR
         GS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=L0CcexYvr50ry0k5LCLuUVWFoXYl8KApJv3vLCHXZiI=;
        b=bqLdzGmfPWrCt0COiAq/GzKgptzgZEEwMx28U5DIzW9cN2HN6sl1O4tUgdWQ4Uwt11
         jc3BMzadFIsDYSe/e/CMmXYtmHc31GYDzEORki9dwdyo+8wF09Rjb79qEi6fwjSvo6dC
         2I056rIQdiYKgigpT5GDWTTJ+FeEIiSL+fwp8TYe++vCKtWFaWw2v3Tpe0WUuqtRUX/j
         g5FgChE/rJJrB6RpzpbfqX/OjmJDmWsJCrkV1pg/Ubpd1Kk3xw1ME5Iy/jdoaJboUBqu
         nNVNEvyP0BURQ5a0G2OXwwCOfqm9cE6Cr3M6dEA23LW4leEgBCfmLuAeJuhwlFSmONGR
         AvYA==
X-Gm-Message-State: ACrzQf0wUq7FkQLdwNrgC2bVzxxB5Mj6N87yhnvNwFJWx8/sNDx0C7xP
        7ss6K/ZYxowYSuq8/+gnCqYE4w==
X-Google-Smtp-Source: AMsMyM4gLReXsZlISFiuSW1XgfW0GpMeZQMBFVw9foI7xJCo01KU0HcjadDByu18kEXVa3VsgiXg9g==
X-Received: by 2002:a05:6512:1055:b0:49a:de51:5458 with SMTP id c21-20020a056512105500b0049ade515458mr671284lfb.585.1663831184180;
        Thu, 22 Sep 2022 00:19:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t2-20020a05651c204200b00261e8e4e381sm775206ljo.2.2022.09.22.00.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:19:43 -0700 (PDT)
Message-ID: <5a857097-30c2-3b37-6134-57cb942113ca@linaro.org>
Date:   Thu, 22 Sep 2022 09:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 06/17] dt-bindings: mediatek: set the hdmi to be
 compatible with syscon
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
 <20220919-v1-6-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-6-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> In order to share register with a dedicated ddc driver, set the hdmi
> compatible to syscon.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> index abb231a0694b..86297b7eb7f7 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> @@ -16,12 +16,14 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt2701-hdmi
> -      - mediatek,mt7623-hdmi
> -      - mediatek,mt8167-hdmi
> -      - mediatek,mt8173-hdmi
> -      - mediatek,mt8195-hdmi
> +    items:
> +      - enum:
> +          - mediatek,mt2701-hdmi
> +          - mediatek,mt7623-hdmi
> +          - mediatek,mt8167-hdmi
> +          - mediatek,mt8173-hdmi
> +      - const: syscon

So you just broke all DTS and I do not see patches fixing them...

Best regards,
Krzysztof

