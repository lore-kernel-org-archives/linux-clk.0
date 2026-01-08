Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023114.outbound.protection.outlook.com [52.101.72.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E36B31A571;
	Thu,  8 Jan 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767897132; cv=fail; b=RpUZW4cXO4SE9u1SM0NpQ5YvRz+K4/yDPzNiiNWRGz5AcMZFNhCufnaUtc4ILjG/nxdhf5ilgYY8ny3T7yeHjbmYRb2ZtkOdhgU0lzx3ImRVmJ5V6SlrkveP+HP8Fknia4ZgLqyz+ifGNEGwecoALG75jU6PQKN/q1u4dG5fpZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767897132; c=relaxed/simple;
	bh=8Obyqz81kaUL3bCkSkacnHuQmXiWc+NTWBHyGZUKaW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eRhfg4nHyB+eVAf7s7DfwHluv0mkdLMjSkB40EIMMtKjw2haKbbAYc04ilrYDnTwGCySOm/cl1Z9YINsgjmJ77BrUdLG7//f8YKVlDWbKxhTX2eMrVtc62c3FDFZnebybjddKJxtGJliPawNxcJLA1A9fggvc2Fr+lJwRuBmDbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=SjJ2N7pJ; arc=fail smtp.client-ip=52.101.72.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="SjJ2N7pJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eeNHTyDNdTSZu08jovYsLTVfHj/kWPY0Qf4hAGg6c7tAuKqUL5DdqUiBAwzW6CnNPoP9kRmttbfYREv/GrkwKNbgvj03tE8DjZe/XqItZvHi5aK99d0MZWwSw9gGsSMhtOd6fVEDPvv5xaLxmqTy03ueCJ12o+G2V4/sSEuz6KmjTaFTFypGs4lshgtPNTArWko2iKaBx3sTnsc6RFzXQwS7cPDTg3vqRpbzBbQd4yjHccuedA1l/7NNxKqgvw8Gncdx0B0nzQUTk13MqKjIJmj0He8oFY0xYI8i4aLo2sGsTNOipN2dzU2SCS6U5/NKRGMp/afvi9ceT6APspauTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmBO++KdMYUXjtW6ga3cb+fbWkET1VNMM5ti8N0KIjA=;
 b=r0lLB+fnOs4A6Ta0PR8KpIJ4F01prBpRZPcrTz3OZ8ShBSvbTU7t/gm3YtYLONuTd55yegJS9wYAzukL1NEEJR92AFJUQTp8i4LbUx2giWsxeFRzD/mb/8kfyrMS/eSvLtvHon9KRQy9ndzlCQndR0YAq7TYRLHavHMTHt3nSco8g0Z+Qj/m5r4GFIbq6vvi13VtZuk5tBMHkmLWOGSxghKuF2bBEG/HqVf6ke2XtXSQfdVMOYd/oRiyV16y+G0xPOqwQ0iag4M36BNJXUKH7G5Te8RgSNgvkg7MPpT7C8Ow+/OE2/gpkqcY6THngJEINpoNhiGtUnQSrUlVSJIlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmBO++KdMYUXjtW6ga3cb+fbWkET1VNMM5ti8N0KIjA=;
 b=SjJ2N7pJ8Oy67Y6RA6DxkY8/AjEokH4sLqOGh+RXPMkNMXA7MbCnQodWhT0v2E9Wbx9Nmd2YTyLqNR4gYFZwK/5lw4/g/uvDQpmG8ksyEZZwm+rz+ETYckt9NPjI4/J9E2BKBX3kYJYXWKHI3lV/Y3EvtIDAJJAG9T27OovPFKuE5wzueifqgX9vAjYb4fvlgIWc1gmVeOCoSFXuOupInihbfYKAM1w3Il+JggrUwxIBxdp4CJvLFXH1XgMZKdjJ1bLJ0Ao1X/siNgU+uaLLJKieMCw+yI1eRM8YN/4wxCbr7gNeQG653pVHbkU6PZKWwvLeLRfvZ053prupwtVVkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by DB4PR08MB8126.eurprd08.prod.outlook.com (2603:10a6:10:383::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 18:32:03 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 18:32:03 +0000
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
To: b.larsson@gmx.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: [PATCH 2/2] clk: en7523: Add several clocks for EN7581
Date: Thu,  8 Jan 2026 19:31:54 +0100
Message-ID: <20260108183154.681958-3-benjamin.larsson@genexis.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260108183154.681958-1-benjamin.larsson@genexis.eu>
References: <20260108183154.681958-1-benjamin.larsson@genexis.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00014AED.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::31c) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|DB4PR08MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c678a0-d656-4752-4686-08de4ee437b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XuhRrVhhdyJJXMb5FZ9qMJPrYntNbZnjv4+5rwGME2smPpanuHFahloF5fj0?=
 =?us-ascii?Q?pTQZGW2N31jwR5QZZp5kciZa4ZLrg6klOs+n1/2X/fHlgx4FIbIr0dvfktH2?=
 =?us-ascii?Q?0PVQ+MmBM8j8Wia999gkNmga6mCUbaBwV2ztqikOBL1IzUnrJc/fooNU4LdH?=
 =?us-ascii?Q?sUy0YB4avSiDwhn93fpfmM+EPYkLbZg9PBm1EdPvHw6qSYRkyEN8QZVtLzLk?=
 =?us-ascii?Q?I+7+jtyw/15IodiFWu0dB09cUFX0F9hEkuukN6Zjho5tb6bic7rw7pYKoB8d?=
 =?us-ascii?Q?VZ9Dh3PGHokQA8qulYH7qJPVMppycCYN6NCfUaVq1critYVTurkOH4qg9Cwa?=
 =?us-ascii?Q?8L4cPH/xt3TvXMMzCgqIBUBrfAwHP9jsiPnMotb+8KqlE/YMSWpYMugBPjDF?=
 =?us-ascii?Q?6Fgs+jIetMf++x+ZMszJQhQDJTHL+WrvzidkpqqeyA9qC4V0Ea10BqgkOTA8?=
 =?us-ascii?Q?iB+oVabGD5ZC4mBD49mVqCfWQo+EsHVPlV5a92fKDAgMXAvHJso84Hl6ESqO?=
 =?us-ascii?Q?OcHhamQOyiMPu2egNEHceBCLKGpdEAQ/QygLE8BZYL619ULDRuXiX/8Bl8Ud?=
 =?us-ascii?Q?gPvLTMGmmFaVsdt2fYv0mT17pUxji/+RJXcuc5l6Jd4VkyCduyhflblnUolZ?=
 =?us-ascii?Q?O5hSUzD2gsFqMfSCEA0oIzP2nsIwZvtBOrl76byNhYHjOJqTfmyURarMLu0s?=
 =?us-ascii?Q?6v7vgvrtDQcpWHvVs43UhtX8pHhvfKRa5wpHMIAD0v16NkBzsxC+75LhUlsI?=
 =?us-ascii?Q?Y4KR8GNI2nisEjOClvL6LWMKiA8ju9FxpmE+70Jm2stL9pRVd0rmJbIJVu/i?=
 =?us-ascii?Q?q6uF/OF+I8LX4TZypOZDS4Y4JoJHqZdHmiT4ugLzRwFnW3KAAsvFt9SKgajB?=
 =?us-ascii?Q?Cbe7GCu/UzIT3/aaLQ2V4E0QIHjewtiK2utK+H8yGSZDKeLvu/gZ6piACSAL?=
 =?us-ascii?Q?YNkEWZYsxbONXtXokjlFrdSzVjnjknnTyw6Wx9AeBWJxBjBEIEcrFSvhtLHc?=
 =?us-ascii?Q?tV/gpUPaHJN1xDgNC9auYL3D9XB1sj/U2zXfn1SLuX5lCn7VV7mtQixdvJjO?=
 =?us-ascii?Q?POmSGZQKuc5IDzD8mfZjktyTVRZCp57l94C/qVO9u/rRlp42U1kZ0bJq9bOU?=
 =?us-ascii?Q?t8rUTE+CJH8tDD1d350/5IOyS5+tiNJ01deN5ewFWJsM5KQTUgjRLkW+ZDvc?=
 =?us-ascii?Q?q458krrmunBd2WGgFEsdgCJMhfm1Zy99MjEsKvGv47x5DW9Hq2rNTUQw69FQ?=
 =?us-ascii?Q?VfKmHX766kEnousl80OWipA87rpBtkKsSmcJQ4k3Weo2aHvWu8Muu6qVyTLm?=
 =?us-ascii?Q?5PejASVwcjW/aB5yKkNHTnl53lQpyyY5H7e/+G0JTB44xr+XQiEHL+PDznYI?=
 =?us-ascii?Q?iEYSeC2dFgqpBOqUe2x8TiVKvEd3ArnBFGFTMKccgsrE73SSZ82UovK5aSll?=
 =?us-ascii?Q?U9tC/a/uGu9tvnOLyZ0V3dRrN4A0k3M8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hSBl+E+ccy+Zjmt2A1b0i07kEDuqpUoOHANRvwGHu8+55NvbWuZchNyqmEkz?=
 =?us-ascii?Q?5Ca5MuAF9tcd1rmUaM4aNYtYkE0qpStpWFJFS9lRh6F8vCt4Nt2Vkjyp2ZRc?=
 =?us-ascii?Q?8etNfH2MhNwHhtGNlN7MDKSj81zEdDNPCc9FQ7q2cMWUjJq+ySCg7Bv/wFoE?=
 =?us-ascii?Q?d7tiRX++WCP+Fv97absA/inB5SFMkqP7bUe2OGYTPf+KegGpRVJjq7bJoEK1?=
 =?us-ascii?Q?RIZUCsPaYqu9BY26x7qVVa2iZ7M47ALS4WqRMAKs22dogAWye/a4no+cAfZB?=
 =?us-ascii?Q?UWxPld33JLPx4vZrrYLr/VTEZfsPaaaYvH33L1SPFK2TIMO+ojXw9XI4DkOg?=
 =?us-ascii?Q?EAlJSPNArdm5/xCDg3sEkW22VGLuywhhMVyGip6dpuMiJP0SPWWmTVYgwcdZ?=
 =?us-ascii?Q?0vkAL9aloXv2kRatDDuvDvGy0nwOUnTSMe8E6w3ZugBRcChg8Yktz64Sopyw?=
 =?us-ascii?Q?SHQHJfPhBbyVwsTL6LEWIgjlkyyNK7ZSq08koyvSFApG2bcNvWzXJYSHetxq?=
 =?us-ascii?Q?TSwFxjSABnLVCnqpFsGX4arpNRZUNFYTBTbv9a9W2OKqOccuW2ZlJOsBdjr3?=
 =?us-ascii?Q?5V1GU7QxAnPTdcfkOPeZWblimOsl8CRZjD5pnKEM+gaDquLhVNeFHRWCV7qg?=
 =?us-ascii?Q?ckY33qleoajPfmMLmpRAs2VDzZT4GwwOr9HDz5kW98T4cJrnK/wkingqmtYm?=
 =?us-ascii?Q?ZQq3X6/EpK3Bc5YZUPBGe6AXxyX/+FZfq/Ob8251MDaTtc2egPQu0YdhHbdu?=
 =?us-ascii?Q?k6WVEQpWZAVXt5v1hVNWJl1xk/m9/NinfZ1MDAynnrgQ0kow0XI3KRWa/8Jg?=
 =?us-ascii?Q?4MQLCauD1jUSaDdnBMcmIvqUH5GTdgQP5eCfJp0FFPcEUCalEGOqwxRGXlUM?=
 =?us-ascii?Q?Ryq8G8diqohf0QUIw0lD8mz3EK4SDlUpMZ06fA9aExZ8aWPbKQhPJ6WWE+vu?=
 =?us-ascii?Q?cHGARBAqW7O2EDEg6XJk9muDtxuL3SWxnl4p0fWE3S+qYvJ2hQoxuGgmRK0H?=
 =?us-ascii?Q?vmhV0qlPC+nIiqtJA2cRrjGsBO+SkCNG6zcKpjV3jnmUlSrPV9Hy8mBzluZ/?=
 =?us-ascii?Q?02usvA2wn9Mxg2N7CmU9y4qs4krrlaOWrcpbPAbAqH+QbKI/BU9udTYi1Bhe?=
 =?us-ascii?Q?OCaT/rAYsUa9wLv09eEOy2MEZqNpJRU1WEFHgrDVGCK9mFT1Us2wkY5fEDtq?=
 =?us-ascii?Q?V4aSZ5dvRibxna/cqHgjMxfZcyCuGXuw19FXQdCSc09uaizawlyycMln7FAa?=
 =?us-ascii?Q?7elDhgEx8v9ZqfGV9MIrJTOAc7aVjekYVzMMQDHUkudjM2R2Fe3vQ5D52BN+?=
 =?us-ascii?Q?CjHfr5VHrLv5/EtJ7wvuJsQciXB8dPgQk/WRCrIa2TmF0rcDYxbU0dn1TDiA?=
 =?us-ascii?Q?P3CFMn2mO01c9yd5X2y0OUm5fHng57GatSY5oMDcUYI/zoTODQBwAE2LUZ5o?=
 =?us-ascii?Q?RK4DwhhJDiTMtUalB3fJDVeKnOZMw7nK9g4f3kQufpUCSh7Pf8bM898T8o1L?=
 =?us-ascii?Q?hikK1DGMF//Df7ID0lkj8DWtA2Df+MdTVq2TQG/HX+5T05bhDUHHc1L8XLj4?=
 =?us-ascii?Q?AFSrG1dF7CqSe3Vdjtf2XPBHCQi5P0aPBdpDCsJAT06TIy0rnSIQ/BA82nJm?=
 =?us-ascii?Q?yVR06l1tWvxTyIR3zCY/HUMfpDrUnwQe+lMURYJbs9OWq1QAkpWvpzcwZnlB?=
 =?us-ascii?Q?1aCr5SmxjkAtWdQ1cuE8nSnUtch8eYGPVvzuNliILWgpv+1F4Nlowm8yCohs?=
 =?us-ascii?Q?A9M+q5ZagNoJjvl3I4YTqnBt+jrL/LmLDCb/7I8+wIKpz6I/rEju/zni+R4p?=
X-MS-Exchange-AntiSpam-MessageData-1: tVz7BLLSfzHRciNZo6hrCm/7FhNvIYLWYqc=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c678a0-d656-4752-4686-08de4ee437b9
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:32:02.8495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8BxAqN3WOhGq4kBzA4PodJWeQh/922iOg8GuAgHToZDznmEj4VpcFDV+bA9Rl55yJpPEeobSkR6Pft6q3ChZxaiGItc/MdZbe0pFd9NYC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8126

Add tod_soe, tod_gen, efuse, aes_xpon and fe clocks.

Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
---
 drivers/clk/clk-en7523.c | 56 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 08cc8e5acf43..1c7d1c315b86 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -23,6 +23,7 @@
 #define REG_GSW_CLK_DIV_SEL		0x1b4
 #define REG_EMI_CLK_DIV_SEL		0x1b8
 #define REG_BUS_CLK_DIV_SEL		0x1bc
+#define REG_FE_CLK_DIV_SEL		0x1c0
 #define REG_SPI_CLK_DIV_SEL		0x1c4
 #define REG_SPI_CLK_FREQ_SEL		0x1c8
 #define REG_NPU_CLK_DIV_SEL		0x1fc
@@ -93,6 +94,11 @@ static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
 static const u32 emmc7581_base[] = { 200000000, 150000000 };
+static const u32 tod_soe7581_base[] = { 540000000, 480000000, 400000000, 400000000 };
+static const u32 tod_gen7581_base[] = { 400000000, 200000000, 150000000, 400000000 };
+static const u32 efuse7581_base[] = { 200000000, 100000000 };
+static const u32 aes_xpon7581_base[] = { 400000000, 200000000 };
+static const u32 fe7581_base[] = { 600000000, 540000000, 480000000, 400000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -292,6 +298,56 @@ static const struct en_clk_desc en7581_base_clks[] = {
 		.base_shift = 12,
 		.base_values = emmc7581_base,
 		.n_base_values = ARRAY_SIZE(emmc7581_base),
+	}, {
+		.id = EN7581_CLK_TOD_SOE,
+		.name = "tod_soe",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 2,
+		.base_shift = 6,
+		.base_values = tod_soe7581_base,
+		.n_base_values = ARRAY_SIZE(tod_soe7581_base),
+	}, {
+		.id = EN7581_CLK_TOD_GEN,
+		.name = "tod_gen",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 2,
+		.base_shift = 4,
+		.base_values = tod_gen7581_base,
+		.n_base_values = ARRAY_SIZE(tod_gen7581_base),
+	}, {
+		.id = EN7581_CLK_EFUSE,
+		.name = "efuse",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 3,
+		.base_values = efuse7581_base,
+		.n_base_values = ARRAY_SIZE(efuse7581_base),
+	}, {
+		.id = EN7581_CLK_AES_XPON,
+		.name = "aes_xpon",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 1,
+		.base_values = aes_xpon7581_base,
+		.n_base_values = ARRAY_SIZE(aes_xpon7581_base),
+	}, {
+		.id = EN7581_CLK_FE,
+		.name = "fe",
+
+		.base_reg = REG_FE_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = fe7581_base,
+		.n_base_values = ARRAY_SIZE(fe7581_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
 	}
 };
 
-- 
2.51.0

