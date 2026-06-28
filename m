Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0753D3B14A7
	for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 19:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676773; cv=none; b=bEqJLZB/MouyxB3htouWnw2LD8A/TbPFy9Xqy9Ab54XE71zFw/hvf+1ZT8wzxGAfmxAZPMQuEgSjJ0SAJJx1RtfItN3AcW64KqxBXpPe2BWmL3AIqV/+8mNV3cO77TBifQCKGL2piTQy9EHzxcOtsro30d/BYx3+xxQRHFJH1jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676773; c=relaxed/simple;
	bh=a7c78y4awvOptqBnvo4wwQFCy4PQARBq/5n/LCe0P2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=izib1XmSSKLLf4qo4hjwPuHNHiSUu2W4x2FSHFkgVfWyu9He935V4n0IESjtyA4fBKd4hkeuMyLYZLrbh+56zqH9l5xw4ZoMnLA0eN9SffHUtci1oG9TW4qfuzCffSy1a+Gg+ZsRTBlOOmyP7Wa7ydLj4+TSXzjf+yXdqSg659o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNOCfSef; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNOCfSef"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493a440bc10so5454095e9.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782676770; x=1783281570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqIYbDSpn4lGb/07yoDdg2DMBPPvCNmBE5i5NwPXm4U=;
        b=rNOCfSefa74mMB3e5OdmvAhBNEtqRBjGXEAapGKuKSaN8bjp/xOhCF3cpJP06z3v5S
         EJV9N9vYGSv0SLmZlZu3Uo86mBNx4yTuExVCYFNZzXHbli7s8JmMHGfiJ6bJcEl+IKoh
         SZrtpBi8tpnW/VMQDLz9HAUrvpJwshZcTyyHLuwGH/zd3fSCYsCIb/In8MTTmL1flUTZ
         jqM3OKeDFPqQSDNZv2GPB9w1nLt/K5PUIqUj2nL5+SYmukEyBAkeQHVwmH1n8ckO3Pdt
         yzKGX5qYzL1FZpGMdh42a1G+Zjsv4LeBORBb6ebA5XH2/htqnLvzl5C7C0xxaHjJbYIH
         BO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782676770; x=1783281570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZqIYbDSpn4lGb/07yoDdg2DMBPPvCNmBE5i5NwPXm4U=;
        b=LkV+6xarKqXMOqaJM2FlSF6EA/CwicP/9aZs5MrDJsyRx25zkWFyUJ1e2Cp+rNeR6Y
         4tKl4y2SbidarmG5dmghouysNscsrgmbCWHp+WeH6Rw7yFUvbIMIau8xMDwrL5s1eAAd
         hFBdCQrHopqeVAeutpLHIBqt5vgXugFjBbqIju8YG70VTDigQa2+Lmp2t6g4Fx2bFh1f
         +8wQshSlBE94cP4nGfYE1i08x+WEiZhSreqTbm3wBJ2VvOpusRAQ2sz6+6SuFYorCk5b
         /ctyQG9ZeEDLyKAcGEGp1HkPF90/3leeqM0mhVlRai5qetFDdXZ1XZio0bsc+n0V13ZI
         V37g==
X-Gm-Message-State: AOJu0YwlrE2KZ1qdO/umVo4vL4hnmg+dLKF6Jz2BvCBlqRH4uv3WzncG
	If2xXl37N8rQ/zuEMUyMYgbaPNwXyIczWm3nmLwPXJVsdeOgO4oRawcF
X-Gm-Gg: AfdE7cnoiYZIHGy7flb4z+NltWeaOIs9Ft322To3l98Mvh9Ip6fCS6bDeq4D8dEQ8Pw
	6i4yp3U1yUARoWCIidZZYoI6hm9JcFEKAslFnmloGc4xeq4nNB9Fl7lENTtQMtzIcHxhX/z4F29
	TZqrfYiHM4iYSfjs+4uiS1tfdTsAeWWdJi4w13LKg2829XrACyWbPd+n86iDYZi0L1i/8xIyqPx
	rh+ZtGuVgwjPEYhZxYdjfeQVjslsbQas59CPpoRS1Fj8qstYn0Zxn80OV9dZfonc7ovw2Uk6iXv
	yuqPTjSIEZ26HeuhSyQQNtZh1H20ErFRNX5NQnve9G6b01OmMkfpWHV2srQ0C/juBwtDrYenGXK
	ghBSsuXct648VIsJotI77ZVr0OGywyziMhOi5RyKEbacLbK4YeEnLXhE1IE65OX6OyP5R2G04qP
	ZljQPXGeU4V8VNqp7+0i9Qgyc=
X-Received: by 2002:a05:600c:3e0f:b0:493:8f89:cb86 with SMTP id 5b1f17b1804b1-4938f89cd5emr77371605e9.3.1782676770286;
        Sun, 28 Jun 2026 12:59:30 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ae96c85fsm15133505e9.5.2026.06.28.12.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:59:29 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 28 Jun 2026 22:58:58 +0300
