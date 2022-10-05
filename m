Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B56C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  5 Oct 2022 14:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiJEOx4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Oct 2022 10:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiJEOxz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Oct 2022 10:53:55 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495347CAA3
        for <linux-clk@vger.kernel.org>; Wed,  5 Oct 2022 07:53:53 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f9so770606ljk.12
        for <linux-clk@vger.kernel.org>; Wed, 05 Oct 2022 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=gRO3O8xi78oTZptPglDpaTcSvMIXolMC3hbGjTWLEkE=;
        b=rkd0hforclQhcWpTHlD5y8YCglbsV1/nuc3zv9uCelABf1vBJ1LqFZ4I+qy4C98y/D
         wYR5H7xXkWZjWIZFtIW0tlS0NDcrkm2c3kuUcNg0JXqBsjJ4CSDL8WijhX1lDrseh8i/
         W9fWE4EsOuWnLondke0Ky8FJZCOoFu7LZCM7otnHxNRafjATWM8gGK4mqhPVuQoZnvgs
         mq2nbNDqwHfdSaakOwFlKOdhqNx0X+4JzmoAeBZjE7fb0oITN3Z+TPhnozzalJTjHvYF
         7qKGHcFjEAWhz3zaO2h80PDy4pTX1QoXrQdUodADI4fo0/KCLiHAybrIX10rDpQERn52
         GGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gRO3O8xi78oTZptPglDpaTcSvMIXolMC3hbGjTWLEkE=;
        b=DU69LMn2Wg7PFNdeNdt0QlJ+ennJgFGDbbFr5a3D1Q60jgJpCvyBelsftm0B+4Wuzd
         pq/F9KQzzs96zmEonP6WY9AOeGvg2MzdPnttIZ1ZlFxDHXPJa+EGq181WfStGkStGMee
         8VwOiGPX7H5ynLNTaF6F0KwutkXcotZ1lV1yHgageI3AaJF4Ukbdntid8SaY2Sa1rpbM
         LNHCOkq8an8ODHWIee5u38f86sn8I5N0ucV7tYgK79Xki5eNP0Z7indsb9kVHFAncEuj
         rii7VaRIl3VB/KAsC0+oRH27jcmodR/WyLznKDC1SBjEqFI19y3stqV4ASrEB41x3TPa
         SjuQ==
X-Gm-Message-State: ACrzQf373cFBQ/nLXLQSMN0OtH6quC1/xfqAkdwM2z9m99s7FT7PncA3
        qxWbcWYegpUM2A3+fsQgJeUy4w==
X-Google-Smtp-Source: AMsMyM60sctRdKk2qXd9pHiqWJZhc+vjTpzAps80DCC6YisbGJKbNLJWVROzlZaDH/ZO0THjDUZAjQ==
X-Received: by 2002:a2e:9649:0:b0:26d:e740:ea5 with SMTP id z9-20020a2e9649000000b0026de7400ea5mr5117ljh.363.1664981631600;
        Wed, 05 Oct 2022 07:53:51 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b24-20020a05651c033800b0026dce0a5ca9sm1333111ljp.70.2022.10.05.07.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 07:53:51 -0700 (PDT)
Message-ID: <b628a3de-98a0-fa55-57d1-cd375fc8d4e4@linaro.org>
Date:   Wed, 5 Oct 2022 16:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v1 17/17] drm/mediatek: Add mt8195-dpi support to drm_drv
Content-Language: en-US
To:     Guillaume Ranquet <granquet@baylibre.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
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
        CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>
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
 <49daae86-e922-9a17-ebed-2a33a5eeb18e@linaro.org>
 <CABnWg9sPuJQQOmLGDSgE86NCRh_3GqWZ0dFAs_J2PO9HCVbExQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABnWg9sPuJQQOmLGDSgE86NCRh_3GqWZ0dFAs_J2PO9HCVbExQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/10/2022 11:34, Guillaume Ranquet wrote:
> On Tue, 04 Oct 2022 17:05, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>> On 04/10/2022 13:55, Guillaume Ranquet wrote:
>>>> No. You said what the code is doing. I think I understand this. You
>>>> still do not need more compatibles. Your sentence did not clarify it
>>>> because it did not answer at all to question "why". Why do you need it?
>>>>
>>>> Sorry, the change looks not correct.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> I need a new compatible to adress the specifics of mt8195 in the mtk_dpi driver,
>>> the change is in this series with:
>>> [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver [1]
>>
>> But you do not have specifics of mt8195. I wrote it in the beginning.
>>
>>>
>>> I then need to add that compatible to the "list" here in mtk_drm_drv.
>>
>> No, you do not... I checked the driver and there is no single need... or
>> convince me you need.
>>
>>> I don't see a way around this unless I rewrite the way mtk_drm_drv works?
>>
>> Why rewrite? You have all compatibles in place.
>>
>>>
>>> Maybe if I declare a new compatible that is generic to all mediatek
>>> dpi variants?
>>
>> You were asked to use fallback. Don't create some fake fallbacks. Use
>> existing ones.
>>
>>> and have all the dts specify the node with both the generic dpi and
>>> the specific compatible?
>>>
>>> dpi@xxx {
>>> 	compatible = "mediatek,dpi", "mediatek,mt8195-dpi";
>>
>> I don't know what's this but certainly looks odd. Some wild-card
>> compatible in front (not fallback) and none are documented.
>>
>>> 	...
>>> }
>>>
>>> Then I can "collapse" all the dpi related nodes in mtk_drm_drv under
>>> "mediatek,dpi" ?
>>>
>>> I guess would have to do the change for all other components that are needed in
>>> mtk_drm_drv (mmsys, aal, ccor, color, dither, dsc, gamma, mutex...).
>>>
>>> That's the only trivial way I can think of implementing this with the
>>> current status
>>> of the mtk_drm stack.
>>>
>>> Do you have any other ideas in mind?
>>
>> Use fallback of compatible device. That's the common pattern.
>> Everywhere, Mediatek as well.
>>
> 
> I'm unsure about what a "fallback of compatible device" is.
> But from what I can gather, you'd have me write the dts as:
> 
> dpi@xxx {
> 	compatible = "mediatek,mt8195-dpi", "mediatek,mt2701-dpi";
> 	...
> }

Sounds reasonable. Just someone should check whether devices are
actually compatible, because driver is just a hint.

> 
> so that the mtk_dpi driver will use the specific mt8195 dpi config and
> the mtk_drm driver will fallback to mt2701 to find the compatible it needs.
> 
> Would you like me to use this pattern for all the other compatibles declared
> in the mtk_ddp_comp_ids array in separate patches?

Could be for consistency, but it is up to you.

Best regards,
Krzysztof

