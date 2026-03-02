Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205933FD149;
	Mon,  2 Mar 2026 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463619; cv=fail; b=h/rXgKtWRV+MWDX4Fw0w+OABKXE7oJ30kbJycz7p8fLg7OgIxiJJdpDg1btyCp7EKM4nHHWDguSGp4DTqQWFLG+yZc5AoWcLD1cN7m524sUBgO+MAd1wKBqdU0WiDnCZARu/dC+mDGyc4XAM95dcBpQMoWKhgV39hU/VwlOIjEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463619; c=relaxed/simple;
	bh=tI1HX8mpSjejz+ZA/DNyPXDYqPBz6FdPtlCmDEoV/MI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=U6O9uWBcSJD0C/z+ZQbDqfxIMJhhSPM5VfqY4DmqHuDP8jhs2p16zrka2TPGwCvT0X5uUwH9MYWh4RprXj5uuqI8zITmUY3Gy42pECPXOZnStDf7XYTQ7PcX8Dz4IUwkQzZsFUcOcsjOB344ye3ktf0ehPmFEfDd5zapf0w0fro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=h34zAlgy; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="h34zAlgy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C2Jo12MCoJ8JqkY63qmsT7bg406/RXf08xCG8F2zttanpyeBdjfFzE03lhFZqZdPAGkzdoRLwVy6g35v0zPm9hl2sICJhOYpi4M2UsJaeWPPmG22YaBXsvoBqvWrOfwt6XEY09Ae9QOoMjxjt/nAT6lQp/aWQvwmfYvPJOOaVGxUl7PfAc6dw3Fl7pTIJO9uHrYkGkqV3ZWcEgkIisSkYBXpS7N582rkL7Nxdv+ztNY/xU2gutnl6/2t58rzJuX1OsDuhDBYiskLyL1ryNCSxTS4CHMxr8vc/FJ76WRFo3qlnraCmxUWJbIWP/0a4i7SlPMhQ24oIyMjrty4WU/5pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5hKP3FI0Rk214qRsw38EIaBcFaDuFDqNZgMi6bwa8s=;
 b=dv4DR4BollyRospAGDXuWQa8wDPVhPkvl6FJFuNI7LySk5/5UWsjCQo/oNtA5TS35G8KYo3Kgfy6qp44ZgOSWnUqlE2U3AICKGEoqmFczH2RDzV2zhL7+ozhuqVLni66QyYkTashaDTQUkFyukd/6HqJsnaiHQRCLJMz+kbdQs5Y/q6/x9XBvU+10rjtDA+88J7wRwpHICOIS1ceZ6Hb07duWK/aanspW35H9FJv5bl3YEQPW3ZTFzZ9p3jd509OH/3qArS3r/dH0jA9HLeDrfaiPH5hfp2LYjtCGu19bCUvTsn/AvLF5a9c8rou4EUXjlIeC9NnHIVsAKsWuHkEqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5hKP3FI0Rk214qRsw38EIaBcFaDuFDqNZgMi6bwa8s=;
 b=h34zAlgybkm64FqyXYXgrxafHCCu+Bbei8dK5C4lHdE6WHY8b9yHUWXszNfNFGHiNbsvraMcYjPF9WdNIx7zksnl7YCy1Hdt3k3JGTaH1UKzIfJOg27YJcXk7TJPyteYvXHF/3kN9B32jyze4I44cBZNJRZRbSO2zggtoTIZLxhU72QdOxG0+23rhuwVFlqotnXyU62cXlbpGTQpS1sDM2OsqHgQL79weggQCYL9xZGfrTdny+ewRYgNpangCxRfrFPCC95SvhjF6NvjG9zLK8+G9MUmND/sDyPSBQiKWK/y98Oog31dJ5FBGqNL58rnMDZzM+CwgzcGFhjJ8yla9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 15:00:15 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 15:00:14 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 02 Mar 2026 23:01:20 +0800
