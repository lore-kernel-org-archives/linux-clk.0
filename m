Received: from mail.chunchunmaru.org (mail.chunchunmaru.org [45.79.219.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8465C3D301B;
	Tue,  5 May 2026 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.219.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778013551; cv=none; b=OrfaFtxc81uov4ANQofe/EidbkpUylseH/YPdcm4SLK23Uip4bXK+9jGau8UQos17Y81pvYIoPTrdyHHkmuiMGJTaFo5pPJSAfbAnKUM3LBmNskfGds3nG3NfIF/ea94FobiMTvmHCSL1ysGDzU19iHAw8ZVv2QrCQ6OJi6WGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778013551; c=relaxed/simple;
	bh=LoZYKDXmXk/erFMj8M0WtuE3pGeMtUbiRFysQf3t+jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lj5mjRYoM6GihCNz4VrldGBTXWuR3K6widnXeHmUyQ0uXI5fHgZhvWUwA01bPvh+OCdtMKATQOd9eAGXcOPgiYCKq+c4Zo1j9yBoO3Jwfv4jCVGV8yQ9UKFD879F6i49/HJcHAQsE0VKGhgqTRkvUkHtGDgDdGMV3e39CsSqCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org; spf=none smtp.mailfrom=floorchan.org; arc=none smtp.client-ip=45.79.219.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=floorchan.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=floorchan.org
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A287325374;
	Tue,  5 May 2026 20:39:09 +0000 (EDT)
From: "Catherine A. Frederick" <serenity@floorchan.org>
To: andersson@kernel.org,
	sboyd@kernel.org,
	krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Catherine A. Frederick" <serenity@floorchan.org>
Subject: [PATCH 3/3] arm64: dts: qcom: Add initial support for MSM8920
Date: Tue,  5 May 2026 16:38:41 -0400
Message-ID: <20260505203845.192140-3-serenity@floorchan.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505203845.192140-1-serenity@floorchan.org>
References: <20260505203845.192140-1-serenity@floorchan.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add initial support for MSM8920, which is essentially MSM8917 with
an MSM8953 modem glued onto it.

Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
---
 arch/arm64/boot/dts/qcom/msm8920.dtsi | 55 +++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
new file mode 100644
index 000000000000..943cae72227a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi
@@ -0,0 +1,55 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, Catherine A. Frederick <serenity@floorchan.org>
+ */
+
+#include "msm8917.dtsi"
+
+&adsp_mem {
+	size = <0x0 0x1100000>;
+};
+
+&gps_mem {
+	size = <0x0 0x200000>;
+};
+
+&mba_mem {
+	size = <0x0 0x100000>;
+};
+
+&venus_mem {
+	size = <0x0 0x400000>;
+};
+
+&wcnss_mem {
+	size = <0x0 0x700000>;
+};
+
+&apps_iommu {
+	/* IPA */
+	iommu-ctx@18000 {
+		compatible = "qcom,msm-iommu-v1-ns";
+		reg = <0x18000 0x1000>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
+
+&rpmcc {
+	compatible = "qcom,rpmcc-msm8920", "qcom,rpmcc";
+};
+
+&soc {
+	ipa: ipa@7900000 {
+		compatible = "qcom,ipa-lite-v2.6";
+		reg = <0x7900000 0x47000>;
+		clocks = <&rpmcc RPM_SMD_IPA_CLK>;
+		interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+			     <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "ipa", "dma";
+		iommus = <&apps_iommu 0x18>;
+		modem-remoteproc = <&modem>;
+
+		status = "disabled";
+	};
+
+};
-- 
2.53.0

