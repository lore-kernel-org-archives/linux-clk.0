Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D82C6FA82
	for <linux-clk@archiver.kernel.org>; Thu, 22 Sep 2022 07:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbiIVHW6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Sep 2022 03:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiIVHW5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Sep 2022 03:22:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A440DCBAF4
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:22:55 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id a8so13133486lff.13
        for <linux-clk@vger.kernel.org>; Thu, 22 Sep 2022 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=JDY3wyLD4djHNv21bBZZzvFe5rrOQU/pLSj/gQsk7Ps=;
        b=XwHK0QxbkukB+0pfeLp3iJq83T4xdeHh69DQgP8mfmueJLRE765/q+ase9/sNnJs21
         gef4QcYwhvGMJ5I1rOMv4c8iBQEkec5oCScXqe7tEEAh1hYgL/KDHOgUqd+Y2D7/j3qh
         ZQ4uIoPTMlwg/4tS9A7ZZFfoIDVQ2RJjSyPcTigutEkwRe1QNvQ7h9X83DJcBahprX+J
         dZNgSRwzevigqAap02exRBv78XIlWrdN6evViK4G4y3mTDz+ei4bVP1lYTyUF1vdPNZA
         0xD8F3pll7zdcIu5IlxU0TFQmobM5M56Pr+dXMaCNQmKgBXoiyoGaTwzgD0iXpKJUQQ8
         OP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=JDY3wyLD4djHNv21bBZZzvFe5rrOQU/pLSj/gQsk7Ps=;
        b=g0nPejwEC/CdCCiX4+yuAFiZR7WOIqM6yU4uIFQBs6FzfGoiavBAQtRQzJwObgog9y
         KfZuDeG4sMSzEy1Nnpqt4QozrN/+NAgsSo17Jdint//pTwvUwJhxNCbiVOSd+PSo2nrP
         5XhUb2mJYuq6/+d3voS1l+NWFFIrCHmgWUM3w7oLaRvKenqD976dQ6syKAVGjkB98XZA
         P8+qhcNB+Xr+s4GuMqH/0sMLnJXwchwO1cK0qsvWqph7uHUyHGp6WpaDvYCSxAnW3UFr
         bIe8IN0y1vcfEdkv+7sIKahojlGEBUJsuqYIrNY1ug0ft1l8a97ZPpMQ9BhEpIWLnpgD
         yFVQ==
X-Gm-Message-State: ACrzQf2Eii6Py+duvAiUhvND0vHPNOiWAKnSXV1043UoGOyUrH9IrEfW
        I7y1C5Awm7L+euCiUV0iLq/n4Q==
X-Google-Smtp-Source: AMsMyM5+A2X0Idpf2Cy8iDaQZo+BvsjA2Xr5j4lwWyGuafVss0uDTPYm+TtzlvtHMoansllc4Ccy/w==
X-Received: by 2002:a05:6512:b9a:b0:499:b537:fe60 with SMTP id b26-20020a0565120b9a00b00499b537fe60mr785618lfv.319.1663831373857;
        Thu, 22 Sep 2022 00:22:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id i20-20020a198c54000000b004946c3cf53fsm804450lfj.59.2022.09.22.00.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 00:22:53 -0700 (PDT)
Message-ID: <11592bcd-eec7-7cc0-86c6-8f440b6af447@linaro.org>
Date:   Thu, 22 Sep 2022 09:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
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
 <20220919-v1-16-4844816c9808@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919-v1-16-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 18:56, Guillaume Ranquet wrote:
> Add the DPI1 hdmi path support in mtk dpi driver
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..91212b7610e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,7 +15,10 @@
>  #include <linux/of_graph.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/types.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Why do you need these headers in this patch?

Best regards,
Krzysztof

