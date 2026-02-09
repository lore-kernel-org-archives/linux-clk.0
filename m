Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98E92FD7D3;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770616146; cv=none; b=FqBJpY5YeTaSc/s1D95kpIzu8ZnYSI08+nRoYQL08YGYrbKMbkuE97NkWkGWYQsFJSHQ5abVD1QHy2UBKzWbg3bz/gObRu2d4+pt9sncAuEKhFt/CDfDQ/psp5skkzBJOKJrHRpaYZrOT0DneXiP8zFpbx0Nw6+hZjLBhI4Pvgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770616146; c=relaxed/simple;
	bh=snI8j+VY41wHmT+na+qjUXxcX28YmAHQsRCDu04k2ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FE6TG25pkqu/2wvgw5BagZSfJfvZCzaFbtaPh9a3FVFzulsHoiN5eK77eby3uNijyPfTAJZ0nIwYeQ7uT7Ik7KwWgRaiwisIwFBMK69xg5H/2xQRUcT2WuseqL7i5PIhAuyDLJ5UbHCXaUCyheafsy2gxjtXRX9h10kjd8sSobY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=REh4dKtp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="REh4dKtp"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60F97C2BCB0;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770616146;
	bh=snI8j+VY41wHmT+na+qjUXxcX28YmAHQsRCDu04k2ao=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=REh4dKtpO4SQsgRXh+dIHbn/YP1W+XlZjubxD//vuWojHfhTkxX+9PFsDUrmEmQZF
	 PIC9gQUzZKVTf1utw7v8qWhyXXdRHC5QKTk2qBZv0TExqZo7IF88opPTqlR36f4aCl
	 D8z6msu7mo9s8SSe6FhEHBzWoFVpaeBEfyR9W48ASE2aQyj3SRAqFxtR8WAXr4YVt1
	 CHyr3OcIqMcOGmENHjoqHGHXZVr0N717z1uX5W3U1p6hK8YtT2fF7cjDHrltSznAg1
	 a1IVzWsq/guMq/jhvqgx35ZjSXesF9vEqg7FNogYCggg1kRhCwCdt5X0wjR5XgXR17
	 RfVH1dI8EMD6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F9FEF070B;
	Mon,  9 Feb 2026 05:49:06 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 09 Feb 2026 13:48:48 +0800
Subject: [PATCH 02/13] dt-bindings: clock: Add Amlogic A9 PLL controllers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-a9_clock_driver-v1-2-a9198dc03d2a@amlogic.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
In-Reply-To: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770616142; l=5717;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=LyZ6UBT9Q6k7Fn7bjq6bnz37qzqmph54nv7OuWBpCck=;
 b=E1k8Q3OfqeBhGrzZfdznUd4MgKjLxFwgQJabHnnj2VIppvftGQ3dgu/guCoIoj6/G7cr+J5Dh
 7+ocHR9fbibAqs4W++QyVU3wQHBA/zfIMByCSAL2MooWJS8sllZozlK
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add dt-binding documentation for PLL controllers used in A9 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 .../devicetree/bindings/clock/amlogic,a9-pll.yaml  | 134 +++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-pll.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-pll.yaml
new file mode 100644
index 000000000000..26655716f040
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,a9-pll.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2026 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,a9-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic A9 Family PLL Controllers
+
+maintainers:
+  - Chuan Liu <chuan.liu@amlogic.com>
+
+description: |
+  PLLs generate high-frequency clocks by frequency multiplication, feeding them
+  into the clock tree where they can be configured as operational clocks for
+  various system modules.
+
+  A diagram of the A9 PLL is as follows:
+         +------------------------------------------------------+
+         |      +-------+      +-----+                          |
+    osc-------->| div N |----->|     |   +-----+                |
+         |      +-------+      |     |   |     |                |
+         |                     |     |   | VCO |   +--------+   |
+         |                     |     |-->|  /  |-->| div OD |------>pll_out
+         |                     |     |   | DCO |   +--------+   |
+         |      +----------+   |     |   |     |                |
+         |  +-->| M & frac |-->|     |   +-----+                |
+         |  |   +----------+   +-----+      |                   |
+         |  |                               |                   |
+         |  +-------------------------------+                   |
+         +------------------------------------------------------+
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: amlogic,a9-int-pll
+        description: Integer multiplier PLL
+      - items:
+          - const: amlogic,a9-frac-pll
+        description: Fractional multiplier PLL
+      - items:
+          - const: amlogic,a9-frac-step-pll
+        description: Fractional PLL with integer step granularity
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: input clock of pll
+
+  clock-output-names:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  amlogic,clock-max-frequency:
+    description: |
+      Each clock's maximum output frequency is constrained during hardware
+      design to ensure proper timing requirements for the clock network. If the
+      clock frequency configured exceeds this design limit, it can lead to
+      abnormal behavior in modules relying on that clock and may even cause
+      cross-talk that affects other modules.
+
+      In the driver, this property is parsed, and interface functions from the
+      CCF are called to enforce the clock's maximum frequency, preventing
+      potential issues caused by excessive clock frequency configurations.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  amlogic,clock-init-regs:
+    description:
+      Certain CCUs and PLLs require initialization through dedicated registers
+      before becoming operational. This initialization configures internal clock
+      drive characteristics, divider parameters, and PLL internal circuitry.
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: The register offset address
+        - description: The value to be written to the register
+        - description: The delay after the register write (unit is us)
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-output-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        clock-mclk_pll@8330 {
+            compatible = "amlogic,a9-int-pll";
+            reg = <0x0 0x8330 0x0 0xc>;
+            #clock-cells = <0>;
+            amlogic,clock-init-regs = <0x4  0x00402000 0>,
+                                      <0x8  0x60000100 0>;
+            amlogic,clock-max-frequency = <2800000000>;
+            clock-output-names = "mclk_pll";
+            clocks = <&xtal_24m>;
+        };
+
+        clock-gp0_pll@8200 {
+            compatible = "amlogic,a9-frac-pll";
+            reg = <0x0 0x8200 0x0 0x10>;
+            #clock-cells = <0>;
+            amlogic,clock-init-regs = <0x0  0x08010000 0>,
+                                      <0x4  0x11480000 0>,
+                                      <0x8  0x1219b010 0>,
+                                      <0xc  0x00008010 0>;
+            amlogic,clock-max-frequency = <2800000000>;
+            clock-output-names = "gp0_pll";
+            clocks = <&xtal_24m>;
+        };
+
+        clock-hifi_pll@8280 {
+            compatible = "amlogic,a9-frac-step-pll";
+            reg = <0x0 0x8280 0x0 0x10>;
+            #clock-cells = <0>;
+            amlogic,clock-init-regs = <0x0  0x08010000 0>,
+                                      <0x4  0x11480000 0>,
+                                      <0x8  0x1219b010 0>,
+                                      <0xc  0x00008010 0>;
+            amlogic,clock-max-frequency = <2800000000>;
+            clock-output-names = "hifi_pll";
+            clocks = <&xtal_24m>;
+        };
+    };

-- 
2.42.0


