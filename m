Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2081.outbound.protection.outlook.com [40.107.243.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB116F0E8;
	Thu,  2 Jan 2025 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735837458; cv=fail; b=KX/ZP28A20gv+5TBjPJq2UqS0mHRAmRMC2YfsklyenbVJSql37LR4FwAUtqxITXXD/5V45Usbqzf6hr8/mJ9OwdHiv0IH0+lnaksXCjDg+OrYPHD7u2JVwydF7NhLNoZgEGgzlLp9m+6gytFgvf2Bo7DNMD9UarMCj7437clPtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735837458; c=relaxed/simple;
	bh=TceFbpqyoE4ebOOBZ9Z66rA/OudUw8rEO4m7vmRA0+8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EzqsRNqdB4dC9gSzSct6XLnIrT6Q7qJrOxTbhBe1SccfQYaRy6+xn3gQ+YRzfAZNKHod0AAxU7hJi6akyAW8y143aGrubn3Fw9X/pE98oD8Evw8hTxZo/lrMQ+BeSujVTWN8P+sdVDYxDETV+k5o+Ri0Yqi2OSwWfketM8Cx7co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4oVxrmKT; arc=fail smtp.client-ip=40.107.243.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4oVxrmKT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2be2DgoS67ToVdtrZUkeypygiPa1hGEYArF5WwS4BV2NEPB3g4qwzDfffYuV8pU0hM25QKVh4yV6DZIGEbRO7u4HqQlzygUB1VAdA4l/VPQqVFzb3uk982I3LKrlSDdy5G1YbmZQhiNdpL8zHTyX96B07Koc87qiBP9YJktDFdyuKGEkhUr05wDx6lVC1xS6smpGTn9kOSDDPuuutG7U3dSm9mLKRLprpAO4f0NlwAmSrwBrTl/D+9q+5kxTc70d9FF14TaLE1Kw66gpyneifhCYPLg22A1oJsHcYUtvurgHcnOqGiLVZzzDl4Uyq6n8ye7ZZhEfS4rkPZXeXwBVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+z3ZqXTG6gutAZkM8V1b82qk6gPqLx4pgCJHY/2hvN0=;
 b=Ka+Xqa+PK0u8wt5cWnRtjHmyAQe+WYd5PY1rxkouRiMajoYRObtjMXo24dLQBvpZ7UPAF4EWBUjdEIf4AocJ2w4IOTwJJj4xmK+cIIBQMjUJlIKZlDyRo5/3UqKBepSIxpZS1N1Fsm9qKwpAOHEt7PqTi1CgregkfKOIVAsJZPrWhIRbuynhA6fLehLNUEgsWQFQD/+OYGZDLvbPabY9vCglzqG85urXigkiPkoUlJEssTJh065r3Ae2Q5OIJxOUFdE8a1lqDFDUKUnrq1QFPge9qxSkMgqRGjNoRFfnJh6EIHAkY/0q+Lg6ZDDJm3BZISvnGEfp9G97Z5j5i2kxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+z3ZqXTG6gutAZkM8V1b82qk6gPqLx4pgCJHY/2hvN0=;
 b=4oVxrmKTlC8jsRX2fAPLYzO/c9gQtEfZcAYwVS1cXRj/7QvR0iTh2B/FsnYwhiQvqIvkIWaKwrsOMNLwqkcFeddppkn5iRSvobMuUe60e0pzaduw19Cw9/3nJDtYkCzZuvAx5k7J30DZx9UhKNLmCRF9TUxkQciYzdHr+zENt/s=
Received: from BYAPR06CA0070.namprd06.prod.outlook.com (2603:10b6:a03:14b::47)
 by DM4PR12MB6255.namprd12.prod.outlook.com (2603:10b6:8:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Thu, 2 Jan
 2025 17:04:09 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:a03:14b:cafe::e4) by BYAPR06CA0070.outlook.office365.com
 (2603:10b6:a03:14b::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Thu,
 2 Jan 2025 17:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 17:04:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 11:04:08 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 11:04:07 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH v2 0/3] clk: xilinx: vcu: Sequence update and couple of fixes
Date: Thu, 2 Jan 2025 09:03:56 -0800
Message-ID: <20250102170359.761670-1-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|DM4PR12MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 370084d1-a3b5-4123-80af-08dd2b4f792b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wj0NboPhmRc9HEBlXw4rJgf2LgU7GFe50A54rtMxDyV8Brqhb9Eo4Su0wv7b?=
 =?us-ascii?Q?9NJoyR58BTey6nRAP0cQrz12QHTBK4phnLJNHgYsqScuM4Misg9Py5L9Hea3?=
 =?us-ascii?Q?P8yc14gQxMxLeddkOGpngjo/AB769P2o4NJgTzze7CxHdkxi6eRir31HXydu?=
 =?us-ascii?Q?5bnYfMRBiUJxuhmzabmSvlBxXbTCCcOZbz7NHXxcKBT3hOJiFIpHxCDHRNI2?=
 =?us-ascii?Q?RRgNhAkQDZuwRdGEf1ZWd1MeR95udGZcc3a8BRQ+U0Dr95dquvmCEjVi6DVU?=
 =?us-ascii?Q?yKv1Ja+p1DVPdM4MVyp/DUSvXwhH6HSdXIhbRMxzwCiRwfIFW+zN5nWujqWV?=
 =?us-ascii?Q?DdjnzBZGl8wpLlZFDuz089U8wcFsGa7GzqSzrfgBr/2FmbdvXKUos5CN/eBr?=
 =?us-ascii?Q?1vKwUQ2RbkFUvxNIAoEADwt0er6xJPe2CeafFbaIjb9ekuDs272cdPhmAh5y?=
 =?us-ascii?Q?tKqJAUAWJd54IE+8Q00j4K9H4c5wZ967e5qbmuu/Mubx7OnabLVbzQhxYh1J?=
 =?us-ascii?Q?/j/S3XNUo2qO75okTWM3rED1Sbv+B9qaXsDCF4kK08h5Wq/neVPrylWHaMaY?=
 =?us-ascii?Q?QHl6QMiW2ysffuutP8NJZftrRV0jtpSEVvYvA36O63SYp9BS1iiUXZ3f4yxl?=
 =?us-ascii?Q?/M/04p5sPX1lSsHipsS+H2Sh/yFnwFdzBbpn0ht2SX7VWsvBeAVXrioMI3IX?=
 =?us-ascii?Q?A/mfUCGqAtqNTaCfsBZ4Dr03F971sHYVHOuSMZ1DoJjONsJJZMRRiVTp7HAW?=
 =?us-ascii?Q?rznKVMUCZMsi9IoamYJvZ1FqlNow/ELU0fa6hu/CKzkM0/56gthaRNyTegt4?=
 =?us-ascii?Q?4D9kTPkSEjvddTMjG3VBKOptEh39RLpDDTrgCBT4RR8z5+mu4OVgFSBqwu6R?=
 =?us-ascii?Q?KUtjwIZd/qscMRvqS2E7NBe+QQUeiY7eAe5DEHnxMoMbLsDiq4vSGf2B8CH0?=
 =?us-ascii?Q?GbYueQzIJY/zrA6fIxSE5UjMGsTNRJs1suun9fg42Jfm9AtVP1Dzl/MJLHzU?=
 =?us-ascii?Q?1bFo5lPFIo6CXeTUuP6u7p+GzkiD7Vl3e/nOXJHW0lYwVILynZGQykppZOWv?=
 =?us-ascii?Q?+eNNZ9aPFcZOzsT/tLCwfVB6BnXTEs2G/ln3pBtaGjUnvn+TIbumpttDkAKS?=
 =?us-ascii?Q?zmk1Otk1oxbWhPf6kv8mrnHwH2kKZtAQSheYjXoXGsiJRovJvbOpkYARankQ?=
 =?us-ascii?Q?n+3t2ph7O08hJ7pwZSMNZA0v25W7OhyKkB4bCQb7AdocvsRMyvNHwMnbljqb?=
 =?us-ascii?Q?ETdHXniZrjn0iaYMYN4HYQ143SLiHfQVKpWL78clJRImIP5EZeJHE+9Qap++?=
 =?us-ascii?Q?ubBY1eI5MJDttlwsk9QN7CT7u/4v0GUSJFjxnZ3y1MZuglOMq6BETz04C5tD?=
 =?us-ascii?Q?/exMXZrZqu3zCG/9lnkuN9FdxyrPFJYmk//hdq2mhYVum5q0kFPYhLvVtwfy?=
 =?us-ascii?Q?hpCvBGky1wlyY5upD4vnsJ/pJc+HNmprqF/NHi1j0L9YCwVkEsAelORqbxuG?=
 =?us-ascii?Q?nvtSRoTjc1kvguU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 17:04:09.0220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 370084d1-a3b5-4123-80af-08dd2b4f792b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6255

This patch series updates VCU init/reset sequence and does 2 driver fixes.
patch1 fixes call trace related to pll_post clk.
Patch2 fixes VCU parent clock issue by preventing pll_ref to be changed.
Patch3 adds optional reset-gpio support.

---
Changes in v2:
  - Changed patches sequence to have patches with "Fixes" as preceding in order
  - Used dev_err_probe()
  - Moved warning to dev_dbg() and updated print with more detail
  - Link to v1: https://lore.kernel.org/linux-clk/20241226122023.3439559-1-rohit.visavalia@amd.com

Rohit Visavalia (3):
  clk: xilinx: vcu: unregister pll_post only if registered correctly
  clk: xilinx: vcu: don't set pll_ref as parent of VCU(enc/dec) clocks
  clk: xilinx: vcu: Update vcu init/reset sequence

 drivers/clk/xilinx/xlnx_vcu.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

-- 
2.25.1

