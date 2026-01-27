Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76329D289;
	Tue, 27 Jan 2026 08:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769503942; cv=none; b=bax0+il/1x55nBjyAo434Y/RRseD7h+frLm/1TTTqFbet0t74HrSx2buOFfju2OUbWKOj5iDqK2XioCYnYMWPjpvlugbK3HvlMZXO8tymsLnLFkQ6IG67igEMBm8+jSjZfPK3oo645LH9NvsoMFUm2brydqdXuBknr+zUabwVbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769503942; c=relaxed/simple;
	bh=2ea+F2HgYspw3KxUmdCxvMhQZTw7GnkmsekWDoaP1NA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NNZFftuxLyFhYvzoDxeOqHZtpv83a81roOm3HatkK+PHHr4L3/j9pkRf/h6K6ogaRjX1ZYctX0tc8F9/7/LwBoSuCIwepy1uoDsCOY7nzW/J6KCs3t43JMlccW/e0xqY4VjAJxStzETBtCQUal4RWoqzSeA6h2KoEb69ymaYTHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=HGyqJwHO; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="HGyqJwHO"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD25210E85E;
	Tue, 27 Jan 2026 09:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769503933; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=f89ewW6tpVskll2Ea+OWCGnSGwJ/WSvnGk6eazoxSU8=;
	b=HGyqJwHOfVd3/DyRJPn30XO56GQ1LSuNETmXNtjrkWzcJLgzFa2Z03tMWqY8H3sKjLT+3D
	bIOiGFqxgHeyRd0GUQfrixLP3kATurTJyobQH6JIJ7M51QYnPpjlulRZBu1QskMfyP/cgy
	UeyGAEmLoPemsloA/1vaasZlqfiLFVkrK2Fi7if5e8Gy/iu8Rnz87zHO78n0Az9xr4kVU4
	xyH4BOVhYW4FBrCzcj3boH316GCEFwmNKkXjP+NzpiwojGMbhPJWG0gKGTcmBllNC5hQF/
	SXkdu+23wvG+42xbi46ChZOqGC+c9OOfVPL/lsVF39Qj5DHy8e8qpxHk04RC7Q==
From: Lukasz Majewski <lukma@nabladev.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v3] clk: vf610: Add support for the Ethernet switch clocks
Date: Tue, 27 Jan 2026 09:51:50 +0100
Message-Id: <20260127085150.3040586-1-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The vf610 device has built in the MoreThanIP L2 switch. For proper
operation it is required to enable ESW and MAC table lookup clocks.

The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
to provide clocks for each AIPS1-"slot", which size is 0x1000
(hence four separate entries).

Those can be enabled via clock gating CCM_CCGR10 register (0x4006_B068).

This patch also adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
macros definitions for L2 switch.

The VF610_CLK_END has been removed from dt-bindings, as its number had to
be increased when MTIP L2 switch clocks were added, and defined locally
in clk-vf610.c driver.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v2:
- Squash clock DT bindings to this single patch
- Replace VF610_CLK_END with VF610_CLK_ESW_MAC_TAB3 + 1

Changes for v3:
- Re-define VF610_CLK_END and move it to clk-vf610.c file
---
 drivers/clk/imx/clk-vf610.c             | 7 +++++++
 include/dt-bindings/clock/vf610-clock.h | 6 +++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 41eb38552a9c..84a6f907e213 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -11,6 +11,8 @@
 
 #include "clk.h"
 
+#define VF610_CLK_END 196
+
 #define CCM_CCR			(ccm_base + 0x00)
 #define CCM_CSR			(ccm_base + 0x04)
 #define CCM_CCSR		(ccm_base + 0x08)
@@ -313,6 +315,11 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
 	clk[VF610_CLK_ENET_TS] = imx_clk_gate("enet_ts", "enet_ts_sel", CCM_CSCDR1, 23);
 	clk[VF610_CLK_ENET0] = imx_clk_gate2("enet0", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(0));
 	clk[VF610_CLK_ENET1] = imx_clk_gate2("enet1", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(1));
+	clk[VF610_CLK_ESW] = imx_clk_gate2("esw", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(8));
+	clk[VF610_CLK_ESW_MAC_TAB0] = imx_clk_gate2("esw_tab0", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(12));
+	clk[VF610_CLK_ESW_MAC_TAB1] = imx_clk_gate2("esw_tab1", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(13));
+	clk[VF610_CLK_ESW_MAC_TAB2] = imx_clk_gate2("esw_tab2", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(14));
+	clk[VF610_CLK_ESW_MAC_TAB3] = imx_clk_gate2("esw_tab3", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(15));
 
 	clk[VF610_CLK_PIT] = imx_clk_gate2("pit", "ipg_bus", CCM_CCGR1, CCM_CCGRx_CGn(7));
 
diff --git a/include/dt-bindings/clock/vf610-clock.h b/include/dt-bindings/clock/vf610-clock.h
index 373644e46747..5d94bd561a2e 100644
--- a/include/dt-bindings/clock/vf610-clock.h
+++ b/include/dt-bindings/clock/vf610-clock.h
@@ -197,6 +197,10 @@
 #define VF610_CLK_TCON1			188
 #define VF610_CLK_CAAM			189
 #define VF610_CLK_CRC			190
-#define VF610_CLK_END			191
+#define VF610_CLK_ESW			191
+#define VF610_CLK_ESW_MAC_TAB0		192
+#define VF610_CLK_ESW_MAC_TAB1		193
+#define VF610_CLK_ESW_MAC_TAB2		194
+#define VF610_CLK_ESW_MAC_TAB3		195
 
 #endif /* __DT_BINDINGS_CLOCK_VF610_H */
-- 
2.39.5

