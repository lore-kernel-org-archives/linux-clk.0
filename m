Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515155;
	b=MBLJPB3Boz5rC3G6usfXFg4jKQdDo4BxHC8pRBWYRmdY98jbkfERFoHwqMuFD7+tvwbl
	 fjVD++oQXwJcIL2G2lFgZuZtuy5Y2gzS+V7vfp6nZV00WjulrS20HKyNFVoRcgjhdmoU/
	 /Qxx4oiooK+rZG6qVx0HrJzLpYR/IBS+LFsDOPFbGMc1aR4Xjcd8bvkMe6/vkjO7TnkYg
	 GlF8ci/MudIrKhi69m6JfTRH0yr7JU3xXJyulfG+XJZHiMQsYd38V0D5fgPOHBVlppMc1
	 tPGvABhz7x3eWutf5LSUQW8BgcqUHXPBVIsJvifQWV1SX5Dc+YdHSf2g/WlTFTHb7sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515155;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Ft6BdPyuqytdHY8l2Hyg6AX9qPyhvQDVUKgoKq10xgg=;
	b=UP+TBRqEq2r5pxK6fBfZKegzuHdy40vDg22oTQaj6WKXuglDFXFdYyYp038NVUbm+c0Z
	 xY4gVRSNd361g0/cCDxBeVPz+2cQM47X0MbaHpo2HAZuGgLzflaVi7+EJGULRaKiCqfs3
	 4BfJqqZqFY1db92oP0TKAI/2flG2cYyB5d6uB2ckd7BnZM0rNRf/tDF5FGdTpmZpCVCbc
	 JDPFes8Vfmpj+hw/H3ywECe41iNlfdvELJYzY6M5UHRP8zgQaDK5WfWjIUaO0O7utjN9Y
	 nKG58RRSfZREc4qC+ADamNuYAAqm6TxGx6xRIZoSSCybF71PxVe9jUUMkbv0/Eznw3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006D606A692;
	Tue, 24 Nov 2026 10:12:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8006D606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnVi-007edJ-2Z;
	Tue, 24 Nov 2026 11:12:26 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 2/6] dt-bindings: clock: airoha: add AN7589
Date: Tue, 24 Nov 2026 11:12:16 +0100
Message-Id: <20261124101220.3888170-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124101220.3888170-1-john@phrozen.org>
References: <20261124101220.3888170-1-john@phrozen.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the AN7589 SCU. Like the AN7583 it needs the chip SCU phandle
and has a single register range. It provides resets but no serdes
PHY, so #reset-cells stays required for both SoCs and the requirement
of #phy-cells moves to a rule for the AN7583 alone.

Add the eight AN7589 specific clock IDs after the AN7583 MDIO clocks, and
a reset header. The AN7589 reset lines are those of the AN7583 plus a
third bank with the I2C3, I2C4, I2C5, OPTL_SYS and MDIO2 resets, and an
I2S reset in the first bank. It has no PCIC bank, since the AN7589
drives PCIe PERST from the PCIe MAC. IDs are numbered densely in bank
order.

Signed-off-by: John Crispin <john@phrozen.org>
---
 .../bindings/clock/airoha,en7523-scu.yaml     | 18 ++++-
 include/dt-bindings/clock/en7523-clk.h        |  9 +++
 .../dt-bindings/reset/airoha,an7589-reset.h   | 68 +++++++++++++++++++
 3 files changed, 92 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/reset/airoha,an7589-reset.h

diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
index 0d5f89187525..947f8b939449 100644
--- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
+++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
@@ -32,6 +32,7 @@ properties:
     items:
       - enum:
           - airoha,an7583-scu
+          - airoha,an7589-scu
           - airoha,en7523-scu
           - airoha,en7581-scu
           - econet,en751221-scu
@@ -73,7 +74,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: airoha,an7583-scu
+          enum:
+            - airoha,an7583-scu
+            - airoha,an7589-scu
 
     then:
       properties:
@@ -83,12 +86,19 @@ allOf:
       required:
         - airoha,chip-scu
         - '#reset-cells'
-        - '#phy-cells'
 
     else:
       properties:
         airoha,chip-scu: false
 
+  - if:
+      properties:
+        compatible:
+          const: airoha,an7583-scu
+    then:
+      required:
+        - '#phy-cells'
+
   - if:
       properties:
         compatible:
@@ -103,7 +113,9 @@ allOf:
   - if:
       properties:
         compatible:
