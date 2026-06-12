Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC43374A04;
	Fri, 12 Jun 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781253819; cv=fail; b=lgyJ9GX+s0dTtjWo0GXmakUwVJ/R8I+E9hGyqXnjUaHlM31j+FZ5kc7xbuXqb9UA59qXmUG2tel9E39GpGT4DJViO8tZh/gCEopW0gRd8vw63ZQRYQCTIy5/UxWJtxjz7k/w/6ChI4rKSjCpT80iOMfPT0BhOuAR6kWSSpgS4zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781253819; c=relaxed/simple;
	bh=kLp2NqrkfbmhQJFDqFpTvNT/SgYyaRRAlHCXHa/h0lU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ruFwI2w+07GmqI/k/SPQq5BCqdl4bpzj/nVbBDEQDK/uSCb7C42MYVdChWB8SPH3f2lvm2TUYcv9J7vDFd2lK+8OYIfDdNZvH1bm4hE4PhQ9G3k4zZ5oGx9z2iPqDVQ+bmNBy0jZ/dqc+C3etby+zRYbvNL28uAmOuayM1ZC2nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bhsvfz1F; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Bhsvfz1F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXdQFpzlzuABMiWxpopcQbOqc4bdKeeYx0FO0QxTRa8rgFwtXLDbf7WtKU0+yzQ5wzV73uHZg/gNuUoUFdIKY6TdXraxVU0gQ+6kkKK5ofMo6n7IFk9O4h44w261OUbDjFDNFLq6PECLrCzcWO+dddL9299A4OvMEh1zj/oQuSkrZAt3Qqa+qdSQbJl9uuKcxajkqGu8bovIPw/E+aSUXOuc+44Csa2+KYH6yNAo/QoXLrC6VKt7XbZQYUvrpEroDDSB9vEtiefqTVR+VyoAa7e/nv6iRtnO15+u5c1CRzr1qpRCOnG3E6e8qPahsEGzAwD25liX4Vkkrc0uuXoBwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYqmm2w1jmXSUnJl9Me6aVmrGxiG2TsCH5dxgpjBCrk=;
 b=XflkkJlIE918yu8bqyxxoS0EXaJMqUBSz97tBFiu91c/ZF5VJLLyYL0wrXC5py5gMJcXRjv2rUDaPIXK29gJH6N8gltbE4WHm7D8d19liGcSaqaZ3vi5WCLoh/E8SlFdA2OxVHaJeAesTbiClg2NKiBqNXdEIHkx81OVFHwQIVGxjcTot+Yv5QnUyWr/0uxEHurlZ6mj74H8TTEOVOXYiWyXSdi+WEA0a12hk4I7En+yQOjtEW4CEc9o3Eds+fkVLGR2ZfEkynbxE16itBR4GA5+0mblF8tHgQspI+8EgZuMmvwmM6KUqewQoadtzfGopakzKISspIwPBQ+IVFBheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYqmm2w1jmXSUnJl9Me6aVmrGxiG2TsCH5dxgpjBCrk=;
 b=Bhsvfz1FNhl/0n/+wj5HZCZjKtuJp62g8nbBEK3nJP9lGvTmhnffdW00qgYcRkesGcmkfEkdHjXwahioO2uHTrQLYy5jnat5Yn9a5srq8rF8JdCY2BS6nI222d28zDe5avVpWhIaK+9St5/f1bJjBa276RwBinDfm5u+l6x68vvw8ufVgnmZhJ7ZkNybRRfyn7AP8ovHZjEb+nuI9SM8oKVjbHyYQ9W9kNrcsJYXVRshT2LylkBWq/dj5oDSzcR7eChIaIE2jZxWcKp46JPbGEMOdfXV4sj6bwud4hgQZzQWHTlymWDzC1lbvi9WTj+9SantS8EKOA1WnYsbxwZAbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 08:43:32 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 08:43:32 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 12 Jun 2026 16:46:25 +0800
