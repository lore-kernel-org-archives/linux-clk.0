Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795775784;
	b=3pnBWewBgxSGGkWFflOWhgI0mT6FzMKpHFpCP0rs7Tu9cjD29UwU5P77RJhiBLsL27W9
	 +6cngHQcmTJ4TKazcac8DLIgv9JoikChzr8YkgLgSBZZlKYFDnN0g/9K/+rwBKkYWBjkg
	 J7fYqJtkgsSjddZxcZIRyeffK0NO7tBHhkQfuwooCVd0luKDxmUGQQ2ZsLUaZhLpQvZVV
	 1cnzT8Vqfp9dEq3Li2EE1g1r7Qs8h+gOQgRvcw2ZpcVzz5dwGf/EK5x0m7KVtsZ3tGvAc
	 UyY5/Tde8BolyYOTSuvLuzBK4/ZpLXtS6GuHT6SlXBbGipjEfrd9KpfpYBZie1wd09Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775784;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=E+HALV0rPc9FkSZPQja3qBVbUypjKUx8vB5cLXBkrds=;
	b=LzNxG4LxCD+8RvMjZTWCcsNm6EHMKeqdL5b2Q6Q0TAZB1441O7PKlpF/Y0DgZOHmYe4t
	 7CInIQC4Xt2b+R/Y7+R43rR85jkTu7vkz9EF+xRfB5fqZZwbAtQuykpWd/eKa8xB0lHBy
	 SrZK94E+3Tl/Am3YsA7DfdyoyEvgg1fLjdtDkhFSimXZDJCgBqX72aBTpYg+8cN6a4aFM
	 62xQSHm2mPRdJk8N4HJ0cOtllJQWLjrGt9ZXvGocjbiJFSl1IOopig8PtjzDAKJfSy3Sm
	 fBKmvv0qoyvNxZ7zXKKdJlwIvRhdaaItkJIRPTOTS0gYpxjR4iXNOydNz3U9NW/drfg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=cu4NyDAT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.25
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010025.outbound.protection.outlook.com [52.101.69.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23FF606A32A;
	Fri, 27 Nov 2026 10:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F23FF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=cu4NyDAT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiKf+8hSdwyxarO9WLbHZTBVAYSzJzJ7/YxFwIXKad+HGhG41Hnsn1Y+mtvXO0Gs8jUrw0gwyq5a+K1uZQLN4gFKdPABcLOAGd9DwqQ6rHd4JE6xjfVv5w107HiFMo7SRo1oQgnkLm/YXfxdOtSs2OUg3J8MnxT8a+l/h21Tk6tWI58AbMnG5HXDNm7k/Bw5EVD9whGOWsbIpmHpuvBsmwxpSYJZCja4zKfzjkuS8YKq6TKmmMYh0AmV4U+wlQouJ37inoEEaaTQYFtdxqu+m2AqZ3Jm3hrz81I7ynYFo2elc281r2reXdc8e3InBG7tWuv2DlcvCbm535N/wl43aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+HALV0rPc9FkSZPQja3qBVbUypjKUx8vB5cLXBkrds=;
 b=l/cZ6nhoupn5QSxbEpcZUGGHN6juzyIq4zXaezvYDXkjT0nFGHpFOH0L1aPJQH4079h9RnsbSTHw7Ha19IvQXLloVQ2jcRRyuNswcLJFOBNijTCs0eieyHWMQF+gCqUbRBSJ6sbFxbOqiHZWy+54qBt+Z89P0+qguH4fPbOQ12vulCqT0Kc22hrpVfDvF/3RK13mOPB18Wv4p2FOuO1z/4+xx1JtloGYdiP/ntq0W11m4wMEOIe7AQxavUwZmaiGK7c1ArkR6fI5K5Yy8q/FGbDj5F9l6pHZiUUnNSdpJR+6fsDN7LL+Bg0mTeOciNnyS6M2TqICC+n4K9WqjxVj+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+HALV0rPc9FkSZPQja3qBVbUypjKUx8vB5cLXBkrds=;
 b=cu4NyDAT10tzSItTNZyLBJ+h5GukkA4lgt1T7F8rjpw0lf0LsEIJfc8SsCPxRuNHzLzDjB0I/LnsTd8uBE0cf38cv1Y9RqRM9Zo0y/CzTv4EBfVCJKVbwPz6f1CrywTUNdY9lTQsqRNshv3zx6QdYrPU5bwPLcjqij2y3/POzJ1Dj4A3WTzCKv2JyIC8bCk+lcNQaRZ1wjHwjxaKKoqSo/P5oKr1ogyvNbW2X/9q69QG3HGBbslAPtn8ez0SAcH5vPVCaX27sL8wqElKtp0W6lvlVLGYJRCfhDUPx35d/L6ACyCeFAcIPevOwDM3ZCBzrQQmv5/Mliof20ntwVF+LA==
Received: from AS9PR06CA0335.eurprd06.prod.outlook.com (2603:10a6:20b:466::34)
 by VI1PR10MB8206.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.688.4; Fri, 27 Nov
 2026 10:36:20 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:20b:466:cafe::14) by AS9PR06CA0335.outlook.office365.com
 (2603:10a6:20b:466::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.9 via Frontend Transport; Fri, 27
 Nov 2026 10:36:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.688.5 via Frontend Transport; Fri, 27 Nov 2026 10:36:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 27 Nov
 2026 11:37:26 +0100
Received: from localhost (10.252.15.170) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 27 Nov
 2026 11:36:19 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 27 Nov 2026 11:36:17 +0100
Subject: [PATCH 1/2] clk: stm32: add support for a parent table in the
 muxes
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261127-ups_mp13_clk_rng-v1-1-86bef8c05ce9@foss.st.com>
References: <20261127-ups_mp13_clk_rng-v1-0-86bef8c05ce9@foss.st.com>
In-Reply-To: <20261127-ups_mp13_clk_rng-v1-0-86bef8c05ce9@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795775777; l=3840;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=JaDvqHKjYOmM+DXxhs2Aiz0yd+xq7PWSuAq1YHhL12I=;
 b=I2Fv6gcuQeWNMUgJw+fjrljd4hLkf1EcRMAbAzugIwpU6oFcbAsbUNDr88hiBf/a1aCPf+ABH
 sLYaAeeET5TBI3VfUd074fFVW+QHHyvPBTU7aj7b1WIhtnRuTBHPu9q
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|VI1PR10MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d26b9c6-2050-495d-1ef6-08df4c724674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|11063799006|261009223027099003|22082099003|18002099003|10067099003|56012099006|261026121527099003|261102123227099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	gbmsrkl0tXeRdLuVnZQYAg/3GW5+Wc3a5eHZQW46NQAIZCEZajp2VPVeYmxos4kmLJVVRZS6C/uLBFrw5wHdRLpsdMIPiAqL7i6O76cfGE5CPXQxzHuXzcgvSBbwk3KFPmby0yKmxXiFpZV0Vau/Blsc9tZFOd+KSCwnkjybANbH0ZRvl88f6BCDGGwPRTegn+AaPS2auxQz4LGAstu3TkXOXmP2Q7hEQ8IJtEA75nn2uaCXrp7yIfP9+qh/UFd8VuJPGq6uopj/xFIPz+XNzrH2MJkZG6rGrHaVVNzLYe+fUTSfecsc0DrU9qUHEvlYbinuS5eRxd/qOExZndVMq6foAHKr92WSNss32CmymsWygZdPHOckvS/T+FeTqAda3m2UjjEQWSPk3LDKCRQw3BOBF6HlCB1Vcp7/Hdyk2s2KzS0Z8hheOyGqW1QCPAZOUiur4iSWzs/6t8c6+jRaIKnx4M86m8kPc+o7LZuplAynVWKIg59x9boDg7lpGRHU1m/K+FYb+0CpN7cqdyby0o+plFNx8Yh1Ju65yCLkVrRvB0/0u1eHmcI51h09AdrqQIyxxEkV6sKan9f0WJ/3f4+DJO2y0MWo+MAQTr/l7nnHCeMfF3g5rhtjdMKhrr9CEamS5qU5Km2IsBq/6sm4WrFDARdee7lFc8VlLEl6YzE5aApoVT4eQtJF0cR8aNMIT7HWWuAo+Wsic+i3oCP1dw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003)(56012099006)(261026121527099003)(261102123227099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NVpAougk3JtBgT2u2zVoHrSTnD5ztCxnpCForfBR0DlIF8j+PNRY15GNYbJJvLgAmp9r2yq8DeGaBURevBdkMi6u5G1Og1pKXlA8NqrJk4KeOvjZdIVYGH9nnRisl9sZG62fy4rfj7wJOnbzcspp95d0cqL2KFEG5zo64UVXwCaLS1608gdbP2k/85qBtIRxOFcw52fLqi9W+GQiabs31xYniVa/A4fCWlKK9ClAF4gjZbC2dfbjTUeSvroN9mVvcc8f4J/vdcS0+0h2K025zZeXe+7y+HTBqbUr6Dbx0jDCYXdTyTRBiTUZUkmMQvsF7+2e/6dStFLPTPI5dEv/idc5/zAf1PSgGeM8K7cMYZ6sGa4H+/JOnBaZNQmInQPoN1l+XXQLtrnbA9Ca9iQXtafPt4BEY8lgE1q/6LgpyAOwocZlrVy3eMEiTFAZQaOD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 10:36:20.0822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d26b9c6-2050-495d-1ef6-08df4c724674
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8206

Some muxes have values of their selector field that are reserved and
must not be selected, so the parent index can't always be taken as the
register value.

struct stm32_mux_cfg already has a table member that is not used by the
muxes. Use it to translate between the parent index and the value of the
selector field, as the generic clk-mux does. When no table is provided,
the behavior is unchanged.

A value read from the hardware that is not in the table is reported as an
out of range index, so the clock is seen as an orphan by the framework,
and setting a parent index not in the table is refused.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/clk-stm32-core.c | 35 +++++++++++++++++++++++++++++------
 drivers/clk/stm32/clk-stm32-core.h |  3 ++-
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
index edabc160a6f2..d426e69f8b5c 100644
--- a/drivers/clk/stm32/clk-stm32-core.c
+++ b/drivers/clk/stm32/clk-stm32-core.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
@@ -105,11 +106,20 @@ static u8 stm32_mux_get_parent(void __iomem *base,
 	const struct stm32_mux_cfg *mux = &data->muxes[mux_id];
 	u32 mask = BIT(mux->width) - 1;
 	u32 val;
+	int i;
 
 	val = readl(base + mux->offset) >> mux->shift;
 	val &= mask;
 
-	return val;
+	if (!mux->table)
+		return val;
+
+	for (i = 0; i < mux->num_table; i++)
+		if (mux->table[i] == val)
+			return i;
+
+	/* u8 return type: report an invalid index (>= num_parents) */
+	return U8_MAX;
 }
 
 static int stm32_mux_set_parent(void __iomem *base,
@@ -120,10 +130,17 @@ static int stm32_mux_set_parent(void __iomem *base,
 
 	u32 mask = BIT(mux->width) - 1;
 	u32 reg = readl(base + mux->offset);
-	u32 val = index << mux->shift;
+	u32 val = index;
+
+	if (mux->table) {
+		if (index >= mux->num_table)
+			return -EINVAL;
+
+		val = mux->table[index];
+	}
 
 	reg &= ~(mask << mux->shift);
-	reg |= val;
+	reg |= val << mux->shift;
 
 	writel(reg, base + mux->offset);
 
@@ -266,14 +283,15 @@ static int clk_stm32_mux_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct clk_stm32_mux *mux = to_clk_stm32_mux(hw);
 	unsigned long flags = 0;
+	int ret;
 
 	spin_lock_irqsave(mux->lock, flags);
 
-	stm32_mux_set_parent(mux->base, mux->clock_data, mux->mux_id, index);
+	ret = stm32_mux_set_parent(mux->base, mux->clock_data, mux->mux_id, index);
 
 	spin_unlock_irqrestore(mux->lock, flags);
 
-	return 0;
+	return ret;
 }
 
 const struct clk_ops clk_stm32_mux_ops = {
@@ -466,13 +484,18 @@ static int clk_stm32_composite_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct clk_stm32_composite *composite = to_clk_stm32_composite(hw);
 	unsigned long flags = 0;
+	int ret;
 
 	spin_lock_irqsave(composite->lock, flags);
 
-	stm32_mux_set_parent(composite->base, composite->clock_data, composite->mux_id, index);
+	ret = stm32_mux_set_parent(composite->base, composite->clock_data,
+				   composite->mux_id, index);
 
 	spin_unlock_irqrestore(composite->lock, flags);
 
+	if (ret)
+		return ret;
+
 	if (composite->clock_data->is_multi_mux) {
 		struct clk_hw *other_mux_hw = composite->clock_data->is_multi_mux(hw);
 
diff --git a/drivers/clk/stm32/clk-stm32-core.h b/drivers/clk/stm32/clk-stm32-core.h
index 4be103710e12..eb07ade7f2cd 100644
--- a/drivers/clk/stm32/clk-stm32-core.h
+++ b/drivers/clk/stm32/clk-stm32-core.h
@@ -13,7 +13,8 @@ struct stm32_mux_cfg {
 	u8	shift;
 	u8	width;
 	u8	flags;
-	u32	*table;
+	const u32 *table;
+	u8	num_table;
 	u8	ready;
 };
 

-- 
2.43.0

