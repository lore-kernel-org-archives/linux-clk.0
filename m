Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77BE2D63E5
	for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790542268; cv=none; b=h9ufjwJMsUgjDoS4fsbOkzYfnkOg9H1NN6PumayClONjxf08VC3IfVsVhu3vKMS6NIuK8gKTTSpuuO3MFtmu36zy48UeerfYovkZXoevNtbccN1jHiw2ccEFqqjegpnKeL3G0UcF1ciDbwWWSSMaOtRTYgT0O+2fgjKO4Fgl2sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790542268; c=relaxed/simple;
	bh=QvrCBO1Yv1uu9lB4VC3C33kwTXsj8pF49PIlS0v8lsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hFvoSvMVHMyt5tXuLYFrJgA4aiZ2PnVwoAMthHE4kPxLGhehdG2Z2pTbVyIoOM1H5beAR7zYqM7RRe5k+L5WXjwiz15vYqEz6yad144NZqi3oN41UCvZCp1g0uHJmcpapanO3ZryoxURolC0dUaUmOEa7/X3a0bt+ZaVcGPeIVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdpMKsWw; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdpMKsWw"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso17015455e9.2
        for <linux-clk@vger.kernel.org>; Sun, 27 Sep 2026 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790542264; x=1791147064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kUYGyZPkzisCXjd18YS32E0k2NnfBv/Du6efJgbaS1U=;
        b=GdpMKsWwoTXEdLD/KME8c7CpTXZnCRueAPj7HXQKiKAx86mhfi6CI/f2KBaAI1rqJR
         UqMTL5EIFtuf64ODKnD7jVQKDYrHntS3KZ5ASyIcqGLYiX69FWTVRRKn6H+XEw7Zr+uZ
         xlLF3+fy/CV7WlliaQ3AG/+Ab4ysQpniQaFVYdTczFjT5rehj2Vo20ytXmNg1QCpAtUq
         5sZIXdMY+//58owsA4tTSrAqF6mSRnwZJ0KTUdH2frAkRrBzYWBqDYoCHa0oHNzRpwh1
         Qv9J15pfen+lDETKVSav4Qvgf8aIFBjPwlphRtazUhOZA1Kjjzsj6s3/HmwV0IEuzkGH
         DgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790542264; x=1791147064;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUYGyZPkzisCXjd18YS32E0k2NnfBv/Du6efJgbaS1U=;
        b=SIPehpEQzifVp6qhkaCbAKl74ZeKOLk/QVtH8BR+MFDbftSOVd5+9rifOMjxXWdyhd
         gUwbfPXGstKQT6JxosWGIcjxHwnm5Nxjy3Y4IlpC0fm9ALQ43n+Cn1Ngz5IeJ1dvebtG
         pv4lguOjHntUIvFpu07FvdDS+Voz16RvUio5W6p0/jUxNa0BX8AOBnXk6Qmp2P7OU+gE
         71OUukv5dnFnq8/VGOLz4vcXhDI9K+WnzY2zXXeN8q8OMxgHOK2S5sLvIAI/fXDDqfWr
         lUcAX3+eAxZx9H3gDQIhMYxJHe3LE9oxYWeE1FE7FzsUKxGvzt0EMCjp4Kl3k5zjQqfg
         sBKw==
X-Gm-Message-State: AFuF++nVwBkAlFas80Qzw/uB23R331se17SK84xOH1DH55UrzsHBUuNX
	oKVp7Nv8jskx6M8cvg9ygGzPlOpoSgcEI+Ok/2pvtkMfOUf5FU3nFNio
