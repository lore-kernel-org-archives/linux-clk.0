Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11021105.outbound.protection.outlook.com [52.101.57.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60C34CFDA;
	Wed,  6 May 2026 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778097966; cv=fail; b=j3aJZhV4/msR3uRftPgzKKDkqBgL2a6pZ9FP2GKmk5Va3uh4NtB6Yjqyiw9Vso9T54NingBO5TVgMvGzCiZTH/xhKrMYCWudQuSrU7kIfdR6Z6PaxA8dC/J84ljaslkD0li5bUAqpbTqGfNJW3nzp74QE8J9C5KJX/o/cSkE9g4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778097966; c=relaxed/simple;
	bh=aCXy/ykOAQTWXmalKAIgntBRqF/4xdlRXzyzRdysC4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S4yk2fF3ySib5lNLPTvTlXkfFMpeCCcIvGEFvj2BvLQykD5Fgg85ad94c0/ZsYrXg+vR0Xt0miKzI1nE2DtlLdD12ptJpL4tQi25ztagVCe7NAs3NhjctrvEUbj7cC4TY+DnwQxz1BmkSGRGMGSuPkVWi3OEP9SnTRSAhJDRXeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=apnS/dQm; arc=fail smtp.client-ip=52.101.57.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="apnS/dQm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F18E5QgJ9mTYP1aPx28MQNCzstSmNNGdOKfVT/6LDsYxHeCy+stBKhprcU/nt7G65w6OfPX5NEPrC4VwGz8TgsHcL/Od5FUIYjn/MKsYkRxuLPzE5m4IoOBUiSsvR4PWVvwl2lxrRc2ykUrIOorPGB/WXqyitWhiol+UuClY2Az9cd/GnW6hE4Iw9VZTs15l37DO7Y4L7syBgkqDJMpMjKACOyMyHfdhNquIjf3zm02XxD+bo3OLBW+UcCeCBKT2qwa3mdGAo3JDxxz9PdzoyfB6B0SGKsrWpNUdsDu4NvxF/YHKBmwqEey5QYYNOFZfyQ/srXSV+N2zGDdgo6w06w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1ifcvzeF6tUAEk+T5o3m9r3y4zNqOwXGodJWBnwpNc=;
 b=yESvbgtYrr3t3kgaBBxBFXwRZMwuu1gFcQRlHZ7W+pPZKbD0BNq/FjEOfdBGnK59jRqE8de1YYCcbxKVUBdG70UQNgPssF3WBnA9cLkSZdJMpfNaJGIiee46zK+HtxPOT/yu4GWe/GEq6r/3YOFgFWicbqC3fjRWQmrds8GYquBmU/p7FrcIbD7/DWYKpAcVFT2i0TDfXkU9ohDMZWp6iJMlUzEeV4g/LPxEkw8rDdjM9rAJV4AK2m2KJFGPfXtwqDHPORgI8/lKJI9dMn8t8RDjc2BMU04+MpiO8s+7uk0qfKTkRQCz/xMU99pKVBR+I/I/tPuTVcytFA+3olC/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1ifcvzeF6tUAEk+T5o3m9r3y4zNqOwXGodJWBnwpNc=;
 b=apnS/dQmgQJTLgyqXoQ2P3ZIBs9W6Xs9esLwmGGCOSSVhnDAZRYbvi7QD3LcUPtn/5iK6llVYAqr9AOOcsFigkLAO58K3h2UDf8DC1uULaFbUwb76CfHHUstyflXldlFVDfQpe7JftPOmlkLAcftO5AR16y2b0rhGm+AhBLFqdo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796) by DM4PR10MB6278.namprd10.prod.outlook.com
 (2603:10b6:8:b8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 20:06:01 +0000
Received: from SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b]) by SJ5PPF2BB505D96.namprd10.prod.outlook.com
 ([fe80::5876:2319:6c09:9a2b%4]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 20:06:01 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH v1 2/3] clk: clocking-wizard: optimize clock search
Date: Wed,  6 May 2026 15:05:54 -0500
Message-ID: <20260506200555.2558434-3-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506200555.2558434-1-colin.foster@in-advantage.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::16) To SJ5PPF2BB505D96.namprd10.prod.outlook.com
 (2603:10b6:a0f:fc02::796)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF2BB505D96:EE_|DM4PR10MB6278:EE_
