Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011001.outbound.protection.outlook.com [40.107.130.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BEF2E7BDE;
	Thu, 12 Feb 2026 10:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891156; cv=fail; b=H0t/Z3XFjNk3sqVLVnMI7+TosFN1bjNA4IDpQUooCC3yQdsxm3ovtnSlaTAuTrK8CtAKOcxR2Q4rOT/1jdO2a1oYOFHzcBvwt+aE9MIbHy3lJ4q5bSvISnA06lpIxVDCk3ARg/K5Roqrk+kXPHxaDfufxMAhrLW1bWR/eOuTcnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891156; c=relaxed/simple;
	bh=Q8aa5QQ266QeKahLVX8qW8VjrdCwhvW7v/g4yepqIyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tz1UTOzCeMuQXjo//iy71glHm/xzTvTSE8pCs249w/19r3QS7ecF0AiunMADcMuayJe/pNhCLXNokMDBVSrLleZHxM3hbW8pSU4q1Beu1p5vTd9IZnIZ2akicpA/j1wYgW0qEPM5SlLj4U+PwBQtIJqMAZFCTEtXop5vZZKt48g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NaQw38wr; arc=fail smtp.client-ip=40.107.130.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NaQw38wr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBNFgbK36j5NiJyDf6YpJa3Z2BNjZPgnmUfV8kBSAzFia3Uvx8J8H0aIV59+es1BPI42DfxMYvIbH/8jultkyc2osQB6zmwOwUvil6yxVZ4OnlwmCyf42xXKvOBTG3SRMJW+ESQiq3NNZkcyxSGlgz3V0D2I/3PAyY9fLKp4n7Nn4ESXtkHevIl8JqW09nFEeu0klcFj49hzRVMDljPEI9cwW/uEtJa4AWYGLF267Vgg22dCco1cMX8UYTMUG4tN+3bTGxeeh6A6yfSiarhFGNXpQgdXPNbl3aPJ+6Xlb+u4RnBJCaodHxzhLkNB0QWoV6ohrIdXcf7nO3EyF8eUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47+ONjsoN5DBXWAxqxRGIi3sBX85pIgWPLUDR9isXMs=;
 b=ETPs2M86Kxmq9LDRMw3WNsI0UWaDkxPO7/fdS0FAPDrUHRyL8RFLtEwYGzmKNy83WJ7C0wo3EDOQQiB1JeFkqGgGQEc58E9B3GSZn6OZWbbkiJLWcMzNKqVkhTUKHKUSqa5Ra4711I+dwVCxWcH6qi1cGUmToqUfhT5EAIvm+Ae1F7PEUTgy/0d0v30EnaeNXjACwq8QauB6OtVvpotiO5teApYZWgLksXdl8QE25uTSsGYJgX/N6T6DMSHWFWC4a3u3BNojMUm4H11QxI9kxj5/ZTyLhhRVmgAe4OaHxK0tdCCryMlDhhUOWTSzaw5vNdmIyCA04PkGQZb3hVVaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47+ONjsoN5DBXWAxqxRGIi3sBX85pIgWPLUDR9isXMs=;
 b=NaQw38wr7GPDl+el2Vdy/Q1dtTY0CM6KqqUxCws3hwgDSxLc6sh+W9KG+gOBEoKnSmDcuneu5GzXhkUiCnUYZ2qB3O0RmdWB41VDbvJz2F5ZmJyeAC16DI0gLE4gmw5yyxYTMd0YTMP/FPDq5QvBlo61xXPqaruUkw+OXRFffGNR/yLKIoqE27HhUx+fKMMc+HgSdRocRJgtjaBVAR+cNGWVyveqCg+0ZpDmGUmQnsbUVhLe6A7UMMIgfO0UYH31+Xt+fxX3Jqd/Yh7G9b8ktx72vhK4W2c58M6L9pBWear4c6U56MErTtzYxMf/W93OBCBbS9srqsfjxXJMWXtESw==
Received: from AM9P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::26)
 by DU0PR10MB7359.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:445::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:12:31 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:21c:cafe::4b) by AM9P250CA0021.outlook.office365.com
 (2603:10a6:20b:21c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 10:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 10:12:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:14:13 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:12:30 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:35 +0100
Subject: [PATCH v2 6/9] arm64: dts: st: enable all RISAB instances on the
 stm32mp257f-ev1 board
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-stm32_risab-v2-6-02ef2859b596@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DB:EE_|DU0PR10MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 1925a7e3-a95e-4329-6f01-08de6a1f3bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUtadTk3andEWEJMVW0zYURDbmwvb25rQzJFUldPcE1DS0hTTDdxVE02VXNT?=
 =?utf-8?B?OU9lRk9KVm9nUmVNM0lTSlo0RThKNmErYVVTUG5meldIUkdWWFU1RmxMZ0lH?=
 =?utf-8?B?N0JQSlB4dXN3M3J2S2hSQXFFTmoyOHY4OVVxNGRhaU03OEsyQ2xVY0ExWWtJ?=
 =?utf-8?B?azdlTDhoSGpPQURwMVZOcmlMeFlxdDlMOTJhL21BS09mSWtUM1NwWDQzekxO?=
 =?utf-8?B?eTh6K3NMa1J2OGQrbDhBeEo4V1JNR2xEQnp6dUE3UVpqa05DTXNZVTliMGZa?=
 =?utf-8?B?bm85UmlkUThSRTFyc2orTU1MZnpQL3F5SXpNeHhERDRJRUZQQllhOENDUGVl?=
 =?utf-8?B?WCtQelJsYURvOXFLZ1JUYmlDZzZvOHJuKzVPWUlFZGxTYXdFdm50TXVLUGxE?=
 =?utf-8?B?ellXdG5ZdE1NT2tUcC9UaHdDSnhwSzBFbzhpcFE3WWt0TlVMTHVvWmJPOGgz?=
 =?utf-8?B?QzlYY1pvWElZR2FpNms1VGNJRUtvMUFMaG0vWjcyUHZlL2dOVFNzdWYrNXVG?=
 =?utf-8?B?WGhMRzVTK2NYZ1FWUlVDMXpuS1gwZTg2T29UeExHbU1oWHZkbXcra041QzRi?=
 =?utf-8?B?RGtUWnNyb2c1WHFyMzA1SS9SQkQ5Qms2NmkvTFVHMEg3U3FVN3FNUHhqenBa?=
 =?utf-8?B?eFkwZW54NHorUFB1VUtWcTRwSEFWQXVPa2dhdm4zR0t4bG0yUTBLSWYxM0s1?=
 =?utf-8?B?R0xSdGJVMXBFcU5tbVVXTFQ0OU1DYms1T1FOR1lpRXNSMzh0T25Hc3QxWDJn?=
 =?utf-8?B?dGROV1BjUnA1aWltRldkRmtFM3lxbkYzWUQrYWRINWhwSzVNcU8rTHdyZmxw?=
 =?utf-8?B?ZFNnVmdHaEhpNjdoS2NuTktrVzJreWJuRHFRR2NnMm5BZzZtT2J3ZjM3dTBr?=
 =?utf-8?B?Q0F5Y21pMTYyNFozWGQ0WjZHeGNoWTU5YTZtbEpjK3JqU1MxRkpreG9TZStn?=
 =?utf-8?B?bFFndzd4TjZNYklOaVN2V2RwS2UzZ1hnTCtuWXNSakZ2YnF3SlpKYjVyMjlK?=
 =?utf-8?B?WkI0N3k0cFdRc3MzY0kxTUZJNHdYVzZwTHMvWnVwVmxydmI1OE00RE1CN21O?=
 =?utf-8?B?VjAyMExJT2NIRGNOa2pSVWtiRUNlK1Z5Q2pLWEtNeW1DYnN1Zjc5aWNBYTBU?=
 =?utf-8?B?d0JRUksrOS9pbmo3VmN6cGdWUkIwVjlCOEg5TEd5bTZxVVZtK3pNb1A1d3RI?=
 =?utf-8?B?ME8yNStrWjJoRTdsY0F1d0NjQ3I2RlBDc1Y3QXpqTHBYdVN3TVdNam5BMEJX?=
 =?utf-8?B?YkQ4VkM3aUJGa0U5b3hUNmdpd0grL2gwQ1hKSmEvekx3aDl1TWcwaDFxV3RM?=
 =?utf-8?B?dnBIQXIxcGI3anZLUjJIK3ovSmhaendiK0tYeEptR0Qzcm92eHVYNzVVN0d1?=
 =?utf-8?B?aWE5OFkxYUNxRlMyTFArVXJsU3c2VXMvT0p6bk5yR1ZOazNQSkdYMHB4Q0FB?=
 =?utf-8?B?ODlyTXdESW1ldVpvVGNVditKM0NRK2FRVnFpQWgrZFlvdnlOWVVWVEk1ME9Q?=
 =?utf-8?B?QjNGdDlTNVR2eUMwZ2wvamhTUThCNTFsUEY3bkZDSHdvc0g2aVFUZElmOXBZ?=
 =?utf-8?B?WHdmNXRhYmcyaWViamcxNjNOeGtMZGVQVmUzODBEajRnVko2YlRJKzBrai80?=
 =?utf-8?B?UU84L3p3cTVUdUt2K3RYOWMzZTdxa3RJYnljRVJNRGpBek0zK1pBZitPYk13?=
 =?utf-8?B?V0x1YmtqOEtucW9TUVBOc1l6ZUU3YlVDV2JtK1ZyVDhyL3JWeFhBejBOMEpV?=
 =?utf-8?B?Y0RLd0RJRGRRRlNBL1R4bmJwSzVCWFBRRkdEU01FOHVQNUV2Wkx5TFh5TmVu?=
 =?utf-8?B?SzZEWVRRbEtuQzB5SlVVUjVHNnpMd1JBRzFpazJMcVBzWDQwaVNrZkprZThN?=
 =?utf-8?B?SzZWRGZPVUo0cXUycDNTUGVMN1VQc1RrZGlxRElzbmh3ZnVicUlyODNFTEpE?=
 =?utf-8?B?MUxOdUxUVzluN2Q4eURsL204WUZXb2lLK2xsRzJHelhSZ3FwK3dUN2JUU1N6?=
 =?utf-8?B?c0VmSkN0Z2ZFWS9maVMxZVNmWDJCMFhjWWVBVkNRVnZQdFN3TlFXYldxWkdS?=
 =?utf-8?B?YkZpTmRPQ2ZhbkNiMU9nRVNDSnUzWHdlSzFUT25oVlpJeXkyajNXWmlKZ2hO?=
 =?utf-8?B?ZUNQQnhlNHhGaGViMnhsWE5lK0pCL0F3K1c4UUFsSW45N25vV0ZvSVFJWC9j?=
 =?utf-8?B?RmRraVg0c3dpT3pKVUpRSEIzVytmRlQzOXgybjFCZVU4RHRsMjZmUGpJNlVP?=
 =?utf-8?B?RkhzVEpNVktlVkR6WE5vSllTMFVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	na1QafYp8m4gsxb1BWQ0PXfI7w3PvZwo8ap0+VqvJ1wwsJYuwFHz3BlodPi7TAsiMUuqP06EfK3cL2vlE8a4r6i0ArTyWJq11S74YuHUvWnjTzgz/JeHcEtSUQG1KrxBTL0B3Rj0Yz6wzLsVvx8LZ8Ia74m3J11i36n60hAWfAHnPLJKEtIY9wq1615BmXm7W8rUCZjguAflSy+6lKCLNWLY2JAvljsrEf59sj60y2G8X3EfayNoTQCRTPXELhNLngGYixhx6ZC+7MoWgI1+XY8QrjB/l6BNCmmqoSenql5vbStln/t8WMCipMrlCEog7ID7sb7YDh2QaJNWn7QKghGfxhItZkVuJrntr5O51ULHNG/hqNvgqyHea8c0hxVHT9ZmQiMG7Cq4aM/mEcU4tMcfQCtHwdrxuFGc48+b4KM7uRGY7mLFAH1s3PHfYLuh
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:12:31.1915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1925a7e3-a95e-4329-6f01-08de6a1f3bc8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7359

To be able to dump the RISAB configurations, enable all RISAB instances
on the stm32mp257f-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index bb6d6393d2e4..973acea6d248 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -352,6 +352,30 @@ pcie@0,0 {
 	};
 };
 
+&risab1 {
+	status = "okay";
+};
+
+&risab2 {
+	status = "okay";
+};
+
+&risab3 {
+	status = "okay";
+};
+
+&risab4 {
+	status = "okay";
+};
+
+&risab5 {
+	status = "okay";
+};
+
+&risab6 {
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 };

-- 
2.43.0

