Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D89C54EE9
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 17:00:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiISRAO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 13:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiISRAJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 13:00:09 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D938313F8F
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:56 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id z13so73999edb.13
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 09:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=5y6U/O2cW1kp0MEYYlgdcRumC1g8PUdg2NEss+CEK4Y=;
        b=u9o63LTxFa7L0qIFlEApgQkRIlw0NFfFQtW1Vdw4ql0gk0AkcKQUA308pxM1LeQsTV
         ealEEZUUQ1Hoc26qB9doB91p2dMDciChIfhr5efax2uEJls/dFAHbvg72hGqyPc2ZCli
         /jtjFI0iCGSTOGhwM0REsrlbCu6NmyGmUve8aAOWWow0ddGpbjiYETkTphqQ7chs719p
         i4s1mpSRVVmRqL3N3loAyHeDe/c22M5IQRRGBjhk0zhNR088zfQCYCghvg7Gf0yjBkOV
         jWYjrMsnDxopS6FaQY3glD94bxQViwhQjaECJnwkS+0NUaZXxlVdW4g7EbcdNq8ZdMwI
         t5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5y6U/O2cW1kp0MEYYlgdcRumC1g8PUdg2NEss+CEK4Y=;
        b=iXXMrkXIxdnaRQxRWqLlZwp0aoQvgbJ4vLZdPQWiUsMWrKGQNLcBhFVmB6CAFJ1kDx
         hupi7C2N5ilH/okjK/4NnLDoW3oIItKggJe/cBaGI6uafI9UNOZ04/IXRMg12zESu6h7
         W+3bEg1Q0Cwq3SOMgs3cDypnzOASnp2/85455bjHReiGip9BvnnqdHSq41XLlwdPqK5I
         /WtdwhLMz9i23EYP6XPRDhUHFBOLslg/xTHRtMT5CSz5bwcHzI3WCBJKzb2PlvDRoz3D
         cRGFBz/RJ1nDkcC0qMYjW8+kTTlJQnj8rLwmL50Ler5lPGauddD7A4b2cXfzWjOWd824
         hngA==
X-Gm-Message-State: ACrzQf23SbHj3+LfH5lxMBNS1GaX675opdwTDEWIxTThMInh/Jxx2qnc
        TipY7fjQFfX/Fqv8kne2EeUB9Q==
X-Google-Smtp-Source: AMsMyM4z9QtWkhNsKkQaCij9zXzUMc6vE8fa01Z3HxRTpUioaFewUxAHVAEU609+mICb4RrhgGgc5A==
X-Received: by 2002:aa7:da97:0:b0:452:bea2:5200 with SMTP id q23-20020aa7da97000000b00452bea25200mr16562187eds.341.1663606794718;
        Mon, 19 Sep 2022 09:59:54 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 09:59:54 -0700 (PDT)
From:   Guillaume Ranquet <granquet@baylibre.com>
Date:   Mon, 19 Sep 2022 18:56:04 +0200
Subject: [PATCH v1 06/17] dt-bindings: mediatek: set the hdmi to be compatible with
 syscon
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-6-4844816c9808@baylibre.com>
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

In order to share register with a dedicated ddc driver, set the hdmi
compatible to syscon.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index abb231a0694b..86297b7eb7f7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -16,12 +16,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-hdmi
-      - mediatek,mt7623-hdmi
-      - mediatek,mt8167-hdmi
-      - mediatek,mt8173-hdmi
-      - mediatek,mt8195-hdmi
+    items:
+      - enum:
+          - mediatek,mt2701-hdmi
+          - mediatek,mt7623-hdmi
+          - mediatek,mt8167-hdmi
+          - mediatek,mt8173-hdmi
+      - const: syscon
+
 
   clocks: true
   clock-names: true
@@ -142,7 +144,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/interrupt-controller/irq.h>
     hdmi0: hdmi@14025000 {
-        compatible = "mediatek,mt8173-hdmi";
+        compatible = "mediatek,mt8173-hdmi", "syscon";
         reg = <0x14025000 0x400>;
         interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
         clocks = <&mmsys CLK_MM_HDMI_PIXEL>,
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7640b5158ff9..3e7a0f406631 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1306,7 +1306,7 @@ od@14023000 {
 		};
 
 		hdmi0: hdmi@14025000 {
-			compatible = "mediatek,mt8173-hdmi";
+			compatible = "mediatek,mt8173-hdmi", "syscon";
 			reg = <0 0x14025000 0 0x400>;
 			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&mmsys CLK_MM_HDMI_PIXEL>,

-- 
b4 0.10.0-dev
