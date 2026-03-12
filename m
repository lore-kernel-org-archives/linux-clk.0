Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04473AB274;
	Thu, 12 Mar 2026 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773298672; cv=fail; b=T9/xz3esonq8Da3EZDoZrHZNOYVxq+UyJAL/MbLD01vAB6ak4hlXNcvJjPIJrKcpFTTNCWuRVBbpDWBFOtbeySsMCeoyR6sdnzutDmQ+qyyowc3iYXYt3GMBC+tBAEL9TYccrwgWnWxwTci4xFJ57OtHrr6xsT9QjD/b24X2zOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773298672; c=relaxed/simple;
	bh=K4kWlH9ooiaG5vES1pkDQY94e65HtplOah/6ae5D+TM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A0kqc20ghPfui0A55y8s4RIl5PKD5uSgDlbfCkBrvq2S6L2R02IH5tUqpKN7+kgrU1z9PJHIlJQBRSYAm8NL/KEcZxEwF6S8WTJOcSnmtuyrEYWBievTPvC1nwCFerslEFtH5Hurto00DThlVHr1nnvFAqWFNF4wkTzUa4j2aNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=f27+YFpR; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="f27+YFpR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1EXblGuyA0PLZ750xyg0V1iMG752f1auBUCW4xu8lpl1/ql54hpgiFrVQgd5PpfDW7gRM2ST+2ypEvMxxqwU96dFL5fB5MZ2SqfDMuDE+3c0xP436XNAlOb5+XA99yDXnCw6K7TY5pL7mikn2r4E4WJwvKx9sZ6GjZGPM6rYUw+nQvNBvm0QMzTUhRoNPC1tPG9gtU97ILv/eLq5+yjmK0ffM2f82h5XdGRwLIqueHnxDUK5gXeqYkLCsTrg8eUTFBRcmjqrm3Ii7nhr/5NRbk7GqOVAtVIiq0BQ69HdI3yZasHcECpIGw+9BWID9qFuK9wZI3W8CnFSup616NoJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3m5yOyjQfNb4fBHfff/rHUp9AXSH2WV2osV+rNRLGA=;
 b=G4Uo3aaDixt2ELAmxHTdGeKDUeFBB6N2+p0OCjp575ly3NnWiixKJ3qGhLa2rSaDFpf3yIkXWw61yPNHo5ijsLgfjcLdPNIuqRS+qSO574a/Df2HI/vZ0gYWRtydqE/8f2FVtVf+vqWDVjcazW5PK5caze5X2YaALjn8tIdFFACLC82Do5D6+dlHJco0u4OBtRgJBkFJyBT6quQMFY9esfGibLIP/1i8ytVrJJ/Ugq1J79BredtYsV6nDWNhZrDk33h/6wt85XQtqx2IIJEH59YJTELualQ0uBFFnPUO9/mDFs5PvcTFI44UgpO0BdqrJ4giv62EOp20qfRM1krw7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3m5yOyjQfNb4fBHfff/rHUp9AXSH2WV2osV+rNRLGA=;
 b=f27+YFpR8C3K7YQzu/jJkKZICG/HwE4IDpAXYRHJMSC86FOAEjXcJadQh6wTgZAS28eA4YDsPsCzevmE9pRHDk0mwFUAscxemIMV86C5uFxpTbJ+0J2PVLFBN3l228F0kbyNBblX1p4ijOI/sr1rWmVdh7VSRkESudKzC1U8kZw0ehJSyY0eZszA21C2IZfY5rjkKuTeYtF7Mr9Rhw6kSigWrHf5gjXuuHsT7XRQg82019cW0hbh2fclG2MwtkcqMEn6k2q5bmWsvROj7kU0gTlKKfgAkKz3jOy7wbKKNaYk5AQ2dG4ebjdR59Lr13Rr8X+MyK8E6+RJHbLCecFvWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6997.eurprd04.prod.outlook.com (2603:10a6:20b:10d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:57:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 06:57:45 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 12 Mar 2026 14:58:22 +0800
Subject: [PATCH v9 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-clk-ssc-v7-1-v9-6-0a9d2e188d9e@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: ec9420ed-fd43-4289-e69e-08de8004aa38
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	FA08va1SMwaq9Rul44GOURV0xpcoQOI49nr/P9/2RVnVnCHQulnGxIY6QgMGTG1eZ7dnGE29CzVuAGJoJsZRws+wcFG4r7eyytShfQUAgQen2J4Vgg1m8U4sKdCeOmx2Nsdk5RALsepIcMlAY1NIyGyTH+VHRDbbmDUzMndkCIMLIrjHTh6pPx9HqLqus7L+hTmvRtP+DmuRzHORwwDE9Qf2osR4qBoG7peAA0sjzmQT6lFU50HENBxfHeanQsMXWQdYYdb6QjNXcEgvhklItoIYoZtZA/djRXee8GTnWjFpLCrFs0ijazKSZ4ZCuVZJPUMqvcDZBKH+k6r0ouVaAa+jr4uFhTdfNCPcncg7Y7bJU2bLm6g+W9cE4Sq0cPMd9DIoXKEzkIrYlOMGBdqh1bmc/Ns6dXHCQJrTW7LCih/RRsYXYF9wQfKdtZ7F69D4Az88ivnYbUllMXcH5A/NhqA2aTMpHuwEk6Sop0nBKo+vF1TFWrVZ3HTmowlMJf6AQkpXWrIPRJeEfaxnb8oLEUGHUKosYnsFuxDJrnikA07D9qYk2aryO/HfK8+03HJghXqiP17GSq2bnrlWzNQ/9zScUYXN12YnwtDvPJS3JXHN9dbRKdoDJyse8wvDu98ixOTqeHtQlBKytHzNYfEobLJuyQ2kpOVTJfhRUytwaR1pkDQ9xKSzZ/nd+eDZs7FDlGVoG8wqO2co1UU/b+ukbmzYR3Ygp2g3+AYv6Kj36RkptIITdranE7l/m2nnXJUI4Iv4AJMh5/3ziKkcp9ljdF3qn2fr0hswo+66/8+sxgk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aU1CZzJoRFUxZTBvUlFVOXhQbjduNVhPT3o3L1ozMDVpZ1BIY3dwQVVvT1pI?=
 =?utf-8?B?WCthM1pOWmJucWtleWgxQVZ6eW9YYU5Ya2I4bVVsaStwZ1BaSDByc0xjOWRw?=
 =?utf-8?B?NnZlMjY3Q2JvancwWE4rTnpoaktmaGsramRwbEo4MVRyZmpVdnlRbkFjQlFP?=
 =?utf-8?B?L1VaNHQxbEdUMXNkcE04WGJzQzhjVG4zZFFReTJPeFVXaWhWdkd6WTAzSWNI?=
 =?utf-8?B?dWZWREN1ajhvV0RkbkF5dDlMSHc1VjM1UFk4WnpVZ0NacjZPN2ZZVlRWRGlx?=
 =?utf-8?B?aEtVRFZ5ZDhGVGhDVGxHdDBhdlVBZk5qcGhoNG5sTXFicFk1bHM4WVdqSzRT?=
 =?utf-8?B?ekFIRkJPM3NSWVAzRy84MmN4N3RkRyt4ZUFiZG9HQzlxeDBEME5pck0wQVJY?=
 =?utf-8?B?Rkx3eHc0MVhITlIxSjJNVkdqNWFEZjcvYlgrZC92Vlp0N3h4MGFSZjN5YXI0?=
 =?utf-8?B?RFV0RkpwLzAwdzRUendVT05zQzFVU3F0cUpkeUFLdFR4c255TTFadiswV0xL?=
 =?utf-8?B?aVRJUUF1ZzRtUlh6RjRRRjMzc3NvS2ZyTG9vdXVxd1FvVlVEYXYvUU52YUpS?=
 =?utf-8?B?ektnK3p3WVZXRVVvQncwMlZyb2JkQ2hzQlNCdzA5WDhPMmVMZVd0S2pUTHE3?=
 =?utf-8?B?QnBHbms1dnIxN3RQTDYzMnhaMTZhWlQxNzloWHpoOW1oenpRUFhZTmdCMnZK?=
 =?utf-8?B?UVZaYkVmUDE3aWI4ZTF0YWwvVmxmK1pibGNzZjBlV3craGlTTUlnL2Z0ckVx?=
 =?utf-8?B?Z2RXUnZYRHhnU1o2RmU1MURJRlphWVdkL3dYQk9FOWRGeTg5WFMwb3dnUC84?=
 =?utf-8?B?bWJ5dU5zSnNud25ialdHZzMzT0k3TkpYRjJ0S3RqN0pWMXNma3laNXJncjVI?=
 =?utf-8?B?aTRQZTBudy9vZnlYRjhRbGhPaVJ3VmlEV1lqWlZ2MFJESkhtUmxHMzBFNWpv?=
 =?utf-8?B?ZXRRVVRkTlN4SyswT25JMUhjMWlKS3RkYm45aHVsNG1zbDh4UTZONTJoRzFK?=
 =?utf-8?B?elpRK2ZBSnA3RHBiVmVqMzBHRHA5TG42VEdTYzRLMlNNNWdkWmxxTTVFK2dL?=
 =?utf-8?B?bXl0RjJjK1VGOXIySFRVQVEyS21sT3hKVXlJM1RXNkE4c0RpcVc0OEFPcUFn?=
 =?utf-8?B?ZWpBbnFPN04xVEdRQS9Nb1dNSDlZMmZHYjE0c21UYm5RbGFZVmlzN1NGS1FG?=
 =?utf-8?B?dEhaS3JIdVA1bXRMcDJJd2JEalVwT05hVEJtTEc3UEFBNlBHcTJqeCs2ZXRB?=
 =?utf-8?B?WnNOYkJadjdZMnJNWFBBRklzUlNXRFducVBJTXVoR0dad0tWTFVrUGVnRDA0?=
 =?utf-8?B?NEQ0U2tCZ05lZ2RmbVUxRmdybkU5c2hyUVRWejllS1JsUjJrSXJSWmNxUXd5?=
 =?utf-8?B?aktjc3ZZd01HcWtqTXF6RjdKSTMyUHh1SWt4eUszNUdENjBONE03VStnNnRC?=
 =?utf-8?B?VEhCZ05DM011SWxCbS9ZS1IvZzV2SC91eStSS2FPRVlnbllFalUyRXZzdGh1?=
 =?utf-8?B?Rm9qN3pSSHV5bHIrSEJSY2dkVlo1Z2JXL2JocmdUWWtFaGdDK2FUNDhpdHly?=
 =?utf-8?B?MTZnL2RXNEIyVzJmK2dzekNQYmFYTGJ1L2RUWkVraHVrN3k0cnd0eEIzQnhV?=
 =?utf-8?B?ZW8vM1hVODRBK2tmMlhuS0FQRWV2cUNHWmhodXlRUDlnMEE1TUpMdTVISCsz?=
 =?utf-8?B?R1AwS2JEM2doSGVhTmg1Mm84eFZ5K3ZmL3A3bHBWbkZwcVk1YkQ1eUVsSU40?=
 =?utf-8?B?SlNaSzFaRm9MQk13K01mZlY3VTU3eHdtRHBtbjBaVVUyV2RXZEN5Wm5PcjEv?=
 =?utf-8?B?MHViNVRBUUFjdFcwSTBweHFRdGNPV1pRNzdwbE5hRncxUXRwYTI1MzhodGhh?=
 =?utf-8?B?K3diSXJTM0kvT2I5aXFBT052MXpVbHhsMWJ5dHQvNUZhZVZjbWtRMk0wQ0M4?=
 =?utf-8?B?V0grNWQ4bTNRdUlZRU5sVG9zYWxQZXpUb2hsKzNoRUY0UUZTTkFuQ1c1MDh4?=
 =?utf-8?B?WFRLYkpqeXpYQ29MYURhaEMya2tDY3pRdzhFamxzK2JXTkdpY21FMXZzeFQ5?=
 =?utf-8?B?RExrcDdGcVZjeFhXSlZPdlhKYWNtTzQ0b1U3UEQ1cEI0UHF2dGttSEErWWJz?=
 =?utf-8?B?RXdkK0RyTlhLZ3ZhdXBhdytUWFdZWHdhR1BXeFYxdU44SzF4KzZnajYwcVFr?=
 =?utf-8?B?ZnJManAvWWZPVjdFYnhGK25xTzNtNFF4UTdWOHozV1h6MlVpdm92cGZqNm92?=
 =?utf-8?B?U0o4dDQrUE1KVmdibW56bC9rYysvOEYyZUJ0cnFZd0F4UXZiSE16QzJYczBY?=
 =?utf-8?B?QWtYM29TMFZVWnZhZC9UUmFUSmxnc1NuSWdDWEoxMEZrTWFNWjdVZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9420ed-fd43-4289-e69e-08de8004aa38
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:57:45.8570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyYxpd+bCaWdNOgYYFI2BjszTCECS1LG29H4BFOdGMe9u/DGT/A1QU1AFRA7wTMQBpb4Bj0zxCAnJYHg8S5TiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6997

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
 drivers/clk/Makefile       |   2 +-
 drivers/clk/clk-scmi-oem.c | 108 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-scmi.c     |  19 ++++++--
 drivers/clk/clk-scmi.h     |  11 +++++
 4 files changed, 136 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index d569d0ea3153efe593efbbd51e022b2415234d3a..0b74a458255b2d50030cb4a2102599228c3660bd 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -93,7 +93,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
 obj-$(CONFIG_COMMON_CLK_RPMI)		+= clk-rpmi.o
 obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
 obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
-obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
+obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o clk-scmi-oem.o
 obj-$(CONFIG_COMMON_CLK_SCPI)           += clk-scpi.o
 obj-$(CONFIG_COMMON_CLK_SI5341)		+= clk-si5341.o
 obj-$(CONFIG_COMMON_CLK_SI5351)		+= clk-si5351.o
diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
new file mode 100644
index 0000000000000000000000000000000000000000..be11d359b4ec3633868f33bb429c7cfec9f1e48e
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
index bf85924d61985eb9e596419349eb883e3817de73..1ed2091e3d4a951c8662db4c94dee4b9c98b8326 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -14,6 +14,8 @@
 #include <linux/scmi_protocol.h>
 #include <asm/div64.h>
 
+#include "clk-scmi.h"
+
 const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
@@ -242,6 +244,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 static const struct clk_ops *
 scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 {
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(dev);
 	struct clk_ops *ops;
 
 	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
@@ -288,11 +291,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
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
@@ -317,8 +324,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
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
@@ -326,6 +333,7 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	const struct scmi_clock_info *ci = sclk->info;
 	unsigned int feats_key = 0;
 	const struct clk_ops *ops;
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(&sdev->dev);
 
 	/*
 	 * Note that when transport is atomic but SCMI protocol did not
@@ -350,6 +358,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 						 &val, NULL, false);
 		if (!ret)
 			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+
+		if (oem_data && oem_data->query_ext_oem_feats)
+			oem_data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
 	}
 
 	if (WARN_ON(feats_key >= db_size))
@@ -407,6 +418,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	clk_data->num = count;
 	hws = clk_data->hws;
 
+	scmi_clk_oem_init(sdev);
+
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
@@ -438,7 +451,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		 * to avoid sharing the devm_ allocated clk_ops between multiple
 		 * SCMI clk driver instances.
 		 */
-		scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
+		scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
 					       atomic_threshold_us,
 					       scmi_clk_ops_db,
 					       ARRAY_SIZE(scmi_clk_ops_db));
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
index 6ef6adc77c836dc2d599ff852cdc941f217ee388..d7f63f36c56d155f728325efd6bcf7fe2585b170 100644
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
2.37.1

