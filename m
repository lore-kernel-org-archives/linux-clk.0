Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F14C00A5A
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 14:14:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbjASOOP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 09:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbjASOMx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 09:12:53 -0500
Received: from fudo.makrotopia.org (fudo.makrotopia.org [IPv6:2a07:2ec0:3002::71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289E859576;
        Thu, 19 Jan 2023 06:11:46 -0800 (PST)
Received: from local
        by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
         (Exim 4.96)
        (envelope-from <daniel@makrotopia.org>)
        id 1pIVdm-0008M3-0v;
        Thu, 19 Jan 2023 15:11:42 +0100
Date:   Thu, 19 Jan 2023 14:11:35 +0000
From:   Daniel Golle <daniel@makrotopia.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Miles Chen <miles.chen@mediatek.com>,
        Edward-JW Yang <edward-jw.yang@mediatek.com>,
        Johnson Wang <johnson.wang@mediatek.com>,
        Fabien Parent <fparent@baylibre.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Jianhui Zhao <zhaojh329@gmail.com>
Subject: [PATCH 1/2] dt-bindings: clock: add some compatible strings for
 MT7981
Message-ID: <cad4f70cd009ba82e39c623485389c021992762e.1674137304.git.daniel@makrotopia.org>
References: <cover.1674137304.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674137304.git.daniel@makrotopia.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add compatible strings for MT7981 to existing binding documenation
at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml | 1 +
 Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index 731bfe0408c20..dae25dba4ba69 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - mediatek,mt6797-apmixedsys
           - mediatek,mt7622-apmixedsys
+          - mediatek,mt7981-apmixedsys
           - mediatek,mt7986-apmixedsys
           - mediatek,mt8135-apmixedsys
           - mediatek,mt8173-apmixedsys
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
index 81531b5b0db79..0fdf564148334 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt6779-topckgen
               - mediatek,mt6795-topckgen
               - mediatek,mt7629-topckgen
+              - mediatek,mt7981-topckgen
               - mediatek,mt7986-topckgen
               - mediatek,mt8167-topckgen
               - mediatek,mt8183-topckgen
-- 
2.39.1

