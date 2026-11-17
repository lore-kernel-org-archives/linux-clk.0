Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908657;
	b=tATUpHsOjZaXR430A1ud5cfpOG13phrSFfcwpKACKtB0gEM163B28Uo5cN/WEe0NJWUb
	 C0TxjW4ippxsD/jzRsBg+7c8w/uOh3Zm1ltve7CysdvRvFZuAWIOzx5HFBoFQt2HNL4Wt
	 GSoV9G5Am/DHdk6uIg/rAVyCt9gQ4tQtwilGa7lbXa2SURscrlWrq2586SxyhfqezO4uU
	 tTvL6O0b9pu3ac055lnckHAVkRCYeK0LaEELsBpwc/bn6ZDah9khTInmHNhW3Cs6gPpI4
	 KxeKNnWygYS7pk3kSQz8S9yhKXvq0Sr3Kpt8YQ7mOHLNxgOC5gloSvkVfYspEFpNenQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908657;
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
	b=3Jy6YSCMY4c0lbEOuWUvynH2KuXOVQUghorfQKPOrMH1CnmYezCcYehFsLUFDYb4Jagq
	 T0pi3K2LHyYHyWhpjfnHaXTAHzF7Q9CIGerE9G5BYbrEtQql53bv9mV4ZS4q0Q21kWNnV
	 cozZlgnSH6krIHKKdPNUASFW1wC6BEINEse6S7STdZEocaa97mvZ7H90BqvXbYX+Tiyvz
	 t1V4lc1EZYYtTIaateqrTCosmORtbwcdqMsKww7yB5r3NxBRgibtHBGOM8SOLFRh5NeYy
	 lNXfyqZL5MgU32L1GDw+ucpcfI0d5TyNoso5qMCSqS9OWJ83VL5PWeHf1Kj57V8ryHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.122
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023122.outbound.protection.outlook.com [40.107.44.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1360606A323;
	Tue, 17 Nov 2026 09:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1360606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUHz99kp2eHyZt71YGTVNH5sSSEkLqLrj1/wuHf55yW1/+k42xHWp4cg0m2ZHzNW+NilZRe0sJAa24ctArqKCqUW6kuXzTi7gU7S3Q3SntkbJlD/bnPKQc1RC2zkt8I8XYEb10umPnWp+dfTrQc28rtOdNcmmhwrtdfD1OEG46eEzncW40BbwsIOTUWx+1hipwNuYynhdho/UcAeVnYRDYbtrzCGArWo++h5fNzgo2r0//bBgVSazL0Y8MMkIS1PK5dTcLf/oPXdhSNkGqvDqnXW/lmwIvrwhuOOf4rlHhGRzVuT2N4QoQtd0GmxiHy/CCBi2zQz002l0HLuTezNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wvLRDTzAuyU/cnrrmEH4pWrzDy4CHKvNYZzFtPrmRBw=;
 b=X+4YAwE+/sGnEEuq96TVNTccWaBU/QxpplGrM+Xz9xXz6IO+/GPP8IJAKfRe5Z5OBle4XiF4qPk+hlC3Snosb5OCK/GsaPzMjKyBTmaKcT7tjsZdw9JbAta8xzVLqLmX9NOsEl+AiPGxd1vtFbPO+lYHCQ7lTeOu1Tr1pq7TePheQfpFvVkE56TngEpUtDxeAHxVJGJMMYKhGqnHJWddTf9Yp/GYXTPQuz5LqLceggm5P73I1AIZ3VizXKTgI0N4MBkfqckzjyvdehq1rObJakrezB4yWcCobUQGat2SwxEJRioIbXmgGWuyo1YkMGO1d11R/1kBSIZ1Je3wuc9/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PUVP216CA0043.KORP216.PROD.OUTLOOK.COM (2603:1096:301:210::19)
 by SEYPR06MB6130.apcprd06.prod.outlook.com (2603:1096:101:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:44:13 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:301:210:cafe::8e) by PUVP216CA0043.outlook.office365.com
 (2603:1096:301:210::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:44:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:44:12 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 7AF6D40920E8;
	Tue, 17 Nov 2026 17:44:11 +0800 (CST)
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
Subject: [PATCH v4 5/5] dmaengine: arm-dma350: Honour dma-channel-mask
Date: Tue, 17 Nov 2026 17:44:08 +0800
Message-ID: <20261117094408.1393837-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEYPR06MB6130:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 69a15f03-c948-4200-f1bb-08df448f56ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|82310400026|36860700016|921020|10067099003|56012099006|260925021911599003|260925021311599003|260925022911599003|261021121427099003|261026140227099003|261022105027099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nBUHvgnIEbNzSLGgN66d4D20yix/MOR394ACABz8RIZQnG7t+bHfFdXhWT+mWiJG8eDmo+BnM7/Sro8+y9deP0IbZiRzY/OuSbYcPh0mKX3WZPNPLfOw50443Ho9mEZFDmBzlWBsILZN4DI+ihjLZVlEwltDjfRrkp9QEF7W/ulQ4KEbBMhosQpVbqjUvCRnxTTeyF8ucH04LmpbCtrMkWDgMO/SDm0X8ZXY74ZZTnrlDqEyn9jh431hbgiCTouJr8HGYNs9f9kcdluLZbqaEzWH2F/we0m5GOC6F/ppje25KSIp5o0CvDOXIaqX7Ii1smsSAHmPFVu92hr9DGhMZRLDy44l72A/5vvifjhwqlXFE0xg8O6Gyj5eydv4V+x034o1Bk4YVjKZXTv4Ghqc9CHtPRnDF/2HOA2bV5P/WJUwbIfJafYB/+HuQdDRbmFL4IzANHQE0aNV6M9Z5JR5t7en25EhnDuuvQbZ4fYo7qGsrcA6xT5li/gD9/5+X3Uqyni+RvxQc33zyHIO8sgUHy5cLYrosESZ1C/gymX4qxXCZZmbIbIqPqtej2+5oV/39hW1LQgIA2u6j3HcDWgnlayKg7ewPL0onm0mrtys2vRmE5dTnNi6csQrBC3axU9A1ZYdSq7VcD1KJArDSKZZ1QVRkCEYkZNhXrkK1nTLxAHmAnKl/4BYJR/Dyd9/Md6yHLmZnC/GcW20b9rojdRkY1ssxdc41x1YlvNrOqjG+AXSDSYX2Mp4pQxhgBYFUjfK
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(82310400026)(36860700016)(921020)(10067099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(261021121427099003)(261026140227099003)(261022105027099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zn3Oh1J6HnvPh4wWA4vnVv9WubLF4WRpw2QsGyE+SVotrwPLM+t3y9N0B9aV5lzfsLHPvL/gc/JhREV+hJqs2Lk8FgCBunbko0S19K2kn/df60htDGl4dT6dfuvgi4yABCgeEj6A5SCXXMT5rrlVjDVXU4MoW2b/XWn09dsIcH+KctUUWIVRCW6Ubz6PeJK1lCcTyjz1SXN7oV/2yopu1Q9EkFp4TJsZYWKvPFsOfLQnsv1RtHSEuDl09iAlH9rbGT+SXI4shyxOdHQFVXIYbTevWSLmZu2qX93QJ7Cea+EqSUH5TadP8OPjRgG+qLZrS4AtrtAlSAeNsfkT5Z8/GvhaU0pjKIh7KhEU6eeVyGYNP+fE4F1+WemFpk/WA+FtKmqa6DYuwhgVEVbtaIrkY/zAhDbcV3XHxnJz2zsQl5sf98ZOpdQDRmqZQkHiXshG
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:44:12.9472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a15f03-c948-4200-f1bb-08df448f56ac
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6130

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

