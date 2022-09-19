Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A10ECAAD3
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 17:01:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiISRB4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 13:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230497AbiISRBA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 13:01:00 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD6A3ED7A
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 10:00:26 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id a41so148187edf.4
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 10:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=;
        b=h4xvs+f5cmaWKYK71+hYnOmPVkiLtaB2mRla9tuoCEJPd+4ppfNzN0FBFiwIs70U65
         tbJ9aJA3dpNgt1Ckv+Bx6Hc8Syb3OFhB4z+FJI0fxOKxNgoDOjZd8j6Uskwq0OWUm816
         O7xPp4SJYuri2o1ZZKVZOB4LzhA9nFL2qpDxRJhsPPzW8j/vsldo+OZmErddviwJRjTi
         p4lfIW565oRIN/c+Vrhth50HEka7xMLu+MKAjKA+FPbmPD21phAwhccqtGiVTtSD60Zd
         EGLplHMN2dasKn0QgJPqQZBi+CeACR4L5U4Dlj9odh9YO7SKHNRH5sQETerhK+QEqrcG
         P3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2Meo31PuvkGIwIM5AdXoX0Hd0Yqmep6vNoeB5sp1WIo=;
        b=O2tUdtNQrMgjoEp/2VwypSckx617UVyqWwmo/459PS5c2LVbUbbXXXrqQQ+5Ejclmt
         Urw9Q7rAZtRpufwJ2wkdoxnDljk0+rhr9GpEeNdD/3DeeU8s3ANixDJ7E41IsDBHyK8T
         L0AZTsOukMH+fOzjg3zm/+tpo8i4+gdnhVP2U4NooMgtytIztCq1mIzs7nz5AoVYd1H2
         yzvlQ2oiqvJgXjEwevZtyAywEgc94GKL1s31TOhsHxGSxhFbNAwlwCTIgJhpDqB+ycQ6
         NHV9N0DPFDQF818kglsGwiUZ3xZoXs4XlaWFxZFwD9H4mNlVhot8hqMgqr/WsUv9EqZV
         ngCA==
X-Gm-Message-State: ACrzQf3RhSyYOS3appsVUq6BnSRHxK9ShB1rOmfsNNd7EOGVlRmQq9wB
        eYkBd2IfEPr4OYZFPernXuwG+A==
X-Google-Smtp-Source: AMsMyM4nXsx/EGy8bNgRHqGUolsSurVZgmUHv5N2kQ+oMKWiHF7U6zG3vs9wXOsAsDPUMkE0zR3f8A==
X-Received: by 2002:a05:6402:847:b0:453:943b:bf4 with SMTP id b7-20020a056402084700b00453943b0bf4mr11555407edz.301.1663606819619;
        Mon, 19 Sep 2022 10:00:19 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:00:19 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
Date:   Mon, 19 Sep 2022 18:56:13 +0200
Subject: [PATCH v1 15/17] dt-bindings: display: mediatek: dpi: Add compatible for
 MediaTek MT8195
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-15-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To:     Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
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
        linux-phy@lists.infradead.org,
        Guillaume Ranquet <granquet@baylibre.com>,
        devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add dt-binding documentation of dpi for MediaTek MT8195 SoC.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5bb23e97cf33..2c7ecef54986 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -24,6 +24,7 @@ properties:
       - mediatek,mt8183-dpi
       - mediatek,mt8186-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpi
       - mediatek,mt8195-dp-intf
 
   reg:

-- 
b4 0.10.0-dev
