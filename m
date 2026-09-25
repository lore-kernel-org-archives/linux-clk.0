Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E64E2F15;
	Fri, 25 Sep 2026 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790365147; cv=fail; b=DUs9z9vgpr+3td1VTm4PWq1Paaxx8qG+SuKKWY4j/2ppA+47yhJSMZoEmsvqKgeO5S8Yo5d11hxdu+WkD4eUNhrPNbbzWpgVfCAKOvDzmobiIfEWGXUeamRhRQGm+zQbofEcuAyfKxGCDVwzw9Xt0dRmiW1heD6ukolZYJ2xwq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790365147; c=relaxed/simple;
	bh=qfLbiHHyXA7t+jq2iD4H6DHvT0aWWjvBL4+oY0hNTW0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Jgsbgb/2t2MNLfyhLSW6epWZ137VA9Pl/qz6f2/h2PnelY1TSoiOGkq4B1UaDtLiZ9o+1DjbrbIugkMVAlpDph8tmMsSwL80QYsOnvz+wk4lKbaqW/omc9uIAKgi+vxDZt4FX9eE0/EGXbdl8L7AKEqfnxUmMINrqEt3gAZ+M2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ETaHAfp/; arc=fail smtp.client-ip=52.101.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ETaHAfp/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mc/QEcFXWME0OH3AVKEKr7382fIrapIJW9pxyFZI3z90lWe6ovaNzNdJEB43g+4ZISuHpMxOznG+haUe+QA/GQPLjDayL9VagIBU9h156E5eKBsjEYFsMei9PU9SA/64CjRBJbrdPH9br7lAOh5/7L0sxttMybwlRHpuIbZUZ8cn7K/nyBHgmawAhNNKSQ/VNr1wjv19flzn3qlF5Qp587SnxSiJ0eSK4vuWQ8+AZluKeWA4bKkJvc+kz1Egpx5ouzWbNXxBfuMkIDQBRNxqttQ1a8HxT3/65MpSzq6wf4he/HKE8dZquFzuIjY7b+JvSU5C1y7qtpjpXRBa/4T2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q55CNF5brzptinKAKXmBnJxUStPvunBhnu2g2msufs=;
 b=YySSUeHVchoFbsaHjnf+kGfsDu/N88fJ1Jlb9vPShkSWxtji7KiUV2OWBSO/4RM1ECVAsO32IrIhwZ5vBf4pNpOQnXbq6Ht9RQRiVePPV1LUG+SFXa9aue/aGa87w8G6g3ZdmRe03JFnKW/P1OD/f3omAV1k34B+SEl9T/KGKUfR4WR1uDueEu9xRStYOKkhnX4b9hJlKu24J9A6QUkcMy1a33OpysdjadODsr68UUks/GrSXz1c4+5ZyKthRlFG72GLWrDyIQeGRwVLpbcWxf6/3br/dFTGCL8h77p8w0cor7ZN8LSSMV6jS31qYj6hmg1vFsTVMHOlNqCTjAbYWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q55CNF5brzptinKAKXmBnJxUStPvunBhnu2g2msufs=;
 b=ETaHAfp/u4sqt+f5ycPu1thGKoPQfWx4HjmbhvIaxNKxIJnya3rfw5joZR/3B4nP6bEWWBZYtbU+AxrGqm01ls7N+sr1uZ5BcFyqYITC17xorxxxN6Dq1o9FbXwrNVCXrxwNagaYBp7hW/au5E01jcXT/qmvsCYp33CNVjjTtcfFLnsGc93ZXtevhbrEdwh4YCV7XRprtl0Zl0TCnkQ25tAHutbGpjuPx7SdnG7zPjFsBUXoLmDVW++3a64OqcXrqtAJhW15TEPber3taNyvZ8e1W2Q9uGOYEqvwPF+3o6GSCYUmteQLtWePYQ7uhSpIEV3MFKRCo2bYd1P0C9WSMw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by IA1PR12MB6580.namprd12.prod.outlook.com (2603:10b6:208:3a0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 19:39:00 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 19:39:00 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <ynorov@nvidia.com>,
	Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] clk: si521xx: simplify si521xx_diff_idx_to_reg_bit()
Date: Fri, 25 Sep 2026 15:38:58 -0400
Message-ID: <20260925193858.250215-1-ynorov@nvidia.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0908.namprd03.prod.outlook.com
 (2603:10b6:408:107::13) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|IA1PR12MB6580:EE_
