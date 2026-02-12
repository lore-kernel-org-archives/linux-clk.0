Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011047.outbound.protection.outlook.com [40.107.130.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB6C2DAFA8;
	Thu, 12 Feb 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891148; cv=fail; b=av63XV1M8DOw35CELSdnOA7va36++Q7/86Cl3SdWSRst8xPO3U/cAt0H3DT3P2rHM0p5TaAju7lOCMhA1MY8khzIQjGDhBZKXAeo+0KCDg9rVp8Pzbsq7F3PN2sAgommcdjNdASintWV4OarsdSL1ALg41SAa1bwBCX3VHEuPkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891148; c=relaxed/simple;
	bh=5802rhGNY8HNz6YqhLmC7dw98XCJwTUOfMssa++AJQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=VbtVjN50q8V1Hs5xixw7OjiPCdNaY4PpEqYX46RzR18khh2s7mMqMtCH3ojobprWn3L8Kdco0LpAfnWI3iRY4yfNAMJ5Jjopg9NYAN78Lb1tmP3C82yhYEYMy0YnpRJEGSo48c0wurRnPdyWM8U/CkcyG2TQYd2U5erVJ00plt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=aQlSf87K; arc=fail smtp.client-ip=40.107.130.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="aQlSf87K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZB0y8WEChZlBLNMGD7tlQjhH45Y5znTZjWBv3prZi2lTKMgVOhgR4Wx2TJYkWFCMcaI4qTv1iInve7yLOUq+jU24yUTl37hv+9dbSdtQeQyD8cv8lIjzdLDne85LXpI4as2RA7GfUOHFuPquZB+09Hs7lCOYimo65tpiO/lE5Oyvwhh/ufgoAP+8Kw1EwyFtneuY13r7Ffdxm3YBNESiGRkZUTIKpSFPnmo3j9hAhlXbz5IfyYELKoJ6xQADlekwHT33qJWd/jGhMQOjbvCab8yuoLMJpQc5ECFGkNFK0PPKacJWNsW1l7Fn9goRaFs091iSBZ15/VuT8zvu86Ptyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mAEcFODbRm4IdxBIZA4j/MAmFbMC1aGV+RBbHR4eiSQ=;
 b=vNjqy1YfRgva4Q6BxZKTaphQENpSrrkry12JYDEd/Ey3DFKS8+n1JX1FFYOTMpANCQxOS3YMBmAAmj8Og4xMd/5b+Ou+55ybl+5A+cvCSGS9LjfBEGzxh3jwSx6SZxwgTQzkTjHI5T2E7MXce7T0nI2ATQozL1GxmR3pzipnttNb9ubxJjMmQ1sXFBZsgIRaq4JSwtswykZYrk2V7jMODBCjsne1GwP68t9q3tIo+gW710im8miVCAXawiRAlUVYJPgECgcB0UumUnBOEhVouOhNkux8AY8IawZTQD2dJw34Cm7WFygY39yVxGK5Tc1OIwpKhkcc2xva5vnDioE6kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mAEcFODbRm4IdxBIZA4j/MAmFbMC1aGV+RBbHR4eiSQ=;
 b=aQlSf87Kug0zOW4k8qke9nOKMrcNMwRi6Wgl3Xd/o8kB22JFe9o6ijoo0Rw/8C7iCyzNU2Y0SieEtmypQK9LYPoN7TFaIsUBsLf2K7maVaZl+XbB01UOWGuLISNucnb6WhgDDGJB3c97gCXSpEWFqRNSm42WHcuiCjdD+1Ih8K0Rr3QgkWWoZKzgTnL0M4sDyK0ZZUeGJbcAvoQX49oSSpOON+aynXSYSaml/6FGNgHirOfzEOcKsgNk7Kmyn6pOtc9j5kw5afzI+miNqycEwrGUVDSG94sLtV5UbhnctjSObZEfF4aChlXnpxhRntDgdHyBNEZUBjZqp0sBIiSDkA==
Received: from AS4P189CA0056.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::26)
 by DB9PR10MB7123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 10:12:21 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:659:cafe::93) by AS4P189CA0056.outlook.office365.com
 (2603:10a6:20b:659::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 10:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 10:12:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:14:03 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:12:19 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:34 +0100
Subject: [PATCH v2 5/9] arm64: dts: st: add RISAB1/2/3/4/5/6 nodes to
 stm32mp231.dtsi
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-stm32_risab-v2-5-02ef2859b596@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DF:EE_|DB9PR10MB7123:EE_
X-MS-Office365-Filtering-Correlation-Id: 7139554c-d473-4e83-49f9-08de6a1f3564
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RWx5UnlPTUd3ZUpNZFA2N1pnZzRETGsvRzZ6dXRUNGtKSUdPbnFDbUFhU0g4?=
 =?utf-8?B?ZmxPSERVY1FrYXA1VUtWSEhSb1A3aXpydElrS0crVzJrZmVVM3psM2VhNFlE?=
 =?utf-8?B?a0p4bDhHSWpuRTBtbVMzbUtjN3BpWkJ0N2pHamJjamlpR2wwNEtVRXkxNlBU?=
 =?utf-8?B?WjJ3dGdDdVBFYXVIcDE1Z0dDM3YwaTBZMVE4L1B0UU5UME5lbEdyUVhGWm9X?=
 =?utf-8?B?OEVZUWtpekpaalFiM2tiYzg2VVNQSDRtdGY1RTVXM3dsSEJDR1lDeHZ4ckt2?=
 =?utf-8?B?R3VRdG5iRm1lNldmMDJmSmNxRTAvR2p4YUVVU3hPdmNWdzRqQlRjZnV1d2x0?=
 =?utf-8?B?VXFSMCtaLzhRYVlEc3U1cG1zVHA0WExVclZIUDZXOFg1eWxwa3drdk9WWTZq?=
 =?utf-8?B?Z2xWcmlpZGVnOU84b1NsTW1nSFh5RDR3bURPZ1lENXUrdnp2b3hBN1V3aDBo?=
 =?utf-8?B?MlRDZUFTQS9wS2VpS3RjMm1HNnNxMXROR1BXbzZXSEFtMGlJcXVobzhjR3VB?=
 =?utf-8?B?TGdIcDhGVTZWZGNzR1poeGk3Z2I2N3kweW9JZW16UzZKZkwrUUh4VjlQejRZ?=
 =?utf-8?B?cGF3dy9xbngvVk0vVGhZZ1N2eWVRVFZnYmdZY3YzWTNjeEhmYlNTMWt2a05T?=
 =?utf-8?B?ZVRoWW91Qk4ycG9PcGNKa1hocDk4aThJZG5rUUxPYko0bHB2OG81YW9WNmZR?=
 =?utf-8?B?ZlFHVjR1R0NKU00yYU1DUGIzYzBoREVyMHMrd3NhbDFnaGJidXFqaHBUZnhW?=
 =?utf-8?B?VmJ0OHhZZVBFMkNFNmprdVRiSzducTNiMTFJUWRDcHA1a3VTNm4yUFdqVGFw?=
 =?utf-8?B?UVdDUWpjZnJpR3dFRUsrWExjaFQ5WmlEK3JVaFhGTUQ0Vy8vU0tFOXJiOHBp?=
 =?utf-8?B?OEZiemV1cFBSTldyVkpKcEF6eTZkRnByNDdiQStlZklia3EzYmZKS1owdys0?=
 =?utf-8?B?Q3ptRUN2NW4vSmorSVdKWTJlMWh3WU96WUJDWTdTYldHelhnQ25EYWJsZGRj?=
 =?utf-8?B?MVlsSEVTVHZaNEt5QkRldk1lZzNIdWh5a2xnSlU0YStleWtJdWtnRG9rOVF1?=
 =?utf-8?B?NWRwSWsrWkFMVVptajVTaWQ1b2g3VkJlN3pEZWpCc3FWcm5JSXNRRGNkakFj?=
 =?utf-8?B?cnZMSGJWT0I3cFczU2c5eDdRUFJCQlRZSXBtUW5McDVVQ0p1WGVqajAzTmwr?=
 =?utf-8?B?TjVHREs3c1ZhSFgxR0ltNlczQ3FNdXYrbjVHMmJyeXBSbDQvU2tzaFdQblR0?=
 =?utf-8?B?MmUyNUJDVCtqazBlWVRqTU1WakhORU5BMUkzclIrelB4L2Vsd3E3eFhock5G?=
 =?utf-8?B?MDFocFpRY2x0eEltTGc1RzlBWUF5N2k0SDMwR1JPRTlTOXl6S2dGU1ZERCtV?=
 =?utf-8?B?Tk51QmNrc3lWRGhpWlhleEYyamk4bnoxQkR2VGhzQlNCQldrS043WS9HWFB5?=
 =?utf-8?B?UmZiRVgvL2xyUTJjVUxtQ1Mwdjk1cGNabXhEa1ZZMUJRWFNYcldxbHoySVQz?=
 =?utf-8?B?b2Y2eUVPeTg0c2dTUlFEazdoZnlySXQxVDVNSjZGa243dVZFcUl0ZHh5ZHRs?=
 =?utf-8?B?WlRmakkwakFqUE92djFsay82Sjc4ajIzVW5tdTVtQUExaGpEcFlRblNVSVpt?=
 =?utf-8?B?b1h0N3BwKzcxaUhMeGtqNElQc2RRV0YvSUxGdjVZUDNBN0d0ZUhIUlAxWGps?=
 =?utf-8?B?YmRDSlJUdmQ1emYyMkhBVnpmY1dUaGVFZmp2dSt5ckxGb0xEV2JzVkNzMWpx?=
 =?utf-8?B?a0xleHkvVnUyKzN1MDlubDhpbHJRVmZwUzFtS1k3dDN2aFlwSmFmckxuRUpy?=
 =?utf-8?B?MGdBZE1wVjdLT2lrTzY5TDlTbC8yMTd4Zzl1d1c5ZElBV1dWZGJXVVMzRVNO?=
 =?utf-8?B?ZzUxbmYxdW1ZNXplUVo1SzlpMDZLWlI2M3J1elBZRXRzZlBPcWN1NllQRUho?=
 =?utf-8?B?RFBkZSthVy8yV2lVMEtnaXh4eUlQNWkzVDNIOG1tQ3diNGRpeDJTL0h1T1RQ?=
 =?utf-8?B?UjJ5V0M2ZHM1eXJoTVJBTURxMEVpc2tHWldPaldsVEczaUtCMTF6SERQbjVV?=
 =?utf-8?B?N3BKc0FSS2tFQk95ZEpZL3l6OU5RVWMwc0ZjMmhsTGQwcUY4YVVoYytJZ21p?=
 =?utf-8?B?ZG9yZlNvKy9jUGxyR00zMUlEV3pPb0c5Rk9henhEWHRkQ3NDRm1malhqSkRx?=
 =?utf-8?B?VFFPM05OVXNOSjhFUzVLeEM1UXAwS2o0QjB3M2ttcXFVZUlXZm9VbStzd0du?=
 =?utf-8?B?U04rcVNuV2JNSTNuZHVGL2xlODdBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V7HbhxBb5pylRE+VE8M5xFY7BlPekWy+fI4mvqgB6pPKTM86fvMXwQOTCLceceuLFjU7JcgplDZZwl8KHz08dxTsQuLxJSCM3817lS97DR89Lp9IQK1fFkUjsOf8StblyDJnku6YdiKsD361A69rTkksKJenvlGDO5JHNwfLf5ssT3NstSjl7cRtiIjBjnbBFz8jDbyjIrhF8BmCHn/XVHwLVZrzhOOBJMCipNWd9MRmbjS7ftfG/hhmWwFSbmJW74wO6p8mP0F4njm3tMmYXhP+rfX6+90EJyuqOR1yOzON1SwdDzm1PXCSgFNtfDkDfCb4R6rnC120Wevzi4OmXtdmX6MfoCTF+E97/basPXCG6mKuwIOBqbPrpILujXOej9bZDngwVgQqpn+4QlSQKkqi8uQzWVhmKEapaY/AEZ7IHT8CfMxvoPpSPHORwC4q
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:12:20.4721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7139554c-d473-4e83-49f9-08de6a1f3564
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7123

Add RISAB1/2/3/4/5/6 nodes to the stm32mp231.dtsi device tree SoC
file.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..326d4bd59f96 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -755,6 +755,54 @@ stmmac_axi_config_1: stmmac-axi-config {
 			};
 		};
 
+		risab1: firewall@420f0000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x420f0000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa000000 0x20000>;
+			status = "disabled";
+		};
+
+		risab2: firewall@42100000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42100000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa020000 0x20000>;
+			status = "disabled";
+		};
+
+		risab3: firewall@42110000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42110000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa040000 0x20000>;
+			status = "disabled";
+		};
+
+		risab4: firewall@42120000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42120000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa060000 0x20000>;
+			status = "disabled";
+		};
+
+		risab5: firewall@42130000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42130000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa080000 0x20000>;
+			status = "disabled";
+		};
+
+		risab6: firewall@42140000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42140000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa0a0000 0x20000>;
+			status = "disabled";
+		};
+
 		bsec: efuse@44000000 {
 			compatible = "st,stm32mp25-bsec";
 			reg = <0x44000000 0x1000>;

-- 
2.43.0

