Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1D3033F5;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955084; cv=none; b=Qp5yelY76xha10pQp08Yq3f6VVm8XyQIhgwEc9Uoa0DipFHAKuqd89I/n2vXoXYVau20kOY9u47deb+OOBMTaFM8q9PKiXn/Om6qMoWY0taDZwDBqIqbIhhkBPjBL5WKQRV6BB1h0KdPSGDxTPynV1QxB6ouS89fSS/Ck/+RgW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955084; c=relaxed/simple;
	bh=E3+IBKtBlGcUymSMyi1R9MAcoGNeNAnLaeLohFdeUtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dbXJbElCSH/P8zCOFXUYAXx00YqrfrdBwJTmWUYWPJOiW8zpycBnuQL4asSbU6fSYLVon4Dz+clSVf9+i4OAkPo2NoFi7RK7/WQzQQIz75dua1qacapKuIWMPjJMDJCDUO6/PDvexZLIUdH0K7ZP6p6FRorPS6wXLELYkYKquJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJ0+fIQZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJ0+fIQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43996C4AF0B;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784955084;
	bh=E3+IBKtBlGcUymSMyi1R9MAcoGNeNAnLaeLohFdeUtM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cJ0+fIQZ6DlQFatE6CKw91LlsLEzpp4GcwAJn0IYj+kqeE7YYR5F1fiseog9igxem
	 tzwFZc8MgooPNQYXItWEnLkjokWDuD6sTr90FrPoX9lhhp6NOAMuqKtWejorVd3ZiI
	 MrAOYtI9eh4+bmq1Ggl5Ij1lqD4phg4aqFzlOhMWxhakLKZnDG2LCXs7VSwlZLFGKw
	 A63JbZ07Gk3QlJTVuLoVAQFNO4Ki8rXq8kyZplD2H2U9QaidXJJV3OlvXyno7jWOuN
	 9kHzgPWqIIzGL/5MWRgBaqLv1WLFXvqjUWv/ubA+hB2qB0rUL97pbxJ6rXAUAWB5kk
	 iQhgHsHXT0GMA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295A2C531C9;
	Sat, 25 Jul 2026 04:51:24 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 25 Jul 2026 00:51:12 -0400
Subject: [PATCH RESEND 03/17] dt-bindings: display: spacemit: add K3
 Innosilicon DP/eDP controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-k3-display-v1-3-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
In-Reply-To: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784955080; l=4645;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=yNWq543Aiagc6RVnpWivC9SHy2Deccat9Kz6CH7b1lM=;
 b=hNU8SsVIGQvtnrPi65MdtSx4Mow8CYWQmkIISxP9tzg/k50OtnES2xQV1xvCEtXhwe48rC2E+
 0m8lXiY3aWrAkURQ1sB3+qem/H4eYcBTG3n/P1k9IFdHq7dLRkxAJOO
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang.hk@gmail.com>

Both K3 instances are the same IP and share one compatible; which one
behaves as eDP is decided by what its downstream port is wired to, not by
which register window it sits in, so the binding does not distinguish them.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../display/spacemit/spacemit,k3-inno-dp.yaml      | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
new file mode 100644
index 000000000000..865ea310daaf
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-inno-dp.yaml
@@ -0,0 +1,140 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-inno-dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Innosilicon DisplayPort / embedded DisplayPort Controller
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  Innosilicon DisplayPort transmit controller integrated in the SpacemiT K3
+  SoC. The K3 has two instances of the same block sharing one compatible;
+  each acts as embedded or external DisplayPort depending on whether its
+  output port drives a panel or a connector.
+
+properties:
+  compatible:
+    const: spacemit,k3-inno-dp
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description: Link and hot-plug events.
+
+  clocks:
+    items:
+      - description: Pixel clock for the controller.
+      - description:
+          Pixel clock generated by the DP PHY PLL; the pixel clock above is
+          parented onto it in use.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: pll
+
+  resets:
+    maxItems: 1
+    description: Controller-wide reset signal.
+
+  phys:
+    maxItems: 1
+    description: Phandle to the K3 Innosilicon DP PHY.
+
+  phy-names:
+    items:
+      - const: dp
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video input from the DPU.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the panel or to the DisplayPort connector.
+
+    required:
+      - port@0
+
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+    description:
+      The DisplayPort AUX bus. Present when the output drives an embedded
+      panel, which is described as a child of this node and identifies itself
+      over AUX. Absent when the output is a connector.
+
+  phy:
+    $ref: /schemas/phy/spacemit,k3-inno-dp-phy.yaml#
+    description:
+      The DisplayPort PHY. Its registers live inside this controller's
+      register window, so it is described here as a child node.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - phys
+  - phy-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/spacemit,k3-clocks.h>
+    #include <dt-bindings/reset/spacemit,k3-resets.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        edp@cac84000 {
+            compatible = "spacemit,k3-inno-dp";
+            reg = <0x0 0xcac84000 0x0 0x4000>;
+            interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;
+            clock-names = "pxclk", "pll";
+            resets = <&syscon_apmu RESET_APMU_EDP0>;
+            phys = <&edp0_phy>;
+            phy-names = "dp";
+
+            edp0_phy: phy {
+                compatible = "spacemit,k3-inno-dp-phy";
+                #phy-cells = <0>;
+                #clock-cells = <0>;
+                clock-output-names = "edp0_pll_pxclk";
+            };
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&dpu0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    endpoint {
+                        remote-endpoint = <&panel_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0


