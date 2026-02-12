Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013036.outbound.protection.outlook.com [52.101.83.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53D32E6CD2;
	Thu, 12 Feb 2026 10:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770891179; cv=fail; b=ixykCRIQRVxX4nCB1Plu02bh0xohEPHSZt10ikwTDwHdKTH8x7o0CvWaDSSB9vKKe3cQhZlHo4g1GdLl6p94eFgEe7dKlAN8Rl7z/YAZVhbQ6VNIoYQknRzNCTzDnqGOdongUzRhha4CLqtTcRT163hZUttI+dCwe7dkYaoKRys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770891179; c=relaxed/simple;
	bh=KKGd7dSJK2J3S48d4WxHnHIgdgi+ezXldcZkGWy5zps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Teb2R/HEFYU0UyE7pIESz9z61fQroRaQQxoCeB4baZi+cvYVqYBfsWSRk/yUHH0uwRGForGc0OGhqBOiAqZeEleNkDC5TUW+IY2EkHx89rOhji5Ey8w4NR90hLDLzzZxYYNyYFrQ5zjB7NRYlscxu2Ur0EvNRRdj0AYDl53fQO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=OC17jkYq; arc=fail smtp.client-ip=52.101.83.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="OC17jkYq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+CTYnFEhgV65LTGDfZ+G5hhGJTNFFToaoj3JywO/ENf432aTzPrf2l6lOBN1/kUs1M3fe44/hHOvic6wrB9454M5mPfTzMZ5jtlnyvhitSKBhQ5OjDyekqlPnjItHtXcgKPNHFiEO+LvvPiMaJWPfJgy/8NTBh7p7/2jzCOVqkMEyRFpvnlldkSh5ZHjsirHl7Yz7XnfON8Bp2tILh6LMMAcJStTz2XA8ToeqnNybjPHKA3gW4EaHXeYsYkO07mC1lfLruZns4QPL9QG4jw6rxQlXuKAYPWln4jXqSNUonEiGRpRVvUk6pgbSSIXHAD6MYkHnEcHQayyT+TuH7qjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2ZH+1InPOkhPV4isG/wM71yGay/lZvL2jsoHve5S/Y=;
 b=I8TKDVykAtFnq51LGEmKG84rM64Z00G3CEpbLjhd5oC87SqX+/jkrmYD9P/2RMt4cn/b5yFIJhuZs4dkW3j3yy0QOhhQ1buTPQdL+7hYfxNwuDZZ7wunWQBrZAlX3J+6rBwXVBEpVBr/cQj5xdK7sN0cN0rlTfH0lw8gHelAafBImUjubUkqjMoaqYVoyxHVn2MRcwxsFjA+KqwBZtkbnT21Rs6yG7RXR8j/KNKs+GPlMRi43Qv5Zv1w91rruas85SMKJYpHitUsqRKcwZe2C7rS0Bz1Ofbz0eo+v9ivmtFtzBMgA3tIe7+wvm3BygNhi464C2cZSxv2Q/d98sqZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2ZH+1InPOkhPV4isG/wM71yGay/lZvL2jsoHve5S/Y=;
 b=OC17jkYquMEyZM6KkxxJofez7Kf+t6wNa+OSMDchhI5Rc1dmnH/11AuAkQJLiGsuS03+JHYPHtHWz1kE21Od2m0Rg5NTbRYz7xT6mLZImltUKqJ9PfxuHlK9TN7fxBGz9T2iZr+5T4Jwwms81CsT/tdrsa4kNtyzXHtMNLp4t3wreGhdVXDngE1cWkdvbspeDkg33XE1kOE2Jvc1UM6g/ipZpE9TEUBCIX9hN8M164lOqOqiVrUAChHxQRodXGk+OA3CI1FtrC58NuuPAj+mChd6yK0HMpLHQykSxZCtifYaYqwZUhVZtJnUsXobOuladphmiFnboDHpG1X2uW00bA==
Received: from PAYP264CA0023.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:11f::10)
 by GV1PR10MB5988.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:12:53 +0000
