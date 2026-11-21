Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795246851;
	b=UoUij5h10cVndzBZcn0UkAK8gVXupjDqOMzfh4g8DktzkLRiHyQqleBsOfWyZSVbsmpA
	 LbyVk8jkjAPpnUK0zbBeJp6McjAFMY0OX9BMeKFd3lgT6yW28nAlcstAv0bbFO8qYWVcX
	 JYXyb5gY6qFXbes0ewRht9BWv/i/vaCIbV1xBFVCSQRrAvrxFVmwcwbfI8EhvP+1IFkqS
	 /TwHTlxHseR33y1q7rtwHd2g3eRKTHH7qeOWen1UrFQgrcl+IvA5x1C8t6cq6+qyzvr/e
	 BdSMfWfYO6fvmAhmOWo6znJTwu9MndQpRfNzyonJXhzkj4Mf2dPiSyKdGi4RODwyiYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246851;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=FEhQwyqQ31+c1r90nHubw1LP2Go5hKpeGQGhR3y91SE=;
	b=F1PfqcmCAVlFSS5/x2jx9xuCXAemCBLhsj1fQ7den8UaubAywSdtuphi2OMZ/gscJOac
	 jQuCaYdQrx9/gGQZeW/fZp1bGdPBSbFsgOw1vEsjSe4x5dztbfzIQFO+c9ZFiqzvuAqx0
	 pT/DyFMZ9x+cNpjbL4e0yLbyrXr7JKVu85Baen8mKn0wswq8ikHxeYMxU9wmpGWMuKl3Y
	 wtqINf7+7RPIjXq8JtMI6g0AQLMJ5bXOB43DTS+GQv7g9cGfUV45PR8Kst8F5gasVEQBT
	 t7UazhTwGjhTUAu0u87WoGU6u0XwmSRktfjGapn2eS3bJdVayPuJGxvr7OT4hm4bfgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="b/GCCQWg";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09E606A320;
	Sat, 21 Nov 2026 07:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b/GCCQWg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795246851;
	b=sDHDAzxR3iSAGyJ/FDPwyqCN1lAuAHdGLAtvnuxebZFciVjqckuozLba4eP7HymjVaRV
	 FVrzn6LGTyaVlYsX5fHI/FpGLE6QMWC2mFwEJKvr/7c/pM+HVp7Uj4evTuT7K8tQbsFvm
	 7M+kz+N7ll6Vm4llKjZ77qoKlt8A5RBPBwPRynqaWW+t56yQmSMSETQi3HEFODb8L6s9w
	 J83KNH9m5imhkP/l9QIowyUfLd5x3e0s1zG5H60PDSLscHQW8v1VTZjog7td7PIdSb97Y
	 gD+BLC/L54F7k5HInUcOfRqrVg9+C3sdY3wm3+CZn2a4RHUDDFcAzvnrxjPc3hzp0cg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795246851;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=FEhQwyqQ31+c1r90nHubw1LP2Go5hKpeGQGhR3y91SE=;
	b=ZRhdFhAhFd6WbF5JLdg1tGMNBUjJslHQcfo8AhnCmiEBrKRkb4ZBenobeohjg7cQ4C76
	 ONUXNEWEdov0X64bjmC0aZUku4P/H2nbpvNLEGzl/EBmEELm8H2l8v7HEHLYYlQmfB4CU
	 oUQtsY8vTwYfj/jDsMjWuxoWn+/MKUrXwdpmwP9NULtd5rUeJ3OdLfPBD5vR5MSaCvsEf
	 F1evMD8vLL+LWY/uTTz0eiB2HhxjZzAod+qWB89ON+uC3q0MouPBLGvMs0myA8pASvK+E
	 Z/vtUMh1CAULEFziq+ux/YtGzk850D15egGY29eb9Ow9Ry/fYQYZvJ8Zknj6tePhoXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EAED21F000C4;
	Sat, 21 Nov 2026 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795246851;
	bh=FEhQwyqQ31+c1r90nHubw1LP2Go5hKpeGQGhR3y91SE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=b/GCCQWgzLnn4RnVIzWp3CfCEp+tZ/9yM691ourhvGRBQgUhMskKgXV0EB13VMsNE
	 h5/TCST42zjyYXLw8jjjHNk2b0cG8ZfWx1qkMuhpghmAx2XxPE1ok8A3sTmw2zTRqe
	 FUEpUCxEkp0/14lCRoSs7dLYdDCBXm1miGKj+OZi5mj/9+xb9vPDedi4SSnR7fG44A
	 q3nGifTacbK749SdBRngwg0ERq3hZ/u+4TQhEe/R8zUcwFICG10b0VB1vP1xEgfJC8
	 Vb5enVEJG9DGtBa4yhEEn/YwxBSoH1a7rw1pOvK5DOzRpEB5JLiFFH/gi/fZnYqNRe
	 mcE5qKkUfX7hQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6AE144BB30;
	Sat, 21 Nov 2026 07:40:50 +0000 (UTC)
