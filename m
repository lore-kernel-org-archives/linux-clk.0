Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A7E4C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 15:14:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiJRPO2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Oct 2022 11:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJRPO1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Oct 2022 11:14:27 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D9325EE;
        Tue, 18 Oct 2022 08:14:20 -0700 (PDT)
Received: from jupiter.universe (dyndsl-095-033-155-016.ewe-ip-backbone.de [95.33.155.16])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 17F696602363;
        Tue, 18 Oct 2022 16:14:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1666106059;
        bh=gPTdozLcuQ7KYb8oIxzGu3wO++Dq7Pq7ohFGcgZyo58=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bi781qHqpzMQtbIFQeuEO8HM4MLBOhNp0IBu3MTGwb83CgZyXJisFm/GAFZyOaRmK
         /WpPOXK974PFvFiHd+NILlK61Fqlc5Wz9XpZg3NDa/zMMsQyrOzuFSEZ1xm/eO/HBt
         AnZXliVQPlHzYgbXrsKdsTpRknr8v8v9TWDJE743ZMXyAMzKejeHCRy2XTaKRBlLYA
         jC5jF3pwIvr0TX83hADIYxRF934Z17uEPjdy1cJMhzfELU/PXUaXdMgwdYhT8vWfMP
         qoKFIPyrjzWFOVUhKn/jYd9vbYP7cUAUO76nPTAxspLsqNyraEZ4DWRTf/9+TWj9pp
         Kc/hm87FgkjlQ==
Received: by jupiter.universe (Postfix, from userid 1000)
        id 266804801B6; Tue, 18 Oct 2022 17:14:16 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Elaine Zhang <zhangqing@rock-chips.com>, kernel@collabora.com,
        Rob Herring <robh@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv3 3/9] dt-bindings: clock: add rk3588 cru bindings
Date:   Tue, 18 Oct 2022 17:14:01 +0200
Message-Id: <20221018151407.63395-4-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221018151407.63395-1-sebastian.reichel@collabora.com>
References: <20221018151407.63395-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Elaine Zhang <zhangqing@rock-chips.com>

Document the device tree bindings of the rockchip rk3588 SoC
clock and reset unit.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../bindings/clock/rockchip,rk3588-cru.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
new file mode 100644
index 000000000000..74cd3f3f229a
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,rk3588-cru.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip rk3588 Family Clock and Reset Control Module
+
+maintainers:
+  - Elaine Zhang <zhangqing@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+description: |
+  The RK3588 clock controller generates the clock and also implements a reset
+  controller for SoC peripherals. For example it provides SCLK_UART2 and
+  PCLK_UART2, as well as SRST_P_UART2 and SRST_S_UART2 for the second UART
+  module.
+  Each clock is assigned an identifier and client nodes can use this identifier
+  to specify the clock which they consume. All available clock and reset IDs
+  are defined as preprocessor macros in dt-binding headers.
+
+properties:
+  compatible:
+    enum:
+      - rockchip,rk3588-cru
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
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: xin24m
+      - const: xin32k
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  rockchip,grf:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: >
+      phandle to the syscon managing the "general register files". It is used
+      for GRF muxes, if missing any muxes present in the GRF will not be
+      available.
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
+    cru: clock-controller@fd7c0000 {
+      compatible = "rockchip,rk3588-cru";
+      reg = <0xfd7c0000 0x5c000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
-- 
2.35.1

