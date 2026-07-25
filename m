Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC0131E85E
	for <linux-clk@vger.kernel.org>; Sat, 25 Jul 2026 03:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949563; cv=none; b=HhCQAo3MUAvZngZsXNsLTMpFdkTcCC90EA0/qAmFPdhly6RH7mtHyiDhpNWcxNbXgB4pOndQP3m3Ml+azMGlpNhfHRE0V6TAazdksej+9RgfFZBEBsPn+cp62VR8KxfZ52R9Jq751GRHk3UrceRZoS1UntW3ogEFWtKlH6mO1gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949563; c=relaxed/simple;
	bh=Grthmsr7K7t1VnCPujULIM8MkKQHBQfZ26CPMfOLQdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fl0Suvn1AdOMFZKUzMa2LD5HnkfoNDALIdq6N1dYMePxHhlouhx6Y8TOHo68HMHRaB4zojcXzItTes4AZFR3xLFhMSXUJWJa/RDTjTYBTZsEiRNlhomFtNTvM7XIfQtn2uS++bSEHaoyMeNXWnOzA2wVyVylNEfMViUQJEMCYdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Olwabyp9; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Olwabyp9"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-cab1b0bb489so1046538a12.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 20:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949556; x=1785554356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4C2qDdMDmFuAaCYr0SQwKrHQit4QrHO7xfMnvBhehM=;
        b=Olwabyp9LIi1aIrZloIv8qknY2RB1iOLMkMa93a3pF0rC7Xf9PMmo3v+kkj0iIVjzP
         2AJEgS7CY3hBeeSfrlItHp/oE2oRLRq7yZIyLY+1CYFgLAuPKG5xEwf3UMb4kxrJzt+U
         7g4mhVkpRduGxlg2Ws0j3acNuoxChf2Fl0L5HelyeQbi71kviV0c12eL8D+vgpHsyCd6
         zYAjlIrocZY/xCL0d3VMuSDnxhKWWeeMwthmZz2zpy61p1lLaKa1yRyte+w99TNLKpmQ
         P/XRuixXnpQt5t6M5ppiZsL/DbUweo6e9ndVIw3VEXHLwEUjIp77t8fv2CLDuwW9JaqF
         jaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949556; x=1785554356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4C2qDdMDmFuAaCYr0SQwKrHQit4QrHO7xfMnvBhehM=;
        b=qBmD3ArOxttddIRDu7R4Alk2uMVu3N0BpbpxEU7hobavq51i3+fZCUN2L40TTvfWmu
         zyaWz1E/sy3PYXg7tbpEHWw1jfzLRqguH1/nYIjcPEthQzfPrHym5A2EyZOGutLf5MP+
         mSlIghFNI6WipERl3CQ35qGz2fASmbbVOwmfph0zTthsQn+V1pkaWsHnyhHFpNPkshBA
         dLFf5d558N1z2/LxPFYIl+/xwsl79+wZFgze4yq3vKHNTmFhq6z/rYDfe0KeoMsHWtRe
         WarnyZKD1qi6z9tOwwJ2bPgBUSLJSw50nsVuIc4/GkFnWUzs03npxD0N2j8C1MGhhwj6
         QP2w==
X-Forwarded-Encrypted: i=1; AHgh+Rq96A7icabKrhjTTLdKRkjtkA1Mc359r2A9q+sCYhTKMOEZ+LDydDKZMW3vfSVAORNF6pHfKXmlYyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj4esQrqMJdGiwptLxpamMBJRiKV1/St9R1r9pwM6Q2UJFQLAk
	5ZwDbdnEZJR6AWNURw+CmL5Ixkk9f0HFMVgft/g+CBm8lIBK3qXbsOTE
X-Gm-Gg: AR+sD123vgWd7KYh1qTlM5lP2LPu3krPnNxGtJ1pZ2kkx8cGEz76Qfo8oGy36ZqEXf3
	quJ38tctdLmA0CN+kjY0o1wWKXfxYBgjRT2d6FEeb0gQsd3PMjs0NfNvdd/1AmspL+mgUcyF/3f
	O2ygwNYMswB1q8/g62oFuWYfBx05zlfnusgbhjRQeXKDrnDj4d/OYpz+m5mXcIGbANT+4gfoY15
	6meyCSlMf3HwDQXjm6qXh4JereVvJ1OYAydp1j4sZ3y+D2OCBcSOhZVixLARUFAvUA1U9ElJq3k
	05ubYTyit8Wydfit+FpyJMUy4nsa+K3Hox/oNLe/E1kP3Jq2/5rWc5HVxRIwRyw8/ZyNbb4fTp9
	k75wcmRrfH4tveSdR5eN6YgDHOJHZ3IR/TztIB2NA0s9zvxIGeD+Oy5d9q6gcFwwcTw==
X-Received: by 2002:a05:6a00:180c:b0:84e:2d5d:5e4d with SMTP id d2e1a72fcca58-84e595d6eccmr712341b3a.68.1784949555818;
        Fri, 24 Jul 2026 20:19:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:19:15 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:46 -0400
Subject: [PATCH 14/17] riscv: dts: spacemit: k3: add display nodes
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-14-f22a10a52867@gmail.com>
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

Add the SoC-level display nodes: the two Saturn DPUs, the two DP/eDP
controllers with their PHY children.

