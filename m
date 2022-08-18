Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70170C28B2B
	for <linux-clk@archiver.kernel.org>; Thu, 18 Aug 2022 12:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244699AbiHRMmW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Aug 2022 08:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbiHRMmV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2022 08:42:21 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 888BEA9240
        for <linux-clk@vger.kernel.org>; Thu, 18 Aug 2022 05:42:20 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id a8so1561520pjg.5
        for <linux-clk@vger.kernel.org>; Thu, 18 Aug 2022 05:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=0HEKwiXfv3HgP3MOgpoqwQIXfPyMEIo0RbNdJLZlR7U=;
        b=DHyBt4XnA0QoDX1PDWq9dZpIYtFLlzJnC43G6cNAXklZ0dPx1e0EufSfK4IHVemUOJ
         36sKyb8uq8KupJi77+VWDRzfFXBnLzLueLWA2EvYb4shEpWGTFjgYXqMovNFkXwP6Iy2
         ys3dL8WBzNDwecU9Zxk3l+rsEe1MJ/rS453KxZebrPNGYhur18qHrMVwr2WFvPPWA5yy
         bg9LVGnxJ5qeNMDisfELsMM6t/Q+Wh+2PdnEDWE0BmriX+EcEQKR92gzR+PmuvhvP2Wx
         NOvLQhF5/5mnWHhT5h9tHqlMnu6hWraewQd68Abbs5nU72hyebmxz81Wf7OWntOQGF1m
         hJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=0HEKwiXfv3HgP3MOgpoqwQIXfPyMEIo0RbNdJLZlR7U=;
        b=lG6g2CJ4k5jJXlE/zIMU3krJGRXdEVGO6nWc0PEP6Y5uW512RZFme2dq7heT3SJdc2
         TozVREZV8iZPTL8cwO0CN3FEKU0upGHR1DBQcmITiPieV2DTF/JNrTR1pbTnZQUiSinT
         FElPzpiQa6oiC9q9y1lhrdCEoXfedJ35AkEsq5G/yk7KV8U/9Usdk0qMmluZdwEa3LVL
         2zkbBEauADWHLe+BStjQBXu3sAUsO7QBX4Z5davV1M7JTZZt4VdqIZB95TrYnwDzi91c
         WOKoYvmJQIjJWDOPq7hHb/aV7LIgksq9mpQ+H2oOEp3oHaElxs6snwdUwMGUsLpM6jpH
         UEQA==
X-Gm-Message-State: ACgBeo19WvUL6OwvQNCmR7f6NUoF25jRXUbIO8YLjhwNy0FKgC6qonr9
        fqoQsEmNKRj7JsR/ldxa6wrdmA==
X-Google-Smtp-Source: AA6agR49qb1OT9tj/zc3izD+LrVoq69EouPAIABOi0hu6q4EZb+LWEVKWJk+6mxDmcQwhiDnFvDOHg==
X-Received: by 2002:a17:90a:e58a:b0:1fa:c67c:6107 with SMTP id g10-20020a17090ae58a00b001fac67c6107mr3039733pjz.50.1660826540035;
        Thu, 18 Aug 2022 05:42:20 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d1c4:8ea9:aedc:add1])
        by smtp.gmail.com with ESMTPSA id x6-20020aa78f06000000b005302cef1684sm1495651pfr.34.2022.08.18.05.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 05:42:19 -0700 (PDT)
From:   Jagan Teki <jagan@edgeble.ai>
To:     Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kever Yang <kever.yang@rock-chips.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Jagan Teki <jagan@edgeble.ai>, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 10/19] dt-bindings: clock: rockchip: Document RV1126 CRU
Date:   Thu, 18 Aug 2022 18:11:23 +0530
Message-Id: <20220818124132.125304-11-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818124132.125304-1-jagan@edgeble.ai>
References: <20220818124132.125304-1-jagan@edgeble.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document dt-bindings for Rockchip RV1126 clock controller.

Cc: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
Changes for v3:
- none
Changes for v2:
- fixed title
- remove '|' in description
- add one example

 .../bindings/clock/rockchip,rv1126-cru.yaml   | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml
new file mode 100644
index 000000000000..0998f8b922bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rv1126-cru.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rv1126-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip RV1126 Clock and Reset Unit
+
+maintainers:
+  - Jagan Teki <jagan@edgeble.ai>
+  - Finley Xiao <finley.xiao@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description:
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
+    cru: clock-controller@ff490000 {
+      compatible = "rockchip,rv1126-cru";
+      reg = <0xff490000 0x1000>;
+      rockchip,grf = <&grf>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.25.1

