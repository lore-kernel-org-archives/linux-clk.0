Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E4C393DDC
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641626; cv=none; b=FcP0Q2GXdJfBc9CMh934UGpByPY2htN9EOBzelFXr3Cbf4AKQ46bjlzbpShVa+RWRVURMJ7Hg+gRIJmSwXNkZNLoEXcH+HsFt7F/SSYYf+3t1Jhqz9p4qQhUQxGnX8Zugp/115ZOi2q0q8nKF5FDPwxQQgNuxny7P6HzhP9jYUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641626; c=relaxed/simple;
	bh=uRtL3tXTNxFSsXIeunxk1WnL31X8l1JDXBwiyONwhLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jDtc7Kk2cKv5pDM994wqHUNYp5V/oM0I54Q6HoEB1oKmZaKki9t6u3eqspkm0D5xEnX8m4MVMA67MDBkk6smCn6mMuA7s7HR6V7Ck+ekTUt7qfccdUbJSdFDw4kLfWHbQPcVRGdwmpAwfQKseior+95gillNzJ2DqatqU1P25gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neWfC2aZ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neWfC2aZ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso2253115e9.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641623; x=1782246423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1Y7VWEFPR+VTtT3NJmqQWRzBo4PZWm5r9ohgpgGtBQ=;
        b=neWfC2aZgrMwuB8RMzxNEqfLRGqUw8YVrLaBf1LyGupbqQ0zhi5XaIRbNiZREN2Aw4
         1ZmES0mECfcx23Hd5Q37JpSHsLMT0eMfGr5XSbwozNzMAFUI6cEleCLocQWDsnX+Kzao
         +UCxQb1xkId3cdFLtTmBQq99zvXAJAmFM6TBXw5/gLY5u5DDXFX1C5PKNBpQGskYRk5C
         vX+uULpkKfSQY3NeZb1vAHfe/9SO07hA3IPUaEpcKXB1QsnKUTKgR7eJIPW/67X6vkXs
         CNSaELz3MVf/cFN1LjPilKxNP8vaLiNcPlRhtFhnUyT5qKM26nOXl/yniouBVuTrDrZa
         lybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641623; x=1782246423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N1Y7VWEFPR+VTtT3NJmqQWRzBo4PZWm5r9ohgpgGtBQ=;
        b=Z/8rvenjZyOftnSCLaI7RiYNcvBLL0WtEMIIW0FJrA9Fv6vbY51cQvr9SePOEp1ktY
         mJaizixUsRoh3GTyusxjXI51A725/Tezeb0MIA/Dgh/eNLNTnbk9Nsw1OrVPCk4ZiiTt
         suqXxSasUqt9fZtWKgfD2pRLVyvy/tqR1AvU2QfixGL2gQOh434p9i8M/IHqffvXA7lf
         rPEbRxb2ZVED4u+ONTJREjl3uie2pdCHf5Be/olIJmMbhiCYFlrotDc/qHUOjxE4/4UP
         oyvErl/t4rrW0RnzmAKXPwrXv2fxP91/vdDPwLX6XJfFYR/0P/ytClXBI130ErqYwLL3
         DBKA==
X-Gm-Message-State: AOJu0YygiqK2m7EkIrRgSATYRnYs76606xrP0Lxr9qSwCzBWmcCzWYfo
	gqZLYkeSPpPtIkWdxqVmGBCgUnFFSggABTqf8p2Fa1dDz4WAtkProvw9
X-Gm-Gg: Acq92OFWXuPpLMnWxbe5z50tEqxL20NPHt6o8tmmBM9r2aVSJH5mdUu8pgmN/vLKOx7
	FYBzcpYd1tmneat5Q/PuwXGPZyNmYfx0amhB1Tc9yuP/J34XKZip4gjP7M6Frdets1emmIu4dN6
	cxmf4oQJ/FTM2f+hJjIoz79Vs2Fg7HQOhw8i4Ewes/jdntMGPe04vSRI6T5pBxFvbcCUlzMj3V/
	JY3w5t0Eqn3pq401xBJCj/w5TzMcdV1kNMOm6A8YzUyAJ19czUIdNG1HAa09zSf3PtYRHJeKRQC
	0s8Ugrui/85ieLq9gSDCxE1eOZQepPZT1ZQVqPsvMEchhpMIeyn6+O5LwYe2PQgwPCm5jG0/Aul
	SvHhhShiqTzA01pYL6Um3MYVSjBOKsCQbu5XEKrfCF7UpJFkYroOWOzm6jQ3TYtMNg4+VTduMuB
	vOshdQ6C6FDsn8RU1UURoONP7UR7SSy77riNY6KpEwApof