X-MS-Office365-Filtering-Correlation-Id: f90a2121-a4d4-4fd1-d5d7-08df1b3ca5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	yBpad6DPvt7rptlJ/Pqkx/SDwTcWPE8p0Bs6Ay5sNOQ4nGIe8TgItilWmXTdYZfjgl99lVp14xJvg73o3qw0I4Z1fpzmS2Wlp0WdejCngU1CdjgvRCin6uKfp8GHpMcAY1OaDML6ZZCGPsJpr1aWhcIkvbhaBMWfmbhN3I+CIOlQe5Z4pLUxkmBizIjTX3iR3LTgcmSVK5gqjZ0Rw4lTeJnyqQeExWVuIXq83Xl1kwWviQ6LpWqy2aYluRHJqmfllqX4VV/ztGGnDqVkNlOQYXeZqkBUCG+QyvunMhXOJGDoZ9h22Q3A7xg4Efby9e22cN+6qMEToOLNKTPvEZ6olfoTNih1VBALEqIsexpcD220UuOfp7BFBKYv15x0L68+xPLy4rpe+owaZdgPcfO2VBvrA+cilfiYYSEKPGN83JY74XMvU6ygt1xQq+lLMwIc51bkEq9FkRuZHXU+6KP1BjVZ+hjeVcmMW6wOv6VV/WwPfIBtXGvomC3ob3BCd/LVkuroG0EBsOyt1XVDe6V/SJCmPIGZoIbb2finIh8PUZl6Rl4+1RsT2LQBWBjmtrAPsD3YNhgtmp3pIj27pI7bskiZ9+fyFxavcV+RP/rE03ZHQ7GFpFpkou1/Ni+uWQAirXfaMra3OEbD9GBrKP2B7PXMtu5BHsNv0PPvHBCKl8I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R4dEpMWCw1QGVMc7Q4eePWQeDuOB5qokPaW2V4kERv2HBNYZIxQeec4c9VjX?=
 =?us-ascii?Q?6DWbf4iRW3t39dpL4C2jvDCKbLDctolmOzKqWBvw29v0bAV2JVDCXFg2lOLV?=
 =?us-ascii?Q?bN5SnGpJDboj8mdaRLAWOs5NhsyzKwqZnpA8kbi/uYCvcrRL/WPml59EAQS4?=
 =?us-ascii?Q?yIeowiODQxGohg/pdLqrIVTS8DEyJjRpKsgvEMZ+WKivd/cJSzYZJDEmiW89?=
 =?us-ascii?Q?vY9W2Yv83ovtPGqwQfrJDqYSNd3Bvs6W4NFP/pvxt3t6zmtxrEcDFee+9h68?=
 =?us-ascii?Q?NG2DoH0oP/f/di4ZpYBSN+IkCyIpXR9uFe+m96lrRzeMtmZAHdcDpA47f9z7?=
 =?us-ascii?Q?62eWpxwz56NLvn3yUq7oYNj+xlHLzGYVuVaS6FRhFa27thJD4sgCeDcqxOLh?=
 =?us-ascii?Q?omyNKJb97DqhlD8RHOF7WSgfbfi/Yw7Hv1RJbnzrz0YzSXNLbe9X4YcU0P9y?=
 =?us-ascii?Q?7BhFggFKEEBtT7hZH0sOG0e6wDHeAkwIVIxI14UpAdu6zlKfiSeqAYviNu8w?=
 =?us-ascii?Q?L8RZVMBmXpDvtOocoYG1wuGzOy2CvKMYN0wyYA+mpOkDAOoT4hEZZ93oz/56?=
 =?us-ascii?Q?j0RmuUHqwREvmQo61a6fbZH4TAF8l4pSDk5ky52UiELI78qbRFlU2S9cLeSs?=
 =?us-ascii?Q?VTdOMSMfeQa9NwqLfuZ2BkGO5Db9o2uvFoVRUIgXBgiMSgK0C/yNhzcnTFX3?=
 =?us-ascii?Q?bMBHdVoRkr1VTlOqjUzAUKKP/0lylRbf4WGL0Icrz/zY1VT7QIDqjOCEYrnT?=
 =?us-ascii?Q?q50Nr9rVjteCYE7EU1T3HKCj4k0FKeIsUWDaNCNItlkWRNAHIjAPDPno30AH?=
 =?us-ascii?Q?zKo+r3Gr2ciZW70U63js6fFQG/1oh0yxmvGZrqJAUHYeOdro19yMqKaMPDZO?=
 =?us-ascii?Q?x459hzKSGuoOpr337fvyY7eKaRk5KNQWG6b+a4c1ldMX4Dklkl2N31dHPVej?=
 =?us-ascii?Q?ybTtJcrjf85CG2bxj6ypnNlH/hCWeBz5V6eCkOcu6Me5xl/r7YAXBnhhXXuD?=
 =?us-ascii?Q?/0A99VmTzFOQxb7MXTnuCvebfNQknE21FkO6YrbG402BKraIZiD+sLTKBKDS?=
 =?us-ascii?Q?vwkSTGOp/YnJSi3eUPsnoY+JHYjI75odJ0xRD1XU7nfZwye9O0rdYzmEjf/T?=
 =?us-ascii?Q?pgGmAU8dVPKGuiHIYfGiC38fU5ewxWnhp3+fQLUaxaS8bi91p9OD2lPQ4wRQ?=
 =?us-ascii?Q?rcisMP1L3utMOwjA+ukUjNTnFB973h+TJvf6mZ7qIuhsfUn+OcNDYIsoZFH5?=
 =?us-ascii?Q?11MrDDizhszjaZOta3vw81ZZupo/k02nrQXxR3a93L0xPag4UFkqmCiPJcnH?=
 =?us-ascii?Q?llPn1EddH5oHlf1F2gaiYx3pguFyLzQU3NZAyBUjFL2Iwz682/V2l3vNeNT9?=
 =?us-ascii?Q?6zk/aLoOx+qWusY4PQJWMt2xcwqQZSIV6KamYmvu5Mj4PqGB/w1wqnxMX0Qo?=
 =?us-ascii?Q?UdYX44G+/IRiQYwMKWEiFddRwILb+71yXhjtEBu4pP1sOKtfCCEia1LGmr0d?=
 =?us-ascii?Q?SgZimDTLrD2YTpdU4n0uyuq+qMXf744FOV1Mj2U/NspFBHvnuD/NpG/7qqwH?=
 =?us-ascii?Q?oxd80aZ4ToifV4CXV67LrHmrJ7CFKFbJG+i0QMOG5YSKPksLI2aniBFXxBOL?=
 =?us-ascii?Q?DDLcb87/K6Ih6J4WmTjpcbs1NJ0BIwdNJSJ5foaO0jmGNDfRD2O4Dnxo4F4r?=
 =?us-ascii?Q?f/jJTl6UxN6ZqAAaehen90OXS7D9tboKZCvGfCnGyaou1gFy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f90a2121-a4d4-4fd1-d5d7-08df1b3ca5ea
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 19:39:00.6917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8r0ND9VP4zEq/qhrHNtIr8Ja/0CewOPp07z65+h8n2e6UgL+WeBB8/XaoTTvBzB0+N3PVBWgmu/bbgF2S2/e+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6580

