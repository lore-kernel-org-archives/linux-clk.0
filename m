Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334BA301002;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852506; cv=none; b=LhXl2B2BvcsTx9kPvti982HsO1rmCCCq+VK2joqA7LkYzIBYtDDYzrvEGqi9I1R8+BYp7hoIqSPMZIHqjqdihLmUz4Mi6HSh0SFTwA5E8aktsx7fsgE+XN78Y4+Je0sk9N3yRvieS09JtVgI0w+GkY+2YfFHbBT6cYpGflmVW3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852506; c=relaxed/simple;
	bh=VSIZZ+c6ZCEkcYCJ5xJcHe3I7DscypgkCjD/RMtrCKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gs45J3rrFhjXBXxiPP3LhkNcXpwSUvGY+Z7oltXhiNKebQm6/b8sScgNSOJ4L2QEM77jFixklKdTqgkDMnFiucEOV8nx/U5gvDj0sWy2gczGHrPCIkPPiTUQKnwaYxxkPZu9HrLTNRWo+XzdIMgvCvPDNlJnH5Y7Dir6XL/6eJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqsy3Dvb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqsy3Dvb"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7D5EC16AAE;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852505;
	bh=VSIZZ+c6ZCEkcYCJ5xJcHe3I7DscypgkCjD/RMtrCKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cqsy3Dvb+ZNk+yiuiNW5QFTLejrZqJUjiVW2HP3GwMdneWlzeFJf2ky8gVghwDAla
	 9AKHqZtFTWXNviY1qUDTduiXvm999o95Ix0VYmorxkqF0JQw3dKt+Pm96mBtSBspN0
	 VzFhTguE3d9UB2R+1NJ5z5Jiac/8haVvcsVW6+EezTtUEp99nF4L49IP1C0Ear/v4A
	 3QeD55kEP8ILwpJGdEDZxl51ZK5C4CDdEXhR+PcNzlG2V8GaiaoiNyM9j+iroqlmGB
	 SA9n/8UCMgG9nmJtdg8QgnLxuE3SW9iOkOCMkWuaL44zHLro2hN8ft9AwCcDxI4b0l
	 k+tg0cWhoFaYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97DFD148A0;
	Thu,  8 Jan 2026 06:08:25 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 08 Jan 2026 14:08:15 +0800
Subject: [PATCH v5 1/8] dt-bindings: clock: Add Amlogic A5 SCMI clock
 controller support
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-a5-clk-v5-1-9a69fc1ef00a@amlogic.com>
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
In-Reply-To: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767852503; l=2048;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=4kspprQnq+nsGEHN4lrxioeMwroBsv/rJjwAgDy0myA=;
 b=ZbaHf+9APVOpWZjIUX0bGvGAzMs+2e88wvCfCJ3KVIjYimiWnBTWwx+RTXpotFlXA75b0SstI
 MBtbBWQKn8TA3Va/p2gBJNElCwwTlxBjDsNBveSkWNmD+jhv7YlscD0
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the SCMI clock controller dt-bindings for the Amlogic A5 SoC
family.

Co-developed-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
2.42.0


