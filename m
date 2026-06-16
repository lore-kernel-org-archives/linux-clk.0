Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94DF38B14C
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 20:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641622; cv=none; b=beDbE29ZfInaN8Sj5BROydYKIjZcQMAKZVD5fbcfOSzF8THbdGla+ugtzpQnWGklWZXtN8T1jXRDo9ZVUKpDOvnf+1r66FyLHftTAgc6VdK1PFoxrKpitkxGg3qQRnOzbqxykjW56WJHaZwfRknO1fpzIJH5UzmtXtzwb87G4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641622; c=relaxed/simple;
	bh=5Z4ESOVeKBRM0YFOt39SoxPXZhq0x1sOAoH1jrCCjuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfP/Di5EMT8Xg3zdXVd0wAg1Y0CMrXLex+bCCxEKDo+p++y1CNZoJD9x2ZAmJ64NCnUAvfjEhu4dF0BoiPH9vSKdBiMKVUkePTzDa94HZgALSU0B4qtxOtak9d9UWiEdUlUbGqGIYj1hNcXUlNnViuMKe3LfijRIA+hngO8w+Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4V2bA3P; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4V2bA3P"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso33130485e9.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781641619; x=1782246419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yt9uNKNQQM+kBZ7grL85coaaAADfms7lZW+K+UY64U=;
        b=k4V2bA3PsVjMwsLDb3QE2rGFas2X6St3ZFv1FzgTdp0d2/ZxnZRD4Q3Wv1te2+YNY5
         3flKdtbmO7jTBLrOj6GKv1vnRZe+H7B7yE65qVL/mAwAkh6UHj+e9HD4fgMbNPrk+tvY
         IL0I8aadG/2L93VfBSa4Wjp6fS5H+p38KYUS1myjXl6GgzDYQ9xrwrMDmllCbyS5cKay
         JB79KTzxaRmwebYEH3Ci360+fBC9cHcnSZP4PkVhQ4Ef6Tz95z4Keh7leIUepjybocjR
         ZzcuFeTpJIX1iarhsqm/DbN4fbAxn4TU1Ajqsuuz1ipxqIb2fSnrg+NpJJO2O2vJ+Nf8
         CEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641619; x=1782246419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7yt9uNKNQQM+kBZ7grL85coaaAADfms7lZW+K+UY64U=;
        b=kIl/DlpzGdotpODj4Kbp8AOFtI7S7c0bRp5/zczLobMplSLcbUdsR+kHHXyQixjP/l
         lmpOiko2G5Qsb2J5sH96xwAEVnegOnaHwhXf4qEZkwqrS6Ffs1Rv4n0SEcvqCnZoZgRx
         FEyY7sYAedAiU6iulzY63D2ALcMAQDu3zeiRpTZhHladxrxSH5fXRSTHR93EEK8WoLKj
         n5gYvp8LvyOxxTGmgLuXaiUHH9s7Fm8kG4Nj6fGtsc4HmGSJZFLiVy5LwMiKExpgc9v2
         cc0nH58z3tPX9sFqTnExern8MlotW6uWDMFLN2S8pwM141OcL5n1+XRPEpSWR0PnY1Yg
         OiqA==
X-Gm-Message-State: AOJu0YzsnvMDhyd/oUactQsWZo1VH2imiaqBodfqk1ZA6d8vHvbWlSxI
	z3hQxAXQn240+yn7356dg9AIJISpkZqa8Z0Ep9RWKk/kwCHSqxkJfxeG
X-Gm-Gg: Acq92OG1znx/OW0Aqjh0WN1phwMBo9w80dJr4Zm/6l/iy8cm0vYZOeLFM9L7eQwie47
	1HyLf+latImj/mtO0CaAQRJ/3nPQOvIRUVDi7r5V4iPquCiHeTUhDPopWMr2ygn72QJEsjn92aa
	gd323zCPV3wFHF2tMamybPSeHABJMZPPCF/YpHVz9cFog9R1+4riqIHwapjF0n2DgrWe5iHXY7+
	D4FLuvMnDnsRGgmumkYzgOvnHfgcRfENo7tbWkyOJnQ4N/ie7wJr3zFN09ap3otZ12CNQ8IPtki
	is4P3kdC4wsh6nB2oFI8V2vU9bNSC09KH4b/ouCPjdwelN1rhNExRwNxihsjJsaZH4mmanQOyxL
	cUooJShOuFPKmG+8aBxZZk8wauY0agtI1i9aal2zljnqMWRpTN6tagVK/vAedIYjWycGaTyzItk
	WD2Xn8x1Er+xe5euHXRCVAOJwUAVhCSMjhEw==
X-Received: by 2002:a05:600c:4ec6:b0:490:c2a3:3303 with SMTP id 5b1f17b1804b1-49233430b4dmr14621755e9.34.1781641618726;
        Tue, 16 Jun 2026 13:26:58 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a458f2sm89987005e9.3.2026.06.16.13.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 13:26:58 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Tue, 16 Jun 2026 23:26:22 +0300
