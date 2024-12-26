Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910E01D5146;
	Thu, 26 Dec 2024 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735215640; cv=fail; b=f0lTEp77G9qzI2G3xeYC+oiKE0pCn172bT5boH7CLG/1O87WlGCuBGuXoIJ4U6MpGU3V6eU3tiAVadtMbF4cBnQ20TQSVNp0j2H8HOwWPRIO71gDQEk2Vx04vt1aDJf++HWXCxMwngPCE7NN/P2XawOJr7y3lBJAKzkipiC97nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735215640; c=relaxed/simple;
	bh=MY5RODbprPcJZ7riTWfPVBZ+B912sxrw2r0SiKQXYAU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lUihg4SMZihRac7JXlmyQEVn/JlgCVK1Iql5yOIs1WtA7nBZIezijf2XXMiGPWO273/ufsKz6N+ti/BCG827UjomwimMLfRNyUKDDNXskIMy5MZVaPHho0YwD7ykPP7vXwDyDaNlilrrAqZ1kO5PDTfUZ92oupZMK+dpW4VdQ2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WJZ6b3dx; arc=fail smtp.client-ip=40.107.95.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WJZ6b3dx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwRTlrSsCIdBQDM/qPkFlN0JQpBU9pOkCpB2v9713wvAKYaRcSG8RhEESI8FJXGfJuiOzjCV+dnVn7DHBb1CK8som3waPz1QuEmz29zzaDDdo7fkl/mWhz5NeYSgXToRNJxEJw5NWsgsnDMt6FvFcZS7Oj2TdPwOIKqHqFMldhnNG7OI+GpnYKe4BwqJ8VKutZz8E9puVLQFHc9+DGE5Li8FymleQXOQnqcM1TNaqH4uo3j81H0F/j1kycG0MBqk+x7EDvNYgD/OC1WjFAgOklXM/srdw4NQBei6gG+6KL/D5zH/oy4O696foVggFknW0hXDkRKfIvy504bpbmDLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSLEd1amywedVVw1F+Hwve/g5m/GjYaGpQXr/MuFVRM=;
 b=ZhFv/y5rwrldFUFlUSAtc+wDMZG5/Lx/HxJ8PtRlN6iwqUDfFyIxO7qIg2L3yZOIbyU1U6NB3nDFR9RDXYC+5FOzn9et/y5teUTJ4iYhuhc3whSAVJIboCc0HQBoJCWR8NkQWikTmi6aA/4t6NsDI8YdRLdkduj2iltf1fZsQNVPh2ye5776Vwo5cDfDbJVDqHfImMFis4srztuyXfwDAjSUfRM44ifWnJuq4s0VxUZjB75ZbDrmfzcsNwRlV/tBMQChqmmKN/CRTV3EtXi+DtHclDyWNkNccyy0e01v5BDgjpFH97IOQEwQipAZ00bohlYBWjZr2VhRJzZx3aYuGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSLEd1amywedVVw1F+Hwve/g5m/GjYaGpQXr/MuFVRM=;
 b=WJZ6b3dxYYpJQThvrnz7mNWLbG7ztzbSdlFDvrwgMIKF6w9oXsq1HYbsFDBNyMwAov32u4MdOxiGRZUHcxN21c/4+RmEkI3u/+KDIVKMMHIplxk7kESz13OIIbWYWUpOMqYyCKnOjX3tr8jQ4jCjg+6flfWG8Jd2Dc1EYw3A3Ro=
Received: from SJ0PR05CA0180.namprd05.prod.outlook.com (2603:10b6:a03:339::35)
 by SJ0PR12MB6854.namprd12.prod.outlook.com (2603:10b6:a03:47c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Thu, 26 Dec
 2024 12:20:30 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::b1) by SJ0PR05CA0180.outlook.office365.com
 (2603:10b6:a03:339::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.15 via Frontend Transport; Thu,
 26 Dec 2024 12:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8293.12 via Frontend Transport; Thu, 26 Dec 2024 12:20:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:29 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Dec
 2024 06:20:28 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Dec 2024 06:20:28 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <michal.simek@amd.com>,
	<vishal.sagar@amd.com>
CC: <javier.carrasco.cruz@gmail.com>, <geert+renesas@glider.be>,
	<u.kleine-koenig@baylibre.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH 2/3] clk: xilinx: vcu: don't set pll_ref as parent of VCU(enc/dec) clocks
