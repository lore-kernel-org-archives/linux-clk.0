Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF819C07E9D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 06:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbiIZGi2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 02:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbiIZGi0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 02:38:26 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53021E04
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 23:38:25 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a14so6278634ljj.8
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 23:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=W3hxzdrBIum1j0xz9YZTHAUg/0XjqqL/D7mMmLIxdR4=;
        b=ePexRndPURvdCW/6uFFqR/iEiqGsxFN63U0+E7Mw/SDz4ZwwNEHsmVHumFqZeMYCUP
         w8s7D75BCLIzBKqYzi2ogsSYLQfENPA4YBlkAy7xmGIaZVpzOBLJOJBVmSgV8B9AxENp
         4k9tn5vOQllbiqS/XTVubaMGN3+gj9u09UhLCVk0TYFk8T5lw7S/gkcV2EfEw/3L/JMQ
         D1Pt/0hEH58mgxQwVwA1fUt8341UKEQFrik2uQZ70jnH8wajATyMJdZbd8uzdTiFw7/8
         s4sXMk+6hYNL9CHWmFGnedd4ZzjP6bKJB+in83kJvdPYJbbwwdg5MwyBBVmi4j+WhIEb
         IqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=W3hxzdrBIum1j0xz9YZTHAUg/0XjqqL/D7mMmLIxdR4=;
        b=mAOimtW5ahi4V0N5mAqm8sGutSY3Gw2agWtudH52rbOBah07Zdv5c4hRfaaVgPRayO
         gOkRL6wTG8SqyYNSJEBEECOAA8O0ckqOdTFebMfQ2CI7VHpSHWu4MIvY6F26dkKZjN6b
         3esYpZKUtR9TEnHt0cX55rkmmRpQOl7myJBRC4KG0SkRjLlXFWo1XsfRPMTiwpnDG3Wl
         Hv1ImijCQzFqq2SMQRiLU9JUh2/hHGpYnfQ98ne8kS7lDz53BKsMtftsNfzHGtv7PumG
         pkVhA8BkEhmVsDDGPWyTGhSMJ8ceRvv4tALyR7Y4dCiXbfhLX5dmd4P0p8lZhrDFHrsd
         cf7Q==
X-Gm-Message-State: ACrzQf2q9W+tSNQEpDRcX4pJ2erpR5pEgfizlg4EsBdax7Q7/V9HAbir
        Ij0xYsq0FNKOjrKO7wxFrOqmng==
X-Google-Smtp-Source: AMsMyM7zYhJnhCTUeUDjnpPqlK+tH954E2LgxBK1i8gOU2GZVXuiyg0sE4TRiLJTrdd7ByA6IdiJnQ==
X-Received: by 2002:a05:651c:a04:b0:26c:50df:75ad with SMTP id k4-20020a05651c0a0400b0026c50df75admr6942132ljq.416.1664174303703;
        Sun, 25 Sep 2022 23:38:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020ac25625000000b004a050ddc4ecsm1321680lff.125.2022.09.25.23.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 23:38:23 -0700 (PDT)
Message-ID: <bd99a454-8cee-edb9-bc34-ce0be280bd90@linaro.org>
Date:   Mon, 26 Sep 2022 08:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8195
Content-Language: en-US
To:     Chen-Yu Tsai <wenst@chromium.org>
Cc:     Guillaume Ranquet <granquet@baylibre.com>,
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
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-phy@lists.infradead.org, Pablo Sun <pablo.sun@mediatek.com>,
        linux-arm-kernel@lists.infradead.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-15-4844816c9808@baylibre.com>
 <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
 <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/09/2022 07:24, Chen-Yu Tsai wrote:
> On Thu, Sep 22, 2022 at 3:20 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 19/09/2022 18:56, Guillaume Ranquet wrote:
>>> Add dt-binding documentation of dpi for MediaTek MT8195 SoC.
>>>
>>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> index 5bb23e97cf33..2c7ecef54986 100644
>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>> @@ -24,6 +24,7 @@ properties:
>>>        - mediatek,mt8183-dpi
>>>        - mediatek,mt8186-dpi
>>>        - mediatek,mt8192-dpi
>>> +      - mediatek,mt8195-dpi
>>>        - mediatek,mt8195-dp-intf
>>
>> Aren't these the same?
> 
> *-dpi are MIPI DPI (as in parallel data with DDR modes) encoders.
> *-dp-intf are Display Port encoder.
> 
> Totally distinguishable. :)
> 
> The hardware blocks seem similar upon cursory comparison of the register
> tables, with the base layout being the same, and sharing registers for
> basic settings such as the display timings.
> 
> The DPI ones have some extra registers, presumably to control the signals
> or output width. The DP one has some registers of its own that only make
> sense for Display Port.

OK.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

