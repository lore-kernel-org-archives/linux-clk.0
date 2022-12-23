Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3875EC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 23 Dec 2022 09:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235722AbiLWJ0l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Dec 2022 04:26:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbiLWJ0k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Dec 2022 04:26:40 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DC836D5A
        for <linux-clk@vger.kernel.org>; Fri, 23 Dec 2022 01:26:39 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id bf43so6392126lfb.6
        for <linux-clk@vger.kernel.org>; Fri, 23 Dec 2022 01:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sffa2Hux8GaWgWWtPY8hkrJRPTRgOSkXQuS0QSdZFis=;
        b=aF5d0f6QVvd38Mdy/2T+RdKXdHV1tHP1d/FlSvUZJDO0AMX2oD5pTxWaKLINjsGrCk
         33voj68lDcU27Mn4+rIW2DPXtxJ+KuXcKnpA9lgUpRLcnAWU63QTKHmzOlp3vXDwOuHY
         yr/gwVLdfkqPQ2XNiOHal0noWIABZus40cUWsEukeOLonsNe8Z3OWZGztMKeP/OjiWGp
         EeP2SgoDVIoXd6/wGIkIN9JpwKznnMFEPff86tyFnvB2j6diAL57ZJmaC3Fmd2IbGG2h
         JRpNNDILKAMpPeb0ofkeHuy6/ndOpNJRZJkn6vdYUMe/4rCpx8Z5SanRUt89QrLZkcV0
         Nwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sffa2Hux8GaWgWWtPY8hkrJRPTRgOSkXQuS0QSdZFis=;
        b=ZASY1kOyELsEa54iwZVr0d/uelnxYXshjuA6x8jvVzc7R4x1QsuaWtRoxfpB9AteOB
         4XUHvjMiewGmMFp93E8EPDF0ytn4PFmtfFkzrVhTuEcLII8vTiX0BluHRERkvPKX7+n8
         QFgavuqGQEDsepnVOfWEfEr+VaTYBWr9DPJWWAh7CpPJZ55k+sokyONqF3SiMImuryhf
         U9zpcDYWs9QpJZHfFk+SbLglgs5D5axPAkwsr8gGdErc/Gjjiz8JZodYDCA7y7+2YGaQ
         2Getv3bLrf6kwqpYIA9RDEuwGxNkvcaxiknyRN1+TLCyjGcqUnYlXk5RAqIKZiRbMH7G
         t5Nw==
X-Gm-Message-State: AFqh2kqCLQOpLiEmlTESu5YAXyaiETWTbYPJeFQCxqFvmp16NyTrK8BS
        ExolKOwS8qTmVAJGbuZRbiYcsg==
X-Google-Smtp-Source: AMrXdXvX2r5mqocclfvoOrl6ACTY0m1OG8B3pC83AXf4Py5ZlLKVUQRwn6/iWosyd9CVfwxT2J+oBA==
X-Received: by 2002:a05:6512:3d05:b0:4a4:68b8:9c2e with SMTP id d5-20020a0565123d0500b004a468b89c2emr3673035lfv.22.1671787597388;
        Fri, 23 Dec 2022 01:26:37 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a20-20020a056512201400b004cafa2bfb7dsm2867lfb.133.2022.12.23.01.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 01:26:37 -0800 (PST)
Message-ID: <46edd627-c128-b979-823f-0a94fe9d425b@linaro.org>
Date:   Fri, 23 Dec 2022 10:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 08/25] dt-bindings: clock: mt8173: Add dummy clock ID
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Cc:     sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
 <20221222114857.120060-9-angelogioacchino.delregno@collabora.com>
 <869ae494-d74e-03a0-3622-b3a2b0b10470@linaro.org>
 <960b0707-f0e5-993b-3706-a7a275e0698f@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <960b0707-f0e5-993b-3706-a7a275e0698f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/12/2022 10:21, AngeloGioacchino Del Regno wrote:
> Il 23/12/22 09:52, Krzysztof Kozlowski ha scritto:
>> On 22/12/2022 12:48, AngeloGioacchino Del Regno wrote:
>>> Some old MediaTek clock drivers are starting the clock count (so, the
>>> clock ID) from one instead of zero and this is logically incorrect,
>>> as we should start from 0.
>>> During a cleanup an issue emerged due to that and the cleanest and
>>> shortest way to keep devicetree backwards compatibility while still
>>> performing the well deserved cleanup is to add a dummy clock where
>>> needed, with ID 0.
>>
>> Unfortunately I do not understand at all why adding dummy (fake) ID
>> cleans anything here. Unifying IDs to start from 0 is not an argument on
>> DT bindings header IDs.
>>
>> Best regards,
>> Krzysztof
>>
>>
> 
> All clocks are in one or multiple arrays, and if we don't register ID 0,
> devicetrees will reference the wrong clock, as the IDs will shift back by
> one during registration.

So what stops you to register some 0-dummy clock? Why do you need a
binding for it?

> This was done for a commonization of probe() and remove() callbacks for
> MediaTek clock drivers... since we have 3 affected SoCs (MT8173, MT2701
> and MT6779) out of *19* (soon 20), to me, it didn't make sense to write
> commonized code to address this just because of 3 out of 20 SoCs (note
> that each SoC has around 4 clock drivers).
> 
> Any suggestion to keep this one short, while not touching dt-bindings?

Just add a clock or better empty entry in your table, without touching
bindings.


Best regards,
Krzysztof

