Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA57F432BCF
	for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785176721; cv=none; b=YqecdgrkVYKAyryf9Eyketh9a6xBlm8C+W3vsNBpDCPtQroWc22HpBG3xLQZcWm7quvF2uoRkYMuiyagok2XfI2TfYVUdT0nw+KKZksDi59mDJx1gSWSxX5wC6QrewFT4lZa5KeGEInYhsA5unnVKL0wnUBu+Vz/iL5AF2jUJLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785176721; c=relaxed/simple;
	bh=ffC60u8hIPOmt0qi87H1YYiy/vgKwD1XVNY3q65mPKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4BZ6C6FZYd1J+FvCW7ccDAvCNpc4zHlWCLEV4fkCvd+jfy4lls7xpGCes+OySm1ryJ43bUD4ntVygnEiSkubKHv33UrSYCd87PdLzWZrcKWyj7VjyD9khzQGjhjF0ekMBf6BZjHi5SQi/MsjduHW/kS80YBV8JRctr3eJIa3GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbNIB8qK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbNIB8qK"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f84023916so3026724f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jul 2026 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785176717; x=1785781517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VX6nWC1wuEufJBrXu3pDOZQGxBJekZKOfI95BxKyKd8=;
        b=mbNIB8qKGSTUC3vWFKCprXVrwqn+sPjADISm8cwhInBSSF+RgQt8V+0wJh1X6sGQav
         DO3cO+CxbBUH2+ZIDO5E1OjI2aNOT1TvG9tp4kUY1yRe1B1dtjbuJ13o10bXQeiywK0V
         Lyp9yCZcuBcraP6ijODdRimCMelIixbJvJ/vpQ4cHR1YL/XEnoVyhCqlCwlDZi67H5yB
         ECl/Vkb7IwrUnua+6O6h9bdkHFALfM+dWYpqHkkJN04abFZQnOsFnUeGf3nzG/+63DuW
         aRV9y0TmmOF9RmqQVx7CXkluYulEvVkvDe3Gy/JbtVE6OuSosg5L4hAKWyZEPf+UW5+Q
         sApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785176717; x=1785781517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VX6nWC1wuEufJBrXu3pDOZQGxBJekZKOfI95BxKyKd8=;
        b=abpVqiZdCTxBPFF/HL+cgbK8vUYVtvPHD2Sd0nNOeLAB+k5vh6RNzulkk6XkpUcKB2
         o3u8/JNr6qVGlmSp0zAHnsJZDalD2Ehui9hl68qtH1mMlpClaQL3p0Gh0jyrpovIeNsn
         XmlwYbQqNcHBKJKVZaVzlVl74L6SWMgj5h+gmYPKVZvJCR49WTbi0UtID2YlLvtGDUm5
         pQcZ+ZBswslJqK0j94O31ep8enUAPJq9hGDtAOopw/MDeyTpDMB4z9sayowrNJNyKQeO
         8dmjUsK2t6T9IdfaJLnVP+CNqv9Dj3WS9en0MDjUvu9S6zIJfhLWhnBbciM7B6TqUr6I
         buwQ==
X-Gm-Message-State: AOJu0YyFGJqHIh42Aiw9MdKw4x4FgkvAgJX6Zw4xOL7hMzkXT1rOPwoN
	ZbEnucV8jKLnaxDvhzwwiif/cUnUsvyPOV9MEwumBE/OdJqIaKk+JMzq
X-Gm-Gg: AR+sD12x34ZVoS5w6HYW5QHR2i3WUFinziI8oh768YiUdj3GOm6id71/Ai7TeHlNLjp
	3A0c+DBZDLStiCB7yiB7TI6WNvjw99CdJE8/q39ysekkJxQFU+NB1+WpR48RscGd37qjomewj7G
	QKY/6NgQ/H7Inz7ESle3WE1s23kYWeSKBMnVLXKYZBIPEu+E+p2cBPPpsSw9z1QT4ld7JMkoOx+
	JyRuWXasI4t6aLPUrqx0LXRlkQdwGojdFJboBf7XUrybflrhAh5IQc5/uE9rt061zGQnN5pONRJ
	zVOWMLYp0avNn8zB+rSmFWj7GyoRJAvHk9NYUe67jB2efNZmPK0dYNCH82g9t88tV9FeaI/83Ny
	qBS8DifgHKYotWM6zXQy+j5N9VQub4KfVYbarlJXO4vT9A0ikjiM7rRmqV+zxuZsHG936pRmm/Z
	SBpNtWRzdzT+8O
X-Received: by 2002:a05:6000:2085:b0:47d:eee8:ec40 with SMTP id ffacd0b85a97d-47fafa71ad6mr282587f8f.38.1785176716587;
        Mon, 27 Jul 2026 11:25:16 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm50689288f8f.18.2026.07.27.11.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 11:25:16 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Mon, 27 Jul 2026 21:24:17 +0300
