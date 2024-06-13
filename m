Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD61A143C48;
	Thu, 13 Jun 2024 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282863; cv=none; b=c7Mg6H9Hc82DiIqAQh9tECERTkC6HfuYRLaLLFTh7mntxr9crnVNRHpsHuMzQWE+AeqnjBKLJ8X2oj9UyqDMm496Ig3WA3usnJOMLMds/I21VCzZvLAekjNm3pbZ/NS+3PnudHZVbalxE/PBOwnCi0JJnsp+1/XYId5dskboX94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282863; c=relaxed/simple;
	bh=ad9x5yMs8ga0zZnmsTn+ucutXDEmn4srbTD18t0nLS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4brYwBAS5zNwreJkpRhTnjWQHq6uAgqISQmW28f2zbUaSxfq+rPTcztBJ/Uj6QEAHaueU1P4XONZk4JMZCD44YIWWZgzfmujTt74zgDxsKliZQ1JyyhFluKYIToULG9Cf8NdE6u4seYInqd5zuvg6PymjMfYsvWwK7jbRh3xEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itDSX2Rn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itDSX2Rn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23703C2BBFC;
	Thu, 13 Jun 2024 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282862;
	bh=ad9x5yMs8ga0zZnmsTn+ucutXDEmn4srbTD18t0nLS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=itDSX2RnedPjYnzaoyH91+9KKIqhjMs18rPHCEJJTBI4D6CgiOdjRnEF9vKnV1P2/
	 +hfTxfx2lw7JGcHmnbW0vExyHeOb0XF3CpKSlUV7C89IcnDu1SIvIwBSEa83DJIKVw
	 fQy2A2GzZfqNKVAKCfY8NTxEa6vjev9Be8BWVlgH5mLZ1MGFWzfjcmM4b3JSLwAavs
	 JZURSqvxSUcskYl8UpMM59FJZoiFTzRB1PztCm4Tgzgbwb3YGj7k9GEmJ/HcY33iCb
	 fEVVbuk/J8947XcXNCbmgfUNhYkPXPTj3CNJgUugDKtkzsq4ogezj0hzwS75QAOp/2
	 Jne8EfSVi7iQA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v3 1/4] dt-bindings: clock: airoha: Add reset support to EN7581 clock binding
Date: Thu, 13 Jun 2024 14:47:03 +0200
Message-ID: <ac557b6f4029cb3428d4c0ed1582d0c602481fb6.1718282056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718282056.git.lorenzo@kernel.org>
References: <cover.1718282056.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset capability to EN7581 device-tree clock binding
documentation.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 25 ++++++-
 .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
 2 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 3f4266637733..84353fd09428 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -35,7 +35,7 @@ properties:
 
   reg:
     minItems: 2
-    maxItems: 3
+    maxItems: 4
 
   "#clock-cells":
     description:
@@ -43,6 +43,10 @@ properties:
       clocks.
     const: 1
 
+  '#reset-cells':
+    description: ID of the controller reset line
+    const: 1
+
 required:
   - compatible
   - reg
@@ -60,6 +64,8 @@ allOf:
             - description: scu base address
             - description: misc scu base address
 
+        '#reset-cells': false
+
   - if:
       properties:
         compatible:
@@ -70,6 +76,7 @@ allOf:
           items:
             - description: scu base address
             - description: misc scu base address
+            - description: reset base address
             - description: pb scu base address
 
 additionalProperties: false
@@ -83,3 +90,19 @@ examples:
             <0x1fb00000 0x1000>;
       #clock-cells = <1>;
     };
+
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      scuclk: clock-controller@1fa20000 {
+        compatible = "airoha,en7581-scu";
+        reg = <0x0 0x1fa20000 0x0 0x400>,
+              <0x0 0x1fb00000 0x0 0x90>,
+              <0x0 0x1fb00830 0x0 0x8>,
+              <0x0 0x1fbe3400 0x0 0xfc>;
+              #clock-cells = <1>;
+              #reset-cells = <1>;
+      };
+    };
diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
new file mode 100644
index 000000000000..6544a1790b83
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,en7581-reset.h
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2024 AIROHA Inc
+ * Author: Lorenzo Bianconi <lorenzo@kernel.org>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_
+
+/* RST_CTRL2 */
+#define EN7581_XPON_PHY_RST		 0
+#define EN7581_CPU_TIMER2_RST		 1
+#define EN7581_HSUART_RST		 2
+#define EN7581_UART4_RST		 3
+#define EN7581_UART5_RST		 4
+#define EN7581_I2C2_RST			 5
+#define EN7581_XSI_MAC_RST		 6
+#define EN7581_XSI_PHY_RST		 7
+#define EN7581_NPU_RST			 8
+#define EN7581_I2S_RST			 9
+#define EN7581_TRNG_RST			10
+#define EN7581_TRNG_MSTART_RST		11
+#define EN7581_DUAL_HSI0_RST		12
+#define EN7581_DUAL_HSI1_RST		13
+#define EN7581_HSI_RST			14
+#define EN7581_DUAL_HSI0_MAC_RST	15
+#define EN7581_DUAL_HSI1_MAC_RST	16
+#define EN7581_HSI_MAC_RST		17
+#define EN7581_WDMA_RST			18
+#define EN7581_WOE0_RST			19
+#define EN7581_WOE1_RST			20
+#define EN7581_HSDMA_RST		21
+#define EN7581_TDMA_RST			22
+#define EN7581_EMMC_RST			23
+#define EN7581_SOE_RST			24
+#define EN7581_PCIE2_RST		25
+#define EN7581_XFP_MAC_RST		26
+#define EN7581_USB_HOST_P1_RST		27
+#define EN7581_USB_HOST_P1_U3_PHY_RST	28
+/* RST_CTRL1 */
+#define EN7581_PCM1_ZSI_ISI_RST		29
+#define EN7581_FE_PDMA_RST		30
+#define EN7581_FE_QDMA_RST		31
+#define EN7581_PCM_SPIWP_RST		32
+#define EN7581_CRYPTO_RST		33
+#define EN7581_TIMER_RST		34
+#define EN7581_PCM1_RST			35
+#define EN7581_UART_RST			36
+#define EN7581_GPIO_RST			37
+#define EN7581_GDMA_RST			38
+#define EN7581_I2C_MASTER_RST		39
+#define EN7581_PCM2_ZSI_ISI_RST		40
+#define EN7581_SFC_RST			41
+#define EN7581_UART2_RST		42
+#define EN7581_GDMP_RST			43
+#define EN7581_FE_RST			44
+#define EN7581_USB_HOST_P0_RST		45
+#define EN7581_GSW_RST			46
+#define EN7581_SFC2_PCM_RST		47
+#define EN7581_PCIE0_RST		48
+#define EN7581_PCIE1_RST		49
+#define EN7581_CPU_TIMER_RST		50
+#define EN7581_PCIE_HB_RST		51
+#define EN7581_XPON_MAC_RST		52
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.45.1

