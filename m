Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731E23D75C4
	for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 21:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693086; cv=none; b=ZbusKtf9n97PC2oPt6cgdQqFxf6DFTMe5KfUkFD4uo7bi55HaL0SdIbcQ/XTRRKTyCMLQB+NSshdbLFXhk3Z/21/GSBZBGzEkjTXYeJn4dTWYBtS07it59g2QxpvRGNYWbMQCMb3+79vKfFaGyj+oWhQq6Rtb89NovF445edFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693086; c=relaxed/simple;
	bh=7Q7rDju/Sb9uNF2sg7XuNuMaorQf+MPeVghQidtskfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EObPOQ0Auca5FHdMaSkxXeFgNx/8BR1kXKzdb30uCRPM3pAw09v/tw7N0ih273zAl93x7BFq2jrMixWlYQ1f2x6XaAsncI7mcQV6e+E6+mXOjZAtkIJPZWsTFoHz14W9i05YxcKA+IXNEf0ddzalqVD+tLduLPjJZHNMajbccQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPYZblFr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPYZblFr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6a144c8eea2so480843a12.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Aug 2026 14:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787693083; x=1788297883; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wz9K9LS2Ea9+A1Snt9mSbTqxp0uUm7G3461p9py5FAs=;
        b=XPYZblFrvA4GdCzJaNGIfJZ6N19jVSWxKumZ59wqBfK6TAR4h/7dE9C2Nh2rKvD5vn
         CwQX5l0WSnbB8QvbJu7udW1/GCR/HEVmb/02hrWbindW35AleKomg6+eUIsnaBoAWWZC
         VodGZndabrYdf1WqrBkY6JDQdiYTTs3EvOsuDy9WI1GZtYA0agXD5lN+4GmyHq+PvgeY
         B2B8heQ6oz+5EwYGvgXDsQMtbx6Pv/q1ER6rdnReG0Lt0ZWE+336dJSewonRar8pGpk4
         2amwVeydb0b9JSDtlYzhzFIArtuTjcxTT46DCRvlYjUZ44CA1Cp3Zk/Mqwl72dmZUl0L
         aL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787693083; x=1788297883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wz9K9LS2Ea9+A1Snt9mSbTqxp0uUm7G3461p9py5FAs=;
        b=AkzmpPGxDxGR5gDLQqbqKoxThK9TSE3g6O9LCCjLhWKUE18lAfXTf+usd0ZJiiV/Rl
         aPTBKsLIwTHgmH/0cWXThK5uEm3YA7PjXvF6vgJU7j60qXj5XYPKb4xgktb+PQwkzWMr
         xTzldrMMdrLMqbPtTUKTOVr32G5/nGOjXZAYFP0kqW7uBsHUGY7jPXFcwf2b2tovUjhE
         ThyiR0V1wCTgzH5G1rvc9kQ+SZeVMVMqECCAcyTfJK/MO7hi0eqqrBViOLsAmx9eY7s8
         T6pQJYfQImGm9vAzAs8yl4F8Fx47X1dsR8OXRQiSnBVuDqSK4sMadorrFWIRLW3Bw7QX
         /HeA==
X-Gm-Message-State: AFuF++mcJmSG2UOvkDgqJr9TC7+NKT0sQ5fJhQc0XJHVHcWkUnz5XlU4
	UvLFmsqQaa6PgXAnlFRkuXd27V6JGgNQI3RKWmv/EAPXd1ogK9Ktd75L
X-Gm-Gg: AR+sD10tStfbhx/qKt98uF2khgmop10ciwCzIfBusa6yRkz4nx36Tbq4jMbkzZTwAlN
	4VhMk/wmRH7Kseey1BtQviEFLYEGFT0hLYih69sR5FS9Udnkzy8KzurWeV4gRNEDGv8dz+I2dyX
	erGnli9P8UYRQyynI5EZQadykFn/s5h4+LpgNNRBOOdO7l7QEWlzsW/+e3VByTaCKufSBsGJPff
	/2O0IlKlIVTL6Y3oqdrVn4Dd0VLY+ls1hOP0wdwxcMCgKXb41JWuy26n95n3wNJribdxBel95fG
	4lTafLZF7q6EwUY5mt3Jk0bORhbrWELowr0Dg58mVRPLgbhXMgFWowK9ny1XYudUVygHNqEb3mS
	emMYwLwwQTMFujYGJ0wzCXRGBTHEMmeV1zITr2ANXL3sg5HFUtlcm8A7hntQxkFsXf41yQaXBsG
	pi6JNmebdumxVB1ptKCbI1lDncY75U+6o4kCf2im5PxdjjpfALNCTqan1X++96S9z6LmNrcq1OD
	kcqb6O2