X-Received: by 2002:a05:600c:c178:b0:490:c1cb:48f4 with SMTP id 5b1f17b1804b1-492340e76camr3368855e9.12.1781641622717;
        Tue, 16 Jun 2026 13:27:02 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:27:02 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:23 +0300
Subject: [PATCH RFC v4 03/12] dt-bindings: clk: zte: Add zx297520v3 LSP
 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-3-ca994bd22e9d@gmail.com>
References: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
In-Reply-To: <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9172;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=uRtL3tXTNxFSsXIeunxk1WnL31X8l1JDXBwiyONwhLk=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGnvcq6tfQFw4fbpiGVAhHG8grApZMUdDUI
 rdKTTUDY4SJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLy7w//Vn8KOlR9kFU4wiu7vQgPoLA+Jj3qoY4
 reoGxqevBcOKtJql+ac2AaQNrfLncREb7f7rnAVegOpGWpPMxvcQaY5mVjSqAUlCW8wuuSa9ev3
 3qMRCu2eD2UX1zY46nbjLz04qC3mzSmF16yS9NNDBavCZLNUdjDlwpo8bByLihq/C4h9Kjz2eYc
 MG0wNJs+P2pyevflaKATcGtqOA8omDd3K6UkDvTerSisOSPLoNwogBT5qYn7nOIE2ErOuHxCY+6
 OMDyIn8yEVY2jjI0bq3RwhjoLKWlH/tWczF4RueWV4YQFl6TXptPKaDDA+nqEtIXuiB+VJI1ChT
 T4+AurmnAe7WiaWUpDUCGIsFdDDrZjU35G6NZazAPnZkHxNY7YYQHCAOJe525sGQ54ecbZTjsom
 K0Jxr3QneEnDe+U7000SR7YOVazl6LM3NAxBj072N7+JT1XzXR/rkeqV06yNcAyZQBD+mCk0JHm
 ompM/+C6mHQ6ao6Mv4KAhtgByy7WaFA2fEYvpdsQ+37mPttUMxjmA6qka8FwmApZyKvZwHgg9kQ
 GIkI6LZZGoO/Vg6HMxOZMeinL3B9Hi1H/1uFeFUzNGmiCyS8xPeNly3LqEc53an+FCm2IdRm7X4
 9RQirwQhe6s/zq3y/lLE4rC1PGoRLhW1mr8OosRjDbJnMcCXBVdI=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

The clock controller of the Low Speed Peripherals is relatively clean.
One register per device with gates, muxes and resets and for some
devices a divider. There are even bits in the top controller to control
propagation of clock lines down to LSP.

The clocks are sorted by register address and I am convinced that the
device list is complete. There are however a few more registers that are
likely helper controls for the I2S and TDM devices.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Patch changelog:

v5: Order properties compatible->reg->clocks->clock->names->#cells
---
 .../bindings/clock/zte,zx297520v3-lspclk.yaml      | 130 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  56 +++++++++
 2 files changed, 186 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
