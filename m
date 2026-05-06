Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021105.outbound.protection.outlook.com [52.101.57.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4C33E35F;
	Wed,  6 May 2026 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097965; cv=fail; b=dSlmek+PWMIfTerEA1Ki8UOvKXt+V+vFDUAnp9wKE3Usc7dUFe4cW6/ZYStvaWdYrHBe/c68IRQdypQ/XdregU5pw5qVrURYzw02BMleEcaVk9P8LjnfiisnkGdYxDVKMAaexgBDgPGHnIhf+aXNzz6em4/mpTWFivKLhC7CzN8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097965; c=relaxed/simple;
	bh=HDDqXJfCk50wsVhemjiiKC5z/K03u60B7PTh0vgiKu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tsxjwjGgeDmmP/TFDm0HutWyXIvz8MhV8AlVdWrYzmZ/BBejveTU9HOPeiECd0yWx3qgrWt7LkDNqVY2TgucXBw3mo0NzjDTStKletOjrVrCjtnbz00HjfH+RPygdiJz82NWzoRHWeAs3eGR9yyXDA3kAv/8dMlVJbKogwSs9is=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=OoaJUyvr; arc=fail smtp.client-ip=52.101.57.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="OoaJUyvr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XihWMxU2lgB3Fa9I6fHhis+W7B0Js15z3qlj+HazCBmdlHoCPdalIbzce2pyWB2eRVTOwYOl2A6kXhJRAe0TEzfk88iPzjyqPtHxDDo08OnkA/e3H16xTibnk1iOwNTlmjr6oYQ7VI6Wf5nNBp3dvxqkLmEszayLgdkXemUod/wVItFhGY6wMw5AzPeuvTBecYhANZThP1D/7Dab/d6QICCL6b6xamVww0VQl795zetq86jnMAMgQdV3wssxeumbE5ygAc5WuVmMS/1N2nF+DcIbkKxnD8dgfmWNhPgnZ3dfpEm7B/T1NnGOczT/kGfOA39SjHuBJzsXjRXiD3kZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gb4kjh2kj01KXsyYCRkyUWgbL9JI4HVFvtmm47Kfad0=;
 b=Z8k9Cjibn/IHTD0me0DM48ck4NIOCWF5fhpYoNmGTZzIUqH3vZvIwfXHKWIqZyCC+DksVwv8SCOx9TLv2myDrhXd9LCgWZ4Fehg5kfrd8XkthcyXicytvHXQGHKCX/MYryGgdwvd40hv8meIPL8OxXv0LeDBodsJjsZUoLMkuhLocKfMWibgvAdonBYha5r1OA90VW4pWwKIutb5OfArqDTV7dzwS501D+XnET6CVCd9DroEiqgirg0cOuK2tTBq0fwPpQ37YEhgqlEgNyA/C6p+pNbNOpyX18f3a58kcaIvcK/Yy4oeAClppgy/nDqk3G+fy0cmONKiNUXvYrskTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gb4kjh2kj01KXsyYCRkyUWgbL9JI4HVFvtmm47Kfad0=;
 b=OoaJUyvrgOuk3vKMeKriixCLaZRdEEXPDY2ukqyMouM7Qa+1dqgwRla/Iskq8sMFumsRT/dMj5LMaI4gcuHb1s+eLAQqr5TSs91TytOdjEuNvCI/gZjkc4Bi77JqG++ktlT1DLX9CXzrWI59shpqgvi7cyBCXYmzknxrjOeHQKA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796) by DM4PR10MB6278.namprd10.prod.outlook.com
 (2603:10b6:8:b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 20:05:59 +0000
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b]) by SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 20:05:59 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 1/3] clk: clocking-wizard: fix clock difference detection
Date: Wed,  6 May 2026 15:05:53 -0500
Message-ID: <20260506200555.2558434-2-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506200555.2558434-1-colin.foster@in-advantage.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::14) To SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF2BB505D96:EE_|DM4PR10MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: bd52b037-48b7-40f1-2ccc-08deabaae420
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|55112099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	CCWy4gyjkRM1eETnfXKFpJh1QnNyWpV2IYhZGV0954YIzmwxo/XmIxh+QbXfnlwzQK2/+RYTCPFfdeYXfgs3Qh5PtAWxVXLn7vuU9o2Srag9U+QI22PecuGWEi66edxUqgM8jorB//7hSHER7X8CNNp9yFIZZBPPdcHjdyMaewyQbzAZ7+8BZimgDFrp6IxCZqZKfzjjbvA3Uw0NhhJvfORedXK++CPRC0htTkwDP+WqYf2CgrGm1r3skQ+RZoenLIRP+JuEv9JcliFWcxIx4rGPUuYouVo5GrLIPr425M59GGL7VeWNgegdnNGGM3/qUPYD4vYPPMNQbux7GRKcX+zzaT0SjB/HiOvCULmT7a9mUqAtdmnsriM3URPxvfRfzOw5IdQHIYnQHUqj1J+Nq5SaLA9Nzy5Ft/2dqxyh/c0XHF5MIf38urqdG6YGjo5bGfO6/Eya0B1vRfeRF4KlrK7rfFusFSCg1WhBW4dZPjX5WTa4LZWsH+KtPIqEHdgFongURCEfqmR91hv3yBllKn89hZMTCPaKcycMlksYvEwmt8sYUuSRld8qi6xd9g2ruGx3vt6b6w4qpgSBXq01MIkxJmoZO4FrcSvuMy6LDSJtFI8Lz0ApWVuEhKOEnqHT+CXyZmxdxy43L8vYY9G4iCUeyNr+6oqjcVCzYe2/+PhJrg9ovLlnMvHFLBvITFpl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF2BB505D96.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(55112099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3qHlOfetnHidDMmqepVNZU1oIcDyfxCeG/2DzwvlqUlwj6EKipJESmAa79ZT?=
 =?us-ascii?Q?yriFe3D8nkAtQcGbf9mldhjmFjGicv/a6UO4/Ahy5UdFhQM89+lK9TaEaFNO?=
 =?us-ascii?Q?XYiGOvj8uR0mcrXf72fNPRS8TunbrT5kkcyQ7qX2B0uCv36Ee6fd5vJ5eiBJ?=
 =?us-ascii?Q?zNFnn3+epTcldB1Eajo5erVSzRVRu8LsL2sY8TZCsmrRfpE3r3aI64bbDxP8?=
 =?us-ascii?Q?PehsQ2aRT/krYNx2hY9SHoNO10We7K+2NuSJtcpYum1Rix5bcFxz2sEuB4Uk?=
 =?us-ascii?Q?9V2sB6+jjpnzRf409KfwTudQWqckzvHnL1T2JY1NAtdJKT41i7NaMNd5yNxM?=
 =?us-ascii?Q?JCmwGP60ITXI8iUPBBwhBNUBQC4imVLd6dh6hh15VO5u5U77zosvm8Xazb7M?=
 =?us-ascii?Q?amNEbQ2R8uyk1dKffKcqGY5YuIbzaq4FOXtHy1szj2Gq0Q2m2t3qjeD1+i3W?=
 =?us-ascii?Q?Ft6arbilk885iFkSrJjzDvOUouEBQaSrz5o48sYVJyGo8iFVN383smtJE/8u?=
 =?us-ascii?Q?I8juHNYZgf9eUgsjPe/p5MjWjuM2VDLJtZ8H9o87vDC8+EM9H6IT1PnGcZuW?=
 =?us-ascii?Q?7IX277yY37+hRf0VnqhI8jsMWzpwEk2qQcarn6zFUfdqUsOqoT2m6K9mQsuJ?=
 =?us-ascii?Q?h1CLn/+Q8EJj/cjgo2hOd7hgqClYsKCyN7O2ClVuATrn6phiHzlC4P+77Vr+?=
 =?us-ascii?Q?h1+OCSjlfOu0IYblhXA4ZR+89jJfkmQGlndDtxMmw9rlXrQ1tT5tBdWNwu9y?=
 =?us-ascii?Q?BNdrv1kums/tW1QvsXADfT8jwpUK+lzlfpDBdiwcuqcCzKZBfj4xGKHGuh6d?=
 =?us-ascii?Q?t902VvQE7nZ/8ZSqVyh4O4W9RjY/tcq0aQksw1sPhsscISlHQi1hD5llTnql?=
 =?us-ascii?Q?mMOduLrLLgIwmRHYteUB+YDm0sdVkUEOFoo4FY3lIYdGi9k4cHwBD0smwOa3?=
 =?us-ascii?Q?KDa4MZ+yggTkzefSpGAu/bjyNec3E2XBiZL7K1Vw/g5gI3kmotZnxVXO8AZi?=
 =?us-ascii?Q?RdAl9GTflv09RJTUB3qKJXAxEMjDORD2lwt8xZjwXUCKND3CNtiklYwhKpl+?=
 =?us-ascii?Q?qKwFB3FhXxFaP+cvtfCTSpQ8uNkIITG139Er9vXuqQVzaVn9C/5uu2xr64GW?=
 =?us-ascii?Q?gFZlua5RTbQIOqpNg7QGi0C/1agoXd0AVBTD51BYpqrFlBX2cOeug3OJFAx8?=
 =?us-ascii?Q?+rF00FExL40RVWyngMWhWrVtO1AVnkSHShBwHHjaP3/4CERsra7OtzYb/JP/?=
 =?us-ascii?Q?iFk2q18s9NigSWHsgJurE76/mr5t+txzpZiumUARJ2igtYMrSkh4evJzwph2?=
 =?us-ascii?Q?eSoMQeqGA+hgUm9nSzlKGMWLX4T3CJ7AcDdxqxdMMMVOB7XHas87MXUBz2lO?=
 =?us-ascii?Q?RgoUONPWqmyZCsQlFL/82C0K8tM6BBnHxT8TDx2HR62jmSJTLWESRtzZaGhH?=
 =?us-ascii?Q?FoWnePcTm5zJw5wHMe2k9Xw3fRC6bcfWPzBYoajLw9N7y2quA/obLrw8saEy?=
 =?us-ascii?Q?kfJ/K0fgqHeOThXNmxd2ugsZ6WReS4Pf+z5OaSk/LjLPpYSeQIyFSOvu/C2s?=
 =?us-ascii?Q?2VvPOenpbsWcI5n521+Lxv6aIU+sOZ4jtKnDGLX6z5tIC4r3oWdeNGSt49mV?=
 =?us-ascii?Q?V06+ZKz9qAHEHBqFewM64m5n8yqIuFU5YoK6N+z1fsTvEC+tSoSAiJJvMZc6?=
 =?us-ascii?Q?SO4BcUzuxc3mAQ5Y+xEz+A+jOztVV9X3Dk9VIpR43FB1rInKp0JoBY7wchr1?=
 =?us-ascii?Q?d8ZODloB2Qxw6s3vyeltARU/0Ifw6ls=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd52b037-48b7-40f1-2ccc-08deabaae420
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF2BB505D96.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 20:05:59.5311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upDGinmr1UCajO6MV4tV7/rNCveT3BavFRM/r7vt8EyBpmPujfOeNZQMXBX2fSfE4L16yNgaGufGmYOBk90NgSgZWzxRdUwa6Ilc4wj/Reo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6278

