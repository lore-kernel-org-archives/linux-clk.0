Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012045.outbound.protection.outlook.com [40.107.209.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB35395AFE;
	Wed, 12 Aug 2026 07:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786520414; cv=fail; b=AXRq9DyCvIfOF41r/zP/JgSHnO+mO/iWbVgpvG3qKjt2v759Cy9y/XerB1VbMMwaxKSPqplbOyEQPY3EoxONkcIqcVeUF9xChp1HxI+VGQ8/HViJ8Z6DTE4TM7Entl4LHOus+p1+Tzw5DW89jRUvGdOS9krxdqs0VYJSA5B9J0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786520414; c=relaxed/simple;
	bh=coaFUkEfsA26o4d+Dc8x0Y8Gvqe4uh+Wd9XpxOiyDOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T5DE3DMTdb3S82zdmILA1zVqNYXXvC+v5OSDoVFiIxtDIcs64cmKisGDXab3blx91hqHHs792Ii5aPQxaaFZUX0r8cC2NmjabU5DPvPVgqaKKNtXgZd51pQcp9IHC5wOL9cas0aWO6gRqcLoJnVc41W+IYg+ASFpzoaa5gkvFCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=Cerbap4b; arc=fail smtp.client-ip=40.107.209.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="Cerbap4b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/SS/mi532h3mUJoKd857dY1/0VE0bjgoyUFpAY35X5dKiQY/Z4JAFJgzSKh7dfq7GCZ05/kIEJJievq20xsxYEdTbcbhLbIK3LXfBG2D4YeWQJnEcUc3H9b3PG4cvl5WBes1BBwkWkN+mKUkH9cBZj+xJHTwb4ZOdA2DurBIRF9a+0n3dFSa7s78KCBPBbBTBIJr5C3hDSLVWOMYW3t/Gqv5mP35lFUoUkAq1RIM5w55PKql6kapNyLh5C3azdFns9ofxIZOOG+e+uSkO0xTvSI+ImWzEa0NAgmYqce4YnspU9zBKQh3bMZiDSBRMHDLa++miFRfMxLUghn6WY93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlkcV5Rvtlq5GYGRzLpTUeGSU7MnWvChb+UBUNekCoc=;
 b=yWwtBbIXi71XKaGkrZPuEq8LOf0qi6+pNeD/KVcfWMR4idSRCrT2pJ/EsB/RTwOXnSr/7YblwAmvtfaG943ozlH7XZZaLAVoNWrXqqUriptnyWLyvRjunCP4+GQH/JXZ1ndSDvqSjtZ/W7KkuEZoHCNjlye0JlFTq0JIvm2Use2X1KsrDJB+u03HLO8OfFPMJpnEudqajQhMyWhRCAiX0BHfMTAyMphfjDkxDQqjNT6FmTK7CiTWOvAtxsI7PHul3RiMFkBkFqIB5yX2VZwEf6qdwFplXt2y6yvcEJA1YR2kFgHmsPSBLQPlFMl7+Qk4B1mwvTPindgM/6MQBR7/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlkcV5Rvtlq5GYGRzLpTUeGSU7MnWvChb+UBUNekCoc=;
 b=Cerbap4biN5AZKTH3IO9Lt8fieh2TlUWCdLBNm81KsliW2Y+4esWBZan9LPwchE4IL3hLk+CCDkyFKc0ocIyfmj7bm3p40N2y5VXbxawwNo4tHv+17P/q4/Ohtpk3g3gi4JDY3LxI7MN5fpuUwvOT9EcRDRCslaiI6AXSASj+uLnwsFDOE/GllHSLTpXnr9bhO76kP1CKW134FIWecRtRwwlKN5mhkmPbTeb8UGPuBwCKUSSIrqQTqH608wlGuZdQMUVIl0uZY1RejuUOS7RyhynwMMSGyMp6qFflOau0KXnuZTbzPagyuzCdFtC/qHyDd2ul8BT7AXYwCuO4fNG2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 BN9PR03MB5979.namprd03.prod.outlook.com (2603:10b6:408:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 07:40:00 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 07:40:00 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 4/6] arm64: dts: intel: agilex5: add USB3.1 controller node
Date: Wed, 12 Aug 2026 15:32:57 +0800
Message-ID: <628275930f99fb6cdc3edb7269ac75cd04f870dd.1786518803.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
In-Reply-To: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
References: <cover.1786518803.git.adrian.ho.yin.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JH0PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:990:7::14) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|BN9PR03MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b558e51-7d01-40cf-438d-08def844ea01
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|22082099003|18002099003|55112099003|11063799006|56012099006|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	yYK7JCaSzK8wklQg8QludHUrTJPiVoyFn1ntJWe1nkBIbOz3scOifKSDQQQB8ODPYgV6CHcfkdo5B4ZiXI+fE8lDBjYusARowkf8YScwg5CF5+xvQAPKUyDfSuOhv1eocEr+8Gry1+XewXIu8l1SPTJxutYtbI8rcls/xxhLEMMqCMRtMbducNwk6rjEvm2sykzVgmotGbi1bND0Z4U7HzDRiytSvfFz6P7/O8OoJAjTT3RWIXXagWoBtuM6FVdRgmaUCA5RmOnC0sV4MIuCn/pphK5UlEWg0EIEdEHZfn5TArxEKIzDXWj5Z2DtxG0b3YOUGXayPyDT3ZhRssmdiZz5YB7nl91zFoqhne6UJvwHHEZSF2ItnaXx4tcs2ldF8+YEcVxZ5bRULEX1osfEdgShd7hPZUyt4xvnNCeHfStbCsq2fJhaiFQK7L4NYxSbILBNHZdTQbu4tD+d8+NHcAZYFnqFzS5YRZZAdMWNAITowvYYMvIXhm48SVPMw1X4aqytAQwoHFgUQer1mVH9qLlNDkBo2smZlnQJzeyoEk95tZLUTzfDrNQotJmbzyMmqKQYOOU6X6iaraA/WFvgRqDeiX5BSp/Oe5a0NkcMb8L+q/Kg70Wl93Lk+8i5iDayjS6A/WyqsqdsXI50sN+1Nk1BLd0Q2/OXQE2uB/vtyj06H1r0xut+ItoxYmh1tVygNh5DjQwPFblD5CXDprPlqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(55112099003)(11063799006)(56012099006)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5z7iL9wnl9IYIAAvg9fLEL8G9/vGK5wjZKxmfq1n+YBuxbktlFWebaSw+Now?=
 =?us-ascii?Q?XGOUYchnu4ep8dKmUnEVq2nXiwdVxl4lFFUvQRgn2PZSS1OSr8fnFh9Cp3m8?=
 =?us-ascii?Q?cYbQctIqsSe6M69yd6YjTPDmT818v0ElmEkbZryTFje3m16bXHWc7cRgHzef?=
 =?us-ascii?Q?13hRHGw7yCvLMDUT4TNJ+9qWBOX/0dQ9kL8sH5HkeEx06/xAzWdHwaRbxo5d?=
 =?us-ascii?Q?CUZQBEo8mYpXy7td7/hz6LRPZOC8IPUfV3rLl4tohOEH9xQWLv0WeYnAeypE?=
 =?us-ascii?Q?2SczCNLdJahsyFZnpQea5frGYaoqvzKByYEtd50kykF7XdWz89KlCgEv+tTn?=
 =?us-ascii?Q?mDrbOGFziUceH7cILga+UXPyS2+ptFID45qYTur/5XUJ2MeC1H1VTv5nHLvu?=
 =?us-ascii?Q?PrIIZzOj6MLN2+mEPYPZB4IDSlkzjNnEQ6lJsT0w6PIM4tL/FTBnt5uAxzzT?=
 =?us-ascii?Q?iwW4eVta9c6biRFQpVZGoJvM9nLmAm0kfJ3C5XEQazhlVVEZUZM05QG1yhCq?=
 =?us-ascii?Q?NXpltxVtR65YVK5eNfwNJB/OnC0/lPULoDGunusuM3ZLNZbwl8vMM5hge1cF?=
 =?us-ascii?Q?mqo8IxAvVY+RiwziKPm4P4jOhlNf1a4ZbmDs+1AKZBzvGgrpQ5aMZSb/W394?=
 =?us-ascii?Q?BjNHw/HVwUu+XxJxpW9ZakyjE7eOmTpJy+wprr/eiQlSb8/fVzgzYWY0uIfz?=
 =?us-ascii?Q?U1bVGZmrqeE8vtcvegj8xbSn04ta9nqM5YHWQMWwAO6lvZbrCmRz8d2I4LnC?=
 =?us-ascii?Q?goVUmRbs2eNrF+rwD5RdSahsD7jHbrqMPkhOyrkXyo0qM5ECByQUoItK26Bf?=
 =?us-ascii?Q?VirZJyZpXvFR0SfnsWZvUrrFs8SSvnevoZ9NBxCZLljzj2s5cmAMYK33+0Gh?=
 =?us-ascii?Q?2DkmF6ON+4Bsc81Sn9c5qEUVmv+E/EYTFEDISVPLZH6I8d3KbJ3dnkNn3QNd?=
 =?us-ascii?Q?ekudAgTTdT1wKrkaNEg8Cqz2W8M9WuPuI+b+L44tmVIkMBJRy4EZjfNt1nYW?=
 =?us-ascii?Q?mGTymTfTKLISbaiwxCFhjFHp3/xQlAYEuQ58j3GPfihO3MHlhGLvmdSCKDJ/?=
 =?us-ascii?Q?UEZadTM2tkkKK9gbrRo2mgMem6gZvZJlUBFbIcjIFO2gA5BSl2Feof758lMp?=
 =?us-ascii?Q?Sf85jFj4PoPWXugoAK8Gc8dzBk6LINgtdm2RDNEHP0m/MohyXfWKGd5NsVzO?=
 =?us-ascii?Q?WGVLm++ZfTE4nvZ1OYj5pg3pOaswiwyCqInenOO8Nc7zb5DUzYfPc07bHXN4?=
 =?us-ascii?Q?O3Zh10nGCStdqkVfkpM0KT6FBtLd4Sa0S4k0RG4vvxAwpqbfwTnD61PtkrHP?=
 =?us-ascii?Q?ikm26QQCalH6YzQo4foyPhkdONEB0mcT6uz5mg62GLD7XpiBeTVIy1QcMj3e?=
 =?us-ascii?Q?CzRy0jWRiC0oB4YXEyDtQDqKPakUWzixF21VPD9RjFuUGjcZUwl60vAvPJOJ?=
 =?us-ascii?Q?3FQ47S5IzpZmRgDVskI29+jtRa73mWGfpEEtt2ksn+j3NjeCBguEIA7TnAkC?=
 =?us-ascii?Q?hHaOVUorfu0QiXSDO1uLVW4wE0NrIxI2ZEBnz0FMGyeK8v0XcEFTFQXQHIIf?=
 =?us-ascii?Q?R65L1R9GnBBDNSiB6oH+wV5SJeOwdLl+m+nWDuRNbSwznNDWU0dH8jYlZL0f?=
 =?us-ascii?Q?6iPIRPrUPVX5f7nhouh4QOpP4uOvbp2sgCNmoA8ZFS5uNC0hqvghu1P+Hs8u?=
 =?us-ascii?Q?ZPZeXuhzi4EbGzgSe/YUDqUA9flnJis8nPYf3ddyMl5vezYacDAvw2J/36iL?=
 =?us-ascii?Q?WDItYXMsqmqwfpsi/lx3td9a3BgjEjQ=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b558e51-7d01-40cf-438d-08def844ea01
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 07:40:00.1568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKxCsPbEp3kqFIKEGxH3HeAlTZ+v8laJFTq050B+WCR6P1C29b2BHyLoTwC4RPKnupLhO4rEuPlJfY1MGvBzAx+ouzmZgnBvwKRXEtl52bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB5979

