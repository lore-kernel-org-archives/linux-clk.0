Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.87
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795152941;
	b=GZ3c7lhuNw1+xW0i+sapum1cM95WuOHe8cz6Uc9+MqP+TDwJE+LM9NHBBnvBAYQKxm2A
	 HStirUBDiqJuBwnPTimUNeLo21k/I/KtV0APL3xuj+5nvikwQXi2iIxubGTeRvSiaxDw2
	 s/4OL/n88I8p4J4n7OaAYfjvCJ6aRBn4HGM/LDGdQdrKTQ2qQIH7K0c/ZLyJM9zFxjGRz
	 wT3/rBMTez4j7D0KLafptq2lzY7b1cTUZuCQ0kJ4PwTieF75kt42y3enKAs/whJOygMao
	 X8CO3xJ0sFO/KmIj89rSVyTS0CbYVxgMxoFzzwdcSW7uW28rv3+LrEuLz1CHmGjTAXA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152941;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wvLRDTzAuyU/cnrrmEH4pWrzDy4CHKvNYZzFtPrmRBw=;
	b=wPwUMRhOgow3LOj04CbUdKUVJXsE8vzA0j+eXJ7AtGgKUH2UeozANQOtnx9FvJIesYsB
	 CuHs71roB5fiaC/EOa2vi2lxy5y3+qiaQSziCO9zUs+jO7GHDRH9VD5cT68uaHpkUDtbZ
	 FTUGzupTEzQZPVB2x8M/KgyridXjA32wwboLU+I3D4hqd2x9QwXlP9IjGQBn2/R7QL87A
	 5jAP25LQ/24b+h/wlsLwzkZofbPtaCSx6WSi9p95oPeuScuDkk3Y8TXGZBBzf3kcsPrMt
	 l9OtKN1+poA3TWCDfLk1Ev2gHGROF45UKiFsAAzlA309p2ZFl6UeObDs6RCWJpZ3qDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.87
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023087.outbound.protection.outlook.com [52.101.127.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ADF60A2635;
	Fri, 20 Nov 2026 05:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2ADF60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCU1cI65FlDUFEh5CVjCDnNaArgGuxMlvD6WM8t3T1GlhUjcAE9uPetMUzcEy+E+nL/SWSs3BIOD5A8pDjLplLFnG9Yk2venuJKhUmz5BNfQY+lM05ErjsixQYSkTofqrWoXeXFz8ONN0WNIkKtOtm0BMUoanEmwTfxciqqFbshZEUUE/GizX1BgzhXtX9wP9hoQKNw3WqkWYKLuclktHrrPYLlLX8V3s+XpmT0AuZC5NpXztcyjMMxhkCKqzxWwrEVk+FDvqnpW2OOw2En+DnX3oiX9T47W5nD8WVlMCNIHJ161Jrac/Fxzzz9j7/1UgY/XhPHrGmeFV25gj1WvHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvLRDTzAuyU/cnrrmEH4pWrzDy4CHKvNYZzFtPrmRBw=;
 b=Z/VaSdA1dcBsbu5I07uOo4GcpbBHnm3OzA2sUGskyfUNAaSQ4it4zr/l/hQFOy7RVTkjLWquG/FniaMpWCPEy+DGg7/CFAOCVZ1AJIuiKIK71LP5TkyeTXZTJTx+Y+/B/Kk8ABD5MlO1NpHyl9SKb7a/U1MnYZ34spwC8/QkZR775fcOL4FHB4Mvw7E9SrqP4da79SAZhoCyJCcZBiv7dCziY8IleEMkiIkJ7/Jld4f+8yVWXxtZqhlgZWtgum1rt4XJJ48bP0M49BXKq1NPLfw3F3CWNK3CtVSooTIkuokzBcARLBBpFBwdYxHsvTiDYIzgOoPgL9emU6kqyVpLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0069.KORP216.PROD.OUTLOOK.COM (2603:1096:301:225::12)
 by SI2PR06MB646176.apcprd06.prod.outlook.com (2603:1096:4:18c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 05:35:36 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:301:225:cafe::ac) by PUVP216CA0069.outlook.office365.com
 (2603:1096:301:225::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.12 via Frontend Transport; Fri,
 20 Nov 2026 05:35:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:34 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 71F6D427EFC2;
	Fri, 20 Nov 2026 13:35:32 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 6/6] dmaengine: arm-dma350: Honour dma-channel-mask
Date: Fri, 20 Nov 2026 13:35:29 +0800
Message-ID: <20261120053529.371923-7-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|SI2PR06MB646176:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 667429e6-38f3-476e-1d38-08df46c819b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|36860700016|82310400026|921020|10067099003|260925022911599003|260925021311599003|56012099006|260925021911599003|261021121427099003|261022105027099003|261009223027099003|261102123227099003|261021123027099003|261028144727099003|261026140227099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	PUUXzwImrHOyEYHIi7c1ePtKsHZPDEbfFJjvM9YjttiqjS6os1G6RYZAm98xrVG5VOOG4hIt2AQN1TK1xymdIMerTgl5Ld+29e7yFkGjRKLlZfbHoLNjKYt6qAlu8RVkMnH6hShL84AMnyqxljCr5aGn5mvWG4MtjdPR0Xu1ruVCMecxy5k3HEQy69YdF5NrDh/ua0OI2XtAGE6w9Sg+7Mtzga8Rn29ixtUhhjfDyRfSiNhpJtjp2XWLWiz663VzdkgVtGJtN4XuNbW3tLH+XpjtRs38y8tZUFMnI/wJK3W8WORj7Uy8rrP6+MCdysyxFfiLBBaG4zVQ1V5e/DINPs2yhpO+pxDrJBPA/xcMngRMLFzyqaJoRVnsRUhYNvrbNbyHNlhBfnyXE9wRAY672QDhbsn94qkAwiY20ekFgsL85eDsHVMADOne9cWsh/APp1QuCxPQtcvzX9y+ME1PyLy6bE8W7tVwJcv27Mho81cx0Evrd9snzgluDEGvzWCOoqtWinxh2FGVzNdmh3KoD5e43DOk2R/nwLR8NhMcYIwSBE2Y7mjjDNTpekWhl1CJ2VvknTKoZrSrWrSjCZbhP1DeO2HHm546KsyGxc+2yPxNhjc9zPdd+z0tK5Hkx0kwQ1F5uhuBkNNPeHa0mw1H5eg9qwN3V3RDdAhpXEl4DpZlYE04t/gfbLcMyrGH2+N08hnuvl/ieWakkbEq7Updv3kkSHrARBLhBBvnYaevoDmH3DcxzD93omf7vhKiI0sV
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(36860700016)(82310400026)(921020)(10067099003)(260925022911599003)(260925021311599003)(56012099006)(260925021911599003)(261021121427099003)(261022105027099003)(261009223027099003)(261102123227099003)(261021123027099003)(261028144727099003)(261026140227099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uvU1OUP21YYoN4NwRxgVAZNqdopk/y61ADw6VJZfLoXjekpPR3qh5AUs/NVFJ8zVXbhGOrQqvEPyMk8vMtsSSh/WjuOHHXU0yFzJ2c6HTatZxF2v7broqpZQZGBEWbHo46JR1D8znYcq7otLxhBoE76vhFzJempSCCXTHFpS8Xp7Mf97txux0nNGuOe783mFeirNXgQ+Wxsnd6KJo/GOFHIMC+E0IDQ/u4TwFrifIJ7kssP0bYNpUJfP310Kb5PUfjZWHKR7vjLpN1ww/1aihi1+x7yRBaheJn/ceQKBug4p6OGTncQOo3rxF5fR+GYq1kuaRHfF8s0fZSLM1SX9yM2BCYBq3eOfUYAByZjE7A4q/ahCUnuL/rT4BvOy39cM/KFIo4PYYA+9iKFU43YUDB9+nHnUxnh6PKtlKvMo/16n6aSBSmv2cpxzLhRJzFpP
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:34.4336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 667429e6-38f3-476e-1d38-08df46c819b0
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB646176

DMA-350 channels may be reserved for firmware or another processor.
Read the optional dma-channel-mask property and register only the channels
whose bits are set. If the property is absent, preserve the existing
behaviour and expose every hardware channel.

Skip masked channels before accessing their channel registers or
initializing their interrupts and virt-dma state. This avoids clearing
or configuring channels reserved for firmware or another processor.

DMA-350 supports at most eight channels, so a single u32 covers every
hardware channel without an additional 32-channel guard.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index ab68213d0bbb..4d3391248378 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -18,6 +18,7 @@
 #include <linux/of_dma.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
@@ -1276,9 +1277,10 @@ static int d350_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
+	u32 chan_mask = U32_MAX;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
-	bool coherent, memset;
+	bool coherent, has_chan_mask, memset;
 
 	clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(clk))
@@ -1351,6 +1353,15 @@ static int d350_probe(struct platform_device *pdev)
 	dmac->dma.device_caps = d350_device_caps;
 	INIT_LIST_HEAD(&dmac->dma.channels);
 
+	/* Firmware-reserved channels must not be accessed or registered. */
+	has_chan_mask = device_property_present(dev, "dma-channel-mask");
+	if (has_chan_mask) {
+		ret = device_property_read_u32(dev, "dma-channel-mask", &chan_mask);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read dma-channel-mask\n");
+	}
+
 	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
 	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
 		       base + DMANSECCTRL + NSEC_CTRL);
@@ -1360,6 +1371,9 @@ static int d350_probe(struct platform_device *pdev)
 	for (int i = 0; i < nchan; i++) {
 		struct d350_chan *dch = &dmac->channels[i];
 
+		if (has_chan_mask && !(chan_mask & BIT(i)))
+			continue;
+
 		dch->base = base + DMACH(i);
 		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
 
-- 
2.54.0

