Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7ED3E5A1F;
	Tue, 13 Oct 2026 07:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875290; cv=fail; b=di44XgWaFZhi8799qT8xat7TQaShdrLl09H/Wkjuq/U09kALh1i600pIEYs7wra/nkag30IuOTO6JjbYzXWZ6Yvnfqg38DgcTsmNvgAJ3U/JP3uSIHeGIHkMcy+EYtEuTf/QRPMu4l6CR/yLZ1uhLpNf0OLxd2kARtdbGMB+N8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875290; c=relaxed/simple;
	bh=GPCLgRn+oUEYNp+hsEEcWCpWVuvQLmuKkPUSvoivgfY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EnT3PvbmGjgzIdyXpqJqmg1RDjVpxoNbXpV1J44x04SryrcB3tbL48xIIBDdbDzeOnv0CF0isPPs5l3emVWLU+/0yLv66v5n/9sywPzGn9uI7uRjDAKyXlxLG2Axohkk6cYjX34A/4aQq8fWVOp58ivut4hGyvajzCFSv2N930o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=eEKOHOuE; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="eEKOHOuE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQEYmevgK27Vyx+OIkVvS3YhvRl9HTdmdqRq8vTHzRowxF8WPEaVSANzS6jTxzCqQ7Lf0oAJ9A8sehVLIRmRoWH6LFAEJpj67m0PSkaPg8Vktmsdbg+sFzTEq0UWObplJmm7EqUFCTOtdxmtsxegpy70gvHcal+6FBftaKXugDebYzz8vFofd8nOa1uGHo1Cu2pYyKhlNDKS7ThVHSt3x9TWKidT7jl4hrh5wZA4BqIyer5f3irJfaWs234ctCQ5pao1q0JUyib4rHX09BGXIG5F+ZhQUjng5QLgq5jHipdowCaT65FUH9yEqy4K710f7QkyU1tYJ8zdHmhyWvs4BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5r1FNQO8lvrCqRR513mb66Sq2apABE5V2vxG9kX+ug=;
 b=Fw2whAxBJI840ygMisyCApmABNK7uPfnM73uPcDQ+MbOslhpvCrwRoVJEVO2eOVpafqM/U1Qnmf/uxSG4RnkAghUFAJB8PaDJixTrnKh/CWs22zUt7F65TbtjwIt+cyMPrBh4U00hYDAxLQsK1jUHUCPCBIiBHExuX9MhHT6Lc8/hAG+gSTfYIYwOYK9Kkv6evoWOheOAcAB6Akq9zTWYdii97CmfCMN71znponyVNAv54ZV4uRLLpNE1lhvrW57frzBXwznZc+dLi8F1Nwyst+VzEIoSvsnNx3Izi7kUfZ0h2IlxSHKrQq59eYXioq4rHBArwp0FmuC2vjhb/7FYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5r1FNQO8lvrCqRR513mb66Sq2apABE5V2vxG9kX+ug=;
 b=eEKOHOuEfzNh4+bT5hDBU24OrMSe3JuBTsqqAz0K8ApwbAWX43TjbuNIfbyTegvjAhOhiwGtyjWsWj4csYiGQwC1AX5KQLcSfQLHk24LUCPrYIekstWMLkBpufshqtap1odR4+5sS6EpdZ27GZtUGvcA6oXHbtivZKyWc5GmlB/TxJpWfsq+AKkEJOvXpoob56m52NDnG6+GJ8TVSzQouRXA6PSIE5D6wYAnbQ0u9K+RFRBbR+9q1MaNC7hqHzEJtwz/7GKqZ2iqjyp9viXxlzp+fppB8E8BnioyzbCkPytq8HxNCBy+grzbm1Zn1AMakgOE0M9GR94u8B5zQBSJBg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com (2603:10b6:a03:393::12)
 by BY1PR03MB7947.namprd03.prod.outlook.com (2603:10b6:a03:5b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 07:08:04 +0000
Received: from SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80]) by SJ0PR03MB6581.namprd03.prod.outlook.com
 ([fe80::e335:b86:cf59:8b80%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 07:08:04 +0000
From: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
Subject: [PATCH v3 0/3] clk: socfpga: register the SP timer clocks early
Date: Tue, 13 Oct 2026 15:07:51 +0800
Message-ID: <cover.1791871090.git.adrian.ho.yin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI3PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::11) To SJ0PR03MB6581.namprd03.prod.outlook.com
 (2603:10b6:a03:393::12)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6581:EE_|BY1PR03MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8d5ea2-ab71-456c-1a50-08df28f8b9b7
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	5LUP94lk3LnAJzhsTop0jWxO0tzz7Ch1ZEe/YeMCW6XAx+4wOPeclavF3SZ/A1t3qZ5ctan/17Yc0EWXp8OcuLIGL8yOZjU0q0GXXP9MILGZEEbg9LPgvmEzZC+3dSIF6hF4T+QwsMX1kaVRpe4+b5MV2skEuvAwtZ/6N5NNK6ARUyNvPdhvw6yQDOu7gD06hJ+vFnDMHCMmm9Aof43yeteoDMV0ZLdU5mQLoGUDAHKEv0SlXBOPBxMeTpFHG7bgrxCu3P5J1TCVZ37wJs8GqIzlKklXYUZUVA8Txa7sYw98M5TtLuf86cuBzNW31RvaVDQoMa8wgnCVOLkKwetPvQ6TEJXMBOYthG2tcgDU9A8gk0o/IFi+gdrTiLDH3KcjRRlhpiUl0xWqN+1cDBG2CZhVRdvOl5djoBJauKEXaKxNHmE4MqmKsOzmzIWcxxGzk5yE7yVaxTebRvG1eKynSteAnYZcXCV1vwPf890vyn740ByK0FWNnFGWZg7A0q4BJ/t+ukgRjDtUYa01X/sDoNzwIeyXVbdR206AVaBnhy5nWZODav9854W7E4VcToOzxEaG7xE0qQNWU0eutMbStDkqYrDP0mUPzEV8bSc7xYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6581.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pt3M2JcDoOKbu9xIyJhGKe0ixFjdeW1fO176aKjHHgRR7OUGEsbnX0ZQ6wW1?=
 =?us-ascii?Q?vtIu9D5BeLzgoOjw3TJ9K0DUicZ+jFvBNTKPzoggx71wQ2jRTMKV2s7i+d6x?=
 =?us-ascii?Q?gszDHMd0ug4LhIkd8XrkjdFSV3BIblDlSSFnGp5zZe+vEl24lrzQUI3g9bBu?=
 =?us-ascii?Q?1w1Q3lH340JN2BsSRn5cWW2D02L+yuOZ/jDCnMUPGoYVjYBr5R3MdKyCRIzS?=
 =?us-ascii?Q?Hbwxm8bBRJqJU733zKPG9K20ppulvksQRu/evfL6ePAbqadGqyOccbyhUPzS?=
 =?us-ascii?Q?S6Jdl7ZSBv9qN0tKxQQPj6Z5H3YV8sAXWmHKccN7BMVWeseTyAhtXcbMQNJH?=
 =?us-ascii?Q?BRsklj7eAdJNN/jy4sYscAI+3q42p/3TeYECemRcBGJ/elcszb9GqV7T7LF8?=
 =?us-ascii?Q?t2OIdotqHoI+F/nEeTGx+0as5QaAqRfRwdvQCfPGrlv9I5lek9jLMsRIb5sU?=
 =?us-ascii?Q?itlF5D38KurXE/YzNKTyYKmkKLHaeSPuD+TI9Kjd0fIGLDdy54Mz8XPl7bR5?=
 =?us-ascii?Q?5gp3tgBofV/iSn2JT8kX4DCmr+WYyFMDkYNu4Gq8NuHuOIY7qKuPsothBG4f?=
 =?us-ascii?Q?7P9uqyzf7/WTH637Ig5LTr+QCmSKz/Q1Jrxn0Mv0Si/BtSMvQD4yEzdjVXrW?=
 =?us-ascii?Q?r6c0FaGv5Q3SLcyOdMR2NJOnqfFf69Ka8Q1X4nTexmEt5EpKZo4fMuFfpgmP?=
 =?us-ascii?Q?8CXvjH9fptYp+B0Yq4isvDeIXff6fZhVdnuhsTm7VdadANoQfaWKr87FgIjO?=
 =?us-ascii?Q?xx+y5n1rhzzllf0fElQNF6vQ0B0JxGNIx6oNQgtyAMWhu4l11Gtm+rdYSDUG?=
 =?us-ascii?Q?NW+PzP2cwplOZ/7mvr8ipFQAOI4DdcmdghMG4eeA47UQE5rYKQb1bx2II/E6?=
 =?us-ascii?Q?kM6ARNa81/phUI4lMqmG/Iq0oaHvhq1zTvyz3qhXamhvZLGhAbo7ycK55nAE?=
 =?us-ascii?Q?TqGZfpmi6q8iIz5WlVTCPjGC3BIbQLYL2t2jtJ9Fcx7vE9BxSLKNj+jjl2Ji?=
 =?us-ascii?Q?mqfKpAQHITLIPai4WBrr/24FewzGmtXxPp1GDK64duElTZAtuqLvJvu3c3hH?=
 =?us-ascii?Q?PPI6MfJ14HpOzXKyoXYVJK9q2tPi2mJHDkqTArS7HAAGWK6h6d0P/PSk65I/?=
 =?us-ascii?Q?trc/oFuhbASO4IeZMubIARxN2X1fZr3dJnZXy2Y4cV/YBUhvM1faNuHLKQ12?=
 =?us-ascii?Q?dd3KMj9YTCL9CKUzP4cvhC7aaag7d/LFDNFjF5mcmRVGUyuY7+0290jgfdM7?=
 =?us-ascii?Q?MPY1+FRf67ea43rPdyMScP3h1+0QSy+tcR1brKx8jRBurTd/BHJDMJgrb5wr?=
 =?us-ascii?Q?HAotiusM42oZOcaKlbzS9moPZpHi6WLpq9uMMZIMeEAteha5x7XEPsNryOhJ?=
 =?us-ascii?Q?S6yoOhzTW+hq7jgms4NQjYV3pWzXzrB2Vkfgvt1eiCGgrG599u+d6WtvEgJp?=
 =?us-ascii?Q?4MZJrd+jDYbhNZjWsa0trJsFD3SwHWmwPIV8/qWpxXv8sy6kWxuEXzH01QUh?=
 =?us-ascii?Q?K3l4ZmIIC/iCihl6omI/7nwcgMuDH2HnkTyirN8jJ6VuwnaqPv/HpA36Lllz?=
 =?us-ascii?Q?WhY2OD/tV8V0UNNNR73g1KKra4WXZ7Ogx7aKZqeZX/q0u6C3xyA6W0oqiaU4?=
 =?us-ascii?Q?JWM7RNJDE7SgtqrgWEplhDtIAHFQVq+NK2k4iH5xsCgv6WEwBs6b/GoUK9h+?=
 =?us-ascii?Q?dF1w3ri1ZZq7nvEtsdFA5wy0Dd2sE7tA5hngrGOzyDb90ckINL9tdiCf5uZJ?=
 =?us-ascii?Q?puVaZVdxwrf4kExxa9OGiYnsiXPwiTg=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8d5ea2-ab71-456c-1a50-08df28f8b9b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6581.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 07:08:04.3767
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNzY/NcMNVKCWYb0sBRft4e30rwGJx7ZDhW6G5sRWFXcbCcUPwgmSD5fevgA+L0xRd0pINOAyOZtD/ramXDTE8p7O9jDwh1a/cI2M7AHXAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7947

The DW APB timers on Stratix10, Agilex (including eASIC N5X) and Agilex5
are probed through TIMER_OF_DECLARE() from time_init(), but their clock,
l4_sp_clk, comes from a clock manager that is a platform driver
registered at core_initcall(). The timer's clk_get() returns
-EPROBE_DEFER, which timer_probe() does not report, and the timer is
never registered because TIMER_OF_DECLARE() callbacks are not retried.

Rather than moving the whole clock manager to CLK_OF_DECLARE() as v1 did,
this version keeps the platform driver and, following
clk-mt8173-infracfg.c, uses CLK_OF_DECLARE_DRIVER() to register only
l4_sp_clk and the clocks its rate depends on from of_clk_init():

  Agilex/N5X: boot_clk, main_pll, periph_pll, main_pll_c1, peri_pll_c1,
              noc_free_clk, l4_sp_clk
  Agilex5:    boot_clk, main_pll, periph_pll, main_pll_c3, peri_pll_c1,
              noc_free_clk, l4_sp_clk
  Stratix10:  boot_clk, main_pll, periph_pll, main_noc_base_clk,
              peri_noc_base_clk, noc_free_clk, l4_sp_clk

All other clock IDs return -EPROBE_DEFER until the platform driver probes,
registers the remaining clocks into the same provider and turns any
unused IDs into -ENOENT. If the early registration fails, probe falls
back to registering everything as before.

Boot-tested on Agilex7 (FM61), Stratix10 L-tile and Agilex5 (065B Premium
devkit), comparing each board with and without this series:

  - with the series, timer1 is registered as a clocksource within 0.5 ms
    of boot and timer0 as the broadcast clockevent device; without it,
    neither is registered and bc_hrtimer is used for broadcast instead
  - the clock manager still binds as a platform device, no devices are
    left deferred, and clocks registered at probe (EMAC, SD/MMC, USB,
    DMA, watchdog) have their expected rates and consumers

eASIC N5X is compile-tested only.

Changes in v3:
- Drop redundant #include <linux/io.h>; of_address.h already provides
  iounmap() (Dinh)
- Always publish clk_data before adding the provider; use of_iomap() for
  both early and probe-fallback setup so a failed provider add cannot
  double-register early clocks or leave clocks pointing at a
  devm-unmapped base

Changes in v2:
- Keep the clock managers as platform drivers instead of converting
  them to CLK_OF_DECLARE() (Brian)
- Register only l4_sp_clk and its parents early, using
  CLK_OF_DECLARE_DRIVER() as in clk-mt8173-infracfg.c, instead of the
  whole controller (Jerome)
- Return the result of of_clk_add_hw_provider() from probe
- Update subjects and commit messages to match the new approach

v2: https://lore.kernel.org/all/cover.1790935401.git.adrian.ho.yin.ng@altera.com/
v1: https://lore.kernel.org/all/cover.1789096458.git.adrian.ho.yin.ng@altera.com/

Adrian Ng Ho Yin (3):
  clk: socfpga: agilex: register the SP timer clocks early
  clk: socfpga: agilex5: register the SP timer clocks early
  clk: socfpga: stratix10: register the SP timer clocks early

 drivers/clk/socfpga/clk-agilex.c  | 242 +++++++++++++++++++++++-------
 drivers/clk/socfpga/clk-agilex5.c | 155 +++++++++++++++----
 drivers/clk/socfpga/clk-s10.c     | 146 +++++++++++++++---
 3 files changed, 434 insertions(+), 109 deletions(-)


base-commit: 1e7f56205813a2c48cdb3e9a4b0a24f49fd9a548
-- 
2.49.GIT
