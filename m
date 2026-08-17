Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1313F8EA2;
	Mon, 17 Aug 2026 10:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964176; cv=fail; b=LAteam1OHDBQRPUKd670sJrpjg7elna5LaQ3S96wL/xu4Xr1D8i/xKKlwhPpnzLNEtQPBDfkpAO51sfrkgK8qJrs23Y+4GcoWRroqzA56SzjCe6V6WcQtMIC0ao+hjf1nepHjc4h7qrAbc4aNxqfu/K8+oTqGAzmBQNB0YoTfuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964176; c=relaxed/simple;
	bh=kLp2NqrkfbmhQJFDqFpTvNT/SgYyaRRAlHCXHa/h0lU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m3ueGwU9uwjA0gbPJKHGsxnXSxhVx+7eeCGIfD1SCzxdgf+hXDnod8oVWlyvXds5FuT+YrgwuTy2lEVjc5px6sUg3MWTrRQCwPBPLDiN6N1XUWw+YDFUF+rD00NLG7LQafR6ccX3HfGkwjLEcCbmzz6oDRt6jKB2G8ZAYAmFed4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pju7ycXy; arc=fail smtp.client-ip=52.101.84.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pju7ycXy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0KT8o5QO6VQY1gd/69HqnLAHe8ATfbGL9U6IcY9AQpNuPjFc71t/TsUadYBTg0ytSo5phUkgEeX5y1cZfhyB56yR4CechclQ4YHYRQB2hhq36r4UQMmViHDZ8Z/E1r0nAnGsSzh00Dj+Iilz1M6kIbzPARgV/Jo5m1EGQXZ2+c4fiUXuCFoKzaYlZagl7TrGQ08vpxhcLseqj3Db9OdwpRD+VQXKigUPv9V/9u7cX412ZCyI6WqCrpc2U4d9/WtmKQ4GF4ejKYYovOaxR7J9lnGw0l99utKMgL0cvUiHZzRPFxoLjyYFaM4XEHh0mDZCPfybYOqJkCwzAbawZXwCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYqmm2w1jmXSUnJl9Me6aVmrGxiG2TsCH5dxgpjBCrk=;
 b=f2Ht+eoUmw3KIyYpdw6SwHIwBJDbi2yYeTGBDi22jdhbQcGCyb9XDrcYEk43cEKkyB8H1j96jz90lUG4v5TInD2uG21YW2oAKKbwL5KqjeTgw2nYqhHKXDSVIeCkwo+EHBYrlR017ApCedlRHQgx7K3rfJTFCZ4kV+4O+MBcFR+HwgefZbJ8mGwo0+41F3NnVay/iKE3NK3ePwI483QmyJaM1O5g5BV+JAzOgbhy6PWeTdvoC4tiYbm/igNTUztl+piHuAV8pjxSGMuUdwiMb8l5+THKee2ar1ce7HXLF/5horzJqB/MbAx3AnZ8vsg7KLekDnRSQ+WTfXos0AiNAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYqmm2w1jmXSUnJl9Me6aVmrGxiG2TsCH5dxgpjBCrk=;
 b=pju7ycXyc2iM2KVX+HRCL5sOsMMbOVHNXDmPJyAeHOUIGrmNSIl5d9hHEv4ddPTgvSokmYByQzKJ5bnKorXLyJ6fY7+72laDBwXmoMJyshh6eygS3IX7O3OeLZK+QT/tL+tv35H19LQ0XdSy+4LRMozlaeH8sv1tLaCOgo4rqy7GTwGhwN9Hy3HLC5eBXu+QBM7t8dF4dYqQMwN1rQhsjWkUMmrrdqmIvCkSS6YN70qmZoKuRyW9dlY/j5K0T9X2I3bTkoH0jJ+R6dwamrs2jMu13q5MUdI4CrZ7MViLvLU4sTFnEO4vyjdZrLKxbIm5upZ9IA9nMM3pywsLCnnyBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV1PR04MB9072.eurprd04.prod.outlook.com (2603:10a6:150:23::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:55:59 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:55:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 18:59:34 +0800
Subject: [PATCH v11 3/6] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-clk-v11-v11-3-36e9bc701b11@nxp.com>
References: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
In-Reply-To: <20260817-clk-v11-v11-0-36e9bc701b11@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SI3PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:295::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV1PR04MB9072:EE_
X-MS-Office365-Filtering-Correlation-Id: b738b358-9153-4b0f-10fb-08defc4e1f11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|7416014|376014|366016|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lCOSKeY4W6gENZVuznC5RVpen01/VwWtHAAixuRqUMNlDh8vNUZPICBE6DgfG1SgC8NdC9CB7Il2e/f7AY+Zvr4Z6xi6EN4NTcynBogMxG95DO/xQIEwi0PBRgZryqRJelgaQLHlIlV28NT1zCKMPVwzE3MmpWHTdu098aPSans8JunJ6II9zinC+wB1RXQ62qHqSDanMh1G1QrcfnvX98ZqWLqfz2NSAiY9Lx+ASyenmda4frGbc/5GY19no84FNPjMqLwjcL6EpjhkocESIvwLUMJf8CU4gG7nRx1ueLv2Z26u7s4TJB4OKCfgegwkY8oFo27uDCXxGHJrQJpTYfnF62u+qseGIycWpygp7LDaF1+/lxwAYG36/vSNFlMqxSSyPPt7j8pZKUU/VvxhxtvN0a9mfNXM/2h0jJyjpDn3ewi1hDnB6nMhMvId6DlZL7Q8Eovkrdv+dJuowG9ULs2CTkgDxLoADP9xLwDnuqz4RjI3oyQttF+icme81DPwKjiUDhLwnjUgJzwFCETQR7Px4sS/oDOc+eu1Ba2/RnzQOHj7fGQxHhKnwV45IFbsSYEA1IHbLmAiv+5L/fXI2P+zcETWDL1F4pqvgKBi2kUNrMw41FRbywCZKZ1A/+pGTPjxqNGDFvgtC6i0n/vp8gQVfjvECSuz/8wnIodw2o8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFNDR1NwalJpazN5VnZzbHR3cFpPekZzMzlyQ2JhY2xuaExyUWJzSVMza3dL?=
 =?utf-8?B?WFE5ZEM5REtHOThjNytSWWhwdENWZHN4ZzJ6K0dHcUVRbjdGQXhVR2FWK1VX?=
 =?utf-8?B?RlZwUnJJcmpPNExsdjQram1ZOGJZZit1SEQvcmJ2MmpJNDN0ZkE2TW9VS1lP?=
 =?utf-8?B?VHdEWDZoMHJMcnIwZFYxbElMNkdrNmd0YUdHZndaUzdONDhzZ2tnbWlOT2J6?=
 =?utf-8?B?dWhlei9Ma1lTYjFUejc4NE1aMkkyTGVHNWcyb281eFpsbVpNWGtlZjZDeGUy?=
 =?utf-8?B?enFFaHpUZG0vWlJPUHNHZUZ3QWFjdFUyTCs1Y2NsVnA1VStQWHI1NWJJRnFY?=
 =?utf-8?B?ajRLckVTY0VlV2ZvY3kxYWs5RHhQS0JJcXd5N1V6M2pFdmRjZGVDdXVUZjF0?=
 =?utf-8?B?dWNNTGlCV2kyTTZwMWZXRWkzZnhWcUpPT3VhQlpUd3NQM1JZdlpCSVFHak8w?=
 =?utf-8?B?TFd6TXIxK1ZxYVBYK3crVUQxM3dJMlFpUWFyOTV4ejVGa09yK2g2b04wNmxp?=
 =?utf-8?B?dTZGTXBEMVVQb3Z4V3hNMmNublZ2NzhZSlNyY2hqdHRvMTMrY29jY092OC8v?=
 =?utf-8?B?T0U4NmhVTFRxSFFhOTFJbUlBb29jSkthTzU0aVlibWJVa0grTTNYL1c4ZGlw?=
 =?utf-8?B?eEYwWHVBSTg5alhzVEp4SzVwdk5LbHVZUG14V0dkbG4rNVJEWTM4d24zRXVJ?=
 =?utf-8?B?VE5hNTZxUWxGenBjSmU3dlZjRWxzSWNweDh2SEpLazhYc1RySzdXMzZLMGVi?=
 =?utf-8?B?SER2OENEYTRVV3Y4YWlBamJrZTNZWjVyU3RzWVNJRUIyNmFpcVVPdW1ZOEhk?=
 =?utf-8?B?c0Zreld1NTkrUW5zMVRpUXJaaGVyUDU2Yy9zLzQwZVhaSnJKaUVkRFpJcFlD?=
 =?utf-8?B?eXJ3aERVSWpJYU9jZlByZDFJTWl2VFpzVUt2TFA2ZFBTTXpCMGc2VXJrd3Rp?=
 =?utf-8?B?S1lWZUdpWTF6K2JCVzlheTlaNHJaT1RnWXZDWVVXL053cW9nTGdBQ3dmbUdH?=
 =?utf-8?B?TUl6NFhYS3Mva3RKM2RTdWJnVGxBZ1NUL0p6RndEcCtpWmtQbXJ4ckQ5eGcx?=
 =?utf-8?B?VTRmTGRFaW1OVkxGYWt2aFRHV2NaSlRrQmJDNVhFd1hteU9Mbzk4czRTRUdl?=
 =?utf-8?B?QWJhMUhmQ1hESUNSdnAvanYrMzF6UVlEZzhmSmRIUVZ5N2JKUDdUMWJ2SGpX?=
 =?utf-8?B?bE9kNndXN2VXcDlLdHI4SmhBWnU0d0o0QisvejNyYTlwN1V1N3JHOUpNMmJB?=
 =?utf-8?B?ek54UE1jZG9ua2FobUV0MGVGUG00citscDZoVkJ2T1duRzRrV21LeWljU1I2?=
 =?utf-8?B?czEvaVFrSkJrVHdIcm1UTFBRQkV5blVOcVhILzgxdmpSN05BT3B0UWtCZUdq?=
 =?utf-8?B?UGxtNVF3aU1NN1dhM1JnTVFMVXQvUU1vVWxvWFhUVUZzVE0vZEZLekRWVDJE?=
 =?utf-8?B?ZzFkdkZBblNuYTRUa0VYL0JONG4vZ0tQa21CQ0FVZDQ0RzM1UXpkY2ZmUVJv?=
 =?utf-8?B?dEExQWJXVTR2cVI1SHIyTlNQUFBPN1FybDNiUjRBaGNQelU2QnJqOVNNU0to?=
 =?utf-8?B?eTByU1FWMzVUZytsS004NVllbkFYak5zZ2tEUDlsRUxHd3JGcEtOSHRhQS9H?=
 =?utf-8?B?R0lmdnNNQVVEUWc1a0xIWkR2dWJqeWVrY0w5T3Z6TnhpQ0hmeDl1bHBFYWJn?=
 =?utf-8?B?QXcyTmFpcVlRNSsxWStobnRuOWF1ZTgyTEx0RWdXcjdiNXdvdEdqS0JJajY0?=
 =?utf-8?B?NjA3aXVzYldBNUR6aXpaOW1uWmxKOUhVTk1rdi9Id2lOdVR0cmMzcCtlZGpl?=
 =?utf-8?B?VjB0U3lOMiszdEJZSy85NjAwYVlPeWhJcC9JaUNHQUZzenBySkNPT0FIRU5l?=
 =?utf-8?B?T3FScElNMEd2aXRjanprdnRsbEl1SklPeEdvOWtTekk3d2xseDVTYzRmS2lD?=
 =?utf-8?B?NnhrQSs2d1JRaW1ZeE9obk1XL3NBNlVCQVR2TFdIOHNzdm9kRHBZT2RVb015?=
 =?utf-8?B?SndRRGFEMjZzbFhHY3F4S2pSRHBZVktkVnQ3KzRYemhrS29Xb0RmK0tCTkpC?=
 =?utf-8?B?VHFkY2haQWs2NjJtMkJDVjNDTFZpK2huZ2UxUDlvdy9JVlA4UVNTL253NEJk?=
 =?utf-8?B?YVZ0YVlCVUFCeGRGVGJQbEVmaGtwSlo3ZHVQZGo4WG5nYll3OE9CUkhVbisr?=
 =?utf-8?B?d2dnTmRGc2JBZTh4UXNvcVlKLzkrb2dMSFA5RFpzSEZpOGlvck1NOG1Cc3pK?=
 =?utf-8?B?VlVxeUdURS9iSHBmZHJ2WkdnWE95WENteDh1Z0ZjMHp2TEdFY2NuZWZENmh0?=
 =?utf-8?B?R0hWUi9mV05kaWZTaG8xbzN0bkY5RS9BY3lRR1FtSFdzeXA4K05DZG9CU05i?=
 =?utf-8?Q?MkRGP1/2tD1Ps42xHKVifkZxcO8LzzkEIJOFz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b738b358-9153-4b0f-10fb-08defc4e1f11
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:55:59.2981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXxnbN83s+vhUvfqnPS7nkoX/TnpI5Vk8aK2oPXa2mCEsBkA+yfLRciZM+Po0zGJvMp8AZbV3da4QaMUg3a1lxNjYHIsyoo7/jKrLa3336YDOaoaJ7xAasVQWIZMdHCJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9072

From: Peng Fan <peng.fan@nxp.com>

Parse the Spread Spectrum Configuration(SSC) from device tree and configure
them before using the clock.

Each SSC is three u32 elements which means '<modfreq spreaddepth
modmethod>', so assigned-clock-sscs is an array of multiple three u32
elements.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-conf.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 303a0bb26e54a..550b8ae375a2c 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -155,6 +155,78 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 	return 0;
 }
 