X-MS-Office365-Filtering-Correlation-Id: 00bea0fc-57f2-4fd6-2e3c-08deabaae586
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|22082099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	xhb/qBLmOa4qoaf0Wg9x200IN5VEn68sJYXOcyYiy7/xOR178SEm/GkfZ3JGPco79qz8kFkPwbAMDU3PDFupVM16d2kZLxVkeyXz16BPvl2hqPXChm5wqNbQ2O39oU9V5CGefBj2PHbjuwj6iwP6RNR88yhBoVQy0vBkEzrFuS9zL5wN6IAJII0uf2bF3Kp/901wL+o0cYMPE8BUVlU3NyyEEdKuBXDqMjfdLakkD4N1czgUA1OSUpNK94BeJkSAccNVnq2Djo+w9afRSpvGv/U7/ix1Q0l7s59+WssmgqoTdz6SCmZcBrj1NN+6ya8s0YFZeq7dkm0QImIN8m6NjHRl4hcV+4SSOqg2wjMCnmM1bNblmnHUVCBVYccBxMXN1whL2X9BUJA6WHzvmF8Qu9kFlwuxjd0la7heTrnuoZKIxBouqvJr8Q0TPJvGeiCBzG1JG3LE+1fuFww83JyQdt/iXArMEx0F0LQn6OLF4R0vr4SN5hs+/siicWeUQCXCgW/oejGiK6hfDhqiDqxqhc0EcnEQlhg8yeDNfexUCBfe2+hmmyNrY8YAj/wfu/Wpbde9K1tav4u6d1jf0ZOt1NNQDm3wp38BdV2A2fuaUhonTmKaV9buf+xcoR92LTDfmOu8qTo2v08GOa5mpJkaEY8YPy9+gTJLkzIJqE9ZXGvslBy6sgRTuQ3g6NZeBc3f
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF2BB505D96.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4EMfohdT4bxCVkUx5sK4np5XFFGVps71n80hn4oTYaloBTBz19Y2a440gasG?=
 =?us-ascii?Q?ROGZEOJ/SGe5vkOZVk1yPfQ/Vt1WYcCK2DNl4R0whMOry940kLahFrDz9YyS?=
 =?us-ascii?Q?NIWJeCenL7xezjLI2rPy+qs1fFTdekPqj4X44Hfkqmxf0o6yW+YcuoHjsi3f?=
 =?us-ascii?Q?U8utRYrYFGrIVhriiZQy1w/6R0ikJVY10ouQHg08GEHjBc2ec5Ux/aOifvU7?=
 =?us-ascii?Q?34PuHiJJPzyfuLP5p5+dZiNqIJXbJkbc0T1nSw6ADmRuaUW/we4VGGTf7s3D?=
 =?us-ascii?Q?5ae+kxjd0PmR6OpFLbhP8KMcx0HTV3EQGOYonxjF1hHP/gnY3M2hfjqJAw0h?=
 =?us-ascii?Q?p9QnJh9Gm7yarSYQBhJHC/WBR6QfE3/SdFaChnRXB9NkaEzW66FWplR86fwW?=
 =?us-ascii?Q?uRytXtRZApUZmmUCb+eHy7j8VUh8HV729h/T0a7z1Owp1HtpQOpDViBPxq5S?=
 =?us-ascii?Q?Yqde+7ARaRx90NgIeAP/SLTzPQ1nOzHYiHW2YU7fi6S0/YaRzw4sxh95Uu5i?=
 =?us-ascii?Q?DZptpALxKlCODuhrG3JgtzSTXCsTLz9i0vypeRNuUJRBdQA2+3qF9DwtN6Qx?=
 =?us-ascii?Q?CS/7eMiT8WUgmr403JGDSBAk/1cAs/ThV+Jbp2w0GZcyMrPmzLRYVF9xawPN?=
 =?us-ascii?Q?T9K55Ii1b2lGtiuO2j/NO3uxZZnOf9sDO1VFt2weSVyJxCKcPXFzEnIcg0lw?=
 =?us-ascii?Q?a8H1dyQgJ74iQDtbggLJoijANR65hybM7LQaUk5LKtEnEnk3uJR8l2OrdWOX?=
 =?us-ascii?Q?d1fmUjqPWxelYRzOrBjEZBTE5/6s2OXkSxKiwluR6+rQfq5gZrJcgALeeg0d?=
 =?us-ascii?Q?RaSKR0S9mJ7UgprNrsrvDZrJro0EmHqts6jMTefAVUWBRZNBMLwA+Wt9G6R+?=
 =?us-ascii?Q?wdZILNnNtvVK5au1s3b8P4vyXlFhf8Nxh69vlTsP+oM6E52TyFc+0EWlnusD?=
 =?us-ascii?Q?dXlox6bGFq2JWIxlVAQ2dd5/08rZXcmfMZBsMwIjBAHbKecOhUvmG+3Kl+Uv?=
 =?us-ascii?Q?hubfTgpc9UvPxSLHuKNLWBbZs78m5RCG6YuKW/OIWsDhiQVTDCujDwwajD7K?=
 =?us-ascii?Q?Ifd6U5fUNrSPpJ0bDrJrr5g59Bv3qS0313wHwRBjDXe6ycBtvT9pnV1OS7vI?=
 =?us-ascii?Q?E8mZb4BHOY0uPfWfj2kLl1mK2YEI9o4crkJ8KBOUb8caf6htImwvMzqqNFJC?=
 =?us-ascii?Q?9INC4mS2l1mZU60QuLE0LFjq2i5pIX0ZxvD8XS7TnQpMwDX74hwLzdGYz8Jm?=
 =?us-ascii?Q?5IHqKvis14TjcVHy9hN/oK4kvmZskjUecmv4HqDRkrnGV1sUvQcaUyQ//GnZ?=
 =?us-ascii?Q?NNcTUJ5hcyiVdZiEhK6edxLE7LJnQfTxMgXhTpZkCvUWfH/VAdEocGYBJS7Y?=
 =?us-ascii?Q?rXSoe/z075f1hL/5f+tnowmGt8LDbifcE49Fy7iQZ2vfxDuNVvRhjPQUu6JJ?=
 =?us-ascii?Q?F4KjnL4l6bHopdGSY7Z62MJD2LjxZaz9sFJWAcVKtIv513GsJ2x9QukGiN4F?=
 =?us-ascii?Q?j9/5ebemURbHUS6EZrY5RdqVyxjaZxI8G4lMR58LGV2vY701wzeD2b8JH/L0?=
 =?us-ascii?Q?dsOtGYNUVS5reJluxTR0/2Xpfj/Ekccqs4GyZBmeWRWdTHoTWpuvQaFYGaco?=
 =?us-ascii?Q?70V7/y17R/AnqAAr2Z7r2k+zg+dL+u88U9/xsO7kVKgS2/h6Len/msbUu3Dl?=
 =?us-ascii?Q?MV7d4hbCeH0PTc4o0jc4BizGpyMmsm+AV7qVUXcSjf8NyQOqCgbJ610zQYOQ?=
 =?us-ascii?Q?WvwS/EYprcYPdwrkNtJHZZW+C/x6ZBk=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00bea0fc-57f2-4fd6-2e3c-08deabaae586
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF2BB505D96.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 20:06:01.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcNHKMWSjrC6l+Nkt86gz3T5QqCEsPRzQfLbXg/Qkdrupm0diNMo3Exb5mWC934fRo2kec+gfUuUk5wIRYT4WrBGP9sSEbx/OLCfBOvBFnA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6278

When an exact clock match is found, there is no need to continue
searching. This process was optimized for versal as part of
'commit e0a94c6bb5b4 ("clk: xilinx: Optimize divisor search in
clk_wzrd_get_divisors_ver()")' but that logic wasn't applied to
the non-versal driver.

Apply this fast-exit logic to the non-versal driver.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
index 88b47b8cc387..d43f20e9ac59 100644
--- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
+++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
@@ -419,6 +419,9 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
 				divider->d = d;
 				divider->o = o >> 3;
 				divider->o_frac = (o - (divider->o << 3)) * 125;
+
+				if (!diff)
+					return 0;
 			}
 		}
 	}
-- 
2.43.0