Subject: [PATCH v8 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10162;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=ffC60u8hIPOmt0qi87H1YYiy/vgKwD1XVNY3q65mPKo=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqZ6J6fgllgvIS5kdlgumbT6u1jjVMEtwHptFAo
 K277V+pq4iJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCameiehsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiI5VA/+LSYOfOlmqLLDCXJ2AzNEEdfljAX/Ttt
 hZriRvCGgNEmPuPiN8Rq2ZAHzq3BcGiubY7PrT4MoF6QY5IM8WppO+7qM+lRGl2O7Px4+MIU0gl
 A2UR+tcf+3UIkOI+OVM8tYS/0kyKbP1fNgxMEH7jRg/LJZfqzrnwUrx2HylgEwzufp40SshSHCi
 ZKd6tY+vZGqp+6XsFyZFYT6w9BlafODg+MVLOq7NTVLd9Ixj0VeulWwW/PVbc4PR+eKcx3hzmWt
 Nti+kHCgCG3q3Si6HZXZljfOGXna3ydtqUBnva5nEKzJnvI/pbPfrGK2hTtfexgg149pw6REdT7
 LOorC8aCxfSvid+ys3xCHL5/1aG6A5OR2l9bbJ6huz5xJg6NtyjhN4E/MohoOQ4F6HRu3M+3R0n
 p4enS7SCOVVwB+WMIBKxvhIzzpyONlNbbqXe5JU2p4PwFmz7VhTOevwqMFb8+AfIQ4TddpOnGAg
 r1rwN1jtgggXIzTXy6OouqOF7hgVPHQf7iN346y7NPZ4ANVFczuifW0srPvREeh9OBliSHzbcin
 Pgv83r+SZnKCLwgkWP5+d+tE0YW5S4VUkC1kE/tkavg8vfOE5GLtFsYtYfhFSUmzlEimwtpRpjD
 ZgRMnadSCUSDjw0m96y6+e2XAR+dXdnbXCXwPEazBhUvF3unsD14=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

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

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

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
 .../bindings/clock/zte,zx297520v3-matrixcrm.yaml   | 96 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 include/dt-bindings/clock/zte,zx297520v3-clk.h     | 41 +++++++++
 include/dt-bindings/reset/zte,zx297520v3-reset.h   | 12 +++
 4 files changed, 150 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
new file mode 100644
index 000000000000..d96f9f374447
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
@@ -0,0 +1,96 @@
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
+                 <&topcrm ZX297520V3_MPLL>, <&topcrm ZX297520V3_MPLL_D5>,
+                 <&topcrm ZX297520V3_DPLL>, <&topcrm ZX297520V3_GPLL>,
+                 <&topcrm ZX297520V3_GPLL_D2>,
+                 <&topcrm ZX297520V3_GATED_OSC26M>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll-d5", "dpll", "gpll",
+                      "gpll-d2", "wclk-osc26m";
+        #clock-cells = <1>;
+        #hwlock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 36619a9ff8fc..dc2972ade70f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,6 +3878,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd fixes
 F:	Documentation/arch/arm/zte/
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
 F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
 F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 3aed94ccc26f..a8477e9b2a14 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -63,4 +63,45 @@
 #define ZX297520V3_HSIC_WCLK			54
 #define ZX297520V3_HSIC_PCLK			55
 
+#define ZX297520V3_SYS_TIMER_WCLK		0
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_DDR_CTRL_PCLK		4
+#define ZX297520V3_DDR_CTRL_WCLK		5
+#define ZX297520V3_EDCP_WCLK			6
+#define ZX297520V3_EDCP_PCLK			7
+#define ZX297520V3_SD0_WCLK			8
+#define ZX297520V3_SD0_PCLK			9
+#define ZX297520V3_SD0_CDET			10
+#define ZX297520V3_SD1_WCLK			11
+#define ZX297520V3_SD1_PCLK			12
+#define ZX297520V3_SD1_CDET			13
+#define ZX297520V3_NAND_WCLK			14
+#define ZX297520V3_NAND_PCLK			15
+#define ZX297520V3_DMA_PCLK			16
+#define ZX297520V3_MBOX_PCLK			17
+#define ZX297520V3_PDCFG_WCLK			18
+#define ZX297520V3_PDCFG_PCLK			19
+#define ZX297520V3_SSC_WCLK			20
+#define ZX297520V3_SSC_PCLK			21
+#define ZX297520V3_AXI_WCLK			22
+#define ZX297520V3_GMAC_WCLK			23
+#define ZX297520V3_GMAC_PCLK			24
+#define ZX297520V3_GMAC_AHB			25
+#define ZX297520V3_VOU_WCLK			26
+#define ZX297520V3_VOU_PCLK			27
+#define ZX297520V3_LSP_MPLL_D5_WCLK		28
+#define ZX297520V3_LSP_MPLL_D4_WCLK		29
+#define ZX297520V3_LSP_MPLL_D6_WCLK		30
+#define ZX297520V3_LSP_MPLL_D8_WCLK		31
+#define ZX297520V3_LSP_MPLL_D12_WCLK		32
+#define ZX297520V3_LSP_OSC26M_WCLK		33
+#define ZX297520V3_LSP_OSC32K_WCLK		34
+#define ZX297520V3_LSP_PCLK			35
+#define ZX297520V3_LSP_TDM_WCLK			36
+#define ZX297520V3_LSP_DPLL_D4_WCLK		37
+#define ZX297520V3_SRAM0_PCLK			38
+#define ZX297520V3_GSM_CFG_PCLK			39
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