+static int __set_clk_spread_spectrum(struct device_node *node, bool clk_supplier)
+{
+	u32 elem_size = sizeof(struct clk_spread_spectrum);
+	struct clk_spread_spectrum *sscs;
+	struct of_phandle_args clkspec;
+	int rc, count, index;
+	struct clk *clk;
+
+	/* modfreq, spreadPercent, modmethod */
+	count = of_property_count_elems_of_size(node, "assigned-clock-sscs", elem_size);
+	if (count <= 0)
+		return 0;
+
+	sscs = kcalloc(count, elem_size, GFP_KERNEL);
+	if (!sscs)
+		return -ENOMEM;
+
+	rc = of_property_read_u32_array(node, "assigned-clock-sscs", (u32 *)sscs,
+					count * 3);
+	if (rc)
+		goto free_sscs;
+
+	for (index = 0; index < count; index++) {
+		struct clk_spread_spectrum *conf = &sscs[index];
+		struct clk_hw *hw;
+
+		if (!conf->modfreq_hz && !conf->spread_bp && !conf->method)
+			continue;
+
+		rc = of_parse_phandle_with_args(node, "assigned-clocks", "#clock-cells",
+						index, &clkspec);
+		if (rc < 0) {
+			/* skip empty (null) phandles */
+			if (rc == -ENOENT) {
+				rc = 0;
+				continue;
+			} else
+				goto free_sscs;
+		}
+
+		if (clkspec.np == node && !clk_supplier) {
+			of_node_put(clkspec.np);
+			goto free_sscs;
+		}
+
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			if (PTR_ERR(clk) != -EPROBE_DEFER)
+				pr_warn("clk: couldn't get clock %d for %pOF\n",
+					index, node);
+			rc = PTR_ERR(clk);
+			goto free_sscs;
+		}
+
+		hw = __clk_get_hw(clk);
+		rc = clk_hw_set_spread_spectrum(hw, conf);
+		if (rc < 0) {
+			pr_err("clk: couldn't set %s clk spread spectrum %u %u %u: %d\n",
+			       __clk_get_name(clk), conf->modfreq_hz, conf->spread_bp,
+			       conf->method, rc);
+			/* Do not fail */
+			rc = 0;
+		}
+		clk_put(clk);
+	}
+
+free_sscs:
+	kfree(sscs);
+	return rc;
+}
+
 /**
  * of_clk_set_defaults() - parse and set assigned clocks configuration
  * @node: device node to apply clock settings for
@@ -174,6 +246,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
 	if (!node)
 		return 0;
 
+	rc = __set_clk_spread_spectrum(node, clk_supplier);
+	if (rc < 0)
+		return rc;
+
 	rc = __set_clk_parents(node, clk_supplier);
 	if (rc < 0)
 		return rc;

-- 
2.34.1

