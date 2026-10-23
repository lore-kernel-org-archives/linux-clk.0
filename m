Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792750710;
	b=mxkbqaqZpXOZRyx3mvk3womWTxgse023QdeAKmSEHgU2MvBOhK5YE1W6NB68ukt1vb5H
	 tdbEIdTEf/O0eot+7ju4tduN6GtIKe6N51hJRwmgyMWfSN59V9y9DwGHl2IFlzAWorvk1
	 g+5RQLzBs4UFeUkt6zYMS0z7BNoA2P7GKrBcVdz5vB1Kqe/2r3l62BlBlacXG/X6BlY5f
	 KllFMfCOCJCg/1Uta49PLg8DHaLCqbjdfGo6fHkn4K7pKXi54cqHwKIkwFqtbMvKaXCo0
	 xvrpCs+/Cd1zSp01bfmKsOI5e74XjYSu0L8yie2N4qKQt3FXwJjmiD3OaF+5tu/X8xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750710;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Os+4IbuR4w4I6EwpFOprhq7fwbr4xPPpn+mMOYfw1zQ=;
	b=n+vT0u0zarpMlGoMXfyWJYHFdng9MXkoO36PSQPWhATp/SMPkvVy7zDhtmevfonY4+1V
	 pqK5160PCmfBTQZ77plPsNkPgfy4KQfY8+ejom72y6zEFoD2DYdEwYZK2ZdtFp1i8HlVB
	 d576ktOXotXl7pqIYTGLvl96DCSRQFsTpZjZckW13veVVD7cLstXxRYeab9nUPGieSDSX
	 0Q+BMfiB80P8tVCwHsTpzDK98huZFImSDkrF8yfHEZwklpk41U5D+ANag3ti8SNoIU41k
	 PMgiuSBrTaY7nzt02FufoP+Xr3G5ZLi5gwGa/YxL9PDNHfukzCPZx7owciJB7j8XOTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M01eeUMR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17D606A31B;
	Fri, 23 Oct 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M01eeUMR
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792750709;
	b=x5XTZWcf3VUUAYITH/RKNZVsT9QBLTzn8CwNZ4O3weHQ695mSEqZw3/It5SsVyejQw+l
	 98/VSNVouXmdObpdtpotJPMjbdrmhJjh1L47se5sR7vYvxWE/rD81aUEq9hM7o3nQHwj+
	 /ipYJlF/ykHIBNcSvuk+mXk1JBYJs1Rrhi9DoRhlT/bdojHMsOiby4UXKz+h1jhlbg0RC
	 muhFfb9TMV/SIpaQXGxtfjzga+Lw9E/xAJL5avVkER8/x/WS6aKilG/3vnb+jOfaTl/9C
	 +JUGI2NWEdsTbQh+YqwyhP0XlfKpWKhv3UZZNzzSFzuC/fVSWIVDuRHD4JcqheY+R7A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750709;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Os+4IbuR4w4I6EwpFOprhq7fwbr4xPPpn+mMOYfw1zQ=;
	b=goJS2zzLZOAtIXCNEOQUaMhy1g4popU36ShKL4Z+wF0ARuV6MP/mWJuxXnAi/Qtp/VO8
	 LKMRRXbG/TXI+OlS/sp5aqQ5QgNjZuTLx2byrrHw2BfO9qIpzMkOpW84ZSAwdLDGVxYrT
	 6xi5+iaUUKGcYtygSg+Z7eflwJjjpjRKPYZYPTw57FT+2Nme4vEWMs69S78JX0kcW8pqs
	 nV/OfR3ytyqPqkk0+NyvkBAirzKCOEKYavR4ARDNxfexXiaKVDEseA6H8D9gtmjFss0zW
	 m3H4XflFlilMG4mzSvVH3DIWso3OwZBHUU8aiucHNWi0tRqpEDxRfSkUAJGjpsYA5Yg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CB3CD1F01828;
	Fri, 23 Oct 2026 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750709;
	bh=Os+4IbuR4w4I6EwpFOprhq7fwbr4xPPpn+mMOYfw1zQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=M01eeUMR57YB7iLCT7NSIMFXif/mUlLB0PSjA0PYJ9C/S1QMVPTdQc8W5ghmmvucv
	 gDOfYF3ygLI/fTJ1Oncyf5Hsyc0oSGHFX0DmZdufttLDU2j8NOZgmVx2rrMkS6Feqx
	 cl1p5ODz1MDWws6JpAe5pLC9jNjRNRSzR2L4LDmTIOwTYeQdJixbfhvwPW3dPgOcDt
	 aspbumYnpkq4wPbqdV0Avmo4M7RhSEnBS26ii10IeXalyinrGEmQTIImpo/ElbnB+M
	 yBosistucIDfuNk6jmWKLS9QqMUIZ3gMqaR6C4b/stq96kemNU6uD2eFxqfI0YmHpb
	 dEQpsBdcsMCoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 608A6444A6;
	Fri, 23 Oct 2026 10:18:28 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Date: Fri, 23 Oct 2026 15:48:24 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Document the SM7250 display
 clock controller
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-dispcc-sm7250-v1-1-07bdefb99801@brar.si>
References: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
In-Reply-To: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792750706; l=5475;
 i=patches@brar.si; h=from:subject:message-id;
 bh=Sc530KmGL8zaKa6SHDV02PUR6renziuJ0eqUJFmUVWM=;
 b=gSZmv1o3R88egNOvPZqRRMWUYGfrT8l7KReB53mFONMDRFASiQQFPUoMocK33yklZQixTeZHD
 ZiNyZ2So+14D/yWNi7KBI1a/hxq0WbieGAgvTtxRXNUDXlxcjjlsg+l
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si
Content-Transfer-Encoding: 7bit

