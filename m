Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D4B1AAA1C;
	Thu,  2 Jan 2025 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835872; cv=fail; b=G3sk00VeXLZnrJuv7U6xNLiKBrb2CZN50C5fBT6ad+0ppuZOkqV9Bf8nJrDX4x24EKqfRV7YK3DxiEHQIjDYj6PzNtO3RRY898273NkKNhyZcNerdK7ZEloKwMiTxo8WlmHFxYBzKP2/sGuCkzE2eteKtJPN77QuN67OX1yR3Ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835872; c=relaxed/simple;
	bh=8FKKfjAITHwKa6D0nx2hD9kOrXVTnz3W4nKYPFekLCY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVETqhMC8khG86uPc0TwPeFTXQmLOruIYMg0SZ7efypPulHvOr8LQgRZR0nBKTqBXb9/g0+W0nuXcKgNOo2TjHSuX/+m4xW5lmaLOEQKl/BVixDU5lqh9lmJxFJjnMqiD8Y0CX0w1yoM3iSJlco9TkETx6kzkrzErZTVdUT5uJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iGg3jS46; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iGg3jS46"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z43i08kgSmjtu7a/30Vkm78rz+jVH+MD8Tzpp0OuJi46FMP44nNZs6V8hfRoYl+kOoJE0nHR+s4qfnXPCB77YOth4bZ1Sh811nwaZqOw7RzSY2CiMTxBuU+SNExVJ5kp0A2TQRPbGBvDa9wNUZBuewGScesBreQKKF5aE+NoT8N0zwUBxrbU3WwYkG02IIL9zJ7GtCiS00zVhUHA3bXrZ6qB7glFsmXfMtZV0ww31qOXKj3weTVsep6pQ44+nQiAL7PPYtBdhEfXnl1LSsAw3UeCer7pRujGA3PVYH3Z+s8jBaQkgYP13jjZur8syGEgElBVVtVtyac8MGder7YPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ku7Qx/eJlYg/QIedIhVmn9LEWE+5Ah/kiDibcPsFn1s=;
 b=Jz/8axMQFfplPvg0YhBgw9ZxBexqtEwZxvjaJnXKuM2Pni8tx9pylBHCAn7Dheg6yrnT1Gl+0L1m3klRXlFB1+HFDk+x1EQ0hFgQEtgJFtr4+4PlnA5akCi0LUG0NE60WfQiDvOMcqb9YV13DejLu0MDnCLm8EW1h7l4vPBvps4f6vpWazmvNDiazZBxrSrbQAQ5JiYbwYGPgiOBlONmICiAOwsr/1UOdXLnuDfJ2TQkAjcqNAbsgHXiEHs++UaJySXPApWBPodScXDycB81WV5fWwoTSF5ZPFI9aEp4t91gHVdq8EqkLFglP55jNkd0otO6fwJ9MvUocb8ImBVpzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ku7Qx/eJlYg/QIedIhVmn9LEWE+5Ah/kiDibcPsFn1s=;
 b=iGg3jS46r1Xd3MrO98+/+ZJOB8WSmEpZwgVO5zV2ZT9FqTS+n3AuHs3inwMKu29ZbFElNTVLcxPydirBPuVHoq7q/QbtBP/q0DvZjmdN2YW2Kdiyir2XwS9gC5fqKQeCy04c537LdRSKmYwnmuV/nXFeelFGodGjxVGhXqytOvM=
Received: from SJ0PR05CA0133.namprd05.prod.outlook.com (2603:10b6:a03:33d::18)
 by DS0PR12MB7607.namprd12.prod.outlook.com (2603:10b6:8:13f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 16:37:07 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::a9) by SJ0PR05CA0133.outlook.office365.com
 (2603:10b6:a03:33d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.5 via Frontend Transport; Thu, 2
 Jan 2025 16:37:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 16:37:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:37:07 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 10:37:06 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rohit Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH 3/3] dt-bindings: clock: xilinx: Update VCU bindings for reset GPIO