Subject: [PATCH RFC v4 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset bindings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260616-zx29clk-v4-2-ca994bd22e9d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10152;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=5Z4ESOVeKBRM0YFOt39SoxPXZhq0x1sOAoH1jrCCjuQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqMbGGZ3Pvb1vAq2QAxdCQPA8eAkCflR7CQUt1b
 bR1Tnva0UuJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCajGxhhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiIDkw/9EcbUbRCCHOEqijrZntbfrjBdM3qtngx
 A9apGk3oJQpChnZrsYoCBhDM96phrgdola5U1Hi8wnyMKDe2H9dwdlRUmttVQRTdT++PMBvNhop
 CU/F7bcY4oxRCI4mJxYx+rPcVn0bt8EbNDFk21cEVT+MFbSLj0xWeldYxRVQOWi9E9E3IqeOy0D
 vx9SbWI4WX7T8AtN/Ao2d7kQGqIkvZlK1cr1myjCULarE2VjxZwe/89tMWjElRtvSEeEk3C8xYJ
 qIlTd0BArhtPwfvqKKs5Mbk54ExKvNyL9Xam70zXAUcRhExuAkiVotn8+8j76E91hzO7FLqiKhC
 LKny5xHEw35WZ6M68D2G3pncDExnvDJtahbLvNFWbD7XDAjqd3j57HZDvggkH+f1hVrP1Pjk6ic
 rk8tS6OvVxoktiVwNi/ihjEutXTGJ4GKkpsbiMD803fc5H9g8a0cVFFVyMitPCphFszx2rgH+Cs
 XCG1w4BjEogN7qKk2d4hMvSQMYbRQ/KqwZtoZldwp5qFC9plkc9PcBSwz1SBS56eqOyMFWX00Yv
 rgIA7ooSt0DMlcxRQv+9Pm6derKpubHqgi7Rm+dEpmcQjBKWjaXj27UulXfT58OVSpUJTsIPCqn
 5OFFnU5E+Ce6sptyO5Ejabyh/yppJFjlOpbO7ybk6Jm6OWbNFSnM=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

I split matrixclk into its own controller again because syscon/regmap
deals poorly with device nodes that have more than one memory region. As
a consequence I am passing all PLL outputs generated on Topclk down to
Matrixclk.

The syscon is used to generate the regmap shared between the clock and
auxiliary reset drivers. The register space also contains at least one
extra block of functionality, hardware spinlocks, that I expect will be
necessary to communicate correctly with the LTE DSP firmware blob.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 .../bindings/clock/zte,zx297520v3-matrixclk.yaml   | 180 +++++++++++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h     |  45 ++++++
 2 files changed, 225 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixclk.yaml b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixclk.yaml
new file mode 100644
index 000000000000..4363ed9be76f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixclk.yaml
@@ -0,0 +1,180 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/zte,zx297520v3-matrixclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx297520v3 SoC matrix clock and reset controller
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+description: |
+  This controller controls high speed devices on the zx297520v3 board: The CPU,
+  RAM, SDIO and Ethernet clocks and resets are found here. This controller
+  requires PLL-generated clocks from Topclk as well as the fixed 26 MHz and 32
+  KHz oscillators found on this board.
+
+  Other helper controls are found on this hardware too: It contains a mailbox
+  interface to read RAM properties and hardware spinlock registers.
+
+  All available clocks are defined as preprocessor macros in the
+  'dt-bindings/clock/zte,zx297520v3-clk.h' header.
+
+properties:
+  compatible:
+    items:
+      - const: zte,zx297520v3-matrixclk
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: 26 MHz external oscillator
+      - description: 32 KHz external oscillator
+      - description: Main PLL output from topclk (usually 624 MHz)
+      - description: Main PLL subdivision factor 2
+      - description: Main PLL subdivision factor 3
+      - description: Main PLL subdivision factor 4
+      - description: Main PLL subdivision factor 5
+      - description: Main PLL subdivision factor 6
+      - description: Main PLL subdivision factor 8
+      - description: Main PLL subdivision factor 12
+      - description: Main PLL subdivision factor 16
+      - description: Main PLL subdivision factor 26
+      - description: Upll output from topclk (Usually 480 MHz)
+      - description: Upll subdivision factor 2
+      - description: Upll subdivision factor 3
+      - description: Upll subdivision factor 4
+      - description: Upll subdivision factor 5
+      - description: Upll subdivision factor 6
+      - description: Upll subdivision factor 8
+      - description: Upll subdivision factor 12
+      - description: Upll subdivision factor 16
+      - description: Dpll output from topclk (usually 492.88 MHz)
+      - description: Dpll subdivision factor 2
+      - description: Dpll subdivision factor 3
+      - description: Dpll subdivision factor 4
+      - description: Dpll subdivision factor 5
+      - description: Dpll subdivision factor 6
+      - description: Dpll subdivision factor 8
+      - description: Dpll subdivision factor 12
+      - description: Dpll subdivision factor 16
+      - description: Gpll output from topclk (usually 200 MHz)
+      - description: Gpll subdivision factor 2
+      - description: Gpll subdivision factor 3
+      - description: Gpll subdivision factor 4
+      - description: Gpll subdivision factor 5
+      - description: Gpll subdivision factor 6
+      - description: Gpll subdivision factor 8
+      - description: Gpll subdivision factor 12
+      - description: Gpll subdivision factor 16
+
+  clock-names:
+    items:
+      - const: osc26m
+      - const: osc32k
+      - const: mpll
+      - const: mpll_d2
+      - const: mpll_d3
+      - const: mpll_d4
+      - const: mpll_d5
+      - const: mpll_d6
+      - const: mpll_d8
+      - const: mpll_d12
+      - const: mpll_d16
+      - const: mpll_d26
+      - const: upll
+      - const: upll_d2
+      - const: upll_d3
+      - const: upll_d4
+      - const: upll_d5
+      - const: upll_d6
+      - const: upll_d8
+      - const: upll_d12
+      - const: upll_d16
+      - const: dpll
+      - const: dpll_d2
+      - const: dpll_d3
+      - const: dpll_d4
+      - const: dpll_d5
+      - const: dpll_d6
+      - const: dpll_d8
+      - const: dpll_d12
+      - const: dpll_d16
+      - const: gpll
+      - const: gpll_d2
+      - const: gpll_d3
+      - const: gpll_d4
+      - const: gpll_d5
+      - const: gpll_d6
+      - const: gpll_d8
+      - const: gpll_d12
+      - const: gpll_d16
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
+    topclk: clock-controller@13b000 {
+        compatible = "zte,zx297520v3-topclk", "syscon";
+        reg = <0x0013b000 0x400>;
+        clocks = <&osc26m>, <&osc32k>;
+        clock-names = "osc26m", "osc32k";
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+
+    clock-controller@1306000 {
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
diff --git a/include/dt-bindings/clock/zte,zx297520v3-clk.h b/include/dt-bindings/clock/zte,zx297520v3-clk.h
index cf436ff20dfe..815e8ceeb64e 100644
--- a/include/dt-bindings/clock/zte,zx297520v3-clk.h
+++ b/include/dt-bindings/clock/zte,zx297520v3-clk.h
@@ -115,4 +115,49 @@
 #define ZX297520V3_USB_RESET			18
 #define ZX297520V3_HSIC_RESET			19
 
+#define ZX297520V3_CPU_WCLK			1
+#define ZX297520V3_CPU_PCLK			2
+#define ZX297520V3_ZSP_WCLK			3
+#define ZX297520V3_EDCP_WCLK			4
+#define ZX297520V3_EDCP_PCLK			5
+#define ZX297520V3_SD0_WCLK			6
+#define ZX297520V3_SD0_PCLK			7
+#define ZX297520V3_SD0_CDET			8
+#define ZX297520V3_SD1_WCLK			9
+#define ZX297520V3_SD1_PCLK			10
+#define ZX297520V3_SD1_CDET			11
+#define ZX297520V3_NAND_WCLK			12
+#define ZX297520V3_NAND_PCLK			13
+#define ZX297520V3_DMA_PCLK			14
+#define ZX297520V3_MBOX_PCLK			15
+#define ZX297520V3_PDCFG_WCLK			16
+#define ZX297520V3_PDCFG_PCLK			17
+#define ZX297520V3_SSC_WCLK			18
+#define ZX297520V3_SSC_PCLK			19
+#define ZX297520V3_GMAC_WCLK			20
+#define ZX297520V3_GMAC_PCLK			21
+#define ZX297520V3_GMAC_AHB			22
+#define ZX297520V3_VOU_WCLK			23
+#define ZX297520V3_VOU_PCLK			24
+#define ZX297520V3_LSP_MPLL_D5_WCLK		25
+#define ZX297520V3_LSP_MPLL_D4_WCLK		26
+#define ZX297520V3_LSP_MPLL_D6_WCLK		27
+#define ZX297520V3_LSP_MPLL_D8_WCLK		28
+#define ZX297520V3_LSP_MPLL_D12_WCLK		29
+#define ZX297520V3_LSP_OSC26M_WCLK		30
+#define ZX297520V3_LSP_OSC32K_WCLK		31
+#define ZX297520V3_LSP_PCLK			32
+#define ZX297520V3_LSP_TDM_WCLK			33
+#define ZX297520V3_LSP_DPLL_D4_WCLK		34
+
+#define ZX297520V3_CPU_RESET			0
+#define ZX297520V3_EDCP_RESET			1
+#define ZX297520V3_SD0_RESET			2
+#define ZX297520V3_SD1_RESET			3
+#define ZX297520V3_NAND_RESET			4
+#define ZX297520V3_PDCFG_RESET			5
+#define ZX297520V3_SSC_RESET			6
+#define ZX297520V3_GMAC_RESET			7
+#define ZX297520V3_VOU_RESET			8
+
 #endif /* __DT_BINDINGS_CLOCK_ZX297520V3_H */

-- 
2.53.0