From: Ishu Brar <patches@brar.si>

Add the binding and the header with the clock, reset and GDSC indices
for the display clock controller (DISPCC) of the Qualcomm SM7250 SoC
(Snapdragon 765/765G/768G).

The header and the binding are derived from the SM7150 ones: the register
layout is the same, but the controller takes GPLL0 from the GCC as an
extra parent and has its own PLL.

Assisted-by: Claude
Signed-off-by: Ishu Brar <patches@brar.si>
---
 .../bindings/clock/qcom,sm7250-dispcc.yaml         | 73 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7250-dispcc.h     | 62 ++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm7250-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm7250-dispcc.yaml
new file mode 100644
index 000000000..684aaf7bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm7250-dispcc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm7250-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller for SM7250
+
+maintainers:
+  - Ishu Brar <patches@brar.si>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on SM7250.
+
+  See also: include/dt-bindings/clock/qcom,sm7250-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,sm7250-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: GPLL0 source from GCC
+      - description: Sleep clock source
+      - description: Byte clock from MDSS DSI PHY0
+      - description: Pixel clock from MDSS DSI PHY0
+      - description: Byte clock from MDSS DSI PHY1
+      - description: Pixel clock from MDSS DSI PHY1
+      - description: Link clock from DP PHY
+      - description: VCO DIV clock from DP PHY
+
+  power-domains:
+    maxItems: 1
+    description:
+      CX power domain.
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm7250-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@af00000 {
+      compatible = "qcom,sm7250-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+               <&sleep_clk>,
+               <&mdss_dsi0_phy 0>,
+               <&mdss_dsi0_phy 1>,
+               <&mdss_dsi1_phy 0>,
+               <&mdss_dsi1_phy 1>,
+               <&dp_phy 0>,
+               <&dp_phy 1>;
+      power-domains = <&rpmhpd RPMHPD_CX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm7250-dispcc.h b/include/dt-bindings/clock/qcom,sm7250-dispcc.h
new file mode 100644
index 000000000..907f4122c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm7250-dispcc.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Danila Tikhonov <danila@jiaxyga.com>
+ * Copyright (c) 2024, David Wronek <david@mainlining.org>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISPCC_SM7250_H
+#define _DT_BINDINGS_CLK_QCOM_DISPCC_SM7250_H
+
+/* DISPCC clock registers */
+#define DISPCC_PLL0				0
+#define DISPCC_MDSS_AHB_CLK			1
+#define DISPCC_MDSS_AHB_CLK_SRC			2
+#define DISPCC_MDSS_BYTE0_CLK			3
+#define DISPCC_MDSS_BYTE0_CLK_SRC		4
+#define DISPCC_MDSS_BYTE0_DIV_CLK_SRC		5
+#define DISPCC_MDSS_BYTE0_INTF_CLK		6
+#define DISPCC_MDSS_BYTE1_CLK			7
+#define DISPCC_MDSS_BYTE1_CLK_SRC		8
+#define DISPCC_MDSS_BYTE1_DIV_CLK_SRC		9
+#define DISPCC_MDSS_BYTE1_INTF_CLK		10
+#define DISPCC_MDSS_DP_AUX_CLK			11
+#define DISPCC_MDSS_DP_AUX_CLK_SRC		12
+#define DISPCC_MDSS_DP_CRYPTO_CLK		13
+#define DISPCC_MDSS_DP_CRYPTO_CLK_SRC		14
+#define DISPCC_MDSS_DP_LINK_CLK			15
+#define DISPCC_MDSS_DP_LINK_CLK_SRC		16
+#define DISPCC_MDSS_DP_LINK_INTF_CLK		17
+#define DISPCC_MDSS_DP_PIXEL1_CLK		18
+#define DISPCC_MDSS_DP_PIXEL1_CLK_SRC		19
+#define DISPCC_MDSS_DP_PIXEL_CLK		20
+#define DISPCC_MDSS_DP_PIXEL_CLK_SRC		21
+#define DISPCC_MDSS_ESC0_CLK			22
+#define DISPCC_MDSS_ESC0_CLK_SRC		23
+#define DISPCC_MDSS_ESC1_CLK			24
+#define DISPCC_MDSS_ESC1_CLK_SRC		25
+#define DISPCC_MDSS_MDP_CLK			26
+#define DISPCC_MDSS_MDP_CLK_SRC			27
+#define DISPCC_MDSS_MDP_LUT_CLK			28
+#define DISPCC_MDSS_NON_GDSC_AHB_CLK		29
+#define DISPCC_MDSS_PCLK0_CLK			30
+#define DISPCC_MDSS_PCLK0_CLK_SRC		31
+#define DISPCC_MDSS_PCLK1_CLK			32
+#define DISPCC_MDSS_PCLK1_CLK_SRC		33
+#define DISPCC_MDSS_ROT_CLK			34
+#define DISPCC_MDSS_ROT_CLK_SRC			35
+#define DISPCC_MDSS_RSCC_AHB_CLK		36
+#define DISPCC_MDSS_RSCC_VSYNC_CLK		37
+#define DISPCC_MDSS_VSYNC_CLK			38
+#define DISPCC_MDSS_VSYNC_CLK_SRC		39
+#define DISPCC_XO_CLK_SRC			40
+#define DISPCC_SLEEP_CLK			41
+#define DISPCC_SLEEP_CLK_SRC			42
+
+/* DISPCC resets */
+#define DISPCC_MDSS_CORE_BCR			0
+
+/* DISPCC GDSCR */
+#define MDSS_GDSC				0
+
+#endif

-- 
2.56.0