Subject: [PATCH RFC v5 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260628-zx29clk-v5-3-79ff044e4192@gmail.com>
References: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
In-Reply-To: <20260628-zx29clk-v5-0-79ff044e4192@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8046;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=a7c78y4awvOptqBnvo4wwQFCy4PQARBq/5n/LCe0P2g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqQX0UpTxm6MDy46Z8ykCtPHL4tqhGPJlg8xDZm
 67ONeEJo5CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCakF9FBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLnUw/9GKAHn7+pX7hDbh7m01Gd9o4PuTvVOuh
 da0QY9NbeHmZQNeNijvFnvIVfuwMi1WmsLf4wRfYdEKmWf1wQ7mrjOxkjkDw30SeSjufP33uU5x
 iH4DXLeS4x/Z2lylgmQULaVHzwoq/w/GBVRGhtMq/TAdmxNNhAWZA0AgXTPVTAalMOcCdpKGJtA
 3NMrC2giYOibqiltI78lnE3nsLL6aeEAa1SGluJ7RVCptKEg2q5xtEnfUS5HJoEhD1+xr/og8m+
 gmKC6aMkyl6517EbQsCFNXRJlAb4HxNmslN/KdVgB+4cmwfNb8l3HzoTWJWEYFCHxZiiRSM5Wus
 PMK5CvEW/zDTHKR5GPF6dKeTfF+25Fvemj3PkJOrjZjermA7f6/bbgND8RtjWcENwfSoGNaLqdf
 6sgoWKvX5V2n7Ss9+Vrg8zTN/tpXLVMEWTTe+jw2iXZZIkyXiWWmT5yGjE8gfI3FQ/NAGn1TELk
 wv5Cc0zUeDUbBFAgooCBjOdp/9zQ28H1SmtjlbQ8elFdtpAGr21C8mrNlleeS3x8Bguoy0CXWSJ
 ZuRDtdKvYSqIYfgLR6eMMl8YD7cHxwXc+vj/GA/J5nBId5wZ7oo36Z8vvZecRTVN5SmXlK//6Ew
 o2/8WZc0cVXXfYZSf7+KxM6BlRy0Cd1o3OHbcb64cW+rKJEZ6Gqg=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The clock controller of the zx297520v3 Low Speed Peripherals is
relatively clean. One register per device with gates, muxes and resets
and for some devices a divider. There are even bits in the matrix
controller to control propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are however a few more registers that are
likely extra dividers for TDM and I2S devices

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:

v5:
Rename from lspclk to lspcrm
Remove matrixcrm from example

v4: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspcrm.yaml      | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 37 +++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 19 +++++
 4 files changed, 153 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
new file mode 100644
index 000000000000..c510129068de
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
@@ -0,0 +1,96 @@
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
+  The controller receives its clock signal from the matrix controller and need
+  to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header. Resets are defined in the
+  'dt-bindings/reset/zte,zx297520v3-reset.h' header.
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
+      - description: Timer oscillator output from matrixcrm (32 KHz)
+      - description: LSP pclk output from matrixcrm (26 MHz)
+      - description: TDM wclk mux output from matrixcrm
+      - description: DPLL divided by 4 output from matrixcrm (122.88 MHz)
+
+  clock-names:
+    items:
+      - const: mpll_d5
+      - const: mpll_d4
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: osc26m
+      - const: osc32k
+      - const: pclk
+      - const: tdm_wclk
+      - const: dpll_d4
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
+  - '#clock-cells'
+  - '#reset-cells'
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
+        clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0f9e588e4839..ee585982b859 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3867,6 +3867,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/soc/zte/
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 8a6aa456a708..3c390211f897 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -131,4 +131,41 @@
 #define ZX297520V3_SRAM0_PCLK			35
 #define ZX297520V3_GSM_CFG_PCLK			36
 
+#define ZX297520V3_TIMER_L1_WCLK		1
+#define ZX297520V3_TIMER_L1_PCLK		2
+#define ZX297520V3_WDT_L2_WCLK			3
+#define ZX297520V3_WDT_L2_PCLK			4
+#define ZX297520V3_WDT_L3_WCLK			5
+#define ZX297520V3_WDT_L3_PCLK			6
+#define ZX297520V3_PWM_WCLK			7
+#define ZX297520V3_PWM_PCLK			8
+#define ZX297520V3_I2S0_WCLK			9
+#define ZX297520V3_I2S0_PCLK			10
+#define ZX297520V3_I2S1_WCLK			11
+#define ZX297520V3_I2S1_PCLK			12
+#define ZX297520V3_QSPI_WCLK			13
+#define ZX297520V3_QSPI_PCLK			14
+#define ZX297520V3_UART1_WCLK			15
+#define ZX297520V3_UART1_PCLK			16
+#define ZX297520V3_I2C1_WCLK			17
+#define ZX297520V3_I2C1_PCLK			18
+#define ZX297520V3_SPI0_WCLK			19
+#define ZX297520V3_SPI0_PCLK			20
+#define ZX297520V3_TIMER_LB_WCLK		21
+#define ZX297520V3_TIMER_LB_PCLK		22
+#define ZX297520V3_TIMER_LC_WCLK		23
+#define ZX297520V3_TIMER_LC_PCLK		24
+#define ZX297520V3_UART2_WCLK			25
+#define ZX297520V3_UART2_PCLK			26
+#define ZX297520V3_WDT_LE_WCLK			27
+#define ZX297520V3_WDT_LE_PCLK			28
+#define ZX297520V3_TIMER_LF_WCLK		29
+#define ZX297520V3_TIMER_LF_PCLK		30
+#define ZX297520V3_SPI1_WCLK			31
+#define ZX297520V3_SPI1_PCLK			32
+#define ZX297520V3_TIMER_L11_WCLK		33
+#define ZX297520V3_TIMER_L11_PCLK		34
+#define ZX297520V3_TDM_WCLK			35
+#define ZX297520V3_TDM_PCLK			36
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 81ffc8bc34c5..85a2f0707cdc 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -39,4 +39,23 @@
 #define ZX297520V3_GMAC_RESET			7
 #define ZX297520V3_VOU_RESET			8
 
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
2.53.0

