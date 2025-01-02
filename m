Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A491D1862BB;
	Thu,  2 Jan 2025 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835852; cv=fail; b=fNJy9jcSpfVw9vXUHs5R/jIqY04NH5cIKjUAGbKKC55wnAnVy6EgZoCEq3xgemrwW37RLPDPgvsyUkxbL4hBaxQo+V/PlAlVicH9A7ydNiCRp+c+/+XNKr5LnqcZEhLfVPqoB8LeXFhw3dWq0LiqqUcZWWFFRW506vgyJjdvBsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835852; c=relaxed/simple;
	bh=4vBTCUB8JRxyn6VU9n5+W5SoGd0tV1nEI6KgOuPrPjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fJ/dYi1aNLhlwnVeiHGb2CFfVlJ2e/g/a4iUpWOkYflp5GIpGca6JopzHbvTH392qqFYxTmGBoiu7LOKVTWWjdebr1WGkOdzmt9mrkYZyrHYPTGJvtwF993kg8rFuBSmOOmC97OJqvKYoCZYZHxuzLynrMs2egPE0ybKL8qQvUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BrtSxyXI; arc=fail smtp.client-ip=40.107.92.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BrtSxyXI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytpxL1J7V2gXteTA+axlS9jjoy29iYgywm/X1fmhvF7e+NwJNNuci4KOoI6xGET0J5JzSNELgqCwRY3m70MIuoZatlhKbxSRdJTPiOkriZPkzluJr0spQVTUGlHSEF/ggqJX7KF7NwPM0tXLILAU9S8CqMdx3IJpJyN7wGzK2YG1wjMH1V+rYgpk4Sr4/alUsB0dy17M0PT/dxz25YOqWREBns3nD4GlkvU4IZTVYQu3lQi3d+rP1PkrdcxLlCg4zVgSZ/VM7CigIQr03jY3OJitK3kjiea+q3nZenXKZy5Pnt92X+n4dh6KLBXFBvJlyy6HauPvUdPojcDHz+hZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zq3UhXZs1cwSfjGxS6GpgbgdIO4PYE1RlKAvyGxzu9Y=;
 b=j9/pEfCemAQ7U+PkFKKF3o6Dq68v/4ZcahJ66LYHjE057Sgr+CqWORsr8Rhb/HQ3Rpd4L/cJjQaguX09Xm0b1Oe7ZzQiwpGe2nsbTOA3O9mYNXtGy1CXPtu5HHnxURaYtW9tLRTMREJ2MmTO9W/AZ/dXF1om5ozl63erfE4zB3tAIWC2KWxVZV3bR/9/hH8MndT1/uqRFNqhn9+/ZBFRFMkjT+I2xTFMvEDeuGwL4QyWyFe+15ynPYEUbJpbV9SS6aXZW6sFalS2sPI8PgeAAugIrMYHkdJS7ieshgVHXTrezjiYEKVxPcMrg6e3Rw47ub2JMztudZyxy5pcyirSpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zq3UhXZs1cwSfjGxS6GpgbgdIO4PYE1RlKAvyGxzu9Y=;
 b=BrtSxyXIzdqUJZ6Bbu9XUSheU6K7py5tmbW+WjIe7OLGQJsrdaQMPZajuGVr4LlusLZSE4yoE+5/xEp8zF4pY5jbxM46ng/jwcB+jjbBrDsyflmIWVSYsPUQltNZXnXTH0/E2x6+H2pujdxSMrWjzwtZDB2tzIyfgOQf4uf++F0=
