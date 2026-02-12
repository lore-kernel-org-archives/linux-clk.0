Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428452E0407;
	Thu, 12 Feb 2026 10:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891124; cv=fail; b=mFNWMFTOOaY8Yx+PRZUvGUA13gpl1yRNAiM9rrTPpRRtQIZ2VdSPpLge/QRa+qHm7xWrLBhWFOEjoKQTsgVn7LhlEowc5/kIsORXuJAXMIBWOAfBQff0s6TDjIVS76lb2W64ZKOoM+Vp1ArlP8iPU+LDALQNXwINxOi3dCi8N00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891124; c=relaxed/simple;
	bh=Mek2UEz1qb4rR2x0g53S4P1I1EhOxkMb8dgySP/YHhA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PxqE+3WKis1ful1fBW3bUDb9+XbxNdItkFxUzBqk0ANZRZ8e2AgNBRYKTteVrk0HE+yZujAdTVnYHBUb6s/lpd3R0i73c2IST4wQVQ/JKmH8KnfBByep66fnM5OEnsFYS68n7DSPMCmZltyeU4nw+LzzaRjpKOd6iKixxB5KclU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=YwM012WX; arc=fail smtp.client-ip=52.101.72.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="YwM012WX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3HYxkocXP36UC28J2DfcivahLSP+gfpqzFlHSkyvvE00YKSj9g0cYoAY7vkLoMMtbINianMILt5oIvLQ84TK3a54RTZFuLFrkIGtEnk0rnCiJJUv7njO7e/oWpOlMnfV0DGxHTCFtuyCFVvYUReGuhz8L85gKa+NIphHkHMQe5NJ+7rVPSHmznjSf9z+DetpuLxd3wbdsVvsRpt4WlNlNudqkTtfQHIzdzvSQaZ8EKCSz2vVAVCHYHT9I5MgRGITtYGU6Z28SGNQ4zDkIp6g84ViBXCw6CLDAs5pAj2qfLGsFNLX7+QFzF+HUZFG9ZZOhkC2hvLoHIY3NEs9PHzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIkq9bzraNkKQH1Ro5dS62OtQ5vtmCuoAT94DcldeIw=;
 b=hduModa2gCBj03LHt4/vddsY7V3a0ZVPPUaQC2p7L9PXiFWkRolQrH2eDDlHcEEkj1uYFSlj2t5kJ/FD78hwOtJBTdTWOqEkaQD5sedJcbvBS9ATufuxCcRBPCGDBfxm/ureVDu4IYa+5sWXOSAzoWFn5OSPdZVA+QUBm6IPQY7mtOHpFI4UL5DnMaytrVrA8maA7Y9mhr2Kcx/FxpYMR0lyy9yKP1lf82ZJ8ErWqf53beObyZbusqe8tP8fhs+4U//p0vnOL8vV2HPVS+dVMU4RSV8pl0hW2n3NMZl8uOTq7Ug+KS1fMHOyotJgpiiB/JQxf2adlsKb7bYDVNs+vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIkq9bzraNkKQH1Ro5dS62OtQ5vtmCuoAT94DcldeIw=;
 b=YwM012WXLwsJxEC3u5Zix9K7XliBkWVU0ekqPOElEGFOW1IlE5ut5P1syfYDoohN8pDLFnNgj80VIaIZrbLCXigH0xaxl/R4njOBxynwKQjL4CcljS+rJb+bsqw/ROC1K/588U2rpSskAhvqZOPEkF0ESA1LtTNR8S3M9IcVyLSNQPJl97GKR6bKeJvz4XkQAgYGyvGu8RGRPXQboABF2pW6wbPVWhK5LXIiwabOYJn+FzM93hXyEt5VbsVL36nPnx57lxmEVbll65nOtacBxLBg8YigK5cNhCzEFYFP5/IZu13h4UJijpFajlGPAakGcmexO2DWbG03CAydWaNpfg==
