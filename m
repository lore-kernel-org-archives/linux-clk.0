Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021075.outbound.protection.outlook.com [52.101.62.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ECD38889B;
	Mon, 29 Jun 2026 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766436; cv=fail; b=EkauoeMDf2RPqs9Kg7DRtho1S4GDi5M55olnlrxHgO5SXunoMnzmUsvLZ49KAbUXbsX4Tt62yMfHEeQ7Lrs3jlzf2b0+fGR1fNcyT7O7BfXqQLFCoVFx1C3Qbwe4KdeXsVY8vVrOAzB6m0yQqknpNHAl2l7EeMoacbagSEeaRoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766436; c=relaxed/simple;
	bh=/MoYiDACrTbzz04028KYiBvXsatODdP/r6juX+JZTqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o2XyGO83nrKnYSCtqw8I7JI9sFGqxu5tIcICGGh6IwTFWcd4Mi5U3QEEt8aMOEX8iDNuJa74TPxg8vY0/A6VsdZEOnwVnsfHesVP1M3OcCxrUzTYNJvpF9LXN63OieaRb45y42HFcATWQSPUCs9F1veL7FYDF58SVmqmI8hJSmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=BBEVfqNy; arc=fail smtp.client-ip=52.101.62.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="BBEVfqNy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEx97I2PcWHDRaBSvKmjUUegG4eTHIPjtMItldqdAD46apsQ6GJx/nr1wzQG2OXRW/tCw1HeB2XhifAGQeQsqMHmjcpZKCiuP/IV/9n+9v6jDds2yRFy8WVCuimW8ZK5JSnWyLZuM477VbpVWfLcO4tYjejUELmFcx3z+/BJZ1BWLNQn3k5qwoScKjvemRA1S4x5hHPojLv2AI+S1J0Rb5vM1cqPbOWTXI+nIEJIi964gz8HTgxU+XUi3yCmJQ7j4uFWzT2lSa0xKLNIyrihE+QPxjOZ312LVB8M1M/w1tGM1NK0oc1JfSzYH3Ojf24oPkJ9HbLhT6WJZAudfSX37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPkiIfYS/p9tSmw68fTY23RyXQT+oRK4BisdBJ7hMl0=;
 b=pXPMubYwfDmzw7ro+q8K9TgKASA6Hl8wvuHX8im8oX82I2ACUYdEfiz0qhklSAVUXg0MYUUgXKq8meBSEEkGePi2M+8tl56Iqlce7R0aaWU8uTsANTGJxjv7xhQCQKM/572fBgoDvygpCgjwVlpRtAVRU1IeuIhILRpgLAO7/2kKshC3dSgN+aNbIJTYQdc5CMD63tCKfYATL3TmdZ30ukWIZee093W2xacM2sqTNd4sC4/Hoc+V5sOGEWL7pauhIAoCti6jD7SLletJ+lGU6s43yUwVYeEyM5FHfdtTLYC8QFx5cfG/hiaS+oDL2RhBQXlfe2tNqrDNHVfhreiaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPkiIfYS/p9tSmw68fTY23RyXQT+oRK4BisdBJ7hMl0=;
 b=BBEVfqNykrk49lbyPDCIcCVSxY5UKeobuuY6pnia/s8c/KBZuGi8q9cUjc16Wdfxd/4AD8mCI4IfJ8ph6CqT/qOAWEDRvY4BZHU1DAyxrB6HWWwMutHfd7/xBNTQoUi3tIevc2DPg6KV3wEYC1U2TEb1otJO46LKGU5A2PlKPxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by SJ0PR10MB4749.namprd10.prod.outlook.com (2603:10b6:a03:2da::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 29 Jun
 2026 20:53:52 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 20:53:52 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Brian Masney <bmasney@redhat.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH_v2 1/3] clk: clocking-wizard: fix clock difference detection
Date: Mon, 29 Jun 2026 15:53:44 -0500
Message-ID: <20260629205346.3228886-2-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629205346.3228886-1-colin.foster@in-advantage.com>
References: <20260629205346.3228886-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0344.namprd03.prod.outlook.com
 (2603:10b6:408:f6::19) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|SJ0PR10MB4749:EE_
X-MS-Office365-Filtering-Correlation-Id: 9725e4ef-6b50-48be-8a77-08ded620869a
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|3023799007|11063799006|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	E3uV7ZySJZdKnb7wqJ163XaQOV8V0/XCufisOKphSUJj4wVJdbvBLlbIruh/ELniQpbBwyAPr/9wYCUCqVFn9MW4xNazL2QytNVIAYnq1boiuTmwSc1IiX2gpQ+T1pCffze48AdqP/1rlPlz6JXIF4vafvTUzQ7CJPz+sQuBazIdFIxEcSanqLgJXy/tEgKTq+Hxf2aCcI2rgWA6ONyiNEqLBH2oqRedmBxQj1vt8ZvnlgxbvKhqsRmRIcojKt9/DG/IqI8G6Gi2WSyMtx365zg/5mz1R3sepKgkuZ8LBq8dBmu6kY2oQEKZlyGFMDXpCYgn/+GNEqzV6vQ1dIuK/cbCRtJMcxsrYfY2hIQaBKUW8bI4ipVQuK3euJbVObQWt/ljeDbAcA1bJM8IiM8te+JbeHXeNce3IRh8EfmA0SA72P7Dw/uOotDTEN/UV9huD1Wcz524KO9QzwJphtwWt51DzQxXxooNHhqNVRkL7AB21NVzofS8QlIZI8rTY6Uotc5hAVJEAiNvDH8imvmYilT1OYTlxcZOQsFFuaXPBlZpCenkumTUJrnZ74g2hiu67l5r/vRh+JEzuZ/feTMNHhW8mXo8lbCRLiSL7hd+0BvT6hURX84btBj3n/EvOf/M1tMkXvszPSqpuaBgj3yIkdsCBBOMvAS2dmi/BAdXkMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(3023799007)(11063799006)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G83NNIV9yjhDtWVhl3sNTGBE4XDE/4Mi0RAKLkOXC1FpS3Pq9JH99rq4jzdg?=
 =?us-ascii?Q?jQ1ZU5QUKVhEkYPc8nv4MvppvBqUJBex0xVZfmT4YlqiUbhx0rS8ouekGJgf?=
 =?us-ascii?Q?MI1WxMzOhAG2Su/FlISSNkpoTFshZTFCAu7JAU32MNf8fqgsDSC4cQUYfozn?=
 =?us-ascii?Q?n867rRtYDanvogRC2JnKGVs1R7ICwdq8y9j/Q58NgIj9wdGNAaGfQg+jI1cc?=
 =?us-ascii?Q?cdDltxFuBbWhrcMeNez0h+rAqVjF7ashTs5nGGd9OsEDZJ1ZYfmJBM5MbutX?=
 =?us-ascii?Q?ATMDeT+2oHh9hpSt+wsTtS7HwnFMJqLJi5rVxDRLeggv1In42Dd5MyHWvEcw?=
 =?us-ascii?Q?xnrN0EVJ4PSzqgMRrxEUu8UB0RY4P14t4rlMEgjmGxOsYTv3NR78kl4h3JPU?=
 =?us-ascii?Q?3MG0a7Vumz5svExLIQmBwPGVgnqFUFDi3H0DhliY1Gf/RxGqcifh8opQye5f?=
 =?us-ascii?Q?obIUknvEOBja9737UZAixHPvPOJhRa1Ou4F8OFBT0SFmDFZ7VkeaAkkp5qMG?=
 =?us-ascii?Q?Mw4wWms1jrXQ77xvH5dEH4pjk1HdMCiOxFPw3Bv8vBxC29TEPDgsIHPoeK4s?=
 =?us-ascii?Q?o86cvMfHaQOPq46SwYbvYxVxDhJUYUXWkztlw5WRFpu/y5QMj+eNpA8RfoTq?=
 =?us-ascii?Q?yOW8PP8KQzFFpipwtQCS5tmiMWgdAN1UUCUhJu4JdgP+hwDYB04d+udrk0ip?=
 =?us-ascii?Q?p7lu6sHkkcBVfUZNKicTPM8H6/BcxfFm9/2XdjO8SXu5rbliuXkEtXV5xrvJ?=
 =?us-ascii?Q?AOEM0NmCqaowXZnKBnX2+CNDI1HFF9lrOfr65rkXTTFmeM+fTDEPHMM4n5NY?=
 =?us-ascii?Q?n+uzXXlct+w1jKMYOqowpDx9fysL7K5NnJNm/WygH9YO9nIMi4rPxrwpE0lh?=
 =?us-ascii?Q?T4ungvaZE5JcylkstO8VlVpACHOljNXK2O3KBX891P+1zf0+LnDlZXrLJOJi?=
 =?us-ascii?Q?XLKfAoIx/UpNG4vlU5Woo7ptKiZyrlD9gXeozXdquZwMWfktGWRFGcYIc6Tk?=
 =?us-ascii?Q?sH98PkOTwEKL+yPVJuzcWh8P40sccTyMAlL9+kMiEEj15+b+CUz6WGcaw/TY?=
 =?us-ascii?Q?TW/HAE86E4X/g3PYobzQdY+yThPMN9E1tYSGmFZZSrhL/ipm8GJob9SiTvTD?=
 =?us-ascii?Q?hp4fKfYo266CvnetmbXz11Ou4JuWYuGwYDrWwH/UwT4kh6xW1jB+XONctZ/Q?=
 =?us-ascii?Q?yuZIOsaMMOagFzAtce8rAyVG4Z1SEjRZCS6tXWM+8UOvZ0zsAlz8tKIKSmFG?=
 =?us-ascii?Q?/D5NqIw9rxe1vI6H2F3wXFJNOfCImqvPI+Ah1A8/SxbxKHcqjm7WEZaPRCt9?=
 =?us-ascii?Q?5+nJ6sMj8UDHA2Pe1BA8al2vcAFam+HC0WtJIw3pRA8TV3vIybbyeFU+7GpR?=
 =?us-ascii?Q?CJ3hwJTp3lQeDNz/tuQot2ACng9iCldLg215NbORKces1gb0eT5/KY4+GmfR?=
 =?us-ascii?Q?nmFv2oCCwjboayhAjOQVmlQvMEGYzI3eYPDFXUfO+uK3BHoZspa+RiflXkM8?=
 =?us-ascii?Q?DOr1j76qv1FTUk45U8YU9/P7zlbGljLrUtA71PstiMeHng4fpwwPnNKHKRuK?=
 =?us-ascii?Q?eyJh5HSWiDKyVUjZP0cXvyJkdcYAa1FzZFVucEpNx++t51tiD2ZiUlN06jrZ?=
 =?us-ascii?Q?6tiGTCN5PPg9Bto2cnDYZUN+HHVIHkvQ/NQG/6GFQpwlWtkXIOpXOeapwnqV?=
 =?us-ascii?Q?lm9y+hbmxvhaA82Uw3C2K9WKBqrH80NsM3PKOkJt+j103VG5FuYdksR7fleE?=
 =?us-ascii?Q?jngSeW1bqOOR22UDgj8VIuE6LdNkiDs=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9725e4ef-6b50-48be-8a77-08ded620869a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:53:51.9904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a6jut9zFQbFhNvAquiNbybDNcmppmpZYSPoX9/AH/vVpflyH5yYBOtoftiZMzflF3dcnoOC1jqNCFsmjeicSnYs3/WO+qrSZLeY7cCqI40o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4749

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

Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 4a0136349f71a..77c9d025ca8cf 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -406,7 +406,7 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 			if (o < omin || o > omax)
 				continue;
 			freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
-			diff = freq - rate;
+			diff = abs(freq - rate);
 			if (diff < best_diff) {
 				best_diff = diff;
 				divider->m = m >> 3;
-- 
2.43.0

