Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A193AB265;
	Thu, 12 Mar 2026 06:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298654; cv=fail; b=ukBwBkRZHAm78s0KJ4XE7L8+1nkDqOkHUAmST57ezLx5Fbw3CiCb1Y/pmRvle85jsCN9buSHO1Q+eYNEKhd73Zdb1wHYdWN3ETLA8yA8BWQrK9d07MrdVwJ4DTwDw/VsotDMiOQQA229/eMU7CPQRGlcB0HZa84qXr3rFnB0ao0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298654; c=relaxed/simple;
	bh=C/xvqBForQ9M7yQs/Rlj78I3S3NA9JZfmzorGZOmgRo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SrFTt+THcHozhIUAzRpzncYHFc2YwMooUSSucbsfEOfk9hlXU1YKVnlffmZgXTSLjavrGu2F1qh1bbzkG9bsckxwEZs3cEYyNJelxUQ2hBzjUmLFbq/Z3CwS6gGJYyeo8eVr3zfO+OP6Sb/KYon5Jk4Uej8BHmCQX30BBZs3MM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=voPCU1nt; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="voPCU1nt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy+kQjWaQBmCDx6LiYlocC53FNV3cPBJyiSiIZ6x8+176DXMEZusAZJ8/pLkTQDfWkv71VCDnAdh9WjkdulyaFeeaGGxSEX4Ntp8E7PtFn3Mr83Ic2yoll22DLI4WySdpeS1ZMX1GxxCud5rCQfW46guRP3J9iZnuleRPW/9P6dzm+hF3/d+PeizTF5iKjnxGCBNP2qzL6tT3axVacRj/1NniZPn1Ln/VrkzFVZ8GqbN2x+ARMvjVYc0cplUIzhkbkU8pD+m0LPHaxFIWS2DJLL9O6lPnK7bx/hK/4fbZX+jylo+NvrhxyrXbK236QI3e9yDNpBX3CaUqFf+acU5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCtuE+UCAQjSInpef+rs5kwlWw6wbPSZJ85LhAy5n3M=;
 b=L/57LuXzFg08AqvD3MOaQqZ9q0J+bjQitaJu4QxOgeWnq/xwRtVYoSdbPkNAKKIx4jJtyVmWviJPNCARM10/5tzZWlcDQBCnkDghTLJt8s6RbTm/dh8JGyhlDQLQu9tRlKS4zgw7XokqufMqUqE0mo5NG5dMVEOtFxUh2CG7nc11oqfrVMe3lATyC361vL0ahdh7BoZuSssKWUlEYOSEKFU9sHrTb8e98i3jK+1Vjg9o0m/HyWmBC0DCwpsIdvLg0W+sm48SX2bRra6w1/7n7PB8NG8xlzFBUtwdty6ZFnO6hireSFDbn+IcBIUpr11QzNcPRATOB5iYOhuO6yuAyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCtuE+UCAQjSInpef+rs5kwlWw6wbPSZJ85LhAy5n3M=;
 b=voPCU1ntE0qsHgKG/9brWVrL51cskVXGzx/z0ypH9zoKYK+JbzR4dsfeoUWBgcAMSNoMcEv5moTEovS4DJcHYNPdMDQW0wo9HeYWVCz7VWsx8amLR/5kP1KVckTtyCLRVvPVRZrFzIdB0wVPQn2SL6hNKufsoonWTtZt/gpaO1kUwdtOpU1EsHER2akoMfgiPoqMImvCnAsHfbX6B0t/rLnIYIhIucPPqEteJvp+5BkkPrkzvXl62LOx6um18Rqm10X8f6OH1U9agBFG+w+H8HbX5pPtmzMJPJIkuVYp5lCQOJoU9LJHmX2sU60QCkO4s3BQ1zvlkJ+mkUzG+UVRVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:57:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 06:57:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 14:58:18 +0800