X-Received: by 2002:a17:906:7947:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c250bb7e838mr213578266b.4.1787693082521;
        Tue, 25 Aug 2026 14:24:42 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9ec343sm98297866b.57.2026.08.25.14.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 14:24:41 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 26 Aug 2026 00:24:02 +0300
Subject: [PATCH v11 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260826-zx29clk-v11-3-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
In-Reply-To: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8538;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7Q7rDju/Sb9uNF2sg7XuNuMaorQf+MPeVghQidtskfM=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqjggC7pGfN97wSeW2ZcWggIulezNcy5jT8gDoj
 aGq7YhPcYKJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCao4IAhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiK1uA/+MgBtkirc4h4/r3o67Dv09Yl75JkJO6A
 cgLcJIgMEOYljBY35K8I+0pZZoN8EVQ1DRi2v2/yy3DqiaN02QJL4+y2d7vgi1qPhEn5MV0QPOb
 PANoEMPnJWqCCELEq+Rog4nS0HGmUJRWyH3vFlG+l5Li4r0p/D13c2Cc3q3joBZ/G15EWfodjOI
 zpyV7JcikGbT8Dy2It0DVfMwlt9b15Ss63Sm/gf4l7HGYIdnr42X9OrYFf13dbZM9W4/E98GZX7
 dyqN3KXZA6fdN/ZDYUYx+XB+WkHYa9fu284gk4h8H0mgTMx4dsPCpne5KVywFbIDgAikyxIyQ35
 UkzDa8nSCd8ORQU+IrGxD1SKz7/ILHT/R8MvvQ+k7ZK0XjM0F9LQJzTPFKVoV9JbKopTorLtgLE
 LAUlGhsZZmQwFcINDU7+PvDErorOA7TjlpHe185Vf/OquDVgW+xlhNzubOtTIjWDR7I0SRgkoM9
 s/aQ/KNS5/KDkdsM1xnLD9lg+RvGvpoj1n9ejlsYwJ1znVaRngEkyKksY3mMFVqrjdjMOMX2ovb
 uOYcpxH8GhAeEq0e9FiP9k36Xz8mJYh+gOaTx5hj6ELTHo5Om22OzU/P88UYO9AYqJUPJSAr01a
 NMgXJOH9YaOjUvOvI/cH1NE00I8uao5BrEhVNEkNUDk8IWif9f40=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The clock controller of the zx297520v3 Low Speed Peripherals is
relatively clean. One register per device with gates, muxes and resets
and for some devices a divider. There are even bits in the matrix
controller to control propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are, however, a few more registers that
are likely extra dividers for TDM and I2S devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Patch changelog:

v10:
Fix order of clock-cells and reset-cells in the example to satisfy
dt-check-style --strict.

v8:

*) Start clock indices at 0
*) A minor grammar fix in the second paragraph of the binding prose

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 101 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  37 ++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   |  19 ++++
 4 files changed, 158 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..b0a176ffda12
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,101 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC LSP clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This clock and reset controller controls low speed peripherals on the board.
+  This is a relatively isolated subsystem containing UART, I2C, I2S and SPI
+  devices. The controller is responsible for bringing the devices out of reset
+  and enabling their clocks as needed.
+
+  The controller receives its clock signals from the matrix controller, and
+  these signals need to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixcrm (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixcrm (156 MHz)
+      - description: Main PLL divided by 6 output from matrixcrm (104 MHz)
+      - description: Main PLL divided by 8 output from matrixcrm (78 MHz)
+      - description: Main PLL divided by 12 output from matrixcrm (52 MHz)
+      - description: Main oscillator output from matrixcrm (26 MHz)
+      - description: Timer oscillator output from matrixcrm (32 kHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll-d5
+      - const: mpll-d4
+      - const: mpll-d6
+      - const: mpll-d8
+      - const: mpll-d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm-wclk
+      - const: dpll-d4
+
+  resets:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspcrm";
+        reg = <0x01400000 0x100>;
+        #clock-cells = <1>;
+        clocks = <&matrixcrm ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_PCLK>,
+                 <&matrixcrm ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixcrm ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll-d5", "mpll-d4", "mpll-d6", "mpll-d8", "mpll-d12",
+                      "osc26m", "osc32k", "pclk", "tdm-wclk", "dpll-d4";
+        #reset-cells = <1>;
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index bb1f349e40eb..acec8c1e0fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3901,6 +3901,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index a5e5d5f17c87..0e8c73671139 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -105,4 +105,41 @@
 #define ZX297520V3_SRAM0_PCLK			39
 #define ZX297520V3_GSM_CFG_PCLK			40
 
+#define ZX297520V3_TIMER_L1_WCLK		0
+#define ZX297520V3_TIMER_L1_PCLK		1
+#define ZX297520V3_WDT_L2_WCLK			2
+#define ZX297520V3_WDT_L2_PCLK			3
+#define ZX297520V3_WDT_L3_WCLK			4
+#define ZX297520V3_WDT_L3_PCLK			5
+#define ZX297520V3_PWM_WCLK			6
+#define ZX297520V3_PWM_PCLK			7
+#define ZX297520V3_I2S0_WCLK			8
+#define ZX297520V3_I2S0_PCLK			9
+#define ZX297520V3_I2S1_WCLK			10
+#define ZX297520V3_I2S1_PCLK			11
+#define ZX297520V3_QSPI_WCLK			12
+#define ZX297520V3_QSPI_PCLK			13
+#define ZX297520V3_UART1_WCLK			14
+#define ZX297520V3_UART1_PCLK			15
+#define ZX297520V3_I2C1_WCLK			16
+#define ZX297520V3_I2C1_PCLK			17
+#define ZX297520V3_SPI0_WCLK			18
+#define ZX297520V3_SPI0_PCLK			19
+#define ZX297520V3_TIMER_LB_WCLK		20
+#define ZX297520V3_TIMER_LB_PCLK		21
+#define ZX297520V3_TIMER_LC_WCLK		22
+#define ZX297520V3_TIMER_LC_PCLK		23
+#define ZX297520V3_UART2_WCLK			24
+#define ZX297520V3_UART2_PCLK			25
+#define ZX297520V3_WDT_LE_WCLK			26
+#define ZX297520V3_WDT_LE_PCLK			27
+#define ZX297520V3_TIMER_LF_WCLK		28
+#define ZX297520V3_TIMER_LF_PCLK		29
+#define ZX297520V3_SPI1_WCLK			30
+#define ZX297520V3_SPI1_PCLK			31
+#define ZX297520V3_TIMER_L11_WCLK		32
+#define ZX297520V3_TIMER_L11_PCLK		33
+#define ZX297520V3_TDM_WCLK			34
+#define ZX297520V3_TDM_PCLK			35
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 54e5b24f859a..b21d5901a7b9 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -40,4 +40,23 @@
 #define ZX297520V3_VOU_RESET			10
 #define ZX297520V3_LSP_RESET			11
 
+#define ZX297520V3_TIMER_L1_RESET		0
+#define ZX297520V3_WDT_L2_RESET			1
+#define ZX297520V3_WDT_L3_RESET			2
+#define ZX297520V3_PWM_RESET			3
+#define ZX297520V3_I2S0_RESET			4
+#define ZX297520V3_I2S1_RESET			5
+#define ZX297520V3_QSPI_RESET			6
+#define ZX297520V3_UART1_RESET			7
+#define ZX297520V3_I2C1_RESET			8
+#define ZX297520V3_SPI0_RESET			9
+#define ZX297520V3_TIMER_LB_RESET		10
+#define ZX297520V3_TIMER_LC_RESET		11
+#define ZX297520V3_UART2_RESET			12
+#define ZX297520V3_WDT_LE_RESET			13
+#define ZX297520V3_TIMER_LF_RESET		14
+#define ZX297520V3_SPI1_RESET			15
+#define ZX297520V3_TIMER_L11_RESET		16
+#define ZX297520V3_TDM_RESET			17
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0

