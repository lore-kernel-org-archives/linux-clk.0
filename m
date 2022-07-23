Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC85ACCA48A
	for <linux-clk@archiver.kernel.org>; Sat, 23 Jul 2022 20:44:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236362AbiGWUoh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Jul 2022 16:44:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237033AbiGWUof (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Jul 2022 16:44:35 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2271B7BF
        for <linux-clk@vger.kernel.org>; Sat, 23 Jul 2022 13:44:34 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id t3-20020a17090a3b4300b001f21eb7e8b0so10371763pjf.1
        for <linux-clk@vger.kernel.org>; Sat, 23 Jul 2022 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nOakTaI+AQ9c8hYlbBuSi2lgANY7KlcsaDbREwlYo3U=;
        b=XB3L6vYthKqs+mQUqbeSLasKZUitsgoAYiyFnwJKrl8q29Zg9uRH2B50xD2iRA7fcC
         U5b/Fqb54ET61FV/sjZq+a5D29fp43XRg6JAiEPz/zIshAixvIvkEOv12a5DkUaczbWx
         tSNcBlAp7EjDtQvwT6oX0LvI9gmAI9OCd9RVx28jCod8sG9enImAfB8YNYw52gbpQaOt
         UWhjLCCueeXv5bmw5O44nMiMC3gsFbajtYHBLOpsqZ4Pni+AldOYx/aMNg7itdUb56qH
         e6h7ttz3Dc7lZwUwlSA3o+KJhDQ6W8K0snoT3SqqbqFaU7/FYbM2od7f0J4gwzHpsLMc
         ZtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nOakTaI+AQ9c8hYlbBuSi2lgANY7KlcsaDbREwlYo3U=;
        b=lWlz7hcyeW4WiFXM+6iFqN8eT0QuWBLECzg2wquKgVoW6j156rb3hCPpQV4YC7iLd5
         XB7jx2wwEq240JS8KOeqGw8zFWNYElaEZYvULtimidXku2afy0Yb2fdOdpmwTDlP8uhX
         pdw57qkY9qTimCK+3pxm0ZlpTcFTQKGqUyR7DfRJuMzX+Jf08heNEHUWlGSuyZbK05dX
         LUPJcG9ToPsBs5UpkWBa+uTKdf11N1X5f5jrwW9h4HGIDLeUxFDs6qwrJlvL9Y1hfgIu
         K0aI/elNYa0thoOIeHNTS9oJ6IC95enwibNTDPaox8PG7X2khYmN3Nt7iJagarHJMJvh
         3bsQ==
X-Gm-Message-State: AJIora/+Eysk8TDbNPaOUyCIB58FITR3oz0oV52LNLWzplsKPR0DpGeF
        GzkjdjvSlkVAv6kvGkwFRtJJuw==
X-Google-Smtp-Source: AGRyM1tgP7HPTnWd7m1Cx1NOAVi0mKgWERWLGEuR2l+Hm5D8s4w1RzjndvJwT+uJ741lsCIJiNxtXw==
X-Received: by 2002:a17:90a:c17:b0:1f0:6c72:e3b1 with SMTP id 23-20020a17090a0c1700b001f06c72e3b1mr6561224pjs.128.1658609074608;
        Sat, 23 Jul 2022 13:44:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:a406:cc30:f4ec:f10a])
        by smtp.gmail.com with ESMTPSA id u14-20020a170902e80e00b0016a6caacaefsm6187950plg.103.2022.07.23.13.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 13:44:34 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 09/22] dt-bindings: clock: rockchip: Document RV1126 CRU
Date:   Sun, 24 Jul 2022 02:13:22 +0530
Message-Id: <20220723204335.750095-10-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220723204335.750095-1-jagan@edgeble.ai>
References: <20220723204335.750095-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document dt-bindings for Rockchip RV1126 clock controller.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 .../bindings/clock/rockchip,rv1126-cru.yaml   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml
new file mode 100644
index 000000000000..cf4f11709125
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rv1126-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROCKCHIP RV1126 Family Clock Control Module Binding
+
+maintainers:
+  - Jagan Teki <jagan@edgeble.ai>
+  - Finley Xiao <finley.xiao@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The RV1126 clock controller generates the clock and also implements a
+  reset controller for SoC peripherals.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rv1126-cru
+      - rockchip,rv1126-pmucru
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: xin24m
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the syscon managing the "general register files" (GRF),
+      if missing pll rates are not changeable, due to the missing pll
+      lock status.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    pmucru: clock-controller@ff480000 {
+      compatible = "rockchip,rv1126-pmucru";
+      reg = <0xff480000 0x1000>;
+      rockchip,grf = <&grf>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+  - |
+    cru: clock-controller@ff490000 {
+      compatible = "rockchip,rv1126-cru";
+      reg = <0xff490000 0x1000>;
+      rockchip,grf = <&grf>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.25.1