Subject: [PATCH v9 2/6] clk: Introduce clk_hw_set_spread_spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-clk-ssc-v7-1-v9-2-0a9d2e188d9e@nxp.com>
References: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
In-Reply-To: <20260312-clk-ssc-v7-1-v9-0-0a9d2e188d9e@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MAXP287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::35) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: c3839c2a-dbf6-4022-324d-08de80049f43
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	NQi25uCMiFryvjhAmcPXVoQ+ZC1jXmcGidwPcLgYfHk/0n+60wCQp3NFsCZIdsxVIxyVVULWu3mTgzDocRuJEnCCWQR9FgZ9yHWqcM7vksT4dF8qZ9HD+Kgn/fn1ZvBwOgzAi4XFh+X+j03EFRhJT2PKoWCchl9d0Aovi7yvjvtGgmLI5HMkHzHTewycN/paVKC62yScQ6xI6Z52+R4Y2mlEkF2CjVvPurhIpSgURtS4wpDuBrhxB+paDKz8lJK/j0qRECBfat0PkUUidm1F6X1U9YE//qYYi0Z0QM1+hHQVcOMSauIyhB/nxIOLTlfFqiPigiSuC7ndFiMSripjVTxP4+kJfu8rKCjPQfILL5W+7MCNIompx4Ui2Fb9FhgNJe90ddK1QFrpCuENYHzAwhRkUFRhINMm2a26KtbXi1zD3XzZU2YOGhBBT0D4M9HOq7MyuTwjQLm6YEN6609m3/tNYyNZFMggaQb9RJZCtIIWJKNHY4Nw0JgOj2BeiRR+Vyuz9XCx1xF5yajjGY6IXaxdn3ao3d8yjvv/L1fmZTQU6H5UOPGFN8eJnNd3OzOV4LwQJep5ZFHPuV/PVT98ROu9AFUnd7Ic2Lpx4sUwyB8mzuXvY9Gp3KhmxZbts67HmHz03Mota3iu+utXrrmAn4HLleHwZAn96W3uwX8dGIMjWYnN7XjiEcNsGr5JYMDzXmQZO2mgldfmqPsR2EmF1Hs87j3doLoFF2jUVUiJiqlXjc2bWmA7u1p/qy1cFJhyOlfzQP6hoXlXc0ou9k9GPQfWk+FO5OfQ8haYvy9/so8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0Y2SFRpQW5ZMFJDTXN0a0pRQUFGSlM0RHdxdWFNaTZ1bG9oV25tUGFrN1pG?=
 =?utf-8?B?dGxLbk1TbFBrdGJtSmJYcTJ0c2M0d2RYWGJmaHdudnlnNEo0UXRBbkFaUUF2?=
 =?utf-8?B?YlBld2NRR1VRaDRocnRLQS9uSXZMbi9YbjFiT1JiN1dPaDlJMW1LZjM5Nmg2?=
 =?utf-8?B?SVMrQ1VZbHRQVWpNMHRXVUdxd3N1THFsOHk5SVI4Zk5HWFVubGhJUDVtVW5Y?=
 =?utf-8?B?dVlrVG1qTnlWb0t6N3VTZnRWTDZrK1QvQkFIYWROcm9ZdGgvN1lQdGM2OHpk?=
 =?utf-8?B?dlRUWkNJK28xTGNPY3U4VU5xOHlQcC83ekxkK2M4ZXRmeTRVUDNJdUFQNHha?=
 =?utf-8?B?S1Biako5azdFamx1WHU0WHNXZ1hEWDB5Yno0OUZKQ0k3RGFsakF4Ym9yM1Qx?=
 =?utf-8?B?MEtDL1g1OCsyWlB4RTF0U2h4M0RFVkpoVGRJN3NzeElFVm5qVGwweml1UUdG?=
 =?utf-8?B?a3RHUm5WSmNaYkJXYjN2QkZBY1V6UnBTQTVmYmxlc3RSK2FwTVluOTBZblhJ?=
 =?utf-8?B?YWY4SGdzTm9TK3hBMFpKY3J1Y2dWNTdZd3FyaVZmYnU5aERsU29yMFFTdy9w?=
 =?utf-8?B?TjVMVitUK1BLeWVzNFJMdnJtR0JzVTdjYmJpK3dTOGk3cTlGdHd1d0pZSDBR?=
 =?utf-8?B?TDhhRVRBQ3lQQjFQUjBPWkJYaFozWkd1Q09uQm02U29nWU9RZDZiRldmNU5L?=
 =?utf-8?B?UUdPcU94cHdvNDBQdXhsOE1qUlZCUis1WTM3RENnTFNkT2dRNHhnU3pEbW1N?=
 =?utf-8?B?eWdtRERYbDVkK3RCZ2dmZlRYcnBQbWZMdURYNElONVc1LzA4REs1V0FPVzlP?=
 =?utf-8?B?ZTljTTE2VVNHS3lkTGdXWkRGM2l5VFFCWmpUT0NsMjVzUzV0Tkl5TXZvV1h3?=
 =?utf-8?B?cWxMMHhZcWZrWDZ3WCtvc2YrVTRWU3pCaHl4TEY4TmNZaEtIRWhZUFZYTGtF?=
 =?utf-8?B?OW5mOGVSKzlIOTBBaUpHK2dXNjFMN1J5NXZkdUtKNnFtVzh0VlhhZW9mNU1X?=
 =?utf-8?B?WmtEM3JLbU1UWis2L0hzMFVUZTYxOVhpT20xdTdPMVg0K2lLS3FmOWVNM1Fy?=
 =?utf-8?B?bUNBeEFlaldQT0FHTHhNYTJTRGI4ek5NQWR6WEFtR1RMM1NYc2ZVZTJseW55?=
 =?utf-8?B?UHZLTVdLazAzZGN0ekZCa25lVHJTaDFkWHdtdGc0ZW95WG56VG9TRmZvM0NP?=
 =?utf-8?B?c29XTDdXbVF6K3luUkhmUmthRWZMeGVnWVUwQzMxS253ZEVpRTh3KzNza3V2?=
 =?utf-8?B?MmpXdHBTS0dUemR1cHR5VXZzRGRXODBtNityVWlHK2p2RDdlU1VYYjd5TVUw?=
 =?utf-8?B?SExqeUUrR1RvK3Q5YjBiZFpCMzBYQk5rbUJZcE4rc3BZSHhrbUg1ZFlhOGIy?=
 =?utf-8?B?aDhLSkJEMHdqY0tOd21qVnFwdCtzZkI3bFBSL1BBNi9Sd3hwUk5ZRGpZM2dX?=
 =?utf-8?B?Y1RWby94aVI3YTh3eHE4VlllSm5jemZ3UVovSWt0Sy9VQlpseXIzYTYzK2RY?=
 =?utf-8?B?bEROYUFibjA2QXZGNVIwQVJ0aDVvL1JidGkrTVBBTjliK3VLV2tVV0tKQ2Iw?=
 =?utf-8?B?WDdIcDBKMERSZm81c1l1eitHRUpLbzJGUjZLYUNpb1I5SHFobjRqNkFhSDVp?=
 =?utf-8?B?ZkgxT3p6RHFkeU5oNmZIc0tEZVR2QWVYeDY5cmgrNXVnamplN1VNNkF5aGth?=
 =?utf-8?B?SjVKOXVzZzlYVjY2ODUwRExjd2F2d1BvdGhaNVlqK09kSVJrVjlFSFZZcnQ4?=
 =?utf-8?B?a0V6aXkzUUxSL3BvSHBLekdMT2kwNHJQYVViczlxSEhCZy9pK1grbFFaWkNO?=
 =?utf-8?B?MkVVTWdSY3Y4cGRqZzRQc1Fjd1JBbitpYVhvY2Z6YVc1dlVaTGJmNEVyRlZ1?=
 =?utf-8?B?QVVtRStDUU5aTVloNC95RVVJMG1yMXNRdjExTGViUTRLNW90ZnE2dkc3TFFw?=
 =?utf-8?B?eG5sVDBMWlZrT0Y5ek9DNVBmbFdiRmsyWldYbk80RGxyMGJOUzMwTUN3REpD?=
 =?utf-8?B?b1pRamR3NGdBdllUOU10NC9TRDlVa01sVFB3VEEvSW0yVHFhSlAvKyszRDBL?=
 =?utf-8?B?bGZvWGlJS3pPamZQYXd2czVLN1llMXgzcEhEOFMzZCtoMlJZREVSMmFyRDJF?=
 =?utf-8?B?TC9DbDBYckJScDh5ZDhSc3RvZkM5NEdGOXBUeTByZU1KY2ljSTNyZWZQNzk1?=
 =?utf-8?B?UVlTV0JnWk9tYTdtZ2Z2bXkxdmsvYkJUWjFiY0RVd2NtTCt4MW10STFJemQ5?=
 =?utf-8?B?OFpEMWx2b25vUFpsMkkrV2lkZzBZdGEzbnZ4UmlrVjNzS3NvRVN6aHJjNG4r?=
 =?utf-8?B?SlFNN1FmQmVtY2pFWEE0VzU3OENpUjRjeFg0aDhxU3VhTktDSjhUZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3839c2a-dbf6-4022-324d-08de80049f43
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:57:27.4435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFzBDq3GjJ1o88EKtEhjQVSMEtrqxBlj4EWokmS/dvDa7dOXrVJimOBrFQejwtFcT8fYfbz2j158L5z5mKultw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