The diff calculation didn't take into account rollover. As such, a
target clock frequency below the requested rate would not be considered.

Before this change, bogus diffs would be used to determine the closest
possible clock:

8<--------
clk-wizard-test: requesting 133312500 Hz on output 0 (clock NOT enabled)
*** Clock wizard - Matching for rate 133312500 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 18446744073708237796
m = 34, d = 1, o = 26, freq = 130767923, diff = 18446744073707007039
m = 35, d = 1, o = 26, freq = 134614038, diff = 1301538
m = 36, d = 1, o = 27, freq = 133332000, diff = 19500
8<--------

After this change:

8<--------
clk-wizard-test: requesting 133312500 Hz on output 0 (clock NOT enabled)
*** Clock wizard - Matching for rate 133312500 parent rate 99999000
m = 33, d = 1, o = 25, freq = 131998680, diff = 1313820
m = 35, d = 1, o = 26, freq = 134614038, diff = 1301538
m = 36, d = 1, o = 27, freq = 133332000, diff = 19500
8<--------

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 032a688840d8..88b47b8cc387 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -408,7 +408,7 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 			if (o < omin || o > omax)
 				continue;
 			freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
-			diff = freq - rate;
+			diff = abs(freq - rate);
 
 			if (diff < best_diff) {
 				printk("m = %d, d = %d, o = %d, freq = %llu, diff = %llu", m, d, o, freq, diff);
-- 
2.43.0