Add a DTS node for the Synopsys DWC3 USB3.1 controller on the Agilex5 SoC.
Place it under a simple-bus with a 40-bit dma-ranges window to match the
USB DMA address width of the interconnect. It is enabled in host mode on
the SoCDK board.

Signed-off-by: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
---
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi | 27 +++++++++++++++++++
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  5 ++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
index b06c6d5d60ee..043b980832c2 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5.dtsi
@@ -494,6 +494,33 @@ usb0: usb@10b00000 {
 			status = "disabled";
 		};
 
+		usb31_bus: usb-bus@11000000 {
+			compatible = "simple-bus";
+			#address-cells = <1>;
+			#size-cells = <2>;
+			ranges = <0x00 0x11000000 0x00 0x100000>;
+			dma-ranges = <0x00 0x00 0x100 0x00>;
+
+			usb31: usb@0 {
+				compatible = "altr,agilex5-dwc3";
+				reg = <0x0 0x0 0x100000>;
+				interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkmgr AGILEX5_USB31_REF_CLK>,
+					 <&clkmgr AGILEX5_USB31_SUSPEND_CLK>,
+					 <&clkmgr AGILEX5_USB31_BUS_CLK_EARLY>;
+				clock-names = "ref", "suspend", "bus_early";
+				resets = <&rst USB1_RESET>, <&rst USB1_OCP_RESET>;
+				reset-names = "dwc3", "dwc3-ecc";
+				iommus = <&smmu 7>;
+				phys = <&usbphy0>, <&usbphy0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				maximum-speed = "super-speed";
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				status = "disabled";
+			};
+		};
+
 		watchdog0: watchdog@10d00200 {
 			compatible = "snps,dw-wdt";
 			reg = <0x10d00200 0x100>;
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
index 57d3c5807c65..dc62772e10ed 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk.dts
@@ -109,6 +109,11 @@ &usb0 {
 	disable-over-current;
 };
 
+&usb31 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &watchdog0 {
 	status = "okay";
 };
-- 
2.49.GIT