Date: Thu, 2 Jan 2025 08:37:00 -0800
Message-ID: <20250102163700.759712-4-rohit.visavalia@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|DS0PR12MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: af6bc3fc-3be1-4482-b686-08dd2b4bb2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DHtk0DfXIdQFp1g1aCYPG6SXuYvx2gbH17EDy8ZnYjix2xqu6JFbNeVbbLnR?=
 =?us-ascii?Q?KNlYbKAM7HANHkGLJgUe+2J44zUwIcZRuZakaLUkvxRmgRm7eITDeIBXs0x5?=
 =?us-ascii?Q?DfIId/P8q1tuFRcuwJKcKy0/5jtHu0wvELS86bxttA2gG6hdZG34Qu7fDEHk?=
 =?us-ascii?Q?9y743WVhg3X0q7p6qg8iQB9S+vsvlW+oR3niLSn7+MRsfsYsS+8kG2M3UyEo?=
 =?us-ascii?Q?0l/0hwAOWmyLijYrhLIs22/KtZm+5BPjLTzJKAtX8BLvh8wzErycHYM4tVvi?=
 =?us-ascii?Q?Jsh4B+phLqQcTlcV87Pb3bi5qx2BUzLvbXAUv7gXMebcSEYoYXw7kKRfFgfG?=
 =?us-ascii?Q?ikN1WBsUMr/NXCyiYqqwPwL98ZuIAMvyhJ5jaONQbFBE+qC2io5Rzzvpc7m+?=
 =?us-ascii?Q?/zNAbTvAKJUqkcscJQskHO3RLZjaoC2eeEZwUCPdMY2XH8n+1MZVYFhGwhnt?=
 =?us-ascii?Q?D30qD4Ae4vJtv5h10JkdWlVyzZQC9HRTC/HtOfsKxWpgw12EuHPJtaD+2vrR?=
 =?us-ascii?Q?mtKMqsSwNW2y+/ZdRz2qWKWqfBKgNKGdpiR3FyUkIG6zwJng5t69slK8b2SJ?=
 =?us-ascii?Q?SBcwvqeqUNSQvRKklsiF0MGA22PKX7eytATg4W1LEW1C4B2S30ZT+Dno5Uyq?=
 =?us-ascii?Q?gooKEgOQ74av8sHukKy9Ds+3OLxNNk+Yo8mFA08xIuwNMEonVCQGcaKi9q6e?=
 =?us-ascii?Q?vRex8UvtkGDTz1fxdVeNMcwq4DO4kY+kJnM5al8AG7i62E1bp4BubCDEt3yr?=
 =?us-ascii?Q?tMUShcfBkfiLYB54/nHzFTyTBs5qc4zB1NngJMrKpG2pnHCeXHFoOLT3A8sB?=
 =?us-ascii?Q?ZKNutsieST/RiMrGzcTL8G0BdUWq3SPMukmTBKiedIYdZkT+dYUIcoT3gKDw?=
 =?us-ascii?Q?y2unkwFXbdUiZc2txj5JQa9IxyWI+f3Xv3SvAlIJsAOc+CY0D89aO5T9EpIO?=
 =?us-ascii?Q?rlvM8WRnynGttJjMK3DNYmYlW6EKN2qXBBt6JAUMTDSPjp+p/+2KENeyLMCn?=
 =?us-ascii?Q?h80fhd9kEFYPkvdbP6q7A9x573bcC/1sAOFf5eU/vIbmgrJJZHlY7mlzFdHl?=
 =?us-ascii?Q?Bp7bTrX25Vtut7FWNGi8OpQ09A01k2KB947pB6wuVnqIzeRQnzjFaOoW9Ynj?=
 =?us-ascii?Q?tcUX8AsvCSMxjxtr4HWHFKFffV9njK0uw1RyUntj9y39/gYNY8wliy+XgQu1?=
 =?us-ascii?Q?kTScVOUD0ckaNo7pFhBAVKQKMRcVigeSZWOAvEQco9p0Bva+rv8eLyoxiSXa?=
 =?us-ascii?Q?ApPFT/bvNwbsu/euh5mF3MpDHa2LZoSvVKXdRj1YjBKNGfMJmUFW777lp7xk?=
 =?us-ascii?Q?0MTDYt3VwFWjcas04WrNC92JJqsazJbInDeScDlxAL6snTx4Sx3wviuGcXBd?=
 =?us-ascii?Q?JKT9TgbcAOCiXsQ8L1ffy0HWfvM8bGWNQRQfpfyx3uoKGhbcObHLYa8oBgGe?=
 =?us-ascii?Q?Jh7KwfM1Ug7FlXbtNFT9mfSdiVQDsZF9+HkD8EYyoa6gXPi2Lx4Q3acdEPip?=
 =?us-ascii?Q?B7/jOvy9CaMdj4c=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 16:37:07.5488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af6bc3fc-3be1-4482-b686-08dd2b4bb2b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7607

Updated VCU binding for reset GPIO pin as optional property.
It is marked as optional as some of the ZynqMP designs are having vcu_reset
(reset pin of VCU IP) is driven by proc_sys_reset, proc_sys_reset is another
PL IP driven by the PS pl_reset. So, here the VCU reset is not driven by
axi_gpio or PS GPIO so there will be no GPIO entry.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
 Documentation/devicetree/bindings/clock/xlnx,vcu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
index bdb14594c40b..b3061309f8dd 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
@@ -36,6 +36,11 @@ properties:
       - const: pll_ref
       - const: aclk
 
+  reset-gpios:
+    description: Optional GPIO used to reset the VCU, if available. Need use this
+      reset gpio when in design 'vcu_resetn' is driven by gpio.
+    maxItems: 1
+
 required:
   - reg
   - clocks
@@ -52,6 +57,7 @@ examples:
         xlnx_vcu: vcu@a0040000 {
             compatible = "xlnx,vcu-logicoreip-1.0";
             reg = <0x0 0xa0040000 0x0 0x1000>;
+            reset-gpios = <&gpio 0x4e GPIO_ACTIVE_HIGH>;
             clocks = <&si570_1>, <&clkc 71>;
             clock-names = "pll_ref", "aclk";
         };
-- 
2.25.1

