Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53FB1D95A3;
	Tue,  7 Jan 2025 04:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736224863; cv=fail; b=dLtA4QAK8vq2l7ccixOGO2Q1dIu9/8HIUsw9Wslt/9cSrvdKq9Q6fbBeQaSWNiM+Y5c42521QvxI21qSQpyiFjeldRjc8zcejGFf3+CXPyjb2bwVDU/dQ+lUmgkXtywaQgnyNxbcQdbZqEidODjvGva76X9PV5uAOrIZQRmCz/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736224863; c=relaxed/simple;
	bh=35/06i2OJBNJ8CzrE5/JyBabxdKagxfE5Y/oejv9V8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aKuFDnaPu+mO3/HW8BNHvGEnSX2yGck7FWbqly3MCMrgGatAX9OwpMMktX3npjKHmxH4hAde2TqDTegLHskdiAOyKj3k97XUfhDn+DYvU8xxllN9A45ZBonmkDOPDu9ewRPw7Y68lBXtDPXF4VaPfnVuFt8K+FqGUEUgQ8pSZIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AS74y9qY; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AS74y9qY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMs+hY+IlMIBPyiv9H3oW6LIkIdZQZb8W5//l8W3GawfwHZytOjxPKP2DwVCk7zqS7+R3x0Mo1gt8vgcjjivFe8Gw82aRVXXa4UPwE/kBzNmcicPITz8JAl9HfshkYy5DU+6dn0UOPNC+eXaIV6kbY/Ivb28BUidhEXNd79RPyyxbsZq3Iu23hRUXN4Y+7ogZGovcC7Zf3DyFb5tanRi6c3tmZjLMzVXlz6dsN7Jp/6uytbnC6h1/A8UGHHxX85G8CvH4HtgJ2rYjfgSiWLGdZf6ektYBhJkbpponfmOCjtsdxPXHc+PMa9T0H81ZsbJf2hbsahi9jdAdy0F7jnZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAXNVXjCOkIy6BMZSN9T4HRgc7A/XStKTCNkkElS3pk=;
 b=IPP3l1uP6+a8U/XJFiEC3Ou871c50TBTjCyQkQtUHDqGk7oOtK8faKJGtT3jQhtS+WArZiaTgQ7g4ixvsng9wFkxKtSmTnxN2rySYJaGYxThx3xqhtV1hDRP1Yu/zq+8L6BJFw6gM0slBfJrZaXuV7vFh+4xMIoOqhba/lliC8jmmHFoR95NWjzHoNz+z8tI+UXOxazl6il5QBLbUxuWVBqfouzf0BlYL0N5nDbXsyIxqK+DKCo8lNUMTNpkvnVIvN61bBgtqzlf0QsRMxZhoNxUkPS5NVf5oKU9pUVae/r9k/hkAkfbhc1EmtwUf/ul/vDHkcIAcU3q1jYKh5d03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAXNVXjCOkIy6BMZSN9T4HRgc7A/XStKTCNkkElS3pk=;
 b=AS74y9qYhH0Cr376zBPHuFrLkUDf4oBvuOYa18lLZ00zGVCKTiJC3TjrnYsH/MCksUmbDMV8WQHNtf+DEC0W+MljLg3RGkq6OSkKAtpegU9FETIaHP8ndjI/JYDVQYc7Z9DQo2So5MbQWbzvG+Nkpjp/QBrpkoHcqTH4fu4BHPE=
Received: from BL0PR1501CA0011.namprd15.prod.outlook.com
 (2603:10b6:207:17::24) by CY8PR12MB7561.namprd12.prod.outlook.com
 (2603:10b6:930:94::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 04:40:53 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::4c) by BL0PR1501CA0011.outlook.office365.com
 (2603:10b6:207:17::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.16 via Frontend Transport; Tue,
 7 Jan 2025 04:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 04:40:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Jan
 2025 22:40:46 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Jan
 2025 22:40:46 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 6 Jan 2025 22:40:45 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vishal.sagar@amd.com>,
	<michal.simek@amd.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rohit Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH v2 2/2] dt-bindings: clock: xilinx: Add reset GPIO for VCU