Received: from SJ0PR05CA0146.namprd05.prod.outlook.com (2603:10b6:a03:33d::31)
 by CH0PR12MB8549.namprd12.prod.outlook.com (2603:10b6:610:182::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Thu, 2 Jan
 2025 16:37:06 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::b3) by SJ0PR05CA0146.outlook.office365.com
 (2603:10b6:a03:33d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.5 via Frontend Transport; Thu, 2
 Jan 2025 16:37:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 16:37:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:37:05 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 10:37:04 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rohit Visavalia <rohit.visavalia@xilinx.com>
Subject: [PATCH 1/3] dt-bindings: clock: xilinx: move xlnx_vcu dt-binding to clock from soc
Date: Thu, 2 Jan 2025 08:36:58 -0800
Message-ID: <20250102163700.759712-2-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250102163700.759712-1-rohit.visavalia@amd.com>
References: <20250102163700.759712-1-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|CH0PR12MB8549:EE_
X-MS-Office365-Filtering-Correlation-Id: 774c3abc-88f8-4ec6-35e5-08dd2b4bb1f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?coIogwVjWmKdq48yAtmN7E2OwD1GjV751az7o/eFG4ae2+R3n/rRBp6Zm6qW?=
 =?us-ascii?Q?NbDCHzs9nTsD1PEEpG7H1TV3H3G0raGcKb5tZge+4zYPtHUGw7l/57R7riVA?=
 =?us-ascii?Q?0xNu0Ds5nzaANOHNSufzEpGqn40rCnQzBq/wYkFCfaUKXvYR86MJRKoKuiqt?=
 =?us-ascii?Q?tmqWdJBbK8IXu2Jcd1z/9/cMooocpZE3XjPAWJRg9kuO9FJoNpwXtZD0tBIC?=
 =?us-ascii?Q?EEpnsO8Ufzy8oDCny7h5aDxfU4szWm6gYt7h7NmI+J0uzpehKC/4yfzW8yum?=
 =?us-ascii?Q?lDtp0eit8otWoyvKgYeFXoSIVj7RCjiITK4WlWUtnAzgqQ1MIlvCDg9xSv0h?=
 =?us-ascii?Q?s2OfGg0BitZAM8S5FVieMWZEPwqAr4cNJo+f+LC+mQQrczhsF+BLzd6Lsfib?=
 =?us-ascii?Q?1tWecqkK6wUhNmAyo+CZUswtK7hbreI/a3nsvLkv7rOHfWSe5c4HfGKO3ctU?=
 =?us-ascii?Q?ES0678ZKQibFJ0JCQzZrZl2TlDDHdbBKulJcjCLYGGVUOK4qD9vzPp04SVHB?=
 =?us-ascii?Q?xaWK+xXUu8BNnGjqx1mM9wDflV39rEykLALWMRrkeWdMldeSBgzn5PMfmF4X?=
 =?us-ascii?Q?M70GqXtskrKPuQnbaJIAAvdOe20fzMSnJLD4NGp12qPKcQLnyqfM6Kp030dk?=
 =?us-ascii?Q?XyuhfnO5siMr5yqv3vRKq73Uy1dv8U0VHBXneirMMgol1yoPeJQwcpgZiJbV?=
 =?us-ascii?Q?MIMvx/YQr7u2Xt8VVPSyKnxsKDrm2kZwOuMS1nSe8NgXiEwPDpnSjHc3sG/5?=
 =?us-ascii?Q?pgCGOt7lyE/iFoG3eiTkM8Hq3LCVXL8w0gj1XeB9ANWu5GNWEx/5v311cfoO?=
 =?us-ascii?Q?w3K0bYsJTrJJu/GIqkpA4fL6jJmZV9NWnnVazAiVpDALJ2LP0fhO0FtTQtYG?=
 =?us-ascii?Q?C2jiob2MGnr8CSXSSyE6M8dU/BuXPZfrI5mZ6TqQuxiPHC1ICvpQCC7Wy48A?=
 =?us-ascii?Q?6qYtfQIrE3fW0EHmNkZ8JAeZiNBKJccUHfyg1N5LVOYbCDAmmubh4dgCUtCK?=
 =?us-ascii?Q?bpIgxcqnhAmSPqT8suQb2me7oydu8NeSQPNbqkfJ0RTSwnAtbqDM3vZUoAfd?=
 =?us-ascii?Q?vxCXfWB3SNQ1/y1hzNhDtE0ERfeuctoz1sOdpFIOyUv4hUkR936E7qP6lmjm?=
 =?us-ascii?Q?57k2Itcdk22DykqQH6vvtGjIobFZGHAa93CcyVOOEEjhzF0aw94Jm5EeTAky?=
 =?us-ascii?Q?6d3K6vfBu/B7wWSeHevX+KVk04KKBD07WRM0GIOWNuLltZ6gTDzp7GxStzZF?=
 =?us-ascii?Q?J/2rUNlMAWoUIDCTxMbRT0YZLmg6znVMD9JXRNvfNfjNUqKJdYnHAUbuQ/Bv?=
 =?us-ascii?Q?y3UcgzQ/y7xn1fsCsnnIc+JIzO7y0gPLGhqOv8GjWu6pF/m0eQivK+McvYCR?=
 =?us-ascii?Q?CCabYyVlsp2+VbVx3wR3FjjBjJkDf6ScpYlkPF/zhhN98djYSHOW8QOOQ9Ka?=
 =?us-ascii?Q?0jhCdobHTcB6705t9APxDF4PLsUBxalw3lzBZV4Uonf2Nnm9TwswCIZK2HVW?=
 =?us-ascii?Q?qrG/n6EdIDCV7Wc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 16:37:06.2832
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774c3abc-88f8-4ec6-35e5-08dd2b4bb1f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8549

From: Rohit Visavalia <rohit.visavalia@xilinx.com>

As per commit a2fe7baa27a4 ("clk: xilinx: move xlnx_vcu clock
driver from soc"), xlnx_vcu driver code is moved to clock from soc,
so moving the dt-binding.

Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
---
 .../devicetree/bindings/{soc/xilinx => clock}/xlnx,vcu.txt        | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{soc/xilinx => clock}/xlnx,vcu.txt (100%)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt b/Documentation/devicetree/bindings/clock/xlnx,vcu.txt
similarity index 100%
rename from Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt
rename to Documentation/devicetree/bindings/clock/xlnx,vcu.txt
-- 
2.25.1