Subject: [PATCH v8 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260302-clk-ssc-v7-1-v8-6-2356443a7e4c@nxp.com>
References: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
In-Reply-To: <20260302-clk-ssc-v7-1-v8-0-2356443a7e4c@nxp.com>
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
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c2ca11-62f4-424a-f0f6-08de786c68fe
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	fxPwGu8o4sva4g4fOLxSWC19MMTBds2St6uLNIXiccaDzz9+MMMtHsL6emh6G0NoycvAgh07fVory9wLSV5vBkDiYp6PFawcQM6uf2/Cs7qmJOvYY9CE3j+caJI5i0FgqwapuWNGbZEB/L2z5uE201bY1SrL3eerFd7AAB5b8tbowpXInwIo8C+jfqoDKyQGFZGGauDMR3Ix+3pqEc6Jp6XA+1n5K0ZMIrSdJQSkfTJCMa5vBqJ5q8N2X+hZv6B5SfelrYqh8louuFHMzqqPBra98emM356sqYJxhxz2/aXiOMma13KG3Fa85ue+8s0G2PJlcLeh3sf6UM11d1yvDMglY51LvHX82w+YQhZzV47JxRN7oflPfNfGue55cCvozLdMcQPRhKIZrEhCgOTOdlNKEgR3DLMkOh7qsP88TrB7wMfUgO6PDzoCo6FIXC5z1P03wHz4yI8mnAnIPOGB8QTSjb93OeCRTWnStiPxL8uFVpdC9X/vaGH8a4MkBtmRACNdL5/RlNaxM5a3O5tkkSP5kgHsD4F5sHVkcfTgmxSqkqmyM2DWf0URQKE2aEYnfotOX9iRoW4WJXSijhOvitcgSlVLJUwjcruY74jPhXVK5k8qaJGU0wK1UdMmZ6eOPmGPvbfUJ+0cHK2JPCtaynt9B8NZ+ME6jXZIS/AOtD2ZkjG1S05knIB/z0MTL5sCULBN3LOenhpF9Ti2tST57RDPCe6CA/bGi/BEGbo4dARBklT4o4vVpBXP+IzTilTM09CZninTKH2DNqQCFPMNmcHE7ke3z3n9kSr0l1JIilM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0ZSWXFGdHNWZTRVMUVPVVpaT2w0dnd2eVc5Y1ZtSXNoU1JuUS96cjFvY29Y?=
 =?utf-8?B?ZUg5ZGwvUjZxN0ZJWmtJZENMVUVsVjhIR0lha0xYejZ6Tk1pTEJMekhaaUpB?=
 =?utf-8?B?TGdaYVQ3eFpiTWZUVWZFMEpWdjlNUHpwbkQxR1F2TWREWXNXb2lMclVyS091?=
 =?utf-8?B?YTlaY1NITC9IVGdSejJtZFhlc2NwSDljN3lCczNhSE0zMUNvRzR4QWR0c2dQ?=
 =?utf-8?B?aUlCR3RoLzVqTTlaSXBrZ255TC9RSHpwczVnMzJyWGxkZ1prbnRBbGhrNndQ?=
 =?utf-8?B?WVpJVDY3dGw1NG9NTHlNNVh5UWtlZy9iRStvN2E1ZTV5dVBENUF0RDVxRG02?=
 =?utf-8?B?ZFRESDZYckVpT21Hb2g4aGFmR3VRZUpOMldaRGRNTWlTcTU0cGVSL2FuNlJZ?=
 =?utf-8?B?Mm5mYmFNR2JCZGN2MnRUeXRKcW1CVkJ3Yjl4QlpLeTlaRENraW5LZHAxYkc2?=
 =?utf-8?B?RFBIVU4yTU04eDdkOU12dWU2SHBGS09RRDB0c2JwZThRK1czeHNNcU1jSEZo?=
 =?utf-8?B?OHE0Ly9kYTI5dklZdTYybXJOejhkT1hMT0tZK2I4QlRaYStMc3RIaEgrazlI?=
 =?utf-8?B?OGpCczRoYkxYVThVK1hFYTRjT3lCc3hvV3VYWVFiOXF6ZklzVGV6VS90R0FI?=
 =?utf-8?B?RmR1VkJyclJ3VlhSTFI4c1FFR0dua0UrRkRQdHhYYnEzUUx4c25GaTdSNEZW?=
 =?utf-8?B?SXlTaVNQZC9WR2kwQkMxMTlRazdVZVNVUkZIbGhsWGJZTUtudDVZdnRMand2?=
 =?utf-8?B?ajVteFcwZTk1UjNZRjNHUlpXcWZ3czFuU2NMT3RoSmFrVy95YlhVRmV6SzBI?=
 =?utf-8?B?TWRRdUJvTzJQSXdiR2NiSVNmN1ArbkVzM3RoTGVpWjlDc1h4OFFJS3RNV0NI?=
 =?utf-8?B?cjJEdmRVTXpIbndLdEFUdjhxdUZXVHNSVWUvM1JCOUhUcGlqTkczT2h2RXR5?=
 =?utf-8?B?dWtuVkpKeUUzNXBXUzVQVW5TNUFOZ0NFdHNPY3pTa0ZlWSs5dEFmb0hUZzNw?=
 =?utf-8?B?Y0NuM2gvUG5BM1gzdHhyMDZ6OExYSXhiMTJYSDlaaXpaTHV6d1BKb1hEcWVo?=
 =?utf-8?B?NW52L3pGdEg2R1NBU1VpUkt4RUlaTi9hdnNFWlFOUTZ3VG5RZjd6KzBzaFJL?=
 =?utf-8?B?UHpEelZHQ3hnMGRwbHIvc3RmQlJJd1lWZ0V1WlhFUHh0NFhJcG5tT05SdEpK?=
 =?utf-8?B?c3JaVTR6OENFc051Wk0wVm9zL0lna2Q2TWtmK0Ywckc4UWZ2ZDFWTGhrTWFu?=
 =?utf-8?B?V0l0czZXMWd6bVJxaUFxbktuNk82V2I4cEZSL0ZpalpTYTNNT0JxLzBNbWN1?=
 =?utf-8?B?UmwxQkZSMXVYY3JEN1VZR2VyL1JNU1pFV1FsS0ZrMW02Wmd3NlhkNXFwRlFv?=
 =?utf-8?B?dXo4cnk5NzdQd3B4ck1nR3ZpUExXTHlYL1k0SkNCR1N0bFpTWk53YmpweS9j?=
 =?utf-8?B?d3RXTGtadHBTQjNESDV3N0FKWVNPTDFENm1ta0Vsc201MFFkc3JLZ3FmZlcx?=
 =?utf-8?B?cTBJZkhzaFlGRndhUzAwRGJ6MjF6OERBYjZIM2tUOTJNeE5JU1pUbXFFaldD?=
 =?utf-8?B?QjhudmN2c3J6WjQrTEtiU1E3WWF4YUc0Y1o1R2NsRG5oSXNJcGxJdXpMOFFX?=
 =?utf-8?B?V1BwR25naHFKSjlBdG55V1pEQVJSLytFY3FIRVpIQnN4KzRLQWtrOVUxRTdR?=
 =?utf-8?B?emdNSnh5Qi9OVU1PUGRoM25BVW9sLytQM1g3L0F1b2dqbHhZb3pTQUpnK0Va?=
 =?utf-8?B?dDVZTEZRK1ZQOVNSWWVtVnd6ZldQSU02YVVXaEFubFpaMHFYNVAxOHN6WUsw?=
 =?utf-8?B?T2F0SUxHbFJJODd2aFFRZ2JBQURUdk9rNFllOEw2b2J0aHZPdGVSc2x1MWw1?=
 =?utf-8?B?RXJOa3FQaUtjczVtbVVraWgrS2tnRitib3l2QXUzWWlGc1lTRkJBV2RpbU84?=
 =?utf-8?B?WCs1RE51YkU3dkFmNHdleUNCNUxPNGZqRmlNR285ZnBWOW8rWXJHeVFBZmhS?=
 =?utf-8?B?Vk9DbTBFbWw0UUs2OWxFYXA1aWY3NzRKaC9BWkYvVGRBeExBTFFoYjFWNVRR?=
 =?utf-8?B?REdDOUFLMkRianM5Y21hTzdBU0xwa1VRV2pNamRvL2ZNUnZhUTZFS1pjdW5v?=
 =?utf-8?B?RWxLa3hZVS9SS1NkeittUWZneVF2aVkyMHlDMmRvV2Jhdjg5OE92OVMvL1JS?=
 =?utf-8?B?VXZBblZUYVJyaUdkZWt0cVZwajdvTjVJdEVaWnVva2RTNU52ZStmZElqQVZG?=
 =?utf-8?B?bDFmUnFwVTFXQzJVbXBYazJNZkR1T2VWVjNyVElHU0NlYnpsLzlJbzBIbXVq?=
 =?utf-8?B?VWpPMXUxVjJ5aWNHRGIrNFkwSUdZZkVSNDNCamdmZEVLUTd5a0hFUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c2ca11-62f4-424a-f0f6-08de786c68fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:00:14.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qhb8QG5r3HDGURKD0qw5Q0OnM0Oh8lGkhItr8lIc1s1+xY6BjNpmY+4+9cKRPjncbJEYk9Tvop6fksUfNoJUpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980

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
index e053303984b8d61d5c74dc4cdb582eb2692f4ca1..ae069836f29c2af373e56d66f4e1d6ffa32be7b5 100644
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