X-Gm-Gg: AYBFou3RJxiLTZuysro8pEEZlZOrDKmtroxH/Sw7VlbNKy0M0TtEgqJZ+F3z976Vnjn
	AE41beJbIc26uzjj8WjkANe+fAQodmuRXT0re0cyWfxPkvk7K10GZK0IOXUNhCP/ngFRmIdvItq
	4JbEfBrGU1nYLNOvfwFrlP/J723vMo1VOnn87EKQ63dbFo1uIJ5iDozPBqlzZP+GiUzXTPklMJ4
	ee4NxEKDCmAUS0jWZmmy1xDIez4IaoCcojH2+uir/EqbyovbObZ3nzoyQ77uKXDZwnU3+BOau9z
	9+rk06TdPLLM0dl+lqk5OcoY5fOV7Ss7QUy154hUCxgndbcwixmyAPtPJwBTngBWen/lhWmUBym
	CdLUqe3Dvf6hshZI5ELD1CO7hnHoxQXEPV51Bw5ErkYlouCoaw5qBpZvwCg3R3xrQP9pdsCHLQ+
	WcofsYlbfEkMT9Y4al/BEKDws9Evhcf3IpiLVk/RdCjgUpDOyJfP2O7HDCSvuYrzPJO0NgivHu2
	4Mfeqs=
X-Received: by 2002:a05:600c:4754:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49fe66d1663mr204967735e9.12.1790542263869;
        Sun, 27 Sep 2026 13:51:03 -0700 (PDT)
Received: from strix.doe.home ([197.250.96.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018e6ba2sm88613255e9.5.2026.09.27.13.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:51:03 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Lee Jones <lee@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	mfd@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v13 02/13] dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
Date: Sun, 27 Sep 2026 23:50:55 +0300
Message-ID: <20260927205055.185366-1-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This controller contains clocks and resets for high speed devices on the
zx297520v3 board and hardware spinlocks that I expect will be necessary
to communicate correctly with the LTE DSP firmware blob.

I don't know much about the hwlocks yet other than that they exist, so
there is no header yet adding meaning to their indices. Presumably that
meaning doesn't exist in hardware and is de facto defined by ZTE's
firmware blobs running on the rprocs.

The zte-zx297520v3-crm driver will instantiate separate MFD children for
clocks and resets, which are handled by separate clock and reset
drivers.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

v11->v12: Add RFFE clock. It belongs to the SSC device (ZTE's name, not
mine) and together they are used to set up radio hardware.

Also add LTE_MODEM clocks: I defined them in the driver in version 10
already but forgot to export them. (No, I don't know what this LTE_MODEM
device does. The LTE modem firmware uses it. I found that the pclk gates
mmio address  space 0xf8000000-0xf8300000 and 0xfc000000-0xfc220000 and
that this area is only accessible to M0 and ZSP.

v9->v10:
Add ZSP PCLK and ZSP bus reset. I don't know the exact difference
between the ZSP reset in topcrm+0x13c and the one in matrixcrm+0x3c.
Core state vs axi connection is my best guess. Both need to be
deasserted for the ZSP to work.

Fix order of clock-cells in example code.

v8->v9:
*) The SDIO controllers and GMAC depend on topcrm's ahb clock for
register access / dma operation. Add the input to the binding.

v7->v8:
*) Start clock indices at 0
*) Fix indentation

*) Add a prose note about discovered registers that allow writing
CNTVAL. I am not exposing them in any way because for now I see no need
to use this functionality. It is possible that the counter resets to 0
during standby, which means someone needs to fix it up using those
registers.

Nevertheless, no syscon yet for these reasons: I have no idea how CNTVAL
behaves during standby. It might be just fine. Standby very likely needs
firmware handling running on the Cortex M0, which can restore CNTVAL if
necessary. If Linux needs to do it, it can probably be done by the clock
or MFD parent driver. Given what I've learned so far I'd rather add
syscon later than put it in place without a clear user.

Details of how to manipulate CNTVAL will be in the matrix clk driver.

