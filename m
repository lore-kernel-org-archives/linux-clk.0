Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E1F3C871E
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 21:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784237766; cv=none; b=CEtyzCnXkU7gP/nRSq1l4pJAp1A61WbrkqyS44I9trGPOYkbxce0sc7pIbOqlGk1z4hs9VxT24m4uDtG3dj+dzVodpH4k7zlFlLxrHXvS5X+4fqtuR2yorSRTFrOnIHkdnmYslv6Se7Yy6FoaymJmei1WDr+oH3LVYWyDQofAgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784237766; c=relaxed/simple;
	bh=Jx+q10fDqymoLmvzemEkN3kNUvh3kYeIHQr2ES223+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G6s1hCsgM2SUAhATyspFmdUSrME7Rw1V4WPSFuKcoerAhopmWmUaNBhUu1XpalVB8xHpolmqPJTyakm/6MSPOKeskqljAB4mEfac6B/Q/UJdkViEnRIfY6wvC3AOu7iq0Aha7uXneyOBpXn6NtTzKFp6o8F2/UUUBGTOW9KISXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzrN/xLY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzrN/xLY"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3359920f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 14:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784237763; x=1784842563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=km69BcPb9PrPYwpxcKjbK1SQK4wWTF79y2vSAA6YjyE=;
        b=fzrN/xLYmWLpWAqtMxsoHsGUPIw82SdTGdmhWNJwP9TCQO5DBPxfpeBpjNXaSjhFaV
         3F3OiA/VHDHrw8I5tSPg3vtYjGlX+mK09GVVMuwCIg2myzwUo81XzD23bIaUArhmzYz5
         fWwcNMgyh5tqw5c1IAjjKrorvSAQ+jLNJ3pdqMaINv7z47Wf7DulVKf3BXyUHb1hQelW
         dOGq93C9yMXA9RYrLlvT/Vrm6ET1PRbWZkhSa/aYkHxXfTr9nARs7OSNKo6FXf6/wBKK
         9h5hGnCVBvQO138r8MiiCll/VSSwSxAfwy8iUGbDzn8i1gdkz7Z+P9sY8OtcxYTZp0U+
         /Z+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784237763; x=1784842563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=km69BcPb9PrPYwpxcKjbK1SQK4wWTF79y2vSAA6YjyE=;
        b=ooWRM2oeMgloPP9fBceg3WXeZkYuTeioZKzXSLYCHseP8eRVWIGhyxGwt54W74omda
         NYYWOOisPz69CP95EeYUUMLAz4ERspxG5C1jYHmgKwpyAc0x5+A0LN8xb5Wij9pY2y7V
         e9WDOKqjCI+JDHp8HCM3ceEiPdJklIONmjpuETDGWjTYNhqCHdH+0LyhgdAS7sgy168Z
         ohxBdUdah72LtmM7JpeeTz6l9X48C1cH3uSP1C82TM6+AofWEYCpPRZzIFlA2EPQUtwZ
         h+gsAYblSc7SM4Vhbf6RQ04/uS9+L21ihBeBPKaTT0m+X5Il/RnThjr01vCX1f7sjagk
         q5pg==
X-Gm-Message-State: AOJu0YxziMQjsQQCMVPLmdgGz83y3geBkxrFVL0yYEBR3S9V7nB9hVSj
	/vWXQEEj8TU4ss272tA2+nfFvkTnJU6Bm5Yi1876rMbnH9vnluy1gUQa
X-Gm-Gg: AfdE7cmYqV48hmcmuYjrGhCiMrExZPX3A3Zmd4HsDrwbexoIuwU9PK3wvW9X3KXwUaw
	qEJObIfM1Tk2Ul/sLjZ70iSr3y2ilm6/0sQobLSxluKCpps6BX6b9XLn3FQQGT00aWkRi38Tbdb
	Fqu3ovme3dV4tXEx2WdCC5qxOVap4wZXu+CYHY7WwpyBHa9mV7eBxznse7H+8tW05uVUOv/7yg3
	PO1AmW+yW4ky+psYdSbUY8Pbjh1Z1U8SqR3+indl6lKh4wOqOYntiXlUDB46bZpN3X8BWLVdchQ
	OqAbzkN8/OJfHnjPWhd8S4PSZFnba7KcsLNgaAY7YQ6w2evvFz4ZE0Ou0s2gLzTkgOxlIE3LTFD
	AKtehVSo3MsrafFEzEi081l2hsZEpQoZzeFLZPstH6yVFvW9bV5spiHSC/soaX8VzwjnBvnYPyU
	kuEA3BiFLciAbg
