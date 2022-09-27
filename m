Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73E2C07E9D
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 13:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbiI0NJg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbiI0NJe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 09:09:34 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E53F18578F
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:08:48 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id z20so2147957plb.10
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=YoaKPGbtL0W6yKop2Q5GqUbFMulbchm58vJX4E+Hvss=;
        b=Y3O5T8rz166uc6HJ4FhMI44NIUgz7yP8NiLJa38oQ3iQqcCvEf1JKUSMRRQjUmvMTd
         4ctpIh9zL2BGVRzkWihc/0+zJA0vvqQaNIcdLVBGBjlJgpCdtH9UA6CaIZ8fAsMB7Qa5
         MAmXOYJLBFGb76dyw/0GYl4Ud9bQLwonphTsObGEXWQEk9eA57oxtDSmPKQJHfic3A3j
         HkZqwW/hayyIYLR1Y0kHnLheguF50xHZLRtrPOgrjZtl0trmUGTA+HLEUWgduM2GBkWu
         ThZ/NjoYcg+Qh9SrbLP+UhAR4BHGL1ZL/OyBADAi8nYVZqFUBSIRwmAXmM7f9rMGutH+
         2GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=YoaKPGbtL0W6yKop2Q5GqUbFMulbchm58vJX4E+Hvss=;
        b=6TYDPxtxQxgNJprsia3QBRcCVx7yp3/WEbFbmZln6NpDAmeKbXC3xd6l4V8/ycPo+r
         ZzXYtKkUjuDSnp/GgTQWFpS/K8lSnUahr6MOCT+bK0Qj4TqiuFPXe+vFNTyODNWQwB50
         P/Y/mepM6ntIdftlY2Rdebq1G2OXwL6+SN2kloNiRtukuBEsbP9lnXgUeOwGalhDnDsw
         lT4y0FmWXrM40LDgLW6JjgXzGM/1RG/lflR3/3/AkNdFBR1ut4GhyliamAKC8VILfdTi
         NHODfPJt+rQg3gVuO9OJ9mK4c6TDrGMzkYFBK0f6WvvRG4qbr5/x5LyxA0pW4ZSSW5vZ
         jdfw==
X-Gm-Message-State: ACrzQf2KfBD+1HmanT0xkKKwbJyi4b41HUjrXYWvkJBTxfJmQqjVa9le
        micZvqO6aKNLgm9SeGDC/ESF0jQuJYdYpyBBpzyXpQ==
X-Google-Smtp-Source: AMsMyM6X8Fa6ezRZqL7m/lEJjF3Bh5CG2glAPpLeLqQI0M9YdLpt4yB4B9sD/oFbG2+k4WA70xAHEax+sQbaSKsrxhc=
X-Received: by 2002:a17:90b:3807:b0:205:d746:93a0 with SMTP id
 mq7-20020a17090b380700b00205d74693a0mr3635933pjb.188.1664284124030; Tue, 27
 Sep 2022 06:08:44 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:08:43 -0700
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-7-4844816c9808@baylibre.com>
 <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
In-Reply-To: <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
MIME-Version: 1.0
Date:   Tue, 27 Sep 2022 06:08:43 -0700
Message-ID: <CABnWg9uDo_P7FKzL7zjsZbfrhjT7MtWinhy5pKvDbNp_R5oJPg@mail.gmail.com>
Subject: Re: [PATCH v1 07/17] drm/mediatek: extract common functions from the
 mtk hdmi driver
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
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

On Tue, 20 Sep 2022 12:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Create a common "framework" that can be used to add support for
>> different hdmi IPs within the mediatek range of products.
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>> index d4d193f60271..008ec69da67b 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -22,7 +22,8 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>>
>>   mediatek-drm-hdmi-objs := mtk_cec.o \
>>   			  mtk_hdmi.o \
>
>abcd ... mtk_hdmi_common.o goes here :-)
>
>> -			  mtk_hdmi_ddc.o
>> +			  mtk_hdmi_ddc.o \
>> +			  mtk_hdmi_common.o \
>>
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> index 5cd05d4fe1a9..837d36ec4d64 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
>> @@ -32,187 +32,18 @@
>>   #include <drm/drm_probe_helper.h>
>>
>>   #include "mtk_cec.h"
>> -#include "mtk_hdmi.h"
>>   #include "mtk_hdmi_regs.h"
>> +#include "mtk_hdmi_common.h"
>>
>>   #define NCTS_BYTES	7
>>
>> -enum mtk_hdmi_clk_id {
>> -	MTK_HDMI_CLK_HDMI_PIXEL,
>> -	MTK_HDMI_CLK_HDMI_PLL,
>> -	MTK_HDMI_CLK_AUD_BCLK,
>> -	MTK_HDMI_CLK_AUD_SPDIF,
>> -	MTK_HDMI_CLK_COUNT
>> +const char * const mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT] = {
>
>Why MT8183? This can be either MT8167 or MT2701... or, IMO more appropriately, you
>should name the IP version.
>Example: MTK_HDMIV123_CLK_COUNT (I don't know what IP version would that be!).

You're right, the naming isn't great.
I'll ask mediatek if they have a good name that would regroup the "legacy"
HDMI IP and the new IP in mt8195.

Thx,
Guillaume.

>
>> +	[MTK_MT8183_HDMI_CLK_HDMI_PIXEL] = "pixel",
>> +	[MTK_MT8183_HDMI_CLK_HDMI_PLL] = "pll",
>> +	[MTK_MT8183_HDMI_CLK_AUD_BCLK] = "bclk",
>> +	[MTK_MT8183_HDMI_CLK_AUD_SPDIF] = "spdif",
>>   };
>>
>
>Regards,
>Angelo
>
>