Date: Mon, 6 Jan 2025 20:40:38 -0800
Message-ID: <20250107044038.100945-3-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250107044038.100945-1-rohit.visavalia@amd.com>
References: <20250107044038.100945-1-rohit.visavalia@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: rohit.visavalia@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|CY8PR12MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 5166a443-3731-41fd-3613-08dd2ed57440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gtyknjfbYlKlhzLYXEDp5qdHTNT/q7rUALrLiRQhoQordWPoA/1ud983JoDS?=
 =?us-ascii?Q?0/Ku6XIjgKz1b2LQRcc9EnAumvvxSDpzCgca+YlACWnJVEPDPUKU+je6VDoJ?=
 =?us-ascii?Q?jLb9cmQF3DzPNpO1GTM5RUn++a3I8WJaCZsq0v8/1W4/0yvdYBUh7j5Ysmgf?=
 =?us-ascii?Q?t+Gd/Ccfv6HvFkV/9cCIP3b3kribltdc5zZwuvJpKVOwDGjtYC9PY9wg2rcE?=
 =?us-ascii?Q?emB4/65XJbyAasN/1NxpYq4bCxA2dF67Y+Ta22gEjFSSg4RLQgqhWt5FSx1s?=
 =?us-ascii?Q?HdPPdJlRsJoT+9zyfVmPpx1SPppLl/+ns41QL4bYMJ/QTRmDqCm+xSLLcbTY?=
 =?us-ascii?Q?yDMCmjh7nEVzkRF5KPCmzyLcnNqirddmBMYRhlpfcfzeFHLDIyyH3oMpXRKb?=
 =?us-ascii?Q?EzAngVECkkSWG5KgyASvG/Y+lFQQFg7DKMMLaUTkaJfY5dhtFDJ1EMIzG2SP?=
 =?us-ascii?Q?e7Act+pacOtV19xzo9EqeB3UdqMqc4hWDfY8aBREbm9F5V81/pQNw374ynDG?=
 =?us-ascii?Q?2su+FQ8EWzYqeQNqFTqBWAc7UJEuLnXmRDQVAsPCGVfutsP98MyV/dqr6Xxn?=
 =?us-ascii?Q?w5N4BYz9qsaph7s1Gh0zONM29yj+k3nEiKvTS2DDpPNiFVamhSu9eTWWFXfr?=
 =?us-ascii?Q?jqkOsrb6O9f9VOD/vxXuJ/L6Cdu1Jjs+b/hFdfPCbqLfJLrUhGQon8ezo66G?=
 =?us-ascii?Q?vD8LBvxMVWunGXjNbKr8wN0RS9LTcKr1pAG2UeGwFG4f4kZPDVuHkDH30whm?=
 =?us-ascii?Q?BJO5el+hq8GOwYsLfkssy17SyVxYfQNtxii6kbHvBcR8MI3Uq8aWBAHYQsq1?=
 =?us-ascii?Q?j0/39rgWzJcc6XuAU5VUDNCOjIA9vMlkrPomXOsM1DJgK9sBT6MWIcSwOII4?=
 =?us-ascii?Q?/QefVRRZ+eqdsbUoB5nLrY0LkkJs6JaKabOfjFNXzUSsrEf8Z8mVi/CfnRgr?=
 =?us-ascii?Q?9QlasTlYSxazCDnhk0WAtGcomBen3Dh73CR8S2Zp42L61Ah/gZsbTaRSfCr2?=
 =?us-ascii?Q?Sii4zh1Rh5Iw1gaebEtxfAA53OExKh8QmLYc78Ts6XTY7kg7irvnqQI4ZlCb?=
 =?us-ascii?Q?e5KZ48SPJ7LH3jwWUKzmNenqhMC2i6ThZLETZ2Sr/kS6r5N7Vsq2gxp84Hr3?=
 =?us-ascii?Q?vu9P1hzS8aYYLgN66yRcPqgbY5Af1VxPwIj1Er4wdRuCWBIM0JfJ9oaLQ9J5?=
 =?us-ascii?Q?WAyDI6eCc/eo+6PkX0VRsRgvO/cqepMm+EXGOHYOP7K+v4f7JlMHkYt9mapV?=
 =?us-ascii?Q?hTe1XJ3csgAhD1dTz/HRxGGcbfDoSaTqPG8c109PDHJq2TMdhS6IQYbEGSGF?=
 =?us-ascii?Q?kxVKJjQHP1T/dc/NWo1j0++9UfXAXN5XILUWZ3Vn6OPhmpnw9F2SsPRv9kaI?=
 =?us-ascii?Q?NoVHH24DBXQTIXAvKLdvvMb3OCvfoih4Q0jVO3nkc8HuBO/GOoXa1z7VTjPO?=
 =?us-ascii?Q?T++dDWDb1kvmffAoP31u4B4Tl6WW5NxXrBfCPLlcWzbA5p07iAy+jVtE3LoM?=
 =?us-ascii?Q?bIYDX1vDPHl2WF8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 04:40:46.8974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5166a443-3731-41fd-3613-08dd2ed57440
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7561

It is marked as optional as some of the ZynqMP designs are having vcu_reset
(reset pin of VCU IP) driven by proc_sys_reset, proc_sys_reset is another
PL IP driven by the PS pl_reset. So, here the VCU reset is not driven by
axi_gpio or PS GPIO so there will be no GPIO entry.

Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
---
Changes in v2:
  - dropped description GPIO property
  - used decimal number for GPIO

---
 Documentation/devicetree/bindings/clock/xlnx,vcu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
index 02d27d11a452..19dc923e2ee9 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
@@ -33,6 +33,9 @@ properties:
       - const: pll_ref
       - const: aclk
 
+  reset-gpios:
+    maxItems: 1
+
 required:
   - reg
   - clocks
@@ -49,6 +52,7 @@ examples:
         xlnx_vcu: vcu@a0040000 {
             compatible = "xlnx,vcu-logicoreip-1.0";
             reg = <0x0 0xa0040000 0x0 0x1000>;
+            reset-gpios = <&gpio 78 GPIO_ACTIVE_HIGH>;
             clocks = <&si570_1>, <&clkc 71>;
             clock-names = "pll_ref", "aclk";
         };
-- 
2.25.1