From: Peng Fan <peng.fan@nxp.com>

Add clk_hw_set_spread_spectrum to configure a clock to enable spread
spectrum feature. set_spread_spectrum ops is added for clk drivers to
have their own hardware specific implementation.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk.c            | 27 +++++++++++++++++++++++++++
 include/linux/clk-provider.h | 31 +++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 47093cda9df32223c1120c3710261296027c4cd3..3d9b2e2f7a5b269e1f07bdcd4101799ff6839441 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2784,6 +2784,33 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_core *core;
+	int ret;
+
+	if (!hw)
+		return 0;
+
+	core = hw->core;
+
+	clk_prepare_lock();
+
+	ret = clk_pm_runtime_get(core);
+	if (ret)
+		goto fail;
+
+	if (core->ops->set_spread_spectrum)
+		ret = core->ops->set_spread_spectrum(hw, ss_conf);
+
+	clk_pm_runtime_put(core);
+
+fail:
+	clk_prepare_unlock();
+	return ret;
+}
+EXPORT_SYMBOL_GPL(clk_hw_set_spread_spectrum);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 630705a47129453c241f1b1755f2c2f2a7ed8f77..9ec25bbccd613eafd77aca080dd7f51b1bfdadc1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -6,6 +6,7 @@
 #ifndef __LINUX_CLK_PROVIDER_H
 #define __LINUX_CLK_PROVIDER_H
 
