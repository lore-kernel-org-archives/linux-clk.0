Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A660C6FA82
	for <linux-clk@archiver.kernel.org>; Tue, 27 Sep 2022 13:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbiI0NN7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:13:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232599AbiI0NNm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Sep 2022 09:13:42 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8033717ACA1
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:13:39 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id u92so151536pjh.3
        for <linux-clk@vger.kernel.org>; Tue, 27 Sep 2022 06:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date;
        bh=uw1gvMh/1zxeYeQnV6wZiimhJI0pYdqIU/T7gR133DU=;
        b=KGZxffdgEWrc+nIKZQdWmZ3shdGF0hcnG/eimwyIfxhrmALI1rYCYrjvI7h/XUgVGA
         AC6SvAtl53+/uRBU3anLk1UvpVRaNBemAR7Oyh2pHvX7bjmJNbSDXufs8hRYtyXsG5vQ
         jd3iWOu4rVRR/EnzQp9aaeBmal/AfKg+NmoFOYFIDeJe+wLcey51NCuMUbD1u2T1V94U
         R0nuad1PG+imVaMqobj/rIzM1PIjkWlf6o0msI+SnoIU3CpMuPKph0lfdyOcWwBg0vLZ
         dTGoMaNPB1H8WboG58vSq5A7eIOFKcqFwcw4AAp8tg8XHTSKsuUNf6zQOBzI1wa4MP6X
         qvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date;
        bh=uw1gvMh/1zxeYeQnV6wZiimhJI0pYdqIU/T7gR133DU=;
        b=m4+OE9UYaPpZhH5pCn8rD3Ono+vKZreUBYzy3hA/yWxmR/hz3jm3DZucvKAyMZ1GvP
         OKjN/VjAKjJ0fZSXjmbFn8BJm7azoJRKGSRObVvuQragDGedJiK8N2ICZhdz4XpQQ5o2
         IClV13Wbfuy4ADI+nE13oTiRSvuhYcG/DCQRB/J4Zwvb+KaMFBaVuLXHRcl5O/s8/Ak8
         dt4e35il7scAAunx4PrcCNKYg56IksDt7jykI3nzCqLBpouYeN3qb1gVxGvML9UJv6JX
         iYLrq6W6uKDZf2ZM5yVl1D4fBLdUXL0JF4VvqDGJQ2YrwK+ZCdGzCX/teO4NKlw5sCSD
         cXnA==
X-Gm-Message-State: ACrzQf2ldwbwskeCujUlCCuGTI9AnVHiqJjAGNJF3f/p6Zs2BahfjXPT
        DcUROvCM+6Gj0tj2E/ry8ujcPn4iY1HQxGo1DA0dIw==
X-Google-Smtp-Source: AMsMyM5foO9hRFfJNeJsExDA4MlTDjL11pmea0BPzSUwTLsGAoVk8kBgQmDpzSWwATR1ZA70FE3cdWBnn6SlAjNkjO4=
X-Received: by 2002:a17:902:f710:b0:178:a692:b1f7 with SMTP id
 h16-20020a170902f71000b00178a692b1f7mr27434461plo.112.1664284411364; Tue, 27
 Sep 2022 06:13:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Sep 2022 06:13:30 -0700
From:   Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-12-4844816c9808@baylibre.com>
 <b05f8687-8f34-c425-ed8e-56c8aeccdaf9@collabora.com>
In-Reply-To: <b05f8687-8f34-c425-ed8e-56c8aeccdaf9@collabora.com>
MIME-Version: 1.0
Date:   Tue, 27 Sep 2022 06:13:30 -0700
Message-ID: <CABnWg9tidG-HHhJ-nbE0UD2=EUCqF4WkdQ__j+2sarmSm=MsAQ@mail.gmail.com>
Subject: Re: [PATCH v1 12/17] drm/mediatek: hdmi: mt8195: add audio support
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

On Tue, 20 Sep 2022 13:11, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
>> Add HDMI audio support for mt8195
>>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> index 39e07a6dd490..bb7593ea4c86 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>> @@ -215,6 +215,26 @@ static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
>>   		mtk_hdmi_mask(hdmi, TOP_VMUTE_CFG1, 0, REG_VMUTE_EN);
>>   }
>>
>> +static void mtk_hdmi_hw_aud_mute(struct mtk_hdmi *hdmi)
>> +{
>> +	u32 val;
>> +
>> +	val = mtk_hdmi_read(hdmi, AIP_CTRL, &val);
>> +
>
>val_tx = AUD_MUTE_FIFO_EN;
>if (val & DSD_EN)
>	val_tx |= DSD_MUTE_DATA;
>
>regmap_set_bits(regmap, AIP_TXCTRL, val_tx);
>
>Easier, shorter.

Thx for the tip.

>
>> +	if (val & DSD_EN)
>> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL,
>> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN,
>> +			      DSD_MUTE_DATA | AUD_MUTE_FIFO_EN);
>> +	else
>> +		mtk_hdmi_mask(hdmi, AIP_TXCTRL, AUD_MUTE_FIFO_EN,
>> +			      AUD_MUTE_FIFO_EN);
>> +}
>
>Regards,
>Angelo
>