Received: from AM4PEPF00025F99.EURPRD83.prod.outlook.com
 (2603:10a6:102:11f:cafe::e1) by PAYP264CA0023.outlook.office365.com
 (2603:10a6:102:11f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 10:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00025F99.mail.protection.outlook.com (10.167.16.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 10:12:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:14:44 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:12:52 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:37 +0100
Subject: [PATCH v2 8/9] arm64: dts: st: enable all RISAB instances on the
 stm32mp235f-dk board
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-stm32_risab-v2-8-02ef2859b596@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F99:EE_|GV1PR10MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c6453d-5bb1-4dc4-bd67-08de6a1f4883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODJnSk11QUpIbUM2ak40bVhDUTRTTS9wNTVtNjdiNnNGNURjdisxbjArZVpk?=
 =?utf-8?B?WHM0SlpmUW1adGhES2E2blJucWxuL1RKRExTdUxQUXdnWVFnZVNJdzg5a0Rh?=
 =?utf-8?B?Y0RaZnJGUTl6d0ZTamNJb1lxczZMbDVVeGYyd29qbVhrb2FwWS9zR0xFWk1M?=
 =?utf-8?B?ZjZpbDVyTXRsdjhzTDk5WTJjcUJtMGE5T2JTdEJ5ZFNKWFVGTXdWSlRFeEdv?=
 =?utf-8?B?UGNsUWVQK3VER0RlMCt4TlAyeVBGS0NQYWNKUXd3bWFuWG1XWHNpWmpjSWxN?=
 =?utf-8?B?Z29nbnhuZFRyMG9LUkVhUmY5MHVtZC9hbkltU1d0ZnV4bU8yRjFDRkdhMU4z?=
 =?utf-8?B?VVl3clBkZ0NlUEpXQ0p6V2Y5UUhsZGVRYnVVTXIxaFZkS3VJdFJFNGlwRDZy?=
 =?utf-8?B?b1J1KzREWGt2cE80Y3dVMTB1MlFFM0g0akNkUlJhSldEWUFON0xEZ0NhMmpQ?=
 =?utf-8?B?ZDNJRUtxYjhxbUFCV0VydzZDWVNOS2tQbW1ZOUlsSmFRU1NOMnZNbCtJNUFn?=
 =?utf-8?B?QnJNYlY1bER2TlBXMnE5ZHU3d1dPU1prZ243bi9WT1hJNkM2QjdBV3F2UHFP?=
 =?utf-8?B?OXRHY295ZHdpbHZHU3hVS1NUaU5QSEdnRmRBRnFaTkFsR2VWOUhPNTNqei84?=
 =?utf-8?B?KzloWExkdXZDeWV4bzJLUitTcldyTWNrR0NKbUFGdGJZZEZEbUVVTjlUdlZ1?=
 =?utf-8?B?MHh5eUU5djhZSlk2alczUFN6NU92WHNaYWlMa09SbEs2enUzcWZzYWZsSXh2?=
 =?utf-8?B?QkFNaVR0MmkwaXhSSXB2Zmx6TitSSDljVWhubW1adTBJUVlJeklTRGVUVVc2?=
 =?utf-8?B?bEJaZVVDL2YvQU5ZNDZEVjAvank4bTAzU2xTUFpCR29KYnI0TEYzeVJiZ0ti?=
 =?utf-8?B?SER3MzRoNnp1TUtFc2NLTWRRMXZnSEZkekd0UXNUcWZ0eXl2aitpSU94Sjdo?=
 =?utf-8?B?T2R4STc0OFB3dXlTMlFQemZ3Z0o3T1FXbDFTSExXRzE0Z25zdmhaMDF3cW5w?=
 =?utf-8?B?ZW5VbTlmK1FGbnAwNmdZYk5qb3d0N25sc2tMOUpEbGl1S1BpaGtkZGRzRGtH?=
 =?utf-8?B?VThRT3ZNTldtWVc3RnVVZkVFWWF6eWRBYWJsYndvdWxDWCtiY3VsMzlXM3pI?=
 =?utf-8?B?UWZINXlnMlZIQjQ1dGpQME45VE1FRmNDUmxMZFd6OU03RytDRUJoc1QzWWRU?=
 =?utf-8?B?T1FxQitkZktpVHlFaitvckNnTTViSU5kbGdjUENiYS9UVFZsY2VIQlNQMUtm?=
 =?utf-8?B?QXAyYmx4NGtEemFUWlZGTjNZTkgxY1c0dElxaXFaRzdqQWptVGd0cVRKRGJs?=
 =?utf-8?B?Q3VZVDZiUjVGaEhtNE1xMmFaWGhEZWJVVWsrYWZvTVVhNDZTRGtSOXJ1N2FV?=
 =?utf-8?B?NVRjdCszR3d5bTNVYVFNRUV6MjFTbXBNQ1Q5TmNLeXQvdUNtMnhTbEJ6Rytl?=
 =?utf-8?B?a0lUM2lxcUNFcnpaMk9NS2MvdWxWZTExOXNrZ3VObkp6d1hJQktkWW95VC94?=
 =?utf-8?B?MU9lZld1OWRWUnh0VXZnVmVRMmxWdk5QUklnQnRzZGVaVllQZ1Ntb2N1azd6?=
 =?utf-8?B?Q0VPMWk2TWhaTmRndytIUEhndHc4Q2QxclE1c3VZa2p6M0paajYvVDg0NTJh?=
 =?utf-8?B?M1FubmJoR3NrTEFvd29NYkpoSTlEem1MRTgzOFNYQlRrcFhaTVZhVjVtb0ZJ?=
 =?utf-8?B?Q2RTYndrRWJQamdwUkZ4UTB0OUlSeStISzREV0s1dmljdzJPUmxEMnhZTW9i?=
 =?utf-8?B?RHFNRUtKYUE5Y2xYdDgvWDlkTWxaV1NEcG4vYXRaSHNaMWhQSGF6bkNvOTcz?=
 =?utf-8?B?czVWUFNnN1lFNzJlOTdaY05qdFhZNnpiRk9nTjJYWWdNK0lWOXNHdk9wOS8z?=
 =?utf-8?B?SVNBakhCWHJ5SmpYWmtkejZGY2N3RDZJR1ArT3VWcTdXNG4vRDExUlpTTEti?=
 =?utf-8?B?TVE1YjRRNnhzMW9hNlhJV2NUbXpYTERqM3A5NG55cGRMS1RYWHZtSjNEeGI2?=
 =?utf-8?B?VXNZUlJHcWlwMTNlN0xMN01NamJGL2hFR3VUUFoyZW5yVDA1RGJmdndZNWx5?=
 =?utf-8?B?ajVRWUQwbzdNdHg1VExTbG4zYUd6NnlMUENBb2FOcGg1cXc2NlRVcnNxSnB4?=
 =?utf-8?B?N1UvVnFxeWdqVFdLZEhSQ3paOHZ1TXdRaHdnZDhtNkpsVVJ6aWlueXlYSXNH?=
 =?utf-8?B?aEVhUTNUeVdkb0tER0Vjb1Mzb2dhV1dzMVdJNkMwYXltbXp5WCt2Q1JPdTdY?=
 =?utf-8?B?aHZ2R1dqOVRhbEFLOHB0cGJ3V3BRPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XpJCVDRpUhcNlgs/Fd7XR/N/yQ/I+1sX67OQ3z4QjSmBmX8kYMaonqbeIO2ZPeyt0FRQMGD9cm20ac7Avb1Vko03s+liG6Ht2mm7qVesMfg73OEPc66sQssscwJ70+hKW+3+LjPvE3QkvHhug4mjsMWvF1zhQkhYk6eHYQyRg6QGcXcRipNdGHH4/MLp6WWM2SnglM1ZsUkmIjAHnmKBDPhOfAm4Y+Ip254QJcjCif0UK3TMA7zmYB4EkKmhttXlFL5TLLcFwIC/tsnV22QxJbnMNCYeypOEJmQKMxIaAfKau+ZcqK/6SZArCcrv+fkkfzriy3dphj6tFv9FFw4bMWqol82Y8NRcoe7ZWW56h97bV0TMsROAjw4+M0iA5ynlg1IZOE2tJJ910bWM1rFLO4jzxx1Map87+MWQO3E3eAmac0xmtSkRi5tjEYIPheMK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:12:52.5438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c6453d-5bb1-4dc4-bd67-08de6a1f4883
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F99.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB5988

To be able to dump the RISAB configurations, enable all RISAB instances
on the stm32mp235f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..b76549b9f64b 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -100,6 +100,30 @@ phy1_eth1: ethernet-phy@1 {
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
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0