new file mode 100644
index 000000000000..096295edb6e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-lspclk.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-lspclk.yaml#
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
+  devices. The clock controller is responsible for bringing the devices out of
+  reset and enabling their clocks as needed.
+
+  The controller receives its clock signal from the matrix controller and need
+  to be declared as clock inputs.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    const: zte,zx297520v3-lspclk
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Main PLL divided by 5 output from matrixclk (124.8 MHz)
+      - description: Main PLL divided by 4 output from matrixclk (156 MHz)
+      - description: Main PLL divided by 6 output from matrixclk (104 MHz)
+      - description: Main PLL divided by 8 output from matrixclk (78 MHz)
+      - description: Main PLL divided by 12 output from matrixclk (52 MHz)
+      - description: Main oscillator output from matrixclk (26 MHz)
+      - description: Timer oscillator output from matrixclk (32 KHz)
+      - description: LSP pclk output from matrixclk (26 MHz)
+      - description: TDM wclk mux output from matrixclk
+      - description: DPLL divided by 4 output from matrixclk (122.88 MHz)
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
+
+    matrixclk: clock-controller@1306000 {
+        compatible = "zte,zx297520v3-matrixclk", "syscon";
+        reg = <0x01306000 0x400>;
+        clocks = <&osc26m>, <&osc32k>,
+                 <&topclk ZX297520V3_MPLL>, <&topclk ZX297520V3_MPLL_D2>,
+                 <&topclk ZX297520V3_MPLL_D3>, <&topclk ZX297520V3_MPLL_D4>,
+                 <&topclk ZX297520V3_MPLL_D5>, <&topclk ZX297520V3_MPLL_D6>,
+                 <&topclk ZX297520V3_MPLL_D8>, <&topclk ZX297520V3_MPLL_D12>,
+                 <&topclk ZX297520V3_MPLL_D16>, <&topclk ZX297520V3_MPLL_D26>,
+                 <&topclk ZX297520V3_UPLL>, <&topclk ZX297520V3_UPLL_D2>,
+                 <&topclk ZX297520V3_UPLL_D3>, <&topclk ZX297520V3_UPLL_D4>,
+                 <&topclk ZX297520V3_UPLL_D5>, <&topclk ZX297520V3_UPLL_D6>,
+                 <&topclk ZX297520V3_UPLL_D8>, <&topclk ZX297520V3_UPLL_D12>,
+                 <&topclk ZX297520V3_UPLL_D16>,
+                 <&topclk ZX297520V3_DPLL>, <&topclk ZX297520V3_DPLL_D2>,
+                 <&topclk ZX297520V3_DPLL_D3>, <&topclk ZX297520V3_DPLL_D4>,
+                 <&topclk ZX297520V3_DPLL_D5>, <&topclk ZX297520V3_DPLL_D6>,
+                 <&topclk ZX297520V3_DPLL_D8>, <&topclk ZX297520V3_DPLL_D12>,
+                 <&topclk ZX297520V3_DPLL_D16>,
+                 <&topclk ZX297520V3_GPLL>, <&topclk ZX297520V3_GPLL_D2>,
+                 <&topclk ZX297520V3_GPLL_D3>, <&topclk ZX297520V3_GPLL_D4>,
+                 <&topclk ZX297520V3_GPLL_D5>, <&topclk ZX297520V3_GPLL_D6>,
+                 <&topclk ZX297520V3_GPLL_D8>, <&topclk ZX297520V3_GPLL_D12>,
+                 <&topclk ZX297520V3_GPLL_D16>;
+        clock-names = "osc26m", "osc32k", "mpll", "mpll_d2", "mpll_d3",
+                      "mpll_d4", "mpll_d5", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "mpll_d16", "mpll_d26", "upll", "upll_d2", "upll_d3",
+                      "upll_d4", "upll_d5", "upll_d6", "upll_d8", "upll_d12",
+                      "upll_d16", "dpll", "dpll_d2", "dpll_d3", "dpll_d4",
+                      "dpll_d5", "dpll_d6", "dpll_d8", "dpll_d12", "dpll_d16",
+                      "gpll", "gpll_d2", "gpll_d3", "gpll_d4", "gpll_d5",
+                      "gpll_d6", "gpll_d8", "gpll_d12", "gpll_d16";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    clock-controller@1400000 {
+        compatible = "zte,zx297520v3-lspclk";
+        reg = <0x01400000 0x100>;
+        clocks = <&matrixclk ZX297520V3_LSP_MPLL_D5_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D4_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D6_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D8_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_MPLL_D12_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_OSC26M_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_OSC32K_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_PCLK>,
+                 <&matrixclk ZX297520V3_LSP_TDM_WCLK>,
+                 <&matrixclk ZX297520V3_LSP_DPLL_D4_WCLK>;
+        clock-names = "mpll_d5", "mpll_d4", "mpll_d6", "mpll_d8", "mpll_d12",
+                      "osc26m", "osc32k", "pclk", "tdm_wclk", "dpll_d4";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index 815e8ceeb64e..57387529a708 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -160,4 +160,60 @@
 #define ZX297520V3_GMAC_RESET			7
 #define ZX297520V3_VOU_RESET			8
 
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
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0

