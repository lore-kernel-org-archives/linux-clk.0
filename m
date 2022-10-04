Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081E3C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 15:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiJDPFR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 11:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiJDPFQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 11:05:16 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ADFB50731
        for <linux-clk@vger.kernel.org>; Tue,  4 Oct 2022 08:05:14 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j16so21573028lfg.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Oct 2022 08:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CWdX4tvEDe9KXAQIvWXUpR26N6THyFmklq+pYn7/wck=;
        b=v9qAcpY/EulrMR7IHMzcNeWHI6LbF7pg8NXAg+ErSDmILTlVv9VuATHeiDFUuS0GDk
         fMPUpg+ZIm2fvpOjwhU0jNrO51zTdX5Wo89TE4EpRBM2U6EglD08H2D49MIHAr+WLhko
         QutFGm6gKSaXJOgqQqp0VLMjpvhTVkSYKRXOY7lsbEpK7hpvEMVYv/IOjeuYVy2lpDuy
         RIbwA4QZi5UsdDLDWczQYuAqCNJVPlYdCGswtZoaf03Nol5+mrQy953CxoP1IFoIOrTU
         nFaOMmcYVh/vGEvNaZPxeKoSDLmFz2Hx+xOXxbVYjjLs1Y6XZTdt5PUigU9+DBfhOe6G
         ScPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CWdX4tvEDe9KXAQIvWXUpR26N6THyFmklq+pYn7/wck=;
        b=RBcqWa6KsniVgDy7t0ZIoeYe4t0mI2yhz5UiTob74cC0q9g99Z7uup0oBvhII2qKVU
         i1Kt/VD4O+qDz8SUUgYKJm1rVqzPOuqBdInVBUukwdnfRbfndMGQozVpVQTkIQO9jJPL
         CZoN2UGmH+hgN3XE55VAlOYD2XuFks8n+R8ZpzStsoXWVg/PHrfUu2TUgNyJ3psjejjx
         tYdQsIA6DxwYeoY3yWJntR/2IeMDCYF5uI7lFItwaj0mUyjYgzZjGxx7+0ASfC7i5HyV
         B6iaw99VsQZIRRGFD+nMp0y4V5Oq1GVNKsfisE/SLNWC0wLSCn/zd8hxKEYhetAFdfiH
         GtQA==
X-Gm-Message-State: ACrzQf1ry0aqPD5Q0UkTM2EKtvoj21k/hfpdK14vqVrcITebC8bdvvXo
        /kDzTMdCS+iOWjwLQgQnROt70Q==
X-Google-Smtp-Source: AMsMyM4AtZAJOWtGqNYNncGG28gDj+M6F6V0yMuWIAJhpHtFLCOUuhev79xS5vLvDH12H9Ljm6wesQ==
X-Received: by 2002:a19:6909:0:b0:4a2:5d5a:2f49 with SMTP id e9-20020a196909000000b004a25d5a2f49mr430421lfc.66.1664895912921;
        Tue, 04 Oct 2022 08:05:12 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a16-20020a19f810000000b00494643db68fsm1952030lff.81.2022.10.04.08.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 08:05:12 -0700 (PDT)
Message-ID: <49daae86-e922-9a17-ebed-2a33a5eeb18e@linaro.org>
Date:   Tue, 4 Oct 2022 17:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-17-4844816c9808@baylibre.com>
 <a0a3c427-c851-ae5d-4010-e94740bf9f6e@linaro.org>
 <CABnWg9s3N_Ua9g0S3x0uj8PN4FtOX6DO+zQcBzGFqoLTL1J24A@mail.gmail.com>
 <bc64b69d-3d65-f5ca-a688-2ad1a055ba4b@linaro.org>
 <CABnWg9sJFBAXi1bu_yHDppFOmg=H=G7QTn9Bzqkr-t7qm5vUFw@mail.gmail.com>
 <db1abf9d-ba40-f71c-0d37-c3912ac1bd8e@linaro.org>
 <CABnWg9vOHWpdLPAFdXAG3GNgsxpbzgh2gTq_tm72Tk2uR54LaQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9vOHWpdLPAFdXAG3GNgsxpbzgh2gTq_tm72Tk2uR54LaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/10/2022 13:55, Guillaume Ranquet wrote:
>> No. You said what the code is doing. I think I understand this. You
>> still do not need more compatibles. Your sentence did not clarify it
>> because it did not answer at all to question "why". Why do you need it?
>>
>> Sorry, the change looks not correct.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I need a new compatible to adress the specifics of mt8195 in the mtk_dpi driver,
> the change is in this series with:
> [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver [1]

But you do not have specifics of mt8195. I wrote it in the beginning.

> 
> I then need to add that compatible to the "list" here in mtk_drm_drv.

No, you do not... I checked the driver and there is no single need... or
convince me you need.

> I don't see a way around this unless I rewrite the way mtk_drm_drv works?

Why rewrite? You have all compatibles in place.

> 
> Maybe if I declare a new compatible that is generic to all mediatek
> dpi variants?

You were asked to use fallback. Don't create some fake fallbacks. Use
existing ones.

> and have all the dts specify the node with both the generic dpi and
> the specific compatible?
> 
> dpi@xxx {
> 	compatible = "mediatek,dpi", "mediatek,mt8195-dpi";

I don't know what's this but certainly looks odd. Some wild-card
compatible in front (not fallback) and none are documented.

> 	...
> }
> 
> Then I can "collapse" all the dpi related nodes in mtk_drm_drv under
> "mediatek,dpi" ?
> 
> I guess would have to do the change for all other components that are needed in
> mtk_drm_drv (mmsys, aal, ccor, color, dither, dsc, gamma, mutex...).
> 
> That's the only trivial way I can think of implementing this with the
> current status
> of the mtk_drm stack.
> 
> Do you have any other ideas in mind?

Use fallback of compatible device. That's the common pattern.
Everywhere, Mediatek as well.

Best regards,
Krzysztof

