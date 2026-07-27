Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1223A4F50
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176728; cv=none; b=uy8I4WaQe2ANj2vAyJ7NQtlEWVRcr4cR/i0cZMuOpgj79KTRgocnU1Me666gl87ZLH++xm4p8wFlBk1vOP9aVUWtn6eym/IQRJv8o6ketNtUZ0k/xmyhFwWEyTHu8T06rIxV06b3Bg06auhn4TRRASY7c4mheKmTXQUbz8u7JlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176728; c=relaxed/simple;
	bh=D0jwRCT6NU4HIEAYKyrwIaJChrW6UBZjDhcNTvtwrZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X+HDppqLU9ana3ohX1qnX7nCoVWFdA60+r1oBfGIzZe/cC9X1rihXnX9rFZGp6BZdALGDW96KK0x1f2jQZ65P8zi+JOpF/5sacUJ3tWIFqpjQPltPiQg78r+K1HhoFzt1+IKTMCtfmmIKiHpVL4HJA7G6b8SDmk7tbV6t7nknBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L6HCNddo; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L6HCNddo"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so28105145e9.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176723; x=1785781523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fi69UeDJQv2RitmlOYzaOUng+vmp2f9k6Jeo3FaU8d4=;
        b=L6HCNddoi4XBjkO7WCV/Xgk+h3yepk2dVmaeyg0K6TWRjuc01uAMSrYA/8n5Qclxyy
         dYCwK467oB+ZA8xJxXlL1EWV9NMgfdqqZcePS0sHjV/HaKT6ohM8Eo+pU9o0S60W5O7X
         EvLRFFeXKphVRjy6g89wvIk7uwrBIMzh3MMp3mur5hFZC4c2ZtsJJw8CBcwn44fzAnm3
         NBVGPPtDQz+FwXOxSbRZ4kn/KJw2M1q7di+vq4B0JuDyFksiB9yY7qIdRNRKNIe6HxaT
         kPNtA/HiFsKor8gJTeiwBuQpdG9ceG9RPyJZX1qcpuCvRDD0v5I+0y6NLwbokzLeiN6K
         B94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176723; x=1785781523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fi69UeDJQv2RitmlOYzaOUng+vmp2f9k6Jeo3FaU8d4=;
        b=hAaln3Ll2UlRUM9zUpZTE0RrqcwBll/8MAjw+da0vLQPedhvNh2GZ7Q6NY6++u7Vas
         LVm+DiquQOdqN6TcoWoeJQ6cF6vhWvqF0Mj4kzetD9eK2+X75bewUb4ZxAvFjDqC4q35
         Aa0vgwWvs8x7oe14nPdn2SrM03yJAIq2kwpPPw03zDBDg+X4FdcCS62CgWHVX65mXMGe
         pRpb0LOnHbATKoUnrdBKqc/13DqdCV9zPfkqljFnLMXc0f1pefZpoS9qgSJ2XD9HNV4a
         4/qemw1eG2yGgiJZPxkuKEvL49bxmKCEdHWlXQooXIXfqJqOWN0JsvnwWsjGimoa2kAi
         lAsA==
X-Gm-Message-State: AOJu0Yzw8iIu0rkQM/SbPPCWTGfTGvOzR6jKoAZYwCbwwoHnsnrA9IMn
	F9GgkBAP4ZovP9TU2BvfgmES+7nqNv3MO7CN0ue8c+G/n+gUFiAlNXcc
X-Gm-Gg: AR+sD10UZWdFxkhPsJuPX2MzEAxiEoKObKG/qrTshuhE60MVFceRtuiN1Ad92bdY86A
	xWz4Yo4fDzKEwetkAYdjNIR3PCAieP31bT7T1grNBFtua3SYB8l0cpS1EIUsIOJsSbGylpw3Qy2
	T/JQurjGDAccCc4GhvAfqKwnwvwtW28WnxJvRA+etVywCSd1yU9zX9lkxacbiXQ5OtjvmvwacG/
	kee93oL/UJDYlqVrLY0eZSbTTFLdF62R01+HEY6uNoztV5N5rKkps13kuwxzBOxhRLvqBCJUh0R
	xs36at0eQLcpDLdLnBi2+6PMgJZCNnbEGej3fIcZCt6NxAzXqdhgRs5Lm/KVsXKj88eN5PxcYsw
	+uNzzOBvlGI+fSz8+qX6WBU7vFsFm4e3oKqqzaUKk0jqYnKK6EjcmantOTWNzy/vc2WD2c5COyz
	r8bVaghxh/Pbfz
X-Received: by 2002:a05:600c:a4f:b0:493:d741:5d72 with SMTP id 5b1f17b1804b1-496b57116e2mr152292915e9.38.1785176722964;
        Mon, 27 Jul 2026 11:25:22 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:22 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:18 +0300
Subject: [PATCH v8 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-3-7a107b00f1dd@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
In-Reply-To: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, mfd@lists.linux.dev, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8435;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=D0jwRCT6NU4HIEAYKyrwIaJChrW6UBZjDhcNTvtwrZo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6hwQr2nMRpqBcfS3Otf/+QLaWQlxs4dZq1
 cxaOxbKeaeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJ50w/+J+xRydSpL3dX9V6Qpn5wlLkUP/ZifaQ
 Zz3UFP+P6TvtetSFEywmpCDYpvZI97iGrAvKnkm0XIufHTsJ6yDsI5kDkUtXQmr28WIcg3wBg2J
 aBP1p2RX2TYyL6fodT+Ikz+Liu0J1o7/McP3+itKHmTfnMYaOpAf4ygGv06kVhvB2AXN4MyEQxR
 vrNPol04s51TV5gy72w7gZLWdI+eamPVYhDhHMGJBgFHMuKUz7SLF/Mzj6q0OTb1YsBLDjSKe4m
 oYP73iYRbeYAzQjl5AdwA4sP46kd+Beozzqr4vt0zGqK+pfGsQjZb9VjKhfqKnDEWaMs/04Kr1U
 FlRKoPhAllgKkrkTD0IY2S3/DI9uhrMON8rGHdIoKcoxKweV3wug3ezOVkouQnwXzSNalwN5fDn
 ZnkRBCTdz4T4WdAbYgKgjRGGBMXwqeTG5Sgrxc7FpRtXwvOlAnjHr67eHXy7DMMHUKaQsa8O1BC
 uI9O8PR/u/avuPxpuUVHGQ7hsJCtOJknxY6QK+nb3ioE9kZnJ8jEK1STodHU/I/kV3SwbkTAuyk
 gwur0jEZVo0o+34OMmc+VbR6wsV6i0D4/Wwct2U/XTIuMqwaudYnx+bqIsdYfL/UMyaIVbCrF5B
 EzeqzojzUwrAlm42oXIQAdrbGyG/NHzxd+/YS5HH3Umtx5M+aVoA=
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
index 000000000000..cfad0e0372f4
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
+        resets = <&matrixcrm ZX297520V3_LSP_RESET>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index dc2972ade70f..05322672b9b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index a8477e9b2a14..8824740468a3 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -104,4 +104,41 @@
 #define ZX297520V3_SRAM0_PCLK			38
 #define ZX297520V3_GSM_CFG_PCLK			39
 
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
index 4682d4a599c6..69eef84b2f29 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -41,4 +41,23 @@
 #define ZX297520V3_VOU_RESET			9
 #define ZX297520V3_LSP_RESET			10
 
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