X-Received: by 2002:a05:6000:2dc5:b0:46e:1815:6a83 with SMTP id ffacd0b85a97d-47f6088b5b9mr937456f8f.29.1784237762829;
        Thu, 16 Jul 2026 14:36:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7f09sm27517548f8f.26.2026.07.16.14.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:36:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Fri, 17 Jul 2026 00:35:39 +0300
Subject: [PATCH v7 03/13] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-zx29clk-v7-3-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8790;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=Jx+q10fDqymoLmvzemEkN3kNUvh3kYeIHQr2ES223+g=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqWU6xSu2gSqcQRCgsE8V5zhgmhe0wndVU/WgoJ
 ANDD4JiUaeJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCallOsRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIwXA/+KYHZ8ptN2bw+UZR9Yer1+hLy2/sJDWT
 CEnLCWXpqFR/qgGkKF4SFm6/FZZCAWG9Q4oMQJrcGwoUT73Zf2FcS55Rl906tGy2E9kh0puDVaB
 U9VgTxxiJUqgXBYjfLLroDtpQyu9ivI3ZJl2lOaYA/s8aTtehrU01XLF1ETwWQXQ/Tnpyx44HYE
 YNIeFcBOaUggHxoy3r7mVWFCVRYoSUpRHCRIPHXJavx5ErzI4IsJF3GJIbTjkQmfSS9H8MQm1EQ
 WmByUfTpo1G44tnEnAGO2dF+9rN+RlhHO6XSBo4HBXx8Z3p5pFZnCa6c07IoACqhsF2XE3Zj9cs
 TtM6JQj1vqjsW4xA/cavll9fakpJNpL8PJ/lqg4lnA2Ikz+XVazyK6ftzfvu2xS4W4JW+jVnxD8
 aVD+WdCV8QSkxEbOwzvmSwyvFmoNJkqgxKY66ZZ1yvRNAZOVJFEiuHmMt+yvhZQsbSETdQG5zxD
 /vHh5GYCMYKQWKc6VmxvsN9/LVWMVXcRZ/Ze10GRcmaJKiTm1RcepQ3TqDwgAo2TyToLXmBkj9V
 bbRV5av40oZiHXrn26bgNLa2s5RnVXzMHmjZ2YlbiiEMBvHIBYY0Y3fAQc27E10wEgqmpRtkEFy
 Lp1P6AAsn9GS+H+MEtz3clrHZ5Xh5WbC28vJy9+TWU0P2CMs92X4=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This controller contains clocks and resets for high speed devices on the
zx297520v3 board and hardware spinlocks that I expect will be necessary
to communicate correctly with the LTE DSP firmware blob.

I don't know much about the hwlocks yet other than that they exist, so
there is no header yet adding meaning to their indices. Presumably that
meaning doesn't exist in hardware and is de facto defined by ZTE's
firmware blobs running on the rprocs.

A simple MFD driver will instantiate independent clock, reset and hwlock
drivers.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

v6->v7:

*) Moved it back to clock/

*) Remove syscon compatible again. I looked into remaining unknown
registers and I am convinced that there is no odd misc register left
that can't be exposed as a proper subsystem provider.

The controls in 0x100 that ZTE's DRAM reading code exercises are auto
clock gating controls and the actual mailbox is in a different
controller.

Unknown registers in 0x120-0x12c are a frequency voting mechanism for
the AXI bus clock. The driver will participate in that voting rather
than set the frequency via 0x0. If need be it could be exposed
as #interconnect-cells, but it won't necessitate "syscon".

*) Reduce the number of input clocks to match register controls in
topclk's input control that affect matrix and LSP.

*) Add DDR mux and gates. Not to change them, but to make sure CCF knows
about which PLL is feeding the sysmem memory

Changes
v5->v6:
Add syscon compatible - Conor suggested this after v4 and I forgot it in v5.

v4->v5:
Move binding to soc/zte
Remove topclk from the example
Add #hwlock-cells for hw spinlock registers
Add more clocks I stumbled into: sram0 and another LTE related device

v3->v4:
Split matrixclk into its own controller again because syscon/regmap
deals poorly with device nodes that have more than one memory region. As
a consequence I am passing all PLL outputs generated on Topclk down to
Matrixclk.
---
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   | 91 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 41 ++++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 12 +++
 4 files changed, 145 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..55b1a42836c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-matrixcrm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC matrix clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller contains clock and reset controls for high speed devices on
