Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E523EAC68;
	Mon, 17 Aug 2026 10:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786964187; cv=fail; b=NNJDn3mzaVdKxJajJxc+wtge3H308AvgdwcpTpMQWMwRT2aNbOkDGMqb3X2O7lQzZS6Hharl3X+84shq2MVb1shMW493zq5eymLuU0cUBbsqWE19c/o/3g0OFLKxX5QMMuq+QCNHauQ1k7oOFF96jI2eDS4eL7rjsXJlzGPRyV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786964187; c=relaxed/simple;
	bh=6wqKcduliaAImEnU+6fyFMA/quCnbMgwLea1/sGh2Og=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SZg2h7hDmoNVgwDqIwMiB8/fNfB+pdItdo9t2/n9Z1zpw/cGuM9G3VPwUWfDw734CFILBYGR9cKMvRoTypDcMslzlBZJvrYYN1aMk9ySmxRXvZJ2wdLxBeKjxeV6x3FNCZCyMy4ajVNAhm7rUcBVGGRJP/woyhkwPVJFnRBM7FU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YgtSV5sz; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YgtSV5sz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMHH0MmTrP1yCH68N2ApzwjZIpNe8SfhziuQ4kWNtwnUCwzrt4RQ9/FfOG9o2hurbxBQhD2oMjdrkmI6USKkoU+ewkEN0cs4UB59latHQ/+mz3g8cPkzoV6BDO7MlCQi3cgCghBibNo77ufL8/t0GCK+AbuuBBaBqeHu8pmNj0cAOUcoFTGhzma2c3NfvHl5HHlaZaWSRgUluQLMWGM3dYpoyQ9L/Ljzt9ICvNXQYsqI/2CWtrtYR/yw+WEJMi6w40n8PXkSPxZ2NtHpgqtfYwYQW1kaFQIJf+Sh36CzIx88UesxCIW0+Mu6m8Z5Nd4LkwfPa7aaaeZ7w6UKsi8/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSpO18o9tXPIKhoLFK/NSS4JAqgN4CVzwc6GyfZ+c/A=;
 b=Oo+dVfgCIktcoK2bw0sFqFrYbm+n4Uh1pXYHJvWZouC95JodYideDD4vKGnSFLDeVTlXhEBBhDFOrvSjgpk8OJX0N+NbIch4YJl+3GPQRSHW8XEYc0hnH+Np2Yy9wp2JHcbVQFpLLrs16qFVFa+fg76m7PQV5K6amUWZ/BesuKaFYaIooG7PDUd9N9xwGeP2cfpnRYv3opP5eIH1JRku9MzXkiOpcnjek+cX1muy6zqd1ZgNMWXWMO2zJmxqfzQrGOn399BYARKiOrC1HtPmJw/cPtJhd7+wSXAuFcIR7w58vnVjMHE1fdJWNmRw9B4umHt0xHI64z6R5jQrOQTAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSpO18o9tXPIKhoLFK/NSS4JAqgN4CVzwc6GyfZ+c/A=;
 b=YgtSV5sz9qU2ozbGyDVg2nK80hmHoIUu+bUGoa3v0n0E2wQoHbxGTMiM2KGvLkf3UXHwDfwFbgMl7zTW18KsNJfgFAzCFOGns/cEADlv4f0WMQs2DTAoCzQb/OAPHqmE3ckiisDXw3PhVOnTQ3O5La24FRBNrxJMgr7oGT30PotNtZdHnY5/zwGh6/ln9qhxz8GEwEVo0KZEanTYnt35TVY3Ozis2D5antIFkqdm6xP9jxOH5iLG9d9LdRNJtPW6Oy+5zJTmxomnQADFN0oO9YvrjcxjfYqAskfbuwDRpw0qgvQ9G9xjzaB8S/XkgtrMRrqXazY6VZ8Vpef+tXFisA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 10:56:15 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 10:56:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 17 Aug 2026 18:59:37 +0800