Switch the function to using fns(), and get rid of the double for-loop.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/clk/clk-si521xx.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index e3fb8df712ef..186fb0916066 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
 #include <linux/bitrev.h>
 #include <linux/clk-provider.h>
 #include <linux/i2c.h>
@@ -255,18 +256,24 @@ static void si521xx_diff_idx_to_reg_bit(const u16 chip_info, const int idx,
 					struct si_clk *clk)
 {
 	unsigned long mask;
-	int oe, b, ctr = 0;
-
-	for (oe = 1; oe <= 2; oe++) {
-		mask = bitrev8(SI521XX_OE_MAP_GET_OE(oe, chip_info));
-		for_each_set_bit(b, &mask, 8) {
-			if (ctr++ != idx)
-				continue;
-			clk->reg = SI521XX_REG_OE(oe);
-			clk->bit = 7 - b;
-			return;
-		}
-	}
+	unsigned int bit;
+	int oe = 1;
+
+	mask = bitrev8(SI521XX_OE_MAP_GET_OE(1, chip_info));
+	bit = fns(mask, idx);
+	if (bit < 8)
+		goto out;
+
+	oe = 2;
+	bit = idx - hweight8(mask);
+	mask = bitrev8(SI521XX_OE_MAP_GET_OE(2, chip_info));
+	bit = fns(mask, bit);
+	if (bit >= 8)
+		return;
+
+out:
+	clk->reg = SI521XX_REG_OE(oe);
+	clk->bit = 7 - bit;
 }
 
 static struct clk_hw *
-- 
2.53.0