-          const: econet,en751221-scu
+          enum:
+            - airoha,an7589-scu
+            - econet,en751221-scu
     then:
       properties:
         reg:
diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings/clock/en7523-clk.h
index 0fbbcb7b1b25..136cbbea1f81 100644
--- a/include/dt-bindings/clock/en7523-clk.h
+++ b/include/dt-bindings/clock/en7523-clk.h
@@ -17,4 +17,13 @@
 #define AN7583_CLK_MDIO0	9
 #define AN7583_CLK_MDIO1	10
 
+#define AN7589_CLK_EFUSE	11
+#define AN7589_CLK_TINY_NPU	12
+#define AN7589_CLK_ECC		13
+#define AN7589_CLK_PM_UPS	14
+#define AN7589_CLK_DQ_UPS	15
+#define AN7589_CLK_TM_UPS	16
+#define AN7589_CLK_ACP		17
+#define AN7589_CLK_MDIO2	18
+
 #endif /* _DT_BINDINGS_CLOCK_AIROHA_EN7523_H_ */
diff --git a/include/dt-bindings/reset/airoha,an7589-reset.h b/include/dt-bindings/reset/airoha,an7589-reset.h
new file mode 100644
index 000000000000..9b098db488c5
--- /dev/null
+++ b/include/dt-bindings/reset/airoha,an7589-reset.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: John Crispin <john@phrozen.org>
+ */
+
+#ifndef __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7589_H_
+#define __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7589_H_
+
+/* RST_CTRL2 */
+#define AN7589_XPON_PHY_RST		 0
+#define AN7589_GPON_OLT_RST		 1
+#define AN7589_CPU_TIMER2_RST		 2
+#define AN7589_HSUART_RST		 3
+#define AN7589_UART4_RST		 4
+#define AN7589_UART5_RST		 5
+#define AN7589_I2C2_RST			 6
+#define AN7589_XSI_MAC_RST		 7
+#define AN7589_XSI_PHY_RST		 8
+#define AN7589_NPU_RST			 9
+#define AN7589_I2S_RST			10
+#define AN7589_TRNG_MSTART_RST		11
+#define AN7589_DUAL_HSI0_RST		12
+#define AN7589_DUAL_HSI1_RST		13
+#define AN7589_DUAL_HSI0_MAC_RST	14
+#define AN7589_DUAL_HSI1_MAC_RST	15
+#define AN7589_XPON_XFI_RST		16
+#define AN7589_WDMA_RST			17
+#define AN7589_WOE0_RST			18
+#define AN7589_HSDMA_RST		19
+#define AN7589_TDMA_RST			20
+#define AN7589_EMMC_RST			21
+#define AN7589_SOE_RST			22
+#define AN7589_XFP_MAC_RST		23
+#define AN7589_MDIO0_RST		24
+#define AN7589_MDIO1_RST		25
+/* RST_CTRL1 */
+#define AN7589_PCM1_ZSI_ISI_RST		26
+#define AN7589_FE_PDMA_RST		27
+#define AN7589_FE_QDMA_RST		28
+#define AN7589_PCM_SPIWP_RST		29
+#define AN7589_CRYPTO_RST		30
+#define AN7589_TIMER_RST		31
+#define AN7589_PCM1_RST			32
+#define AN7589_UART_RST			33
+#define AN7589_GPIO_RST			34
+#define AN7589_GDMA_RST			35
+#define AN7589_I2C_MASTER_RST		36
+#define AN7589_PCM2_ZSI_ISI_RST		37
+#define AN7589_SFC_RST			38
+#define AN7589_UART2_RST		39
+#define AN7589_GDMP_RST			40
+#define AN7589_FE_RST			41
+#define AN7589_USB_HOST_P0_RST		42
+#define AN7589_GSW_RST			43
+#define AN7589_SFC2_PCM_RST		44
+#define AN7589_PCIE0_RST		45
+#define AN7589_PCIE1_RST		46
+#define AN7589_CPU_TIMER_RST		47
+#define AN7589_PCIE_HB_RST		48
+#define AN7589_XPON_MAC_RST		49
+/* RST_CTRL3 */
+#define AN7589_I2C3_RST			50
+#define AN7589_I2C4_RST			51
+#define AN7589_I2C5_RST			52
+#define AN7589_OPTL_SYS_RST		53
+#define AN7589_MDIO2_RST		54
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_AN7589_H_ */
-- 
2.34.1

