Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210CA26299
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 05:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956146; cv=none; b=TaObOTx0E5Z/DiBeKzNHOCvU8M8Ay9/ok2zjV6evgbcmNFA8G/atRdIRNaZVFZwEn/Yo/smCtasVHI1ezF99Mt99cLImpghn73593STVgUd2nErRWFE7DRbLSXZxBqt+gpjRl3+mR5aZPXqj7LZbAm7WIaLzbJ7mpVHBqIv0JuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956146; c=relaxed/simple;
	bh=yNWq543Aiagc6RVnpWivC9SHy2Deccat9Kz6CH7b1lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DxjnSTBvo4o97rrG3xKxRzm7e7QvSFPHgtLekCIsBORZH35YR0rADKj/LA125BO6P/uAmekLL3tBejb0onZhiD9b4Zt1Hq0Iw9gjg3Eq5vX4PiYBpN6SvbZw6TdteXjVypkMd3GPo7AmTdFnZZjHoW1TnXBCKqM6WplzVwcrRhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afwGyjqx; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afwGyjqx"
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-44cf1835ec3so303461fac.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 22:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956143; x=1785560943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6a/x50Eo6kNHLlYGVZSsuYw6cqPBcO8EXP5O0WJGjSk=;
        b=afwGyjqxon3Ot8PQOuAwRT090zTjqoBPQMnEAgui8dM7X9jl23goDTi001/eJLrddB
         tLFWUwaAg3iU+N4KTBfa+eHUxYOISCgRo5Y0l6H8mWKgDFrNLMMQcGOIt/wLvKcasMHu
         jNyGpJ0iGDiWdPN8Tib09Py88qwXXbvVMloK2yzfwzY3cB7OF5zjQBF/rxCZhyNJyaH5
         2G+zfELP42628xkR+d76+y7GGzyOdOiJrzFvEDU4Mcf0tAGEzV4CxyGVbFKo8HuSkNLZ
         /jFdiryBLOp4E/XTj2PHxce0MAT6PMC9nZRO/4pOUc68FMSwvChzE/E27FWF90w3ZI0B
         8wpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956143; x=1785560943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6a/x50Eo6kNHLlYGVZSsuYw6cqPBcO8EXP5O0WJGjSk=;
        b=hwmCgOYfem3ckH0eZGCyAARZuLVAiuPKzGMBWtg7cBu6dCDBIWTG0fNlAcYld6N3Cz
         ZKoQGr1cEgmKcToX+KZGY4uNhfS18tORQiuwRBBc0lr+ALhF2QMyRbm3NF9RaMmjWhoz
         u8w4ROkRvRNflVVhrlEqDZ+TzeN7e7P7A3ZH3auFOUQrNf4E382sZJPc1lzwe7CpBuot
         5ZklaaSang+lTnjIZRc22VvRECyN3w67xYmqTrItVxLPs1kRyAm2D+a0+kK5bC16pKyE
         19t5yFwSvu+qquP+H28LhXooK3/g/o4yRstQeulsmuzSOHRhqcY90gP042Ju0ZJq+TlJ
         LFtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPh0ZTyT1TWUExA2udTX7E0TgF4mEM3lwBl7Uhb519XAw/cIVUFzHB74ZuU5V3fseUMc9UZhLf/OA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl7UVfDawPrhKtdtPThXUgvcUmJ7MjIukoR+OBhUwY+wEqp4jd
	J6/xmBnu8oowCwEVHB4kpXZtg76VApfc/h3dnns/GV3OZ7zcON3zpzNgyM8JToN2zLbpow==
X-Gm-Gg: AR+sD11f/WYnIQpCPNJV7bGSvg55DD9lXYOYzdukLYondtGxRRqlcTd75U1QWpuAc4C
	JchwJOVrIk0KMGb+2XjWQozA3eOiUPkLLhZC4AZyrN8uL0A+qSv5Nacgvmp3i9VG22LWxaKvlZ5
	vY3DV35v9sAwdJ5Ca3jSReC/F1TBjZgA2AkaNRdi9JF71avfDBr/WoM3bP0guRXGl8KbNiaQK2A
	3zNBgyAIn9cw8gs3YL12zl4kkYyKbMe+xwAPhAp0jybxIziTDzs5ZPI1rEfBkO/lGhJtwVAfJGz
	+FAFn1EWOYbq22ySU2RXRcd/Uc418Ir+oMsVyOLmzi/384vudSc5Kk//S/0wiK3k7nac8Ueuux5
	VsD/TiLqwGWk1PO0H1fo9/JtmGouX3dLef16T6faOghzDjbfMzPknU1E=
X-Received: by 2002:a05:6a00:a21a:b0:848:727f:2c8b with SMTP id d2e1a72fcca58-84e5959f3c3mr660746b3a.68.1784949456147;
        Fri, 24 Jul 2026 20:17:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:34 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:35 -0400
Subject: [PATCH 03/17] dt-bindings: display: spacemit: add K3 Innosilicon
 DP/eDP controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-3-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
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

