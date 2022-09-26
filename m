Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD61AC32771
	for <linux-clk@archiver.kernel.org>; Mon, 26 Sep 2022 05:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbiIZFYh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Sep 2022 01:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbiIZFYg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Sep 2022 01:24:36 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5455DB86
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 22:24:33 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id y141so4349693iof.5
        for <linux-clk@vger.kernel.org>; Sun, 25 Sep 2022 22:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jEvurfgQn31+MuQ9PuCNa1QSbNB9nuSrakYO01iDa0I=;
        b=PBDYoF0ic9Mb/1mI1YKRHy9Z0n5FU2etf3En+x15fDRZoG29HSFX6c/LhtSQ2gawAx
         HUQ/P7WZ/S2t8ezXnuwLGzOntikDVgIRixZEGHOeG4xWJ1+hllfLvuURJO4X71TgFlKA
         4nCik36ImKTv6m/gJcOmL5NIpO/qmKGTCTeds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jEvurfgQn31+MuQ9PuCNa1QSbNB9nuSrakYO01iDa0I=;
        b=gwPHge8LOk35WWcY+qimYt9jsmYwtKPc7KX0duFgLu/6j2hNst+mm2QebbN19B7zT9
         GHk9Jo5mZREXsnSKiYzRu6OUybahnd8v4MbjOmxhCd/U0WGVpGAn7NFOjJFXhdNSlijO
         wL+FNptdpC4DRfe1vd0CSJU8Z6mOmaYeqPLbzneaQj5X6tJZQ4oxkITmoH3GOWL+p+DH
         vVM5GjF1m9BjS+Q82cVTFysW4qoGYE546AINEChsMZs08rDfaPlVDmgJ3q2f9LjPwCVY
         hT50bseHt4dzXeboJ5NFLzo2TwY6WDSg2rrTs2L27jhOPlSP8YKiLoCP7bRb5rqz806l
         ynpA==
X-Gm-Message-State: ACrzQf2u594gX0Bcmxge/gOl9hvMXrqVpsMP/L3X9Xmcz81KVwmA9ZoJ
        ito/IA2RcrpzO1PoyekU+1+BbJ3UGwOMSx3CO4souw==
X-Google-Smtp-Source: AMsMyM7De/9dx5rvLkUXiEMENOXrcabNaS46duo0p3ODzyDJhzzbtcEstux2UW5Xef0qQZaCHX+iifRVf5LNG1hnmFw=
X-Received: by 2002:a05:6638:12c2:b0:35a:6dc2:891 with SMTP id
 v2-20020a05663812c200b0035a6dc20891mr10221862jas.316.1664169872766; Sun, 25
 Sep 2022 22:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220919-v1-0-4844816c9808@baylibre.com> <20220919-v1-15-4844816c9808@baylibre.com>
 <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
In-Reply-To: <e993c25e-f334-e1ca-73f8-58cf141c521e@linaro.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 26 Sep 2022 13:24:20 +0800
Message-ID: <CAGXv+5FYjj6=WHWBvNRDmpw2Ux8RJ4a2fT1gXk3+eXSqt9poeQ@mail.gmail.com>
Subject: Re: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add
 compatible for MediaTek MT8195
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Sep 22, 2022 at 3:20 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/09/2022 18:56, Guillaume Ranquet wrote:
> > Add dt-binding documentation of dpi for MediaTek MT8195 SoC.
> >
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index 5bb23e97cf33..2c7ecef54986 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -24,6 +24,7 @@ properties:
> >        - mediatek,mt8183-dpi
> >        - mediatek,mt8186-dpi
> >        - mediatek,mt8192-dpi
> > +      - mediatek,mt8195-dpi
> >        - mediatek,mt8195-dp-intf
>
> Aren't these the same?

*-dpi are MIPI DPI (as in parallel data with DDR modes) encoders.
*-dp-intf are Display Port encoder.

Totally distinguishable. :)

The hardware blocks seem similar upon cursory comparison of the register
tables, with the base layout being the same, and sharing registers for
basic settings such as the display timings.

The DPI ones have some extra registers, presumably to control the signals
or output width. The DP one has some registers of its own that only make
sense for Display Port.


ChenYu
