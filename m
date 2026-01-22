Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F9257448;
	Thu, 22 Jan 2026 13:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769087230; cv=none; b=Ibxt8STDZQjhQeqclORba/7dyL5A8Rv8bW/Dg98MYPN9yeQAGR8iXlYOBKMqPPSo/qJXZ5sX5KIyK6I+1ndmB4AbYEEacsxAl8v5wFgKTFuLlmvxToM68esBT3go8TuxQ75gnPOOk3FqPV2y935F3ozEekdc+L4W2Tiy1W2a63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769087230; c=relaxed/simple;
	bh=KFevBUMoTVO19bT+uscP8l9cYsAVZOLUCYHSJHGhDHU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rXQZCswJYtw7k6EHn+8CfRZb+tmkgp8DIi8XXMuU3ZuWewCIaIKf1PfXHL7Ekqc5vDvY/6lYH9X5wpMNMEcZod/85EgfVF7XvQumreYUFBcscWO+8Y8O6TXy4J5+osu4VU5iA/udsJ62tDRUnB+rEtkoH8o4uTlEXzq//1e/sI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=T660OUd8; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="T660OUd8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F7A6100151;
	Thu, 22 Jan 2026 14:07:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769087226; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=eHlZeP2l22y+3oS6OgQo/4EpWW7DL9eFw1xliUsKTHQ=;
	b=T660OUd8MYBP9SbKpg0SF1r6d2nxtwv3Lqb6/LpTHE6x2LB61qTAPyKIEUQWDjqnfdsjQz
	3eDNdK224SvcheR4taJiPgNsdYiu29XTIzKwmwU7Cl4LvfdvU1/FIo6GGfCg3tV/+dLX6i
	S0SEdjk1J9VzKrDAKMHKEppvtflDbaiDBchiqs2RSiwM67tSBKIUEM8AjLGE9I/kYqGFXe
	Yhd1KOVU4LdwkCy7DTD3MXnUzLfDMXASelxPDpmUtFyudwbjLcwj196lGZasK1xypdz+Jr
	kSoyBbVlFYZbppRMS3bGf8+iui6dLCeZfYcuDKolsicRj2676kcKYlYbFncVXA==
From: Lukasz Majewski <lukma@nabladev.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH] clk: vf610: Add support for the Ethernet switch clocks
Date: Thu, 22 Jan 2026 14:06:49 +0100
Message-Id: <20260122130649.4150338-1-lukma@nabladev.com>
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
operation it is required to enable ESW and MAC table lookup
clocks.

The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
to provide clocks for each AIPS1-"slot", which size is 0x1000
(hence four separate entries).

Those can be enabled via clock gating CCM_CCGR10 register
(0x4006_B068).

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
 drivers/clk/imx/clk-vf610.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 9e11f1c7c397..88c9b656f244 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -309,6 +309,11 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
 	clk[VF610_CLK_ENET_TS] = imx_clk_gate("enet_ts", "enet_ts_sel", CCM_CSCDR1, 23);
 	clk[VF610_CLK_ENET0] = imx_clk_gate2("enet0", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(0));
 	clk[VF610_CLK_ENET1] = imx_clk_gate2("enet1", "ipg_bus", CCM_CCGR9, CCM_CCGRx_CGn(1));
+	clk[VF610_CLK_ESW] = imx_clk_gate2("esw", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(8));
+	clk[VF610_CLK_ESW_MAC_TAB0] = imx_clk_gate2("esw_tab0", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(12));
+	clk[VF610_CLK_ESW_MAC_TAB1] = imx_clk_gate2("esw_tab1", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(13));
+	clk[VF610_CLK_ESW_MAC_TAB2] = imx_clk_gate2("esw_tab2", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(14));
+	clk[VF610_CLK_ESW_MAC_TAB3] = imx_clk_gate2("esw_tab3", "ipg_bus", CCM_CCGR10, CCM_CCGRx_CGn(15));
 
 	clk[VF610_CLK_PIT] = imx_clk_gate2("pit", "ipg_bus", CCM_CCGR1, CCM_CCGRx_CGn(7));
 
-- 
2.39.5

