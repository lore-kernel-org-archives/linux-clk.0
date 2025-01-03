Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0A61B0F20;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735882605; cv=none; b=KvbZ9Eou591PePfmwUHwVSpy2fdHxQp2IJwwBDY1/TqSyzT6O6My+ONzEDN7iy4vKwa5mGBFT+UFPPKJJbq1MIaghZmYFGGGMRj+c3anHgu0Prom4ViRB/TU8U7F30LKUVumzPxUiJpA6tVD/k/VSya60HE8llSCHKMCIYBrX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735882605; c=relaxed/simple;
	bh=7OixjdD2m8/UmdxhBFIAm4/7uSUL3SJDwCAZXPIjzio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fx7E8HJnAhwI99aB2IJA/QlztSgK240yEqMLEELkFPqtGWZyiwwhKVlvNoVMt7DuTVJEBAYnz2S2rUXpaXdt3/RzWk1Z7KzO6ia2cmaXkB60jbLK8MYgrcjj336DOspccXzXPDUxUursnHwwORjPkbpzMGOmhc7XFb/6sqyglrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od2XzpAX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od2XzpAX"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AAAAC4CEDC;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735882605;
	bh=7OixjdD2m8/UmdxhBFIAm4/7uSUL3SJDwCAZXPIjzio=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Od2XzpAXFqWuV/kehyOmUZfSYWnsXxupUCiJwq3MGZ2lWuVmAkv3jmYbZzIN0VAKa
	 IqW51hodMKgg1+PgWt4ntGW62u2kv81aqzifXCGJ5vtMLYWRetllftDvwp6UT7TPB2
	 hdOqyNGfbNd3mIERfvyIzqeXQTuyLAirSIV9/mdU26+cbCHHnHsrIkycgls2/rdxD6
	 +pzAcwAF9FbihKsKu8VDUOS9VkcgEEvXvSWDmVlgcSdlydg4gZHE6ISXptSGWIEEst
	 tkFipUx9vTrSjO0/HMzgmFPzBuWf6OPZjrze43VtbWTYFOOCPgbXq40i7EuJhwiHyz
	 Z7txAhHyyAuaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47557E7718F;
	Fri,  3 Jan 2025 05:36:45 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 03 Jan 2025 13:36:41 +0800
Subject: [PATCH v3 1/5] dt-bindings: clock: add Amlogic A5 SCMI clock
 controller support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-a5-clk-v3-1-a207ce83b9e9@amlogic.com>
References: <20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com>
In-Reply-To: <20250103-a5-clk-v3-0-a207ce83b9e9@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuan Liu <chuan.liu@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735882602; l=1985;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=lkr1GZx7K1kssXy2RilRTA0K2DTWj4ijmI36kNCn2FY=;
 b=5EVyfzDCIeV7W3b4vkQAsWuEDvRVg4maJ/UDY/mOy5M0TNS5nL1sySOEVw6UyoE444SXmlvcg
 yEMz/huAslvAMHsuKkIKfYQPV7EL/tE8/1AdyTFvQaG4nNbjmtIS4gs
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
Reply-To: xianwei.zhao@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the SCMI clock controller dt-bindings for Amlogic A5 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 include/dt-bindings/clock/amlogic,a5-scmi-clkc.h | 44 ++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
new file mode 100644
index 000000000000..1bf027d0110a
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a5-scmi-clkc.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
+ * Author: Chuan Liu <chuan.liu@amlogic.com>
+ */
+
+#ifndef __AMLOGIC_A5_SCMI_CLKC_H
+#define __AMLOGIC_A5_SCMI_CLKC_H
+
+#define CLKID_OSC				0
+#define CLKID_SYS_CLK				1
+#define CLKID_AXI_CLK				2
+#define CLKID_CPU_CLK				3
+#define CLKID_DSU_CLK				4
+#define CLKID_GP1_PLL				5
+#define CLKID_FIXED_PLL_DCO			6
+#define CLKID_FIXED_PLL				7
+#define CLKID_ACLKM				8
+#define CLKID_SYS_PLL_DIV16			9
+#define CLKID_CPU_CLK_DIV16			10
+#define CLKID_FCLK_50M_PREDIV			11
+#define CLKID_FCLK_50M_DIV			12
+#define CLKID_FCLK_50M				13
+#define CLKID_FCLK_DIV2_DIV			14
+#define CLKID_FCLK_DIV2				15
+#define CLKID_FCLK_DIV2P5_DIV			16
+#define CLKID_FCLK_DIV2P5			17
+#define CLKID_FCLK_DIV3_DIV			18
+#define CLKID_FCLK_DIV3				19
+#define CLKID_FCLK_DIV4_DIV			20
+#define CLKID_FCLK_DIV4				21
+#define CLKID_FCLK_DIV5_DIV			22
+#define CLKID_FCLK_DIV5				23
+#define CLKID_FCLK_DIV7_DIV			24
+#define CLKID_FCLK_DIV7				25
+#define CLKID_SYS_MMC_PCLK			26
+#define CLKID_SYS_CPU_CTRL			27
+#define CLKID_SYS_IRQ_CTRL			28
+#define CLKID_SYS_GIC				29
+#define CLKID_SYS_BIG_NIC			30
+#define CLKID_AXI_SYS_NIC			31
+#define CLKID_AXI_CPU_DMC			32
+
+#endif /* __AMLOGIC_A5_SCMI_CLKC_H */

-- 
2.37.1


