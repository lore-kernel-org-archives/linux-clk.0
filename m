Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D06137D137;
	Thu, 29 Jan 2026 10:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680951; cv=none; b=OgrisKaw1iwgbG6Do4LxYQx5067FAKl9OjNWlbnTQ5LnwFm/45esXuoir6a/emRF6xpgVIjORyLyBW8rNMBuuBKcaJDiK1uR7HtlMmolxohyA++pCLZoM/Gzflw263sOwUrN2EsddiKvxNJRMaxC23YbKovaM9x1GgEuXUbA2ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680951; c=relaxed/simple;
	bh=nMvp7sq8ZZjQy/P5kCejyFLZpXtKta6haVWRdm941Ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kTGx/HUPS8+SJ/nthhX6vcyn9cG1DPfro16Ql9gY94OGcQx8pMOpUM5wWY5NDFvu7nxuiMCUBonw3xtQr88xHtzDnZj8p9adOz31vDBvgC7/00E+NWHDOQ3MziFMBAzOSsOUv4vnomTbTtIRcUCS4n5/kfv+dUe/fI9p8b/LMXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=A5AXGlCp; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="A5AXGlCp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03A0A10F7B1;
	Thu, 29 Jan 2026 10:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769680505; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ua4dzCHRVlTur4dFIV0XO2jMj61CEAysss6aVhB7hN8=;
	b=A5AXGlCpIvEkBSLGCNlNqlnDtfn//hfnk8wIN5HD2wNh5sm4m80V+9+wxLXic4xSwHDyf4
	EJXXyoNBlKeDsjjP9l/oAjIdfv/QPy7MolmLXIRr7M7XCTLH/NBuyNnNNpe0X4RYy/usqv
	MjJDRx6Fj7AdiJEW9Is2INMooWZC2uhUZMnIauhc4JJJvrhlxcs7qtkX0IT+9EddeCZfWw
	JNViMT5h9CZCkSSoTMkdzuTNSg9P5RELz+/kA1avq/HKAVcAzJ1f25QH6ojBOJLc8/TQKU
	gfexMP60K3sMBGRdpRxIALjxnSjGJskJ7FxCRRZD/jARmHp8vt4eXoZ0KcC7fw==
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
Subject: [PATCH v4 4/4] clk: vf610: Add support for the Ethernet switch clocks
Date: Thu, 29 Jan 2026 10:54:42 +0100
Message-Id: <20260129095442.1646748-5-lukma@nabladev.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260129095442.1646748-1-lukma@nabladev.com>
References: <20260129095442.1646748-1-lukma@nabladev.com>
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
Changes for v4:
- Adjust VF610_CLK_END
---
 drivers/clk/imx/clk-vf610.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 457156944c67..766119a86841 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -16,7 +16,7 @@
  * include/dt-bindings/clock/vf610-clock.h
  * It shall be the value of the last defined clock +1
  */
-#define VF610_CLK_END 191
+#define VF610_CLK_END 196
 
 #define CCM_CCR			(ccm_base + 0x00)
 #define CCM_CSR			(ccm_base + 0x04)
@@ -316,6 +316,11 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
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