The PHY PLLs are fed back into the APMU as pixel-clock mux parents, so
updated the &syscon_apmu node in the display dtsi.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-display.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-display.dtsi b/arch/riscv/boot/dts/spacemit/k3-display.dtsi
new file mode 100644
index 000000000000..4892ee6acda2
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-display.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * SpacemiT K3 display subsystem (DPU0/eDP0 + DPU1/DP1) shared
+ * device-tree definitions for inclusion alongside k3.dtsi.
+ *
+ * Copyright (C) 2026 SpacemiT Co., Ltd.
+ */
+
+#include <dt-bindings/clock/spacemit,k3-clocks.h>
+#include <dt-bindings/reset/spacemit,k3-resets.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&soc {
+	dpu0_crtc0: dpu@c0340000 {
+		compatible = "spacemit,k3-saturn-dpu";
+		reg = <0x0 0xc0340000 0x0 0x54000>;
+		interrupts = <90 IRQ_TYPE_LEVEL_HIGH>,
+			     <89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "online", "offline";
+		clocks = <&syscon_apmu CLK_APMU_LCD_PXCLK>,
+			 <&syscon_apmu CLK_APMU_LCD_MCLK>,
+			 <&syscon_apmu CLK_APMU_DPU_ACLK>,
+			 <&syscon_apmu CLK_APMU_DSI_ESC>,
+			 <&syscon_apmu CLK_APMU_LCD_DSC>;
+		clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+		resets = <&syscon_apmu RESET_APMU_LCD_MCLK>,
+			 <&syscon_apmu RESET_APMU_LCD>,
+			 <&syscon_apmu RESET_APMU_DSI_ESC>,
+			 <&syscon_apmu RESET_APMU_DPU_ACLK>,
+			 <&syscon_apmu RESET_APMU_LCD_DSCCLK>;
+		reset-names = "mclk", "lcd", "esc",
+			      "aclk", "dsc";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dpu0_out: endpoint {
+					remote-endpoint = <&edp0_in>;
+				};
+			};
+		};
+	};
+
+	edp0: edp@cac84000 {
+		compatible = "spacemit,k3-inno-dp";
+		reg = <0x0 0xcac84000 0x0 0x4000>;
+		interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&syscon_apmu CLK_APMU_EDP0_PXCLK>, <&edp0_phy>;
+		clock-names = "pxclk", "pll";
+		resets = <&syscon_apmu RESET_APMU_EDP0>;
+		phys = <&edp0_phy>;
+		phy-names = "dp";
+		status = "disabled";
+
+		edp0_phy: phy {
+			compatible = "spacemit,k3-inno-dp-phy";
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "edp0_pll_pxclk";
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				edp0_in: endpoint {
+					remote-endpoint = <&dpu0_out>;
+				};
+			};
+			/* port@1 (panel output) is added by boards fitting an eDP panel */
+		};
+	};
+
+	dpu1_crtc0: dpu@c0440000 {
+		compatible = "spacemit,k3-saturn-dpu";
+		reg = <0x0 0xc0440000 0x0 0x54000>;
+		interrupts = <139 IRQ_TYPE_LEVEL_HIGH>,
+			     <138 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "online", "offline";
+		clocks = <&syscon_apmu CLK_APMU_DSI4LN2_LCD_PXCLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_LCD_MCLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_DPU_ACLK>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_DSI_ESC>,
+			 <&syscon_apmu CLK_APMU_DSI4LN2_LCD_DSC>;
+		clock-names = "pxclk", "mclk", "aclk", "escclk", "dscclk";
+		resets = <&syscon_apmu RESET_APMU_DSI4LN2_LCD_MCLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_LCD_SW>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_ESCCLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_DPU_ACLK>,
+			 <&syscon_apmu RESET_APMU_DSI4LN2_LCD_DSCCLK>;
+		reset-names = "mclk", "lcd", "esc",
+			      "aclk", "dsc";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dpu1_out: endpoint {
+					remote-endpoint = <&dp1_in>;
+				};
+			};
+		};
+	};
+
+	dp1: dp@cac88000 {
+		compatible = "spacemit,k3-inno-dp";
+		reg = <0x0 0xcac88000 0x0 0x4000>;
+		interrupts = <140 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&syscon_apmu CLK_APMU_EDP1_PXCLK>, <&dp1_phy>;
+		clock-names = "pxclk", "pll";
+		resets = <&syscon_apmu RESET_APMU_EDP1>;
+		phys = <&dp1_phy>;
+		phy-names = "dp";
+		status = "disabled";
+
+		dp1_phy: phy {
+			compatible = "spacemit,k3-inno-dp-phy";
+			#phy-cells = <0>;
+			#clock-cells = <0>;
+			clock-output-names = "edp1_pll_pxclk";
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dp1_in: endpoint {
+					remote-endpoint = <&dpu1_out>;
+				};
+			};
+			/* no port@1: the DP TX drives the external connector directly */
+		};
+	};
+};
+
+/*
+ * Feed the PHY PLL pixel clocks back in as the APMU mux parents. This lives
+ * here, not in k3.dtsi: the PHYs only exist where this file is included.
+ */
+&syscon_apmu {
+	clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>, <&vctcxo_24m>,
+		 <&edp0_phy>, <&dp1_phy>;
+	clock-names = "osc", "vctcxo_1m", "vctcxo_3m", "vctcxo_24m",
+		      "edp0_pll_pxclk", "edp1_pll_pxclk";
+};

-- 
2.43.0

