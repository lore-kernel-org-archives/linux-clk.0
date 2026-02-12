Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011046.outbound.protection.outlook.com [40.107.130.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922F32E5D17;
	Thu, 12 Feb 2026 10:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891127; cv=fail; b=d6aWhJ/JVm2/tFHlufqLpA5exMREvBBs5u8YdAN7tdqOP2D+fuUgJO7FVz5dA0ytV939TO0cu59UXlqd1zfiRF8s2SwrnCvuuQhiB2C1Ad8bjLR+A1TfP+vRTmTZFesPFhaoCVANlsbSXisauzIIoc3GIBZaYaUAebV+Ft/BhpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891127; c=relaxed/simple;
	bh=MypjSmiyKP6k7cRujSxPTWCmqKrhHDDxrKSvBTnhXnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oEtdqY9crQx3rTMIiZpxV3udsc/2stVceq+olT8xiHx+4LUI0dxTeZTaospCp7pY1ffYLFdzCcNLWzAPwQKixJsdc+ZG4us2hGhkmiSAu+/WGEapPgCw0FgxmQFT8/Ck5dgKOCsush4wKYqsD/HDJOKKrSIpOwBxL9KKrqYgUME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=jzMPjLOI; arc=fail smtp.client-ip=40.107.130.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="jzMPjLOI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mPQm/3EmsaZgKFhZrsNWBq5DyIGqWySU3GjHkDqPRPe3rWHKpz3F1fEKCpW6rCQrHi8NGDq9IUvxr5fBuV3cvFmj/nwMIcTFFLLrbj9YDTab6zFH+fMJvfvXQRjbFDnS7eGNgZ3RwrhR/+SpPOSoi2wB0y0sVx1cPMbINj/KHER47tbbdsTsd194vQcPI9XIjOiwwat/yrthpph8ol+BTAJBfqNFcPSv5hnBPEj5eZuyBqTtLN2P0ajWk48r/b413mnv3uN20UK4gODvlr7/VYKdIYAqsFghnYVzcM+my8cLBKpsCuwCPt0mh2uUij+2bLA+R6FxhOJ7p/QDVDLQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ogun4KCfAe7PiRPllffd0JmlIdCy1h4x7hZvTuV2QE=;
 b=gF1f2iiW2QPPtGQRai8bvZ71jx6oRuyXVbWKkEFHsfQ/PFkoSyW9UEmUX4wilorkgfPxVryFlKxe53N2JOTSDATZWQoKv+1eOL7zFQ+0nOeOY8woN2icXbuJE1Nhu7POmCA0QewT7EqVkTzUlU2LSkcSSPqiOdMUCN40Olq0xqCjJu8hhIiE+TE8zL2Zc5wfVCaq0QypN486kZvcgkbJvLBUyXXdoIfqRI9Y2cArf5tmU1QE+jtdvLZvhuph8nCC6nxn/ljxzEFesuX1TmtrDE8z9Rnx/UUDzsXLus502FsQnf96/rY8emiC743oebFhjUpWoHtXEMDRpeh8enqaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ogun4KCfAe7PiRPllffd0JmlIdCy1h4x7hZvTuV2QE=;
 b=jzMPjLOI+7Up2lk0GodmtgpP7R7kWmFbMrwzMq0rPJXdxPcVckipJc5weDTQXDZ/mx+8iw/naJ1rr3ppHA/kh57kp6645/Vw902BJg5Xa0EO8a/H7AjYn/0S65KlEuuF7wdJXUjfm3zOTegKktx81sPz8RBMzkNKZZgz+k4h3bxUPxQFmov6VIaUgWIJ5iCx5AAdRF/5mbMJU/+Z0hkde8ZlyxFrDvW9u33AN37EeiLC+/p82KsGuOQ7hqmm0TA+W9cTtD5oHifmHbimOROOdq2sELBdak9yoobCgxhtO7uig+zUbUU8GaBSJHSIPoS/ecd2E5ozWCKlI+soCVRFHw==
Received: from AS4P191CA0035.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:657::11)
 by AS8PR10MB7087.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ed::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:11:59 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:20b:657:cafe::e5) by AS4P191CA0035.outlook.office365.com
 (2603:10a6:20b:657::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 10:11:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 10:11:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:13:50 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:11:58 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:32 +0100
Subject: [PATCH v2 3/9] bus: rifsc: use new CONFIG_STM32_FIREWALL_DEBUG
 switch
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-stm32_risab-v2-3-02ef2859b596@foss.st.com>
References: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
In-Reply-To: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|AS8PR10MB7087:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df30000-528b-4126-baeb-08de6a1f289f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0RVMUlmUkQxNWhUK3RXU1hubExhYk4yMDBpV0xBM21scGRrVVFMd29ZZmlR?=
 =?utf-8?B?QkpIMXprbWRDYk9Zb2tZc1d3bUtDWExxTE1rV3NvSHA5bGY3M3dxcVZsd0Uy?=
 =?utf-8?B?MllwVXR1QWhsS2JUNjV0cFlHYk1pQ2U1Y0JkVGlPNDdMa2dVdVJrc29GNEg4?=
 =?utf-8?B?Z3krMENhN1YxM1RHTEl5Tkczdll6aUUyTEs4N0RKLy8rMWU5UmhGRmRQajgv?=
 =?utf-8?B?a3Bqa21xbFVOU1B3SHk2b3NrNyt4M2xESmdTM04zTDR6ZFBxVGhoUDhvbmVS?=
 =?utf-8?B?MERnTG9oa2o3dG5pVHFkdTROeDIwa0RRVXVZbjY3bDk3TE9MWTM0OVBOaUpW?=
 =?utf-8?B?YVNTZXhUbW13clFIWjQwNFJmQjZxeVJMNEhRa2YxOVJ1Rm5Gb3FOQXQ3ZjZU?=
 =?utf-8?B?dElTaXNnMzdMTVZSOFdHaTBKbHc0ME1NUlE4TzVPWEFyK1lvbWppRFFZdHZ4?=
 =?utf-8?B?RndTNnh5SlpYL3BJZkw3TXJEc0x0MEhqdk5YVkp5M3MyclprNjJyTU1BbUpl?=
 =?utf-8?B?cGZRUnl3TjFGYkZTOUh5amwzQWl6U3Q5VkUwWlNoaEpKaDBpZDBKelJ2NlVX?=
 =?utf-8?B?eVNmZCtQVlJpKzNRZEtHWlFIM1JvdHpwTGpmQ216ZWNjdEUxanprQ01GZXZW?=
 =?utf-8?B?SWZLUU5meWtLcm1wRDlENXU5VDZFK1krRGR3U1JSWlBLOFZFa2dSWS9VcjdY?=
 =?utf-8?B?Yy90MkU0Rkh3U1FMU3czQTBYVGRIWnJXUi9FaUNEQmJGYTFEK2NBRFBuNlJs?=
 =?utf-8?B?cmJhM2FNU0M3dlQxQnlWNXhxUmFOazAyQlRBM1NueVhzK2lTK0pTRTBPellJ?=
 =?utf-8?B?Z09QRW15RGVwRDhpeUJSWFh3am4yMUNOMEhZK0VPa1BDdE5uVEFjN0plQzBV?=
 =?utf-8?B?ZFY0a2ExdHBZOWxpWHJFckFQZVJ2VlhlWHc4WnRXUnVNU1IxanRMeURGQXpR?=
 =?utf-8?B?OHp3K1dPZnZjTDM0V242MzIwdkJMOG05YjZGd2xmTW9Odjh6UGNQa1BUL1RC?=
 =?utf-8?B?WFMxaVZmd1FPWGxIRnhNV0xBNDJWb000YUlhZGNIckhPVUZ1MTdsWmgxSHc3?=
 =?utf-8?B?S2IzbCtsS2JnWVlsQUgxTmJ0bEs0ZHJkbjhtVitJU3hTU0o3OXlERjFDcEp3?=
 =?utf-8?B?MDZ1MmJCdURWUjN0NVptWGdCdyttUEt5c005ejMvcXEvYVdET3JuSUliMVV0?=
 =?utf-8?B?RGpCaWFIOVhLS3ppV3NoYmZWMDRrb3o3WDROcFZpZlBXbFQ0SzhMa2lReHB2?=
 =?utf-8?B?N28vQi9RZnV4Y3RocytLWHpYZHV6NTFRVlRwUXlZTmt1dnNqTmVHTFhxYTNP?=
 =?utf-8?B?djN5aDdOK0J0THQ3ekF3Qk9xU2VFSEJGRE0rSHFrVXBwVzgwaFlaUWJycVFO?=
 =?utf-8?B?aWNkeW1FY1JwdjJsUmN2Z05HdkxmZCtQY1pDdHZMdFRXbGR3OU5SOWYzaVJB?=
 =?utf-8?B?dHBZWUFoU3BkS1VTaTBnRHNIRmNSNDArMmJRRHhDdDRwdnl1eFhzVnROTXp2?=
 =?utf-8?B?ajFYS0h4Z0p0S2lZamN0UVJVOGxJTWVpVzFtcDRyV0pBdHd3U0VJcWthanJW?=
 =?utf-8?B?b1VoZkxiUVRRdXNOSmR5VFVuNXFudU96UzhNK1J5cVZOeFM1YUZlK3R4WnVC?=
 =?utf-8?B?NUhYMXFpSVlick9QanoreDZ5cUx4WmVqbDhGWlYxMGpBMWFTVWZkU0Y4Vml4?=
 =?utf-8?B?SUxHTmZTektJNE5HMU5IM015b2lVazJTMWt6R1p2MXZHeVgyT3FyVWdXZm4v?=
 =?utf-8?B?RW03SG94Ym1UNEduQy9GNW0yUGZFUy8ydUNpL1o0L1JabVJwaDU4d1ZVZEg2?=
 =?utf-8?B?blo2SkxEb2JGYjVSYmdkMDdDN1B4NE56NVRranBVT0tzRXlyb2xDVUNwV2Rq?=
 =?utf-8?B?NUEvYmdRUjRHRHFBUGorRk5NdTRJQTMxeml1SmlwTE5teXIrOTEzaWpkV0py?=
 =?utf-8?B?cTRCR0FwTTkxc3lzT01sdnVDWGdaaGNEN1ArWVBCY2FpUWc4TnZka2xTZHc0?=
 =?utf-8?B?ZHRvSEFKeERIeEFwWGl3dVdDaWsvRkZuY2dEbHVaZ0NKcGZQeDI1OTZEek51?=
 =?utf-8?B?Mll6S3BVcUJ1NW1Xd1RoYkI0WnkrVjQ3UVphQkdKMXFjaVhRN0pTVXNyRmJR?=
 =?utf-8?B?eDQ0cVpRTlI3SThBb3hGMjBSOHlSd2dDaXBINXlVV2xIRUQyZFFQU01yOUhy?=
 =?utf-8?B?Z3ZqV0NpVVVwVUMwS0pXYk5uclFBOU9oVlJQcm1WVDFRMExzdmlpMFhTUzZh?=
 =?utf-8?B?c3pYbUMwWHN2U3NZdGZ5TldyRXNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n7NkFnR7M8gzUJWiJN9QQX+orl52JUopoeKgGDwEdbNhLRqHl28nLiMH7QDC48YwxIrgaRkUy16/hW5tCsvOIqqdUcfdSAjyhe4h5OwJY9uqzb6bNK1mcSDXnOizhHNUnsT2a8kQU8OdOyXMeCQu9j2ELL0vriyzyQUaBH7Vnq8YwtMTJuUvmnzGnPOx6Yk+ipPmff80OmNxGLr86sgd67s8Uc37LWbVUz1yc83EaN/z+XC32IojOMPFlhCYXp6fmYqe7L9p8/RtoBR14HcMWSsFqQBiIJNMfcJvzBuB+Z07QHU8O4vkJXdt8uoUrhdteiReMj2KTpkdpO3fixiCSHp+9wkdQxiaMwF+5dnd5EHcVtS7oWS2ihb6gdmE8NIh1/LGf7LC0PhvRLxCHwbfGdRJGfi4lvmQXqeE8WCnMGeyxsRpl6X48ae69C48MXbE
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:11:59.0503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df30000-528b-4126-baeb-08de6a1f289f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7087

Instead on relying on CONFIG_DEBUG_FS, rely on the new
CONFIG_STM32_FIREWALL_DEBUG switch that groups all stm32 firewall
debug features to embed RIFSC configuration dump.

While there, use IF_DEFINED() instead of #if defined() so that
all the code is always compiled and let the compiler optimize.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_rifsc.c | 48 +++++++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
index debeaf8ea1bd..80bd5c5acfb4 100644
--- a/drivers/bus/stm32_rifsc.c
+++ b/drivers/bus/stm32_rifsc.c
@@ -73,7 +73,6 @@
 #define RIF_CID0			0x0
 #define RIF_CID1			0x1
 
-#if defined(CONFIG_DEBUG_FS)
 #define RIFSC_RISUP_ENTRIES		128
 #define RIFSC_RIMU_ENTRIES		16
 #define RIFSC_RISAL_SUBREGIONS		2
@@ -434,18 +433,19 @@ struct rifsc_dbg_private {
 	unsigned int nb_risal;
 };
 
-static const struct stm32_rifsc_resources_names rifsc_mp21_res_names = {
+static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp21_res_names = {
 	.device_names = stm32mp21_rifsc_risup_names,
 	.initiator_names = stm32mp21_rifsc_rimu_names,
 };
 
-static const struct stm32_rifsc_resources_names rifsc_mp25_res_names = {
+static const struct __maybe_unused stm32_rifsc_resources_names rifsc_mp25_res_names = {
 	.device_names = stm32mp25_rifsc_risup_names,
 	.initiator_names = stm32mp25_rifsc_rimu_names,
 };
 
-static void stm32_rifsc_fill_rimu_dbg_entry(struct rifsc_dbg_private *rifsc,
-					    struct rifsc_rimu_debug_data *dbg_entry, int i)
+static void __maybe_unused stm32_rifsc_fill_rimu_dbg_entry(struct rifsc_dbg_private *rifsc,
+							   struct rifsc_rimu_debug_data *dbg_entry,
+							   int i)
 {
 	const struct stm32_rifsc_resources_names *dbg_names = rifsc->res_names;
 	u32 rimc_attr = readl_relaxed(rifsc->mmio + RIFSC_RIMC_ATTR0 + 0x4 * i);
@@ -457,8 +457,9 @@ static void stm32_rifsc_fill_rimu_dbg_entry(struct rifsc_dbg_private *rifsc,
 	dbg_entry->m_priv = rimc_attr & RIFSC_RIMC_MPRIV;
 }
 
-static void stm32_rifsc_fill_dev_dbg_entry(struct rifsc_dbg_private *rifsc,
-					   struct rifsc_risup_debug_data *dbg_entry, int i)
+static void __maybe_unused stm32_rifsc_fill_dev_dbg_entry(struct rifsc_dbg_private *rifsc,
+							  struct rifsc_risup_debug_data *dbg_entry,
+							  int i)
 {
 	const struct stm32_rifsc_resources_names *dbg_names = rifsc->res_names;
 	u32 cid_cfgr, sec_cfgr, priv_cfgr;
@@ -481,9 +482,9 @@ static void stm32_rifsc_fill_dev_dbg_entry(struct rifsc_dbg_private *rifsc,
 }
 
 
-static void stm32_rifsc_fill_subreg_dbg_entry(struct rifsc_dbg_private *rifsc,
-					      struct rifsc_subreg_debug_data *dbg_entry, int i,
-					      int j)
+static void __maybe_unused
+stm32_rifsc_fill_subreg_dbg_entry(struct rifsc_dbg_private *rifsc,
+				  struct rifsc_subreg_debug_data *dbg_entry, int i, int j)
 {
 	u32 risc_xcfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_REG0_ACFGR + 0x10 * i + 0x8 * j);
 	u32 risc_xaddr;
@@ -503,7 +504,7 @@ static void stm32_rifsc_fill_subreg_dbg_entry(struct rifsc_dbg_private *rifsc,
 	}
 }
 
-static int stm32_rifsc_conf_dump_show(struct seq_file *s, void *data)
+static int __maybe_unused stm32_rifsc_conf_dump_show(struct seq_file *s, void *data)
 {
 	struct rifsc_dbg_private *rifsc = (struct rifsc_dbg_private *)s->private;
 	int i, j;
@@ -603,8 +604,9 @@ static int stm32_rifsc_conf_dump_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(stm32_rifsc_conf_dump);
 
-static int stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_controller,
-					u32 nb_risup, u32 nb_rimu, u32 nb_risal)
+static int __maybe_unused
+stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_controller, u32 nb_risup,
+			     u32 nb_rimu, u32 nb_risal)
 {
 	struct rifsc_dbg_private *rifsc_priv;
 	struct dentry *root = NULL;
@@ -630,7 +632,6 @@ static int stm32_rifsc_register_debugfs(struct stm32_firewall_controller *rifsc_
 
 	return 0;
 }
-#endif /* defined(CONFIG_DEBUG_FS) */
 
 static bool stm32_rifsc_is_semaphore_available(void __iomem *addr)
 {
@@ -800,11 +801,12 @@ static int stm32_rifsc_probe(struct platform_device *pdev)
 		return rc;
 	}
 
-#if defined(CONFIG_DEBUG_FS)
-	rc = stm32_rifsc_register_debugfs(rifsc_controller, nb_risup, nb_rimu, nb_risal);
-	if (rc)
-		return dev_err_probe(rifsc_controller->dev, rc, "Failed creating debugfs entry\n");
-#endif
+	if (IS_ENABLED(CONFIG_STM32_FIREWALL_DEBUG)) {
+		rc = stm32_rifsc_register_debugfs(rifsc_controller, nb_risup, nb_rimu, nb_risal);
+		if (rc)
+			return dev_err_probe(rifsc_controller->dev, rc,
+					     "Failed creating debugfs entry\n");
+	}
 
 	/* Populate all allowed nodes */
 	return of_platform_populate(np, NULL, NULL, &pdev->dev);
@@ -813,15 +815,11 @@ static int stm32_rifsc_probe(struct platform_device *pdev)
 static const struct of_device_id stm32_rifsc_of_match[] = {
 	{
 		.compatible = "st,stm32mp25-rifsc",
-#if defined(CONFIG_DEBUG_FS)
-		.data = &rifsc_mp25_res_names,
-#endif
+		.data = PTR_IF(IS_ENABLED(CONFIG_STM32_FIREWALL_DEBUG), &rifsc_mp25_res_names),
 	},
 	{
 		.compatible = "st,stm32mp21-rifsc",
-#if defined(CONFIG_DEBUG_FS)
-		.data = &rifsc_mp21_res_names,
-#endif
+		.data = PTR_IF(IS_ENABLED(CONFIG_STM32_FIREWALL_DEBUG), &rifsc_mp21_res_names)
 	},
 	{}
 };

-- 
2.43.0

