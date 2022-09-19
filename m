Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F96C6FA86
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 16:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiISQ7t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 12:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiISQ7r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 12:59:47 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84F201277D
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:46 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id f20so130008edf.6
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=VIAi0nNwF0EQ4Ycv099voA35UIwgAD/zCbxE9L3eFBQ=;
        b=R+qQPnPqizqQy0t3jkiLKwfr4K4/dgarwPfFttzlNb43E4o78izHqlKaHUTtF5L0aX
         U2rW7VDjsEC3GyuX7FFwe1iKr1B4FC7xjZcFh06+y0ryXl2F/GrkLLm1obnIhZPXlqL7
         hPJoE+3Rb00pJAWDNwRcizomgd5BsFP4RIF3WmuztmNQRO3lPH435EjKkezKb6JjjiFm
         +D7J3psGA0bhm1mdY2z/1oZ4WG2QYmi+YfIloXmbs1HtYN7LY1dMPOfFPG5+1SH3EjLd
         6WQPNGdX5ebzgk8mDgJXkf0TTio5UuUFR8R/cQCrHXJKjw3iFhqEji1Adg9w2agMIAih
         tkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VIAi0nNwF0EQ4Ycv099voA35UIwgAD/zCbxE9L3eFBQ=;
        b=LV7xgTKrhO69tcunLQiu9DercrKRSlmUfApLpHBoWE/xt7MFp21+5twoUa/3K+XQJE
         BSsoRlojZmnmC8F11w15HkHT+Liqp4CsKlLXILdKXtxti9BaPUqnbkV1qFexr/FHcxGh
         JrJgRvqSaz2ugUuyHeLuHehj8DZt8a8YeHVosBeE4icMqxSYx8vKYyQDlMIbVMeZIjHT
         Fdltq2E4EqQtzJXuJ25KGvbL70Obs82UrfeechOb4gECQbAivTOIDom0qwGISflC/ogc
         9YpKKUjk+4JZeSCmi1+1WCmoYwePDiajPp6lUuzZ9ejn9fSomVk9QwObtKhV/kdwCR74
         Nc6w==
X-Gm-Message-State: ACrzQf0OSwjRZ6egXqDYnpETkhIW1sTAL9MlFHkrbLKGy+I9/hF/+bwQ
        aUFznB6h/dcNrWfHY6piloRIPQ==
X-Google-Smtp-Source: AMsMyM4FWcGqIb04fz++aRLharY4kKuVTi0otIV+l0WpEp9ORTAl2Z/yp1vEqg/lPBMW1Gcd0sxy3w==
X-Received: by 2002:aa7:c585:0:b0:453:e1c6:7dc6 with SMTP id g5-20020aa7c585000000b00453e1c67dc6mr6810316edq.245.1663606785020;
        Mon, 19 Sep 2022 09:59:45 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:44 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
Date:   Mon, 19 Sep 2022 18:55:59 +0200
Subject: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-1-4844816c9808@baylibre.com>
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

From: Pablo Sun <pablo.sun@mediatek.com>

Expand dt-bindings slot for VDOSYS1 of MT8195.
This clock is required by the DPI1 hardware
and is a downstream of the HDMI pixel clock.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/include/dt-bindings/clock/mt8195-clk.h b/include/dt-bindings/clock/mt8195-clk.h
index 95cf812a0b37..d70d017ad69c 100644
--- a/include/dt-bindings/clock/mt8195-clk.h
+++ b/include/dt-bindings/clock/mt8195-clk.h
@@ -859,6 +859,8 @@
 #define CLK_VDO1_DPINTF				47
 #define CLK_VDO1_DISP_MONITOR_DPINTF		48
 #define CLK_VDO1_26M_SLOW			49
-#define CLK_VDO1_NR_CLK				50
+#define CLK_VDO1_DPI1_HDMI			50
+#define CLK_VDO1_NR_CLK				51
+
 
 #endif /* _DT_BINDINGS_CLK_MT8195_H */

-- 
b4 0.10.0-dev