Received: from AM6P193CA0124.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::29)
 by PAVPR10MB7308.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:11:50 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:209:85:cafe::c3) by AM6P193CA0124.outlook.office365.com
 (2603:10a6:209:85::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 10:11:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 10:11:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:13:30 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:11:47 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:31 +0100
Subject: [PATCH v2 2/9] bus: add RISAB dump debug driver
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-stm32_risab-v2-2-02ef2859b596@foss.st.com>
References: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
In-Reply-To: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>, Theo GOUREAU <theo.goureau-ext@st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DC:EE_|PAVPR10MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fba9397-fd41-4d4c-53a3-08de6a1f2241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0h5S2RmV0NXeHpVd3gwdzlFdUsvWUJwYWp4cC8rZmEvcVFGNGlMSTExTkNh?=
 =?utf-8?B?a0lTaW5PdmF4Uk15cHcwMlZHVkhjWTN1c3FxLythekJlRldhWUV0VTFQN09S?=
 =?utf-8?B?VWo1WWxKTElvenhORE9mR1BkWnV0L0pUbHhMdHdnNVZrZzJ2M3R4OVowMWpX?=
 =?utf-8?B?M1AyTGdVczlEZUVSWHM0clViWHdwbnhvQ3hPSTFPR2VTaHg2NGk4US93aDVk?=
 =?utf-8?B?dUFPTHRyWkVGeVZjVC9DVkpIWjVlaHdZNGlyeHpLNFVUVSt5K0wrc1YxTEty?=
 =?utf-8?B?dm5PcjFJTlBNeUQxZENNVGV4d3d2MVV5c1h1UEZtK1dPRUF3ZVVqNkw0Tm52?=
 =?utf-8?B?RlZPZGxic05sdGNZK25VeGNmTmZlRlhnQ2xGVnBXS2VCRGkwYmlSN3BQcXd2?=
 =?utf-8?B?M1czNmRleWZmSTF4bndNdHBlYjNYc25oWWRkOWJDSy9aam82a2ZkUk9FOXRp?=
 =?utf-8?B?bGFEYjB6dkN5SlBKVGs1VVh2WWVuUWViV2JFTm9DaGZPTHhkOTJQRFF1S2Jw?=
 =?utf-8?B?Y1JLaEtGalh0b1dQVDIzS0o2OC9rWElmUmwwTkF0bTBPdkY2UFAxc3JpS1lK?=
 =?utf-8?B?Kyt6T1pBZlVteWVQaXlhaFNHc2ZoekZIY1FRZm9jSWJyaFc1anBHWGRVVUk2?=
 =?utf-8?B?c1dwR3AwV0h1Sk1rUzU3Y202c2MvVXpRUE9UUGJyM2ZLSlN4Z1p6UmdDWTRH?=
 =?utf-8?B?eVBnUU8zNEMyaWdxSGpiejBRWlZPV2NLejhUM2dZejA3VVc2b1RzUk1GcVE3?=
 =?utf-8?B?Q2hQVVZoSVlPWnAzYlVxMFQ4dUdkUnVrQXBHNmdRajdHSDY3S0g1eVgxUU1y?=
 =?utf-8?B?Y0JmTXFURnpHRUpyZWY3TS9YY0pmMDhYTEZ5U0lWa09PZWRhTTJWcHlOeVc1?=
 =?utf-8?B?NnBJOXJLcTZKcGRGb0F1b0dOMk9pbjBLVXFEeGJqMnFQQU9WNFlSaFpMVVpG?=
 =?utf-8?B?UWZLTW9aUXpxR2h5cGlwamduUFk3TDFvSlVCcHJTZDhqOGJ6cnZKM1ZQQnBv?=
 =?utf-8?B?bFJ0djlodlhNSi83Y29PdmlRdEdPdUJJU29RcTNTZC8wd2pmY2NEMGdXNDVo?=
 =?utf-8?B?UlQ5Ni9HVldVU2F4aEJ6WTlqbTlnRWp2MjJ4TGJBcWxtcWZzSEtud0pxa0p5?=
 =?utf-8?B?MXZmaG41a09VeTl0ZW5nWHVxd3hpZVFNNWR5M05uR29nc2FDQUNSa2o2aWRR?=
 =?utf-8?B?Q0EyWlNsek9SUlN6aGs5bEx3V1hTM0FIbThuYnovU1RhSDEvZUgwRnBVWXVz?=
 =?utf-8?B?dk1JT2FCdDlZc0NOSVBnTGJFWGczbjg5N3psbFJ0Ym4xbDNqRHMySkR4azQ3?=
 =?utf-8?B?dGNpVFFWaWprRnpSb0IrM1UrbWlmaEk5VVo2dzdVZm90dDA2WVhubTJWblpj?=
 =?utf-8?B?RUtoMlRsbkhDcFhSemRFYk14TTkzaGw3ZHFJN2U3YUZ3T1UrZmxuVlU0ZTR3?=
 =?utf-8?B?dEQ2MUhvQmY4NUROVURZL3dkaWtwZVVNcmVWSC9hSkhSbU13S3dqbUExQUJp?=
 =?utf-8?B?M2Yvd3NNaC9XQWhuWThLMHRKU1FvNzJ4WEszdFZCdnZlc0UydGFxenpNK1dr?=
 =?utf-8?B?M0lyY1ZvM0RVODRKZTJxVnc0dTYrMVFOWXZGOXV3cW96aFVHbkwrajRGK1kw?=
 =?utf-8?B?WklOZDVGQnpFTm0xYzgva3lLbGpSNHdzZktVNXZsajY4ZFo5S0lHV3JMM21r?=
 =?utf-8?B?WDFhTTZyUURBUlAvQ00zb1o1NlBFRmp6cE5nMlNNaHZKT0JmeEFYTm1xdndk?=
 =?utf-8?B?VDdSQ1BTSUlIeWoyNkp2bnAraEVVQ1gxcXZtT2dSMGtiaENZRVVWL0tSb2xn?=
 =?utf-8?B?NlJzRDhlZnZ0QnVjZDFnTlVkeDVzZ3kvNmxoWUoxSHdlK2FzS1p4bTdsTEli?=
 =?utf-8?B?bEoxVUJ3V3JsSlB2S0RVWlFVbXRNbitlZUs4YlplUHBnY05vV2wrYmdpVXVy?=
 =?utf-8?B?VVZLNVVPWjR3Y0ZLMDc2UEFrUHZ0c21nczJMS0xSY0MyMFhMc1JmZ2FrT2Zm?=
 =?utf-8?B?ZlVoeEk3RUw4bkFOMjBwaDdKZXFlclJMRVd1K2FSbEtUL0Z0UnFGNTBxeFdO?=
 =?utf-8?B?ajZBbFp0ZloybzlCMWJURnJmeTN3TVpWVG1pbHFReC9oelJad2FuRVV2WW1V?=
 =?utf-8?B?SzlFNU4wS3RoSzhuV0xZdG5GeU5uVWEvUGR3UWlKaUxMQ2VNMExkYUR6U3V1?=
 =?utf-8?B?WlZ3SVZwRUpJMjAyRVFoQWNqdUVBSm1zK05uUFVFNDRQMFBwRkU3bEpRR2Nr?=
 =?utf-8?B?WWxsTDFsUlBibDB5RDllbXY2d0tBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KrIMm/Nv6KQ3iO34r97tezvefWQkMMAcMzD6Yw8Lna19S72Y7piPBnTb0NP3NoTqb8qwKScnBbfJmqylPWOCpmQoiR1ynRI1RgZfTpdTkjsFI+7conz+yUiedP2zGjZM1fx6EuOyKGYo5T7//MBAP4lajY+qMlMqO1ru1s+8dqacxNlmORp2Xxn1EkM1Zjzwna1sa0Hpt2/Bv739JPiH15Ou7/6pQaFnL3H2lpMezpHqp5iLvuhnRBd07sQOHAtv2pqW8lK0Y1yu3ecI/AqESbdmJ8/qQnr4dY+Xx3X4y4X0yTtOyqW/xxsllBFQEQQANNJqhrJTXTqJH0PlA/D6RW3iWkPzNB03ixM1r20kyoIyCq3ntZsRMI/ubzIR7r8GEnKCZU/pw20Rm+YQ40/+kU9qiEX2xXHSX/ZazxewiKZlC8cffrQiqhHqerjiY9oT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:11:48.3577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fba9397-fd41-4d4c-53a3-08de6a1f2241
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7308

The Resource ISolation peripheral unit for Address space protection
(Block-based)(RISAB) is a memory firewall peripheral protecting
internal RAMs and is part of the STM32 Resource Isolation Framework
(RIF).

RIF configuration on stm32mp2x platforms can be quite complex.
Especially for memory firewalls. The RISAB configuration is done by
the Trusted Domain that is running in secure privileged mode.
However, its configuration can be read in any mode.

In order to facilitate the memory firewall configuration (check if
correctly applied, what rights for which range, etc...), add a RISAB
configuration dump driver that creates a debugfs entry as an
interactive way of looking at RISAB configuration.

This debugfs entry is a heavy printing function when read so be aware
that reading it will involve significant time in the driver.

Introduce CONFIG_STM32_FIREWALL_DEBUG configuration switch to
enable STM32 firewall drivers configuration dump.

Co-developed-by: Theo GOUREAU <theo.goureau-ext@st.com>
Signed-off-by: Theo GOUREAU <theo.goureau-ext@st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/Kconfig       |   9 ++
 drivers/bus/Makefile      |   1 +
 drivers/bus/stm32_risab.c | 336 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 346 insertions(+)

diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index fe7600283e70..1b12de2854ab 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -179,6 +179,15 @@ config STM32_FIREWALL
 	  hardware resources linked to a firewall controller can be requested
 	  through this STM32 framework.
 
+config STM32_FIREWALL_DEBUG
+	tristate "STM32 Firewall drivers debug features"
+	depends on STM32_FIREWALL && DEBUG_FS
+	help
+	  Say y to enable STM32 firewall configuration debug features. This
+	  will cause the generation of a "stm32_firewall" directory in the
+	  debugfs with entries for each firewall driver capable of dumping
+	  its configuration.
+
 config SUN50I_DE2_BUS
 	bool "Allwinner A64 DE2 Bus Driver"
 	  default ARM64
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index 8e693fe8a03a..a0447682c314 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
 obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o stm32_rifsc.o stm32_etzpc.o
+obj-$(CONFIG_STM32_FIREWALL_DEBUG)	+= stm32_risab.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_OF)		+= simple-pm-bus.o
diff --git a/drivers/bus/stm32_risab.c b/drivers/bus/stm32_risab.c
new file mode 100644
index 000000000000..794c2bf40a2d
--- /dev/null
+++ b/drivers/bus/stm32_risab.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+/*
+ * RISAB constants
+ */
+#define RISAB_NUMBER_OF_PAGES_MAX	32
+#define RISAB_BLOCKS_PER_PAGES		8
+#define RISAB_NUMBER_OF_CID		7
+#define RISAB_PAGE_SIZE			0x1000
+
+/*
+ * RISAB configuration register
+ */
+#define RISAB_CR	0x000
+#define RISAB_CR_SRWIAD	BIT(31)
+#define RISAB_CR_GLOCK	BIT(0)
+
+/*
+ * RISAB configuration lock register
+ */
+#define RISAB_RCFGLOCKR	0x010
+
+/*
+ * RISAB page y=0..31 security and privileged configuration registers
+ */
+#define RISAB_PG_SECCFGR(y)	(0x100 + 0x4 * (y))
+#define RISAB_PG_PRIVCFGR(y)	(0x200 + 0x4 * (y))
+#define RISAB_PG_C2PRIVCFGR(y)	(0x600 + 0x4 * (y))
+
+/*
+ * RISAB compartment x=0..6 privilege, read and write configuration registers
+ */
+#define RISAB_CIDPRIVCFGR(x)	(0x800 + 0x20 * (x))
+#define RISAB_CIDRDCFGR(x)	(0x808 + 0x20 * (x))
+#define RISAB_CIDWRCFGR(x)	(0x810 + 0x20 * (x))
+
+/*
+ * RISAB page y=0..31 CID configuration registers
+ */
+#define RISAB_PG_CIDCFGR(y)		(0xA00 + 0x4 * (y))
+#define RISAB_PG_CIDCFGR_DCCID_MASK	GENMASK(6, 4)
+#define RISAB_PG_CIDCFGR_DCEN		BIT(2)
+#define RISAB_PG_CIDCFGR_CFEN		BIT(0)
+
+/*
+ * RISAB hardware configuration registers
+ */
+#define RISAB_HWCFGR1				0xFF0
+#define RISAB_HWCFGR1_LOG_NUM_PAGE_MASK		GENMASK(27, 24)
+#define RISAB_HWCFGR1_LOG_NUM_PAGE_SHIFT	24
+
+struct risab_debug_data {
+	bool sec[RISAB_BLOCKS_PER_PAGES];
+	bool priv[RISAB_BLOCKS_PER_PAGES];
+	bool c2priv[RISAB_BLOCKS_PER_PAGES];
+	u8 dccid;
+	bool dcen;
+	bool cfen;
+};
+
+struct risab_generic_debug_data {
+	bool srwiad;
+	bool glock;
+	bool rlock[RISAB_NUMBER_OF_PAGES_MAX];
+	bool ppriv[RISAB_NUMBER_OF_CID][RISAB_NUMBER_OF_PAGES_MAX];
+	bool prden[RISAB_NUMBER_OF_CID][RISAB_NUMBER_OF_PAGES_MAX];
+	bool pwren[RISAB_NUMBER_OF_CID][RISAB_NUMBER_OF_PAGES_MAX];
+};
+
+struct risab_pdata {
+	void __iomem *base;
+	struct clk *clk;
+	struct device *dev;
+	struct dentry *dbg_entry;
+	u32 phys_base;
+	u32 risab_map_base;
+	u32 nb_pages;
+};
+
+static void stm32_risab_fill_dev_dbg_entry(struct risab_pdata *pdata,
+					   struct risab_debug_data *dbg_entry, int page)
+{
+	u32 risab_pg_c2privcfgr = readl_relaxed(pdata->base + RISAB_PG_C2PRIVCFGR(page));
+	u32 risab_pg_privcfgr = readl_relaxed(pdata->base + RISAB_PG_PRIVCFGR(page));
+	u32 risab_pg_seccfgr = readl_relaxed(pdata->base + RISAB_PG_SECCFGR(page));
+	u32 risab_pg_cidcfgr = readl_relaxed(pdata->base + RISAB_PG_CIDCFGR(page));
+	int block;
+
+	for (block = 0; block < RISAB_BLOCKS_PER_PAGES; block++) {
+		dbg_entry->sec[block] = risab_pg_seccfgr & BIT(block);
+		dbg_entry->priv[block] = risab_pg_privcfgr & BIT(block);
+		dbg_entry->c2priv[block] = risab_pg_c2privcfgr & BIT(block);
+	}
+
+	dbg_entry->dccid = FIELD_GET(RISAB_PG_CIDCFGR_DCCID_MASK, risab_pg_cidcfgr);
+	dbg_entry->dcen = risab_pg_cidcfgr & RISAB_PG_CIDCFGR_DCEN;
+	dbg_entry->cfen = risab_pg_cidcfgr & RISAB_PG_CIDCFGR_CFEN;
+}
+
+static void stm32_risab_fill_dev_generic_dbg_entry(struct risab_pdata *pdata,
+						   struct risab_generic_debug_data *dbg_entry)
+{
+	u32 risab_rcfglockr = readl_relaxed(pdata->base + RISAB_RCFGLOCKR);
+	u32 risab_cr = readl_relaxed(pdata->base + RISAB_CR);
+	int page, compartment;
+
+	dbg_entry->srwiad = risab_cr & RISAB_CR_SRWIAD;
+	dbg_entry->glock = risab_cr & RISAB_CR_GLOCK;
+
+	for (page = 0; page < pdata->nb_pages; page++)
+		dbg_entry->rlock[page] = risab_rcfglockr & BIT(page);
+
+	for (compartment = 0; compartment < RISAB_NUMBER_OF_CID; compartment++) {
+		u32 risab_cidprivcfgr = readl_relaxed(pdata->base + RISAB_CIDPRIVCFGR(compartment));
+		u32 risab_cidrdcfgr = readl_relaxed(pdata->base + RISAB_CIDRDCFGR(compartment));
+		u32 risab_cidwrcfgr = readl_relaxed(pdata->base + RISAB_CIDWRCFGR(compartment));
+
+		for (page = 0; page < pdata->nb_pages; page++) {
+			dbg_entry->ppriv[compartment][page] = risab_cidprivcfgr & BIT(page);
+			dbg_entry->prden[compartment][page] = risab_cidrdcfgr & BIT(page);
+			dbg_entry->pwren[compartment][page] = risab_cidwrcfgr & BIT(page);
+		}
+	}
+}
+
+static int stm32_risab_conf_dump_show(struct seq_file *s, void *data)
+{
+	struct risab_pdata *pdata = (struct risab_pdata *)s->private;
+	struct risab_generic_debug_data generic_dbg_entry;
+	struct risab_debug_data dbg_entry;
+	int ret, page, compartment, block;
+
+	ret = clk_prepare_enable(pdata->clk);
+	if (ret) {
+		dev_err(pdata->dev, "Couldn't enable RISAB clock");
+		return ret;
+	}
+
+	stm32_risab_fill_dev_generic_dbg_entry(pdata, &generic_dbg_entry);
+
+	seq_puts(s, "=============================================\n");
+	seq_printf(s, "        RISAB dump (%s)\n", pdata->dev->of_node->full_name);
+	seq_puts(s, "=============================================\n");
+
+	seq_printf(s, "Secure read/write illegal access disable (SRWIAD): %d.\n",
+		   generic_dbg_entry.srwiad);
+	seq_printf(s, "Global lock (GLOCK): %d.\n", generic_dbg_entry.glock);
+
+	seq_puts(s, "| Page                       |");
+	seq_puts(s, "| Res. |");
+	seq_puts(s, "|     priv. (p) read (r) write (w) per compartment      |");
+	seq_puts(s, "| Delegated |");
+	seq_puts(s, "|    CID    |");
+	seq_puts(s, "| secure (s) default priv. (p) compartment2 priv. (P) per block |\n");
+
+	seq_puts(s, "|     start add.  end add.   |");
+	seq_puts(s, "| lock |");
+	seq_puts(s, "| CID0  | CID1  | CID2  | CID3  | CID4  | CID5  | CID6  |");
+	seq_puts(s, "| conf. CID |");
+	seq_puts(s, "| filtering |");
+	seq_puts(s, "| blck0 | blck1 | blck2 | blck3 | blck4 | blck5 | blck6 | blck7 |\n");
+
+	for (page = 0; page < pdata->nb_pages; page++) {
+		stm32_risab_fill_dev_dbg_entry(pdata, &dbg_entry, page);
+		seq_printf(s, "| %2d  0x%08x  0x%08x |",
+			   page,
+			   pdata->risab_map_base + page * RISAB_PAGE_SIZE,
+			   pdata->risab_map_base + (page + 1) * RISAB_PAGE_SIZE - 1
+		);
+		seq_printf(s, "| %3s  |", generic_dbg_entry.rlock[page] ? "Yes" : "No");
+		for (compartment = 0; compartment < RISAB_NUMBER_OF_CID; compartment++) {
+			seq_printf(s, "| %1s %1s %1s ",
+				   generic_dbg_entry.ppriv[compartment][page] ? "p" : " ",
+				   generic_dbg_entry.prden[compartment][page] ? "r" : " ",
+				   generic_dbg_entry.pwren[compartment][page] ? "w" : " "
+			);
+		}
+
+		if (dbg_entry.dcen)
+			seq_printf(s, "||  0x%04x   |", dbg_entry.dccid);
+		else
+			seq_puts(s, "|| disabled  |");
+
+		seq_printf(s, "| %-9s |", dbg_entry.cfen ? "enabled" : "disabled");
+		for (block = 0; block < RISAB_BLOCKS_PER_PAGES; block++) {
+			seq_printf(s, "| %1s %1s %1s ",
+				   dbg_entry.sec[block] ? "s" : " ",
+				   dbg_entry.priv[block] && !dbg_entry.cfen ? "p" : " ",
+				   dbg_entry.c2priv[block] ? "P" : " "
+			);
+		}
+		seq_puts(s, "|\n");
+	}
+
+	clk_disable_unprepare(pdata->clk);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(stm32_risab_conf_dump);
+
+static int stm32_risab_register_debugfs(struct risab_pdata *pdata)
+{
+	struct dentry *root = NULL;
+	char risab_name[15];
+
+	root = debugfs_lookup("stm32_firewall", NULL);
+	if (!root)
+		root = debugfs_create_dir("stm32_firewall", NULL);
+
+	if (IS_ERR(root))
+		return PTR_ERR(root);
+
+	scnprintf(risab_name, sizeof(risab_name), "risab@%x", pdata->phys_base);
+
+	pdata->dbg_entry = debugfs_create_file(risab_name, 0444, root, pdata,
+					       &stm32_risab_conf_dump_fops);
+
+	return 0;
+}
+
+static int stm32_risab_get_nb_pages(struct risab_pdata *pdata)
+{
+	u32 risab_hwcfgr1, nb_pages_shift;
+	int ret, nb_page;
+
+	ret = clk_prepare_enable(pdata->clk);
+	if (ret) {
+		dev_err(pdata->dev, "Failed to enable clk: %d\n", ret);
+		return ret;
+	}
+
+	risab_hwcfgr1 = readl_relaxed(pdata->base + RISAB_HWCFGR1);
+	nb_pages_shift = FIELD_GET(RISAB_HWCFGR1_LOG_NUM_PAGE_MASK,
+				   risab_hwcfgr1);
+	nb_page = BIT(nb_pages_shift);
+
+	if (nb_page > RISAB_NUMBER_OF_PAGES_MAX) {
+		dev_err(pdata->dev, "RISAB number of pages is greater than %d",
+			RISAB_NUMBER_OF_PAGES_MAX);
+		ret = -EINVAL;
+		goto err_clk_disable;
+	}
+
+	ret = nb_page;
+
+err_clk_disable:
+	clk_disable_unprepare(pdata->clk);
+
+	return ret;
+}
+
+static int stm32_risab_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct risab_pdata *pdata;
+	struct resource *res;
+	void __iomem *mmio;
+	int err, nb_pages;
+	struct clk *clk;
+
+	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	if (!pdata)
+		return -ENOMEM;
+
+	mmio =  devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
+
+	pdata->phys_base = res->start;
+
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "Failed to get clk\n");
+
+	pdata->base = mmio;
+	pdata->clk = clk;
+	pdata->dev = &pdev->dev;
+
+	err = of_property_read_u32(np, "st,mem-map", &pdata->risab_map_base);
+	if (err) {
+		return dev_err_probe(&pdev->dev, err,
+				     "Couldn't read the memory range covered by the RISAB\n");
+	}
+
+	nb_pages = stm32_risab_get_nb_pages(pdata);
+	if (nb_pages < 0)
+		return dev_err_probe(&pdev->dev, nb_pages, "Couldn't read RISAB number of pages\n");
+
+	pdata->nb_pages = nb_pages;
+
+	platform_set_drvdata(pdev, pdata);
+
+	return stm32_risab_register_debugfs(pdata);
+}
+
+static void stm32_risab_remove(struct platform_device *pdev)
+{
+	struct risab_pdata *pdata = platform_get_drvdata(pdev);
+
+	debugfs_remove(pdata->dbg_entry);
+}
+
+static const struct of_device_id stm32_risab_match[] = {
+	{ .compatible = "st,stm32mp25-risab", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, stm32_risab_match);
+
+static struct platform_driver stm32_risab_driver = {
+	.probe  = stm32_risab_probe,
+	.remove = stm32_risab_remove,
+	.driver = {
+		.name = "stm32-risab",
+		.of_match_table = stm32_risab_match,
+	},
+};
+module_platform_driver(stm32_risab_driver);
+
+MODULE_AUTHOR("Gatien Chevallier <gatien.chevallier@foss.st.com>");
+MODULE_LICENSE("GPL");

-- 
2.43.0