Subject: [PATCH v11 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260817-clk-v11-v11-6-36e9bc701b11@nxp.com>
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
X-ClientProxiedBy: SI3PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::13) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 02fef3f3-b607-4ec6-e15f-08defc4e284f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|1800799024|366016|23010399003|3023799007|10067099003|56012099006|5023799004|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Vmt/lUPLmUCnYY998m0nSmbUgf5reOlKpyGVOmNo9Zvuv5HDhQfLK7j8s2ynkMFuDWT8RLChRcVCG1mk0N+Z6A0qgEBnzNnCo7dofQJIpJvJ2bof9bo3KioLThy+mNcBV1QKo2IHq94614ggqDQ9ebYddQlGOaE0Yne62z7sVIiy3Ci3xWVqHQ1AlF71s7J3HfQqXtARMBUQOb7TQxfqwwMuY1LvM9XA47QJIk1re2FgahqthqeZRFZ4+JeFZiqGuuTHWG+kuMegQ9Pj93WDIchqwAvOkF6boqxl4NJtn4kxcIrqXZ4iAlFdn2svA6Ms/NKOJx275DVJ4Xiov8xnbaPvM/s3Tnk9A/R4qi4de515zEr1Yk0UYi2ydD+R9I3B7dqQVzUcvfkkYnSMkHYiX08oNfkJkDmZaCqSHCIUHwe/ii4gF/sbKWpkWz5pgm/3wQpmuq2vtyA+XBoiPcT6Nupd7a+Kg+u3Jf93fi0OrHq7URs5WsMeBYie7L+N6p2WS1H/F/6YwQtmFpePvJ2DsCUHwaLvGq6ioyfH6QkLP1nt4PoyKU0fXWUGbtc1NjWcHXViLZNNuygn5R7N2Kdvu4ObBuoIe/bjNq06BnBhrMHOXm4DZS7V745YIJnh7A+max9ImWbWmDf/cnd0Ned7UYMJIe99OmsuV1Y5u9KWjfg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(1800799024)(366016)(23010399003)(3023799007)(10067099003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjRZcnJFN2x5cVJxU2JHeUZDZzVBcXRzeUt1VWkxK1IyYzNBTmZTakZvZGxN?=
 =?utf-8?B?RDJnVzArRWlYZnFHc0M0TVVjRnhtRHpoVlpCbitOanVjQnpzdmxuYnR5R3lR?=
 =?utf-8?B?TnlwMCtaczh2anNnU21lUWxkRjVMQzRkWktHTWMyaXdBVlVPM05tZSt6WWdk?=
 =?utf-8?B?djJNZUZBdVZkbWE0LzBoNGx2bXhTMVJSTkNldGd2NzVxZ1Ztcm9TcVBkNEdu?=
 =?utf-8?B?NUo1Ny80Ui9PTjkxRlpsRldvQ3RIaXZremN6YkNaRWtQUWtzQ3dLNHMxcVd1?=
 =?utf-8?B?SlhOemtQd0NGL0ZTQXlLRXZCSlEvRjR3SjVBNU0wd2Z2UEQ0RG9XeXYxR1FY?=
 =?utf-8?B?VGFLZ1M2VDNHUWRzV2tBUU00bDBnTFJzQ0VmZkcrRUFzcXk4alBmb0VnMzhs?=
 =?utf-8?B?STRLRThsR2JleUkvK3BhRTVSdVN4SElTQkcyL25SbTIzSjdpLzhiaHFpb2FH?=
 =?utf-8?B?TDkxS2xHNThDQWM2SWFjTWVIM1llOFJuOU03Y3NlVnBVVlgybXFFNlVzN3dY?=
 =?utf-8?B?aWlhYWlyMUV5MWg0Um5Nc0lENy9zeUg4OVpnZFp3MU8weHhNSjZQV2ZvZmxO?=
 =?utf-8?B?bnpKNm02VDB4ZXlCRElaalRVbGdUNDBYS0JBREJadmhBQzZRVzFJdlNpWEFN?=
 =?utf-8?B?MFN5UTVtZnMxTzEwV2JDNGxRdGtIdGpBVWRMTjhxMTdyRG15QTZ1c285OElJ?=
 =?utf-8?B?L25oTGk0MHZIM1dpT210QXVzOUJrUG43bG1SaUFVdzc0OWlJL0NhMlRPVFZq?=
 =?utf-8?B?MUsyN2toQ3dxeTFRSktob2p3d0RvVVl5WkpEVnplUno0Vzc0Q1lzMVMyM0lw?=
 =?utf-8?B?WkJkUTk3NE1FWGFCTkd1bnk1YVhaUTFLcDVYT09ZQmlhcGw1OGQzLzZvWGg3?=
 =?utf-8?B?Wm1NOFgwbU1XRnZqVXJEc2svcm1jNzdqVVZEeFo3TnJqSDBENVMyNDQ0eHV5?=
 =?utf-8?B?UHVNMmtqdWFzZGlFUmtUbUVBOEswN0RzS05yZlQ2b1F6bjdnNWhZRkpJa01y?=
 =?utf-8?B?Rm9Qek1rbnRTeUM4TktDMGxaSVk5OVMxZTJKMTE4Q3V1ZDRYOGwyWHNKU2Va?=
 =?utf-8?B?SHdoZUdQOFpSNFFxRkJzMjdCUjd4WVp3ekxBMThubGcySEhJS1A5czlNZ0wr?=
 =?utf-8?B?bGxmMlJuYUpsbzFCelZyTGVCQloxK3dIWS9SZTE5eHA1YVNYbE5oaTRjcE9D?=
 =?utf-8?B?YnVpcFIzY3FuZytUa0hqa05QdWdsVnZRYUdNMUtkalBaRHJBanc3WWtyWG1k?=
 =?utf-8?B?NXlRdStTbXdLMjltaFhsVzhUSWM5Z0dMcVp0SWlXZWZVN242bWVMS0Q3Y2RN?=
 =?utf-8?B?Z3E5T0dmb1RPSzNHSnhDQzNNL1pVWWppa1BUUVdQNTJFalN1T25OdU1JWEZT?=
 =?utf-8?B?cFc4K1kxY2JPdXkxa2xxazNzUzRHVnIwUmd3MVBNZ1R2UzRlR0hkTmF6ZkdN?=
 =?utf-8?B?SXNJVHVhYWxxZUhTcWoxeVloQTI3OVAraENUL3BxTUVPK3NXM1hZeUZ2azFu?=
 =?utf-8?B?ZmJQbFcvOHloRzVPSk1ERnNiWndWSW1tU1pEdHdyZzI3V0tSY0EvVDRpTVFk?=
 =?utf-8?B?enE2dVlkbndoN0tTN2tyVlRteXU1YnI0ak5ySUtIUDhmOTNoUWFnMUxYWnlI?=
 =?utf-8?B?US9vVDQrL29xTXUrcWJjRmVEVGtmM0dBYVNReVV6eXcxaFNCVjdFY2pvM2p1?=
 =?utf-8?B?T2J3bGY4RHZ3dEw3aDA4SXluSnRVa1JQbkxDZ3ByN0pnK0lGV1VNc0duY0RB?=
 =?utf-8?B?K25GbytqendUaW1NMUNSTmV3SHFOVk9SNmY2OWdSd25lUkhYR1FVb1VaZEo1?=
 =?utf-8?B?RDd5QTltVEQxK0pjd0pqczNIUXR3RVZ2bjJaOXdHNStveU5Yd0lrQ2dHTXNo?=
 =?utf-8?B?WXo2MlQ5NzVNOFJucmIvL1RmU2hFT01EZng4MUJBUWh5amtITlkwaUc4VkdQ?=
 =?utf-8?B?cDZjcFJObWxaT0lVOFV1N3RveTNoWVRJaXRsbUM3T3g3V2NrNnJuSk12VTlp?=
 =?utf-8?B?YU42OWJ1Ujd0QW5Kb1dISGwvcTMyeDBKU0ZCYmN1VnZrbGg1aHJ6QWJRbEZv?=
 =?utf-8?B?ZFVzYjlvUFdGWUVRdDdleTVuMSt6WHNzOUVjM0p5ZlczTUw5VHRlWTlNREVa?=
 =?utf-8?B?Zy9jRkFsczlFWWZIeDBoaXpCM3JYSWhWZDhDcTkrTnRvT3pOb01SUGFKblZl?=
 =?utf-8?B?TlhsTnIrcmxQVGxJbmZJZXJkMUJYUXRPZHM0b2g3RnJBbERZYVVpNTd6SC9h?=
 =?utf-8?B?ZmtadURqbXVZaTNsR3N2ckxhY1M0MlBiaXMybFczWmw3NXNLbTd5NVFQTUU4?=
 =?utf-8?B?ZHpYNUNJM1JVVlpJRFVCZHZFSkpGNHlFZWdLVXUwS2RlM0hHYzlXb3RpclhO?=
 =?utf-8?Q?vAykDNgXc6x8wTyZR6znHgTt7e+IBYyRJti8c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02fef3f3-b607-4ec6-e15f-08defc4e284f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 10:56:14.8787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+GeIlljXBsSds5d2x5B7+ezEQ1fqXa2brkdEVEiktGfKwU14SHOp9MhT5eAn8dVbAhUqr30x5gPtMllON3NcmJYZjxyJ5dC0w4bHJ0GThEw3mbr2XVCcA/c/ZbVniGy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

From: Peng Fan <peng.fan@nxp.com>

 - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
   for the SCMI clock driver, allows clean integration of vendor-specific
   features without impacting the core SCMI clock driver logic.
 - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related
   declarations.
 - Initialize OEM extensions via 'scmi_clk_oem_init()'.
 - Support querying OEM-specific features and setting spread spectrum.
 - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.

Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/Makefile       |   3 +-
 drivers/clk/clk-scmi-oem.c | 108 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-scmi.c     |  19 ++++++--
 drivers/clk/clk-scmi.h     |  11 +++++
 4 files changed, 137 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 3a73b81c2ec08..bceaf4d75dbb4 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -98,7 +98,8 @@ obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
 obj-$(CONFIG_COMMON_CLK_RPMI)		+= clk-rpmi.o
 obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
 obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
-obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
+scmi-clk-y				:= clk-scmi.o clk-scmi-oem.o
+obj-$(CONFIG_COMMON_CLK_SCMI)           += scmi-clk.o
 obj-$(CONFIG_COMMON_CLK_SCPI)           += clk-scpi.o
 obj-$(CONFIG_COMMON_CLK_SI5341)		+= clk-si5341.o
 obj-$(CONFIG_COMMON_CLK_SI5351)		+= clk-si5351.o
diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
new file mode 100644
index 0000000000000..be11d359b4ec3
--- /dev/null
+++ b/drivers/clk/clk-scmi-oem.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Vendor OEM extension for System Control and Power Interface (SCMI)
+ * Protocol based clock driver
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/scmi_imx_protocol.h>
+#include <linux/scmi_protocol.h>
+
+#include "clk-scmi.h"
+
+#define SCMI_CLOCK_CFG_IMX_SSC			0x80
+#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK	GENMASK(7, 0)
+#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK		GENMASK(23, 8)
+#define SCMI_CLOCK_IMX_SS_ENABLE_MASK		BIT(24)
+
+/*
+ * Selection is based on SCMI vendor_id/sub_vendor_id and optional machine
+ * compatible string, without involving impl_ver. impl_ver‑specific behavior
+ * should be considered a bug and handled via SCMI Quirk framework.
+ */
+struct scmi_clk_oem_info {
+	char *vendor_id;
+	char *sub_vendor_id;
+	char *compatible;
+	const void *data;
+};
+
+static int
+scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
+				 const struct clk_spread_spectrum *ss_conf)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+	int ret;
+	u32 val;
+
+	/*
+	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[23:8]  - Modulation Frequency
+	 * extConfigValue[24]    - Enable/Disable
+	 * extConfigValue[31:25] - Reserved
+	 */
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
+	if (ss_conf->method != CLK_SPREAD_NO)
+		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 val, false);
+	if (ret)
+		dev_warn(clk->dev,
+			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
+			 ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
+			 clk->id);
+
+	return ret;
+}
+
+static int
+scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *ph, u32 id,
+			     unsigned int *feats_key)
+{
+	int ret;
+	u32 val;
+
+	ret = scmi_proto_clk_ops->config_oem_get(ph, id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 &val, NULL, false);
+	if (!ret)
+		*feats_key |= BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED);
+
+	return 0;
+}
+
+static const struct scmi_clk_oem scmi_clk_oem_imx = {
+	.query_ext_oem_feats = scmi_clk_imx_query_oem_feats,
+	.set_spread_spectrum = scmi_clk_imx_set_spread_spectrum,
+};
+
+static const struct scmi_clk_oem_info info[] = {
+	{ SCMI_IMX_VENDOR, SCMI_IMX_SUBVENDOR, NULL, &scmi_clk_oem_imx },
+};
+
+int scmi_clk_oem_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	int i, size = ARRAY_SIZE(info);
+
+	for (i = 0; i < size; i++) {
+		if (strcmp(handle->version->vendor_id, info[i].vendor_id) ||
+		    strcmp(handle->version->sub_vendor_id, info[i].sub_vendor_id))
+			continue;
+		if (info[i].compatible &&
+		    !of_machine_is_compatible(info[i].compatible))
+			continue;
+
+		break;
+	}
+
+	if (i < size)
+		dev_set_drvdata(&sdev->dev, (void *)info[i].data);
+
+	return 0;
+}
diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index d88e78cc9a12e..2dd50c5b4ea8f 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -13,6 +13,8 @@
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
 
