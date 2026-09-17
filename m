Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995D4908A2;
	Thu, 17 Sep 2026 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789634369; cv=none; b=gMYrBa7KizHcwBLGWAWm8JqoA5IlvMg61mby9r7mhxBQU1/B3SYo5sOKOAv6NiNSyM53CKZBfOjQqDNGhFxxDHVp741/K9tC0lMxwDp40LuBR0sAFF4O4JORyJNWzGClG0cOqoHzDNfKFOmbcUlUpvIfvxwRoU056wA1A3npwEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789634369; c=relaxed/simple;
	bh=VOIt5Ueo84n51MFKJuHQvwxVAUjNMQhMgUwGhvuj4U0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oX3DpDLutkQFHTuTu6Bo1gjwgXCFdZ668Bu8QQzWS6cxyshkUVmzr1LLCRaGSmJhu58HzPevYjPTRCKfKc9xZgAicoGVe+fdM660CV5nab+17SVT2VuP/289wBHckG0EYLsHEnldVPRV1gCgGjwdCJHGLngxF4AKctCZy9MzGGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=op4rD8uE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="op4rD8uE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9323EC2BCB9;
	Thu, 17 Sep 2026 08:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789634368;
	bh=VOIt5Ueo84n51MFKJuHQvwxVAUjNMQhMgUwGhvuj4U0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=op4rD8uEUK/AzE43MHX1I9PC4JU96Ro7LGZYPP2WsNqMVftFZdPt+OQEzHiQVfe0F
	 CCf3ZZupv+nE+xTjsVSShPRWfRhDp2vqQ7HZxYtWtoBJFIifPR/T2DA54k2oByeEtt
	 GrP6hnPAAyPe95qwfwBmkE/mfG+JNQ7Q4eP1eWcMz7HgPFtEUmcNlxDaaGZpXAWpTl
	 +aFhRQ/5kbGY+arZ2I41sRCmK4IYPkPT4J0dqx6Ru0lz/sNWqiAlPO6qXXMDLRSN5M
	 HaF8eunC1qG16QPm4khVdyF16nQdDNYmm+0Tz/BjGk0rqkqp9kZsSDBOMZoUNZeCcJ
	 BdoImS9cS5Qsw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E17BC88E72;
	Thu, 17 Sep 2026 08:39:28 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Date: Thu, 17 Sep 2026 16:39:09 +0800
Subject: [PATCH v3] dt-bindings: clock: Add Amlogic A9 SCMI clock
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-a9_scmi-v3-1-5ad843766774@amlogic.com>
X-B4-Tracking: v=1; b=H4sIACynq2oC/2XMQQrCMBCF4auUWRuZJrW0rryHFJmmYztgGkkkK
 CV3N3br8n88vg0iB+EI52qDwEmi+LWEOVRgF1pnVjKVBo26xRaNov4WrRPVkG5MPWI3cQfl/Qx
 8l/cuXYfSi8SXD58dTvq3/htJq1qZExLbnsYa6ULu4WexR+sdDDnnL5hzRWqgAAAA
X-Change-ID: 20260603-a9_scmi-4a2431b08de8
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789634366; l=2919;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=WQM5jl9E8gItT5ANuR7GZhx7n8JoVv2XfXGNwu6d1P4=;
 b=i/KIdVkG2b96oq/izhj1bcE1ZkVA1v5Ve8xYqMnFWGApZWJaIXYUIAbiX6LELtXvgkzAxlzDX
 L0FTn9MOAM2BdQSkxT50WnOFjr2jpeoR5t4ILIqtXG035TmpkTXEIIK
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
Reply-To: jian.hu@amlogic.com

From: Jian Hu <jian.hu@amlogic.com>

Add the SCMI clock controller dt-bindings for the Amlogic A9 SoC family.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v3:
- Add Conor Dooley's Acked-by tag.
- Link to v2: https://lore.kernel.org/r/20260603-a9_scmi-v2-1-350aec9ab10a@amlogic.com

Changes in v2:
- Split the A9 clock driver and send the SCMI clock separately.
  The A9 PLL introduces several new features, and the Meson PLL framework
  needs to be refactored to support them. Since this work requires more
  time and there is no hard dependency between the different A9 clock
  controllers, split out the A9 clock driver and submit it separately to
  ease review.
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-1-41cb4071b7c9@amlogic.com/
---
 include/dt-bindings/clock/amlogic,a9-scmi-clkc.h | 51 ++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/include/dt-bindings/clock/amlogic,a9-scmi-clkc.h b/include/dt-bindings/clock/amlogic,a9-scmi-clkc.h
new file mode 100644
index 000000000000..d543db9fe035
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,a9-scmi-clkc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2026 Amlogic, Inc. All rights reserved.
+ */
+
+#ifndef __AMLOGIC_A9_SCMI_CLKC_H
+#define __AMLOGIC_A9_SCMI_CLKC_H
+
+#define CLKID_GP0_PLL_OSC			0
+#define CLKID_GP1_PLL_OSC			1
+#define CLKID_HIFI_PLL_OSC			2
+#define CLKID_GP2_PLL_OSC			3
+#define CLKID_MCLK_PLL_OSC			4
+#define CLKID_FIXED_PLL				5
+#define CLKID_FCLK_50M_PREDIV			6
+#define CLKID_FCLK_50M_DIV			7
+#define CLKID_FCLK_50M				8
+#define CLKID_FCLK_DIV2_DIV			9
+#define CLKID_FCLK_DIV2				10
+#define CLKID_FCLK_DIV2P5_DIV			11
+#define CLKID_FCLK_DIV2P5			12
+#define CLKID_FCLK_DIV3_DIV			13
+#define CLKID_FCLK_DIV3				14
+#define CLKID_FCLK_DIV4_DIV			15
+#define CLKID_FCLK_DIV4				16
+#define CLKID_FCLK_DIV5_DIV			17
+#define CLKID_FCLK_DIV5				18
+#define CLKID_FCLK_DIV7_DIV			19
+#define CLKID_FCLK_DIV7				20
+#define CLKID_SYS_CLK				21
+#define CLKID_SYS_AO_SYS			22
+#define CLKID_SYS_MMC_APB			23
+#define CLKID_SYS_CPU_APB			24
+#define CLKID_SYS_GIC				25
+#define CLKID_AXI_CLK				26
+#define CLKID_AXI_SYS_NIC			27
+#define CLKID_AXI_RAMA				28
+#define CLKID_CPU_CLK				29
+#define CLKID_A78_CLK				30
+#define CLKID_DSU_CLK				31
+#define CLKID_ACLKM				32
+#define CLKID_GP1_PLL				33
+#define CLKID_GP2_PLL				34
+#define CLKID_SYS_PLL_DIV16			35
+#define CLKID_CPU_CLK_DIV16			36
+#define CLKID_A78_CLK_DIV16			37
+#define CLKID_DSU_CLK_DIV16			38
+#define CLKID_GIC_CLK				39
+#define CLKID_RTC				40
+
+#endif /* __AMLOGIC_A9_SCMI_CLKC_H */

---
base-commit: 43e1705ecab981c66baee89041e6f728c0436f19
change-id: 20260603-a9_scmi-4a2431b08de8

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>


