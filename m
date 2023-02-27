Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14440C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 08:18:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjB0ISV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 03:18:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbjB0ISU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 03:18:20 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5BDFC152
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 00:18:15 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id p26so3641430wmc.4
        for <linux-clk@vger.kernel.org>; Mon, 27 Feb 2023 00:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmsXqGpstaDNW1rYeO8j3Cmpj7EBNxqayPxfTCKvPnk=;
        b=uCy8R3eUrhut5ajrvRwfcweUpiEmd6SZUU1Q4SaIKe2z0F8/YXupCUZyXtyeTDbjLL
         S+hxrOlTRUkX8LteNyL4osBBaAXwovNwQLKXQiGtZzGojjWKx/an0lnnT2RzNSyH+UdR
         qoLka3mBKnQJduBih32Di4477u2bjhCFMt0rEWDtpOgNsR6CJRQWz/eFwD/n259ehJa/
         9ch27VJh/VIrLigFtlQHnPn7ZPcrJG5O3LTknywrPq2qP7//L9wHHOqN6DsFc8+i2O9q
         QtWu36dlkSXnkj0RQH2Lvhs/GG7lNuXsxF6lsP+cYQ8/iUg+y5lntSodutq5nE+mtjIE
         FMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmsXqGpstaDNW1rYeO8j3Cmpj7EBNxqayPxfTCKvPnk=;
        b=I68PU3VBrsKj1KitNp7CR/PN0d16mExdpX1c9hLgW/FmRrkegUKw1ql4oY4Qhgjrpi
         7I22mJyJlNMnnZEbm1vIqAQw+Ig+a8pGQga2V8RXg7BxhEtwe1f2QQQb/DPphpSjnDdq
         cWrC3VxHgDxPBNeZRZ8sLjb8g7+SFHHndntu2WBImK6wl5xo5oE/yjLIu/sDA6P4Ak75
         V40b0V5o2GQ2M05dL2bd8lUgicIVNPlxZUnCNQM0XHUBSJNSJAHyLNbKVv9E/ZTnK9qF
         ZSl2Lv/6rLQLemHWfCpqtuFapFCxBwCxrwkC3CRmy1JswBok6JiMvxSz5EpZR+pG4kBz
         Iv4g==
X-Gm-Message-State: AO0yUKXc2dOjaXOqTM0ebOfreuTap64FhTytr28ybXJvD3MD4XINP/3j
        xgfLJn1PSFF3MKLGYe/kzYlmPg==
X-Google-Smtp-Source: AK7set9iwF1Of26EjPuUp+IirohBujP4YEwmcDqQ2+5/f3vTpYb09Hw40limy8H2jFYw55cq3FBGfQ==
X-Received: by 2002:a05:600c:1d09:b0:3ea:d611:f8 with SMTP id l9-20020a05600c1d0900b003ead61100f8mr10353121wms.38.1677485894351;
        Mon, 27 Feb 2023 00:18:14 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a4-20020adff7c4000000b002c4084d3472sm6322620wrq.58.2023.02.27.00.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:18:14 -0800 (PST)
Message-ID: <49ec87c5-5f02-ae07-464b-3b9d22c5a6d7@linaro.org>
Date:   Mon, 27 Feb 2023 09:18:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/4] dt-bindings: arm: mediatek: Add MT6735 clock
 controller compatibles
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Golle <daniel@makrotopia.org>,
        Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
 <20230225094246.261697-4-y.oudjana@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230225094246.261697-4-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/02/2023 10:42, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add compatible strings for MT6735 apmixedsys, topckgen, infracfg
> and pericfg.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/arm/mediatek/mediatek,infracfg.yaml          | 8 +++++---
>  .../bindings/arm/mediatek/mediatek,pericfg.yaml           | 1 +
>  .../devicetree/bindings/clock/mediatek,apmixedsys.yaml    | 4 +++-
>  .../devicetree/bindings/clock/mediatek,topckgen.yaml      | 4 +++-
>  4 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> index e997635e4fe4..715e24a4ddda 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml

All the previous patches should be squashed here. There is no reason to
split adding new binding for clock into two separate patches. It is
still one new binding for clock.



Best regards,
Krzysztof