*) A non-change in the binding text, but worth mentioning: Register
0x118 contains gates that gate off matrix-synthesized PLL fixed
dividers. They reinforce the understanding of the top->matrix interface
and the adequacy of the bindings.

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
 .../clock/zte,zx297520v3-matrixcrm.yaml       | 98 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 .../dt-bindings/clock/zte,zx297520v3-clk.h    | 45 +++++++++
 .../dt-bindings/reset/zte,zx297520v3-reset.h  | 13 +++
 4 files changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..5e9506db7365
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,98 @@
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
+  as the fixed 26 MHz and 32 kHz oscillators found on this board.
+
+  This controller also contains hardware mutex registers for synchronization
+  with different processors on this board.
+
+  An additional curiosity are registers that allow setting (but not reading) the
+  ARM architected timer's CNTVAL. This is not exposed in the binding because
+  there shouldn't be a need to access it.
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
+      - description: 32 kHz external oscillator
+      - description: AHB clock from topcrm
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
+      - const: ahb
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
+        #clock-cells = <1>;
+        clocks = <&osc26m>, <&osc32k>, <&topcrm ZX297520V3_AHB_PCLK>,
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+                 <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GATED_OSC26M>;
+        clock-names = "osc26m", "osc32k", "ahb", "mpll", "mpll-d5", "dpll",
+                      "gpll", "gpll-d2", "wclk-osc26m";
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 43fd556e155b..5f367b5126c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3922,6 +3922,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 1bc9267e4d62..d98bc38635b0 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -69,4 +69,49 @@
 #define ZX297520V3_GSM_156M			60
 #define ZX297520V3_ABB_WCLK			61
 
+#define ZX297520V3_SYS_TIMER_WCLK		0
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_ZSP_PCLK			4
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
+#define ZX297520V3_RFFE_WCLK			21
+#define ZX297520V3_SSC_WCLK			22
+#define ZX297520V3_SSC_PCLK			23
+#define ZX297520V3_AXI_WCLK			24
+#define ZX297520V3_GMAC_WCLK			25
+#define ZX297520V3_GMAC_PCLK			26
+#define ZX297520V3_GMAC_AHB			27
+#define ZX297520V3_VOU_WCLK			28
+#define ZX297520V3_VOU_PCLK			29
+#define ZX297520V3_LSP_MPLL_D5_WCLK		30
+#define ZX297520V3_LSP_MPLL_D4_WCLK		31
+#define ZX297520V3_LSP_MPLL_D6_WCLK		32
+#define ZX297520V3_LSP_MPLL_D8_WCLK		33
+#define ZX297520V3_LSP_MPLL_D12_WCLK		34
+#define ZX297520V3_LSP_OSC26M_WCLK		35
+#define ZX297520V3_LSP_OSC32K_WCLK		36
+#define ZX297520V3_LSP_PCLK			37
+#define ZX297520V3_LSP_TDM_WCLK			38
+#define ZX297520V3_LSP_DPLL_D4_WCLK		39
+#define ZX297520V3_SRAM0_PCLK			40
+#define ZX297520V3_GSM_CFG_PCLK			41
+#define ZX297520V3_LTE_MODEM_WCLK		42
+#define ZX297520V3_LTE_MODEM_PCLK		43
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */
diff --git a/include/dt-bindings/reset/zte,zx297520v3-reset.h b/include/dt-bindings/reset/zte,zx297520v3-reset.h
index 4a0eaec0e981..54e5b24f859a 100644
--- a/include/dt-bindings/reset/zte,zx297520v3-reset.h
+++ b/include/dt-bindings/reset/zte,zx297520v3-reset.h
@@ -27,4 +27,17 @@
 #define ZX297520V3_USB_RESET			18
 #define ZX297520V3_HSIC_RESET			19
 
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_ZSP_BUS_RESET		1
+#define ZX297520V3_DDR_CTRL_RESET		2
+#define ZX297520V3_EDCP_RESET			3
+#define ZX297520V3_SD0_RESET			4
+#define ZX297520V3_SD1_RESET			5
+#define ZX297520V3_NAND_RESET			6
+#define ZX297520V3_PDCFG_RESET			7
+#define ZX297520V3_SSC_RESET			8
+#define ZX297520V3_GMAC_RESET			9
+#define ZX297520V3_VOU_RESET			10
+#define ZX297520V3_LSP_RESET			11
+
 #endif /* __DT_BINDINGS_RESET_ZX297520V3_H */
-- 
2.55.0