From: Cody Kang via B4 Relay <devnull+codykang.hk.gmail.com@kernel.org>
Date: Sat, 21 Nov 2026 15:40:40 +0800
Subject: [PATCH v3 01/17] dt-bindings: display: spacemit: add K3 Saturn DPU
 controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261121-k3-display-v3-1-ec419e8e96b8@gmail.com>
References: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
In-Reply-To: <20261121-k3-display-v3-0-ec419e8e96b8@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Haylen Chu <heylenay@4d2.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Guodong Xu <docular.xu@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Sarah Emery <sarah.emery@canonical.com>, 
 Ze Huang <ze.huang@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Cody Kang <codykang@vsit.ai>, dri-devel@lists.freedesktop.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795246844; l=4704;
 i=codykang.hk@gmail.com; s=codykang; h=from:subject:message-id;
 bh=B0FgBmi2uPlLPF6FJZuzQ4EXAJELGBx+dPQ5a+jWxGc=;
 b=bbeBmZ28FJ72zoLSZQtZ17eaErYya1kCkBUjZ0XAjSs1SKMyZ5mZ44ONrCbCguBK/5zqFxzM5
 bm9AOpo7OmMBwADEgUtkrymiQon2Jq1oGJb7a1QZr5PcR+rtUw3F6Vq
X-Developer-Key: i=codykang.hk@gmail.com; a=ed25519;
 pk=Osn6/cs9Su/mHHw4P19cmVc3v2FMQfiWahjsN0vEkuk=
X-Endpoint-Received: by B4 Relay for codykang.hk@gmail.com/codykang with
 auth_id=895
X-Original-From: Cody Kang <codykang.hk@gmail.com>
Reply-To: codykang.hk@gmail.com

From: Cody Kang <codykang@vsit.ai>

Document the Saturn display processing unit found on the SpacemiT K3 SoC.
The K3 instantiates two of them, one per display path. They share a
compatible: an instance differs only in which register window, interrupt,
clock and reset lines it takes.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Cody Kang <codykang@vsit.ai>

---
v3:
- no change
v2:
- add Reviewed-by: Rob Herring (Arm)
---
 .../display/spacemit/spacemit,k3-saturn-dpu.yaml   | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
new file mode 100644
index 0000000000000..97ea9da4b68e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/spacemit/spacemit,k3-saturn-dpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT K3 Saturn Display Processing Unit
+
+maintainers:
+  - Cody Kang <codykang.hk@gmail.com>
+
+description:
+  The Saturn DPU is the display processing unit of the SpacemiT K3 SoC. It
+  composes the display planes and drives the timing for one display path. Its
+  output goes to a DisplayPort or embedded DisplayPort controller. The K3 has
+  two instances.
+
+properties:
+  compatible:
+    const: spacemit,k3-saturn-dpu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Online (live display) compose path.
+      - description: Offline (writeback) compose path.
+
+  interrupt-names:
+    items:
+      - const: online
+      - const: offline
+
+  clocks:
+    items:
+      - description: Pixel clock.
+      - description: Memory clock for the compose pipeline.
+      - description: AXI bus clock.
+      - description: DSI escape clock.
+      - description: DSC clock.
+
+  clock-names:
+    items:
+      - const: pxclk
+      - const: mclk
+      - const: aclk
+      - const: escclk
+      - const: dscclk
+
+  resets:
+    items:
+      - description: Memory clock domain.
+      - description: LCD domain, shared with the downstream controller.
+      - description: DSI escape clock domain.
+      - description: AXI clock domain.
+      - description: DSC domain.
+
+  reset-names:
+    items:
+      - const: mclk
+      - const: lcd
+      - const: esc
+      - const: aclk
+      - const: dsc
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Video output to the DisplayPort or eDP controller.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
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
+        dpu@c0340000 {
+            compatible = "spacemit,k3-saturn-dpu";
+            reg = <0x0 0xc0340000 0x0 0x54000>;
+            interrupts = <90 IRQ_TYPE_LEVEL_HIGH>,
+                         <89 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "online", "offline";
+            clocks = <&syscon_apmu CLK_APMU_LCD_PXCLK>,
+                     <&syscon_apmu CLK_APMU_LCD_MCLK>,
+                     <&syscon_apmu CLK_APMU_DPU_ACLK>,
+                     <&syscon_apmu CLK_APMU_DSI_ESC>,
+                     <&syscon_apmu CLK_APMU_LCD_DSC>;
+            clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+            resets = <&syscon_apmu RESET_APMU_LCD_MCLK>,
+                     <&syscon_apmu RESET_APMU_LCD>,
+                     <&syscon_apmu RESET_APMU_DSI_ESC>,
+                     <&syscon_apmu RESET_APMU_DPU_ACLK>,
+                     <&syscon_apmu RESET_APMU_LCD_DSCCLK>;
+            reset-names = "mclk", "lcd", "esc", "aclk", "dsc";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    endpoint {
+                        remote-endpoint = <&edp0_in>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.43.0