+#include "clk-scmi.h"
+
 const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
@@ -210,6 +212,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 static const struct clk_ops *
 scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 {
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(dev);
 	struct clk_ops *ops;
 
 	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
@@ -256,11 +259,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
 	}
 
+	if (oem_data && (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED)))
+		ops->set_spread_spectrum = oem_data->set_spread_spectrum;
+
 	return ops;
 }
 
 /**
  * scmi_clk_ops_select() - Select a proper set of clock operations
+ * @sdev: pointer to the SCMI device
  * @sclk: A reference to an SCMI clock descriptor
  * @atomic_capable: A flag to indicate if atomic mode is supported by the
  *		    transport
@@ -285,8 +292,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
  *	   NULL otherwise.
  */
 static const struct clk_ops *
-scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
-		    unsigned int atomic_threshold_us,
+scmi_clk_ops_select(struct scmi_device *sdev, struct scmi_clk *sclk,
+		    bool atomic_capable, unsigned int atomic_threshold_us,
 		    const struct clk_ops **clk_ops_db, size_t db_size)
 {
 	int ret;
@@ -294,6 +301,7 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	const struct scmi_clock_info *ci = sclk->info;
 	unsigned int feats_key = 0;
 	const struct clk_ops *ops;
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(&sdev->dev);
 
 	/*
 	 * Note that when transport is atomic but SCMI protocol did not
@@ -318,6 +326,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 						 &val, NULL, false);
 		if (!ret)
 			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+
+		if (oem_data && oem_data->query_ext_oem_feats)
+			oem_data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
 	}
 
 	if (WARN_ON(feats_key >= db_size))
@@ -375,6 +386,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	clk_data->num = count;
 	hws = clk_data->hws;
 
+	scmi_clk_oem_init(sdev);
+
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
@@ -406,7 +419,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		 * to avoid sharing the devm_ allocated clk_ops between multiple
 		 * SCMI clk driver instances.
 		 */
-		scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
+		scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
 					       atomic_threshold_us,
 					       scmi_clk_ops_db,
 					       ARRAY_SIZE(scmi_clk_ops_db));
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
index 6ef6adc77c836..d7f63f36c56d1 100644
--- a/drivers/clk/clk-scmi.h
+++ b/drivers/clk/clk-scmi.h
@@ -7,6 +7,7 @@
 #define __SCMI_CLK_H
 
 #include <linux/bits.h>
+#include <linux/clk-provider.h>
 #include <linux/scmi_protocol.h>
 #include <linux/types.h>
 
@@ -19,6 +20,7 @@ enum scmi_clk_feats {
 	SCMI_CLK_RATE_CTRL_SUPPORTED,
 	SCMI_CLK_PARENT_CTRL_SUPPORTED,
 	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_EXT_OEM_SSC_SUPPORTED,
 	SCMI_CLK_FEATS_COUNT
 };
 
@@ -37,4 +39,13 @@ struct scmi_clk {
 
 extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
+struct scmi_clk_oem {
+	int (*query_ext_oem_feats)(const struct scmi_protocol_handle *ph,
+				   u32 id, unsigned int *feats_key);
+	int (*set_spread_spectrum)(struct clk_hw *hw,
+				   const struct clk_spread_spectrum *ss_conf);
+};
+
+int scmi_clk_oem_init(struct scmi_device *dev);
+
 #endif

-- 
2.34.1

