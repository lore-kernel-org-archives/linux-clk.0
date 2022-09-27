Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED8BDC07E9D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 13:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231269AbiI0Nis (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbiI0Nir (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 09:38:47 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD4BD98F3
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:38:45 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so15586707pjq.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=kcqezBbHJffozFbEyx9wjhl1YSdIHaVumsP0lVEuZtQ=;
        b=zu0LDMWaZ2IiyJWen0shu8EVhyMeZSD0OIiKtU1o5V962A7jwSkPn4CMMQ0vz96Vth
         tmuzCaRlrru7doTeuXHFqIBlelgapdbTo80FoYEtNoYoaEZL+RORowAW5TQG758voXAB
         /qK4nyJaMel2BpXPOS+vQr8yEpETmpuh9xmFJL3bbdiLCPx3mFskJioDlySfvlYLDiz+
         5l4LD9rzPtofDwJzV7W1kwC3nRoiXAq20n8O9pp9eXpfcWtVB3QDe/+q+6K/KnMeAnfw
         i0uPy9j1+kZk4vpNwuHSzu0wEoCWjqtwlybaZfNOtus5P9tVWa7xP7C9GRMIprbloz4T
         aSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kcqezBbHJffozFbEyx9wjhl1YSdIHaVumsP0lVEuZtQ=;
        b=ol0vSX3nT/66OA9ydaQ0iL88nG1ALJvSsV3Vg268qHZ+BoMJ7ZsoXukdnIgiF6Ep8Y
         dIvM5+A/eLs8aAvGjIgpG62WNYhjyH7snorP8MewDb1ZlIn2rhN8q0nw8AVpsC9Q/HTQ
         yEV+Bh2qrTWPw5FKLXdPyNEOrOO7ktYBYkjst2DU6yDOemNLyd1EfTOSY99CHLPljqxt
         DUfI0eq4G36TPVZthykrOafk47NbneveJYQjPTXXlJ5Q1ehmEkU+vVjQWTeeUS/Wwh8b
         IpnQPxcUmLlvnLe8QLK2haru1fRcENk75rbTVFpctwg6jTnW6dFN12P9WFOpQ4zyLBTT
         vxNg==
X-Gm-Message-State: ACrzQf3PZY3A06axFu/y7SKE4ZWkVSmUpK6vJq7j3Uoy/66qOMRv07xn
        THWd/34MTLBfFVB3WFFoXc1cBueatVmp3UNmVnnGBw==
X-Google-Smtp-Source: AMsMyM5rGXrkhuQrQe7LgcjEDdTHK+6y7t6lOaHNCTQ9hNJXjzQRFavvC9zWHs1/i1ytYfodZBY430bKtOUYXAKndGU=
X-Received: by 2002:a17:90b:2643:b0:205:bd0d:bdff with SMTP id
 pa3-20020a17090b264300b00205bd0dbdffmr4550660pjb.99.1664285925438; Tue, 27
 Sep 2022 06:38:45 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:38:44 -0700
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-16-4844816c9808@baylibre.com>
 <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
In-Reply-To: <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
MIME-Version: 1.0
Date:   Tue, 27 Sep 2022 06:38:44 -0700
Message-ID: <CABnWg9twi6inBOeLY=BOQ+o_CwbSW=L49_A+9VMy0L6vbokhXg@mail.gmail.com>
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
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
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org,
        Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 22 Sep 2022 09:22, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>On 19/09/2022 18:56, Guillaume Ranquet wrote:
>> Add the DPI1 hdmi path support in mtk dpi driver
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index 630a4e301ef6..91212b7610e8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -15,7 +15,10 @@
>>  #include <linux/of_graph.h>
>>  #include <linux/pinctrl/consumer.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/reset.h>
>>  #include <linux/types.h>
>> +#include <linux/regmap.h>
>> +#include <linux/mfd/syscon.h>
>
>Why do you need these headers in this patch?
>
>Best regards,
>Krzysztof
>

reset is used for reset_control but regmap and syscon are not used.
Those are leftover from a previous iteration of the patch, will drop
these in V2.

Thx,
Guillaume.
