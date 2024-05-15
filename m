Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7792284DF1;
	Wed, 15 May 2024 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777949; cv=none; b=uiFbJydbp2cGhAonp59k2uIpd3cYefG2RDcfJMYdi2CeXAyvQ8hgLOoq8mEOudUsHHFPNESoH2EazvkTYofG31SC2YSmmIeBI5irDVUlJbPEY6V5PzlN4ot8ad8NaUPzgl2OrJydc11raOmjuwf3zXVoNMVIvI3gbQPMr6Lq7ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777949; c=relaxed/simple;
	bh=QibeM2F1gzpesVZ5F/kxf0b9lNU3TuD+OPRRNfvg/0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOKEC6Krq0+AfQFvsX3MhNTxg3fTN74LW3YFMm1w5m98ikWxoUYzgun6HIJ8Qm4dmqFKCikchGd3zMT+Xi4pMovibVjP3DJ3LNuMnMfPPlcVM6vLSPMkElBlRSkcsjqddz+IDVsFmYh74swOJPGiflMiPhb7LKAU0YtmbrdfJ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVSUmrCs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVSUmrCs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61ABC4AF0B;
	Wed, 15 May 2024 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715777949;
	bh=QibeM2F1gzpesVZ5F/kxf0b9lNU3TuD+OPRRNfvg/0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CVSUmrCszwvXqMvZ6o/KZe4Rnhjezo9mSbtvHGWprvyjHq7l8kaSEDKrm5EA7kEwe
	 oUeQxBEAS1diSLW1/jTxR72cWqAlbtuuSctFnywZ0iqfx4g8mc3R6ecNBVc7QgT8x7
	 GI+0l4Kc9WEqZrR09r/Mf5DPWjGicRaCHTVha5R9GDpo84sg+x74Ckg8w0wfq3ICRi
	 xHNjxsWWkcTD+SZdBzjVG40ud9UrWtlCKB1gSnMmGI5p6kWKHcMKeo9QedOJRsPIhr
	 mED323XijE9qlueWyzWoTfIb+YchgET7+vM7xIkaBxjx0mrqFm3Y3+cewQqSlXDUR1
	 /sWLRgecANCYg==
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
Subject: [PATCH 2/5] dt-bindings: reset: Add reset definitions for EN7581 SoC.
Date: Wed, 15 May 2024 14:58:48 +0200
Message-ID: <acb6aa6fe473c485605c108e551d6d28ceb27a60.1715777643.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715777643.git.lorenzo@kernel.org>
References: <cover.1715777643.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce reset binding definitions for reset controller available in
the Airoha EN7581 clock module.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../dt-bindings/reset/airoha,en7581-reset.h   | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 include/dt-bindings/reset/airoha,en7581-reset.h

diff --git a/include/dt-bindings/reset/airoha,en7581-reset.h b/include/dt-bindings/reset/airoha,en7581-reset.h
new file mode 100644
index 000000000000..1b7ee62ed164
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
+#define EN7581_XPON_PHY_RST		0
+#define EN7581_CPU_TIMER2_RST		2
+#define EN7581_HSUART_RST		3
+#define EN7581_UART4_RST		4
+#define EN7581_UART5_RST		5
+#define EN7581_I2C2_RST			6
+#define EN7581_XSI_MAC_RST		7
+#define EN7581_XSI_PHY_RST		8
+#define EN7581_NPU_RST			9
+#define EN7581_I2S_RST			10
+#define EN7581_TRNG_RST			11
+#define EN7581_TRNG_MSTART_RST		12
+#define EN7581_DUAL_HSI0_RST		13
+#define EN7581_DUAL_HSI1_RST		14
+#define EN7581_HSI_RST			15
+#define EN7581_DUAL_HSI0_MAC_RST	16
+#define EN7581_DUAL_HSI1_MAC_RST	17
+#define EN7581_HSI_MAC_RST		18
+#define EN7581_WDMA_RST			19
+#define EN7581_WOE0_RST			20
+#define EN7581_WOE1_RST			21
+#define EN7581_HSDMA_RST		22
+#define EN7581_TDMA_RST			24
+#define EN7581_EMMC_RST			25
+#define EN7581_SOE_RST			26
+#define EN7581_PCIE2_RST		27
+#define EN7581_XFP_MAC_RST		28
+#define EN7581_USB_HOST_P1_RST		29
+#define EN7581_USB_HOST_P1_U3_PHY_RST	30
+/* RST_CTRL1 */
+#define EN7581_PCM1_ZSI_ISI_RST		32
+#define EN7581_FE_PDMA_RST		33
+#define EN7581_FE_QDMA_RST		34
+#define EN7581_PCM_SPIWP_RST		36
+#define EN7581_CRYPTO_RST		38
+#define EN7581_TIMER_RST		40
+#define EN7581_PCM1_RST			43
+#define EN7581_UART_RST			44
+#define EN7581_GPIO_RST			45
+#define EN7581_GDMA_RST			46
+#define EN7581_I2C_MASTER_RST		48
+#define EN7581_PCM2_ZSI_ISI_RST		49
+#define EN7581_SFC_RST			50
+#define EN7581_UART2_RST		51
+#define EN7581_GDMP_RST			52
+#define EN7581_FE_RST			53
+#define EN7581_USB_HOST_P0_RST		54
+#define EN7581_GSW_RST			55
+#define EN7581_SFC2_PCM_RST		57
+#define EN7581_PCIE0_RST		58
+#define EN7581_PCIE1_RST		59
+#define EN7581_CPU_TIMER_RST		60
+#define EN7581_PCIE_HB_RST		61
+#define EN7581_XPON_MAC_RST		63
+
+#endif /* __DT_BINDINGS_RESET_CONTROLLER_AIROHA_EN7581_H_ */
-- 
2.45.0