Date: Thu, 26 Dec 2024 04:20:22 -0800
Message-ID: <20241226122023.3439559-3-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241226122023.3439559-1-rohit.visavalia@amd.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|SJ0PR12MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f510e5-ac90-4da1-1ab0-08dd25a7aff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y1a7F9nnCFt50MNFPnNctHdqGP/GhsMr9BchgimrB4oo4yN3dm3s/cHVfxnm?=
 =?us-ascii?Q?2uLC9kX0jBHXrY9yLccd47lp/lNVFbFjJV9Wa4QjKSGS1qLV6WxU4MJtxAIr?=
 =?us-ascii?Q?pl048UOVl1EFK+hFLGAIFHWXpwhl7PBmCYurppXAg/QKoD/hkwv7cM8lFjuJ?=
 =?us-ascii?Q?JQPiQlFSQBNQ5rpCGP+8ywqBJhysErQKyEXtBPnK34yNV5oOJdhn494ZZcHJ?=
 =?us-ascii?Q?JUYxBhboHJT0tygwrKXelwgBGlQe4aExsuNqNRXFLeGWTtaiM12OaJiZzZ0A?=
 =?us-ascii?Q?l+tFo4ljVvlRR4PWOFaiJuZvQnLClJCcPpgVsKkKYoL2T4yehqH9pfCCBqad?=
 =?us-ascii?Q?TbJ9lIFGq4PP5ybEHaVdQ5Y51LAjNVHwkyBTbw7UBJ2zQJXt7WZLkZnmgfXb?=
 =?us-ascii?Q?2kg3j8mNbJAyc297WKhD9xnjrja8hJ6qpH73Qw7vsIFBOwTryI1IwAFmOqPM?=
 =?us-ascii?Q?jN4F4Eg+QqsF0P9/zH2qUir3jJ30UewKfxmNKDhCd+L6UgL7EghEL6Kz3gwD?=
 =?us-ascii?Q?+hQqNpq178ZSHlPD0rpFKT/4BNT1R6My+e3f+77jGDdT+ck9de1j/V+0kLcp?=
 =?us-ascii?Q?2YRaJsJ1Tpt28lUqxY95m0HCYI/e7l/KbJw6UNyJwEnAy9LZsm/BgiMZdb4W?=
 =?us-ascii?Q?qveubuwG1ZR42kBb01zxNpC8JZKCNovUUgjMXf4wndlRc5R+cSd9Ca5+4Mil?=
 =?us-ascii?Q?3WcqSRDUS2VRLRZk1Gd7kBghuTBPeSt6YWo0z56nRXWdnNJnyOByQD5aSX8F?=
 =?us-ascii?Q?JLpZbvwMMMifM/hXh9lWwEiBQfOcVZL6MJqTQ2mYBNIWwzDKULOG+awQAjLQ?=
 =?us-ascii?Q?eI72KhRSwGOO65jC8ZxsWoblnFTFaT3pbIRRx2i3m47Og6zDXrLI8LVDHbyf?=
 =?us-ascii?Q?xWlLtrGUqNXW7DUEWVsQEqJXteNN6otKGav76mYzEFMeeJ6bHm5Q+6ajpsdF?=
 =?us-ascii?Q?RaKsa0Bb9wI+5DB7HNA3IKpXtMkV3qLdUU0OcwfcanIK4+bW1WM5anrdyi7n?=
 =?us-ascii?Q?cFwEHn4xGw76++rcXjJboGMmkvNgb4KOZwRA5V7N1V8SQtnXrRV+HqOe1cpf?=
 =?us-ascii?Q?RR/TYYfz9s3BK3N8H5WsjJuvbx59RT00reqO3ghYxx2c4nBpYGaB53OMG7Eb?=
 =?us-ascii?Q?DNCbT1Extbfw59yCeiNq9aNBoeXDLUGcXbuBT3cFBF/NoE8nlLh0kgETsnrN?=
 =?us-ascii?Q?ozLrqyJr236nw2kbTUbBfBxm+rk9qPzDvn/6CNohHnGyRP2hm0DGgH6P79VC?=
 =?us-ascii?Q?xZjCiAXOWfqn5ud8djdyJei/Rig19lXOQ8C0xNqSi3wLfelqPVev4uIyEiKD?=
 =?us-ascii?Q?d6t6dpIinScO6PSze3CxdVott/7KKpjv2OHhnsmvQlUO7yjEmJcWdYLOWoV0?=
 =?us-ascii?Q?q/TPwlLgrtN30S65n496gxTbrP2y2TyucxT1zTM9livkkotybpQRtXiD4q8L?=
 =?us-ascii?Q?n5gxvqBZgk4SvvUYJq8kM0fVLfWqeW+HNEZENpgHaqDj0EorGCF+PRYJfQAI?=
 =?us-ascii?Q?xWr2fAvGxWP2s1M=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 12:20:29.6889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f510e5-ac90-4da1-1ab0-08dd25a7aff7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6854

CCF will try to adjust parent clock to set desire clock frequency of
child clock. So if pll_ref is not a fixed-clock then while setting rate
of enc/dec clocks pll_ref may get change, which may make VCU malfunction.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index f294a2398cb4..c3a4df7e325a 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -550,7 +550,7 @@ static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
 		return PTR_ERR(hw);
 	xvcu->pll_post = hw;
 
-	parent_data[0].fw_name = "pll_ref";
+	parent_data[0].fw_name = "dummy_name";
 	parent_data[1].hw = xvcu->pll_post;
 
 	hws[CLK_XVCU_ENC_CORE] =
-- 
2.25.1

