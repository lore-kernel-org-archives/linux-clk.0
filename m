Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE43818BBAE
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 05:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784956208; cv=none; b=YInCouFWp8l1t7jXseiP34vablBU9yUuHhRwkYMML56md4gFYPuv7Q/t/SWvaNpga04K8fwrLzCPkEWdB9zBwUIQCfAf2JLr8ZrGiyJbOAPUAc9Z7Ry0A6jtzI0hHMARik6hfbIdsB6PdfdP5/3ysnF0uodeMXfhQKvBQXBfUSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784956208; c=relaxed/simple;
	bh=e2HtZIpFAeEzBhd8fEr6izzVbI4e6Mu4fEJXjQ+ijhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JjdwO9Ba9JXwNj8PJ3SKXuGPlVXSQXa9fL9Dko3nAqyn3ehALC+veoG/U0KEOBJVp75OrNxKR8C10+5PDopJb4VL1xWmxsbW8SQQUKRw45sXmKwjUW07bau7+4IIUB62C+bdmYJt1UgcGMyob1zBLU3/uQUomJzm3uYxgdLMQ60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SG3vJFi/; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SG3vJFi/"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso627165a12.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 22:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784956206; x=1785561006; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=SG3vJFi/Ma2x1Jub5hW+evmJMG1+VS2iyGshu3UIuCAHGw1zH4tC+zBpHwhMrCdJMA
         EB5EmbGqVfMl5pPZXoVjvyG1h5kQdjJ/605/USxhlJE9G5CQ7WMpHJlJ0/o7a3YzVtV3
         wVlf3Q12tN9l8eNvPzlIJ5o2P7SoPKK4nyo+tko3xsyN9FAXIlCEl+tmfQjB6dqfuVAS
         FLbvPr+CibC074j2SwsIF7uZAPyjGkMZOvUTsdby4JyX/Oi26Jh1C0KtfM97weOZL/qp
         qtLpoNaKNo41iRhpK6OtaI6Ii/YBsYrBHprWH439H8na5totdaxugHe+G8fyH2/ycvab
         zcfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784956206; x=1785561006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ycy+Qjco0x+8uNmV749kGmpBtIQZVaDIzcG2OSIxUnc=;
        b=T1SBF8cEyjSsPlNEbT7vfwL/5P1q9OwDkAsbF6CpRmtmCsGL3I4TxiKAHUBZvULBSm
         kIMML5IP4sMhdb3zfTStIZeAPOhsao0I9cKfK20iZW90dn0q8jqJS/sFQ4ydrbv0o/vu
         a0e475ZqMyiELGZfE6AepN5fT/EcC0m/vnBz/gWN3aaFHS1EfYxbf8Gs/VmwYyyXYazK
         sDVBKRutT/1oWP0UP6mHDgfALsYHh59nE9FUPyH0Ae+XKtCAA8DFIRplKaRbcJxcl3rx
         Wz5J29fOsY2gqpNfjPSALxNi3s18YLNTBR6giI+KLr0g+rOOk2JhSzYGSmlF0lFldgTZ
         L7rA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5XYOhq27reySE8x4FFPIz9g+o9w/7DWZqmvUNuKBYVBdNvQkiM7pPvWtJggTawgCAuAXaA3QXnYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR74oH8QEBvYVVszOldhdja2w/fRn2g+7fj2I3qjwOLppTKywX
	rOhwSxEEpofzyX8KGeRRxlKtsjXivmRfi7G3Jo8tzG1TrWeSbmq5ACcC/EB4rDeMDmXrlQ==
X-Gm-Gg: AR+sD1182SV65EN484sX1BiSZzWlFW1/GJbb3Oqb+QdKj5wdLmUSHMAebHBPwnq45ur
	MgYzn5FvvXF4Ki/aGFDFC5a8Wi6ZvAJWvRQtnrqhLqAz1YOOIQ5AuBWPAfNRyUbDxHkNWfiRcxO
	5Bj/I2qEmFh87L4a8XlO9wDOBVGVqRJs0jfdXKcN3NoPklWADetjc08tYcU7a8WlwtdBz2BNG8c
	3UbwlDHcLrqvpblP6YN8YBbXvxeypVoUXai5ttso5qJIkwRbtFv5bO81NjFHql+dMbIFPzpv7jp
	9IlPaDNJAMO7uw2UCE/Tjjnl9zR4vZPKVX2gpEPdoqeR51pHBYp3VnAUhRRWtElkien+aqRUVWt
	rxRvi2u6sdg1zoYBZk28gd1fo/CIRjVrG/pQyx2/KLnLcymBY5G21xrw=
X-Received: by 2002:a05:6a00:2d9b:b0:848:2a71:a48a with SMTP id d2e1a72fcca58-84e593ff0ccmr644911b3a.13.1784949438724;
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:17:18 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:33 -0400
Subject: [PATCH 01/17] dt-bindings: display: spacemit: add K3 Saturn DPU
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-1-f22a10a52867@gmail.com>
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

Document the Saturn display processing unit found on the SpacemiT K3 SoC.
The K3 instantiates two of them, one per display path. They share a
compatible: an instance differs only in which register window, interrupt,
clock and reset lines it takes.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 .../display/spacemit/spacemit,k3-saturn-dpu.yaml   | 132 +++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml b/Documentation/devicetree/bindings/display/spacemit/spacemit,k3-saturn-dpu.yaml
new file mode 100644
index 000000000000..97ea9da4b68e
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