+  the zx297520v3 board: The CPU, RAM, SDIO and Ethernet clocks and resets are
+  found here. This controller requires PLL-generated clocks from Topcrm as well
+  as the fixed 26 MHz and 32 KHz oscillators found on this board.
+
+  This controller also contains hardware mutex registers for synchronization
+  with different processors on this board.
+
+  All available clocks are defined as preprocessor macros in the
+  "include/dt-bindings/clock/zte,zx297520v3-clk.h" header. Resets are defined in
+  the "include/dt-bindings/reset/zte,zx297520v3-reset.h" header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-matrixcrm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 KHz external oscillator
+      - description: Main PLL output from topcrm (usually 624 MHz)
+      - description: Main PLL subdivision factor 5
+      - description: Dpll output from topcrm (usually 491.52 MHz)
+      - description: Gpll output from topcrm (usually 200 MHz)
+      - description: Gpll subdivision factor 2
+      - description: osc26m work clock from topcrm
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+      - const: mpll
+      - const: mpll-d5
+      - const: dpll
+      - const: gpll
+      - const: gpll-d2
+      - const: wclk-osc26m
+
+  "#clock-cells":
+    const: 1
+
+  "#hwlock-cells":
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
+  - "#clock-cells"
+  - "#hwlock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
+    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
+
+    clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixcrm";
+        reg = <0x01306000 0x400>;
+        clocks = <&osc26m>, <&osc32k>,
+          <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+          <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+          <&topcrm ZX297520V3_GPLL_D2>, <&topcrm ZX297520V3_GATED_OSC26M>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll-d5", "dpll",
+          "gpll", "gpll-d2", "wclk-osc26m";
+        #clock-cells = <1>;
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f962b9947ab..6d153d2cba79 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
 F:	arch/arm/boot/dts/zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 1f010ff4e6ca..09ee3de679d9 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -63,4 +63,45 @@
 #define ZX297520V3_HSIC_WCLK			55
 #define ZX297520V3_HSIC_PCLK			56
 
+#define ZX297520V3_SYS_TIMER_WCLK		1
+#define ZX297520V3_CPU_WCLK			2
+#define ZX297520V3_CPU_PCLK			3
+#define ZX297520V3_ZSP_WCLK			4
+#define ZX297520V3_DDR_CTRL_PCLK		5
+#define ZX297520V3_DDR_CTRL_WCLK		6
+#define ZX297520V3_EDCP_WCLK			7
+#define ZX297520V3_EDCP_PCLK			8
+#define ZX297520V3_SD0_WCLK			9
+#define ZX297520V3_SD0_PCLK			10
+#define ZX297520V3_SD0_CDET			11
+#define ZX297520V3_SD1_WCLK			12
+#define ZX297520V3_SD1_PCLK			13
+#define ZX297520V3_SD1_CDET			14
+#define ZX297520V3_NAND_WCLK			15
+#define ZX297520V3_NAND_PCLK			16
+#define ZX297520V3_DMA_PCLK			17
+#define ZX297520V3_MBOX_PCLK			18
+#define ZX297520V3_PDCFG_WCLK			19
+#define ZX297520V3_PDCFG_PCLK			20
+#define ZX297520V3_SSC_WCLK			21
+#define ZX297520V3_SSC_PCLK			22
+#define ZX297520V3_AXI_WCLK			23
+#define ZX297520V3_GMAC_WCLK			24
+#define ZX297520V3_GMAC_PCLK			25
+#define ZX297520V3_GMAC_AHB			26
+#define ZX297520V3_VOU_WCLK			27
+#define ZX297520V3_VOU_PCLK			28
+#define ZX297520V3_LSP_MPLL_D5_WCLK		29
+#define ZX297520V3_LSP_MPLL_D4_WCLK		30
+#define ZX297520V3_LSP_MPLL_D6_WCLK		31
+#define ZX297520V3_LSP_MPLL_D8_WCLK		32
+#define ZX297520V3_LSP_MPLL_D12_WCLK		33
+#define ZX297520V3_LSP_OSC26M_WCLK		34
+#define ZX297520V3_LSP_OSC32K_WCLK		35
+#define ZX297520V3_LSP_PCLK			36
+#define ZX297520V3_LSP_TDM_WCLK			37
+#define ZX297520V3_LSP_DPLL_D4_WCLK		38
+#define ZX297520V3_SRAM0_PCLK			39
+#define ZX297520V3_GSM_CFG_PCLK			40
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 43db72bb59de..4682d4a599c6 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -29,4 +29,16 @@
 #define ZX297520V3_HSIC_PHY_RESET		20
 #define ZX297520V3_HSIC_RESET			21
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_DDR_CTRL_RESET		1
+#define ZX297520V3_EDCP_RESET			2
+#define ZX297520V3_SD0_RESET			3
+#define ZX297520V3_SD1_RESET			4
+#define ZX297520V3_NAND_RESET			5
+#define ZX297520V3_PDCFG_RESET			6
+#define ZX297520V3_SSC_RESET			7
+#define ZX297520V3_GMAC_RESET			8
+#define ZX297520V3_VOU_RESET			9
+#define ZX297520V3_LSP_RESET			10
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */

-- 
2.54.0