+#include <dt-bindings/clock/clock.h>
 #include <linux/of.h>
 #include <linux/of_clk.h>
 
@@ -84,6 +85,26 @@ struct clk_duty {
 	unsigned int den;
 };
 
+enum clk_ssc_method {
+	CLK_SPREAD_NO		= CLK_SSC_NO_SPREAD,
+	CLK_SPREAD_CENTER	= CLK_SSC_CENTER_SPREAD,
+	CLK_SPREAD_UP		= CLK_SSC_UP_SPREAD,
+	CLK_SPREAD_DOWN		= CLK_SSC_DOWN_SPREAD,
+};
+
+/**
+ * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
+ *
+ * @modfreq_hz:		Modulation frequency
+ * @spread_bp:		Modulation percent in permyriad
+ * @method:		Modulation method
+ */
+struct clk_spread_spectrum {
+	u32 modfreq_hz;
+	u32 spread_bp;
+	enum clk_ssc_method method;
+};
+
 /**
  * struct clk_ops -  Callback operations for hardware clocks; these are to
  * be provided by the clock implementation, and will be called by drivers
@@ -178,6 +199,12 @@ struct clk_duty {
  *		separately via calls to .set_parent and .set_rate.
  *		Returns 0 on success, -EERROR otherwise.
  *
+ * @set_spread_spectrum: Optional callback used to configure the spread
+ *		spectrum modulation frequency, percentage, and method
+ *		to reduce EMI by spreading the clock frequency over a
+ *		wider range.
+ *		Returns 0 on success, -EERROR otherwise.
+ *
  * @recalc_accuracy: Recalculate the accuracy of this clock. The clock accuracy
  *		is expressed in ppb (parts per billion). The parent accuracy is
  *		an input parameter.
@@ -255,6 +282,8 @@ struct clk_ops {
 	int		(*set_rate_and_parent)(struct clk_hw *hw,
 				    unsigned long rate,
 				    unsigned long parent_rate, u8 index);
+	int		(*set_spread_spectrum)(struct clk_hw *hw,
+					       const struct clk_spread_spectrum *ss_conf);
 	unsigned long	(*recalc_accuracy)(struct clk_hw *hw,
 					   unsigned long parent_accuracy);
 	int		(*get_phase)(struct clk_hw *hw);
@@ -1430,6 +1459,8 @@ void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
 			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
+int clk_hw_set_spread_spectrum(struct clk_hw *hw,
+			       const struct clk_spread_spectrum *ss_conf);
 
 static inline void __clk_hw_set_clk(struct clk_hw *dst, struct clk_hw *src)
 {

-- 
2.37.1