Subject: [PATCH v10 3/6] clk: conf: Support assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-clk-v10-v10-3-eb92484eda38@nxp.com>
References: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
In-Reply-To: <20260612-clk-v10-v10-0-eb92484eda38@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0274.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f6b921-05f3-44cd-2312-08dec85eaf38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|23010399003|1800799024|376014|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	3jBqm/uAtwUyvwEDzB2hLp1qG8ILyryKnfe8OmS4hvqp0aNejf7zYKaD4CpTf2On6/BRlzHcPqH4h7XEc6Q0QCB4zUxw4YQzIQ6ecd+DspumnCeH8zKdvm+gbz1eXnKjEZlMDxdQqhgq9OByAVij0ANGBGVcHywS9Xq3tz0azCHUjwGQSwvacfpk10B+EG5GItlXSpqo5QcXuwSbHPIBH8IMXhysiwQE5b+urOAzvlgPwIdpWn9A3ObOFwiscmmULXaasHOH7liTdcu0jaCggCKU/8sTqYBlnems61D6TeqWfrFreoHWSUyeqHRKG575REibwEL+68ZLrIq3Kllfd5WjixoKEiaWcC7ahHaknxcmgT6wH0JGuMevdJbz3Cz7EZbJ4959xFxg1uCB52+umef6KoM24zXySV/CVlJug02jv1II8D5op9kn8A/bWiuqqKGPeFYAIaMX3t0nlglELsrt6ooBSjAt2EQgqvcbTudydYP/kBEoKyPgIV7ogcjO//81ICnvnnH3BH4c8VJrvJ/YLisYjuR4l6ei70HtM/yHww+dBYTh/jSLQ+Ucq3bUnJqF/9LkM2G55eo3rdlGzWek3mQHLf8A/114cRkGqI8pohZXbHKIwuGvfS2epAvmtoZC+4SMyJqBYaEh8vxQYdtM4h3Vq75poBFbFZDBzUOIcD0N30KH06UVVAbbMDBE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHZHSy9RcjVTYzcrZDVkdmRzbytJemE1VzBkR2lwdGxsZTlya2NSOHBycEUr?=
 =?utf-8?B?UVhDc1FWQ253cWNLelRrYTE2Qlp2N1ZnblVjUWJnSGRTK3hJTVhCNTZ5V2JP?=
 =?utf-8?B?YmhUUVh0UW1mV3hvRXBGWmRTd1Fxb0tJWHZWQWNSSzZraUhxem05V3Uwb1hn?=
 =?utf-8?B?S3hteTNJR2NweXBmdldBV2NWUHNiVU9QQjg4Vis4RXlEN052TWRqaU1wRkhi?=
 =?utf-8?B?b2dDdTVnY3dkREdRaGc3ZW8rVFNFbSs3ZmxMV281YXc5MHR3bzRtSUlLTmN6?=
 =?utf-8?B?d0lGQW03N2o1c3Y2aUtSQVNVSjVuY01wMkY5emVLbTBqNENIZXgwNkthWUw3?=
 =?utf-8?B?NGNNOWdYT3JENG82SmE3aHBnR1I0bmdiazdWSll2bEhyV0drd3VBUUZzWEhs?=
 =?utf-8?B?WmlMTGgvcDZZQ2tMdElaZUJqTTkrTVN2LzRuQVlndnl0a1lrQmNSMWRYREcr?=
 =?utf-8?B?M2RGelhxYTM1a081OGp1aVQ1WVJ0SHc2aGFuMzlvWkdwNmVESmFoU1FwVEpl?=
 =?utf-8?B?a3JpOStZM2tPRVY1bmYrM1dXbXltVjFjZ05reEtpQ1JlZjk5Q1NwTmg4dUJl?=
 =?utf-8?B?RUNNcFc1MkYzTlNaNHFiVHJyMGU2bGQwUTJEeVJWSVlWcDNPUzhDdmJxQVlP?=
 =?utf-8?B?VW5mOWlBK3dhK1dTZFZmUGhZdGlaRUZ1cFh2dmNpeHk1TkpOT0FMSWMvU3pl?=
 =?utf-8?B?Um9VdXgzeFFMeDI4SW8wVFJWTktPNFlYckZXeFJDQy9NR29JeVI3Ri9Pbkt5?=
 =?utf-8?B?RG1XZjY1SkNPaDYvbGxLcjkxVHZ6b00zYkNGTmhSMTQraWl3dUpYT1ZTVy9h?=
 =?utf-8?B?RzZZVGpOU1FVQm1vNXE5ZlhYaDUrKzJ2Uk83QUp6cCt4bUVmVGFoU3duSjJ1?=
 =?utf-8?B?d2gxMVY3Y3ZSbkZFQ1J4WHZtWHFvRnRRcmY5N3lNMDBWRWMzT0dncHl3aFVC?=
 =?utf-8?B?Wml0V1RSLzA1N2gyMzRwWGYzMTNUeHBOQlZObFpnNTlZZmRmS3NDMjdndVNm?=
 =?utf-8?B?RTlFVGtQdmlWcXZhVUROWWxYcmwyRFBFRXFGVHZIUHdNRWdIalZ4LzlGY1Mv?=
 =?utf-8?B?dnZnVDJMRWRyL2h1RXFTbUM5R01RR3IvV3B1ZzE0VkhvcHErYXZKQWdaa3Zn?=
 =?utf-8?B?dW85R2k5K00zQVJEQXBjTUQ4OHFtNGJjeUp4Z3ovRmFnMDgzajd5WmYyOE9R?=
 =?utf-8?B?bytoS2tNVGpuaHVJcE9TRnZkQnhpNDVsZVVwenV5dnZDbUdoZS9VOXloVVdB?=
 =?utf-8?B?K2RyQW5jMWFYa3pQZ25UeXZkS3dkTU9lTjZNY1FmUVROWFF2Tk8vQ05BK0Z1?=
 =?utf-8?B?S1hpT1FOaE5Jb0k0L3hGNFkwMlVJc1FqSWtkNWRyQ21iMkd1MHpmZUs3eElz?=
 =?utf-8?B?eEJBZ0tBSFRNUzdHclFkR1JZSU9nTFVPQlZrcGoyQTRmMWJqVmJCNzFhMGox?=
 =?utf-8?B?UkZzek45VmlQeVNqYmVMNlAvdkpPdmhFY3ZEUzcrQ3c4QzFTSnNEY3NlUkU1?=
 =?utf-8?B?ekpsaU1NTW9xOTNlUnNseSs3aGlqK3U2QTc3SXhBZUFtNVZWM2ZDNU12cUd5?=
 =?utf-8?B?ZzU1RXh2Tk5VSnpXN2F2azd2bDE3bDQxT1BFbElxaFhtMDJ4bDMxUjBVdlc1?=
 =?utf-8?B?Z3gxRldpT3p3VnpaOVo3RmhUbnlUaGlpRlBJZE1YVXNGU0x4bUt6VWFOTzkw?=
 =?utf-8?B?eS9PaFJQdlg3ODhGcWZEYWMyTE03QXp0cFhGallmaUJoTG5CZ0NuZHh0ekdr?=
 =?utf-8?B?QlJvM0ovemVhQlRPTVg3MFM0ZGRZT3gwVTNWNzZ0SWpJWThKUGUyUUpCSHA5?=
 =?utf-8?B?a1J5MDVrQzQxajBmZUhXbVFtbW1RS0RmWFhvM0QyMTgxbVZTUWdJUzd2TXJW?=
 =?utf-8?B?c3U2b3E0Y2xIVkl0SVoxajNYKzZIUUk2Z3I4cUFnMy9BTi9ZalB1SU42N0lI?=
 =?utf-8?B?OVk5OXlBL0RRZ3NDTURRcENRKzJ2ZExNeEppUXlJellYTEJkZ3p6Z2hZbVlF?=
 =?utf-8?B?SitzMlRUSzh0SGUwSkhEdzdvcU13TXVXY3ArT0cycUM2YTRRWnVHS2VwNDJC?=
 =?utf-8?B?NnFGdmFhUEV1R1VGVnhoV25EMXR0WndHVzVZQWlvUm1Dd0xBRTJXRkZoWEtL?=
 =?utf-8?B?OVBmOFNQYmxTOXYwVXlqb2tCVHlSNnpkZ2VEWE1oUE9jOEtjZ1hUQ2cyVHlv?=
 =?utf-8?B?MmRrb3FzWVcrbXVPakF2aCtZbmdTcyt1aktkb0pFQmVGWkJrMjBCdVY4QUpa?=
 =?utf-8?B?WHdvYlJmdEt0Rm9QRkZsdVYwUzJ6bllGSTVzbU5CNmE3UjNuN0Vqdk1peXA1?=
 =?utf-8?B?MHh6S0xHVkJneWpWbDFtdTk0OTV6MHVDRlU1emJUaXZpOXhuakUzT29mVjJx?=
 =?utf-8?Q?U1NTHtIiFGEuizu4/PXB9p89Hzn8GTusap3ih?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f6b921-05f3-44cd-2312-08dec85eaf38
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 08:43:32.6564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qKcvu4tzTokPKwE0G3cxbK6KqBM4qWJMZfaluLz3hez53lKi/yQReWYHgzGWyrnFJlkyymMnXGtRiHdl0ch58EBA1GhCNIzyMPQn+PCegZ6KpfOgQI8yCfHjP2sQy5X2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

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

