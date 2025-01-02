Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE39188735;
	Thu,  2 Jan 2025 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835845; cv=fail; b=pK99f7oxISlGGQI0VZ6dHKPEI2eZVwfb9pVHfFA9+gz03byfNfsqYz8kV1MAy7KxPR3PksH8TlyqBqOhuOWow3+cyEARdFtaJXsySrmXIjcfW15I62hMeaqt46IYemQYgWZJcziyZaiALzGw0ckG3YfPmJLBRCm/z0Z4A72Jj1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835845; c=relaxed/simple;
	bh=YriKiAOcUrdKFJFSyEvHAq3w6aej5t75gFu7gtPxWTs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rZlejOKtsfJLnzE6DGJQy6QF5SfpzU5X8AzB3PvY6Zjc8QusKzwvpRCPzhVyDrAlFrTWs87dIwzJAG+vhSVQwK+2iVlCLojSAOg9AihKAQCaF7Z0iE+RUSsn8XVRQpRAJKZfPX3bblXZF6qb1ETiXtwOWaDVQ0iH/LO6Awioi8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fKJotlgt; arc=fail smtp.client-ip=40.107.244.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fKJotlgt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlAwZSYlOM00jYtTK5RntRdEGSTpSIWWK4sYEVSOYLa5W6uACt2w53iK9X0uUI3NuC48kEW/hRXebRYriY+2i08uvlJdw/ViJmNeAcx9AsHRi0GCAg9hjmEmgj3R/40r/wYh47DrUGkQxtsLi47N/+vyyWPNbfOoUKbM+iqYL85IOAvBvCsCX9Y7LcQrZ5/bc+4rt6Y5bm1k9CeNIsXUNNZM5qKCaf6W72ekJa9c2POsujA+r3E0QaLmVS71mEd88jtih4V7hPop98FGq5vxGR1JNODNu7qLs6Mz21xAQza9W8qMkUA/UNyOlPbDhf/UQSD4tD7jthPBKW/hjb1zuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPTskkGMK7QibQHZK4sCB8nSIeD05PxtoL1Bsdm9/MA=;
 b=Y7ooOwXd9agukIIuYL9lqWzOd2axcN+KXckoyrOWkaWw14sDwsB5ZmSPXYyvLNKrlO+Depkr15saQ8PtN+Beq9xjmh/y+CZn8CkZzXqGOrT2NMVslpDcis5Y5ZNRHvaolvbSTCrsxTof28Bi+ciOJ5rf7+TdxljCefkyk3T7zQp9G2KhOHhGz7eyrD2MZf5o8SlrFCUOD/CPEpknrIjtZeQLF5Rr/l5rk3oCydBx9UfixQs51+3isRrVxDSemGimbo+PgPQlJKTDCl3KWl9tDM+VmsMWDWGapyJzCXfMzsPtpPXQjjleB1kF2XktqPLTJ5WWXneJvBONjUIoFrxr+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPTskkGMK7QibQHZK4sCB8nSIeD05PxtoL1Bsdm9/MA=;
 b=fKJotlgtb+lQt+S0iRxix8DnHY0Oyhh/eGh8ZwRT4/agaoeRUWcVRXqjBI9QEEbEuK1GpD3HS+LQJhCelY0V1JpaKx6MEKW8A7DuLm9p04b0cpFrEbGcLz9FYLHR9zdi8YpUfalXT9XHoWNiqtZY9jbTZfp1HhLm2V3no1AuMG0=
Received: from CH2PR17CA0016.namprd17.prod.outlook.com (2603:10b6:610:53::26)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 16:37:05 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::c0) by CH2PR17CA0016.outlook.office365.com
 (2603:10b6:610:53::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.12 via Frontend Transport; Thu,
 2 Jan 2025 16:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 16:37:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:37:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 10:37:04 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 2 Jan 2025 10:37:03 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rohit Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH 0/3] dt-bindings: clock: xilinx: Update VCU bindings
Date: Thu, 2 Jan 2025 08:36:57 -0800
Message-ID: <20250102163700.759712-1-rohit.visavalia@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|PH7PR12MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 2928fd4e-e577-4c38-96ba-08dd2b4bb154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l5RFd0tZjJbOyh/Q1GM6EPy2JMwIL3ty+E/PjmnwASNCni61srXUGHDpZi16?=
 =?us-ascii?Q?KB+m7joqIB97jjDkm2K7LbFaS3+ih7Qn6wu/RDM3/w67vYZ5+sgsP5Z5Au1C?=
 =?us-ascii?Q?ppUJTlkIjePLUKm8yIK5+Rxn35F/3oblC8Yu5NdYnDHt0qmONdJWop8goZdF?=
 =?us-ascii?Q?fG5lM+l1TzTr44LCszYzP5lowwlQhoV9THKb/+3gSZ8bcLA9pTehhC8HxBYc?=
 =?us-ascii?Q?F99NDS/rG+J3m3vho6vTvz7SSh9XM5KS4I2Q224M3zW1MacfFL8vp6E0dSfN?=
 =?us-ascii?Q?MSlXCLzrpekQnGSCf4C69hl17+3Wm2lJonizFspdd1t7ScPXT7mBJmLoRU6M?=
 =?us-ascii?Q?KGuuSWkgK90wukqkKtdt2G+KGsDqTbbwnUnRZh4B6Tn6sud16sNYpkHPd+kb?=
 =?us-ascii?Q?31gj7KzWYhcZbmgpCUNFAA2qJmsXZiZ9DSP2iT34WkNYgKb5BblLRaxiWDvN?=
 =?us-ascii?Q?H96x2nphxENqgIns+t3/J17bDw54Ppx0lPrwY3NptJh8krowgTk5CUswvvbL?=
 =?us-ascii?Q?Yzh0STBFfswnbHDBajA0ro6dcfaSiRwPymgmpvcyWp9MEWdl83PPeGH2dO5Q?=
 =?us-ascii?Q?ZHQhlosoow9iNFLejTED6rO+NOcNhSjCYzOXdE14V+HNw+jweJW/MLXvb/C1?=
 =?us-ascii?Q?0yNXLJRXWuXZ9mfx9Iy3yh2eoSILMJsKOKLqnUcoq1mY3TE//Cd19rWUWQkS?=
 =?us-ascii?Q?M3GopvutlzUH89iAlsavOc+s+M4M7cB+mnrLV/hQ5jg/2Db5PmuaW8kSQzbv?=
 =?us-ascii?Q?Majq8y3XEGzSUUwY/cgH12fogB7+AvGl11xg/28bObgrN7kWZ4ob+OZzsSIo?=
 =?us-ascii?Q?AykWmZ4er76fpauNlfqMUefdiQRw5TdohyqvJozMDZONR8nMo/Vl/ryFjool?=
 =?us-ascii?Q?4OKtKXRWbNlk3Mmuo2H9wsT1/9m7YD8ZDERy+XXR6jb9Hor5HfY3vSAFMJOx?=
 =?us-ascii?Q?+vI6MVgPtaRVOLFvu9uvFKFCwXmQpCkxYIr1XzgoeaB5tISCYv2Cc6iMcvFz?=
 =?us-ascii?Q?24pvoLvsNw1IndwZfSmnThm+B79CSTH+kZmI3lANn3kR0XEXBGJjZNcWCGlU?=
 =?us-ascii?Q?dAlXMHepkq6d6ASRe31353twb9dDtVRVd5oetX1T/VBxFAWUxUwmt3m+dNX/?=
 =?us-ascii?Q?IVpYQA7oeDmDEjwlJc7mFlf2ff4qSf8L6bq3K5Y+wjGch6N/H1D3U5EamqJ4?=
 =?us-ascii?Q?Je10bS18sNU7m76xj2Hb8ChB1l3AtE8B+xbMR9Syh50xIHRs7Sv4CK5Sgt9k?=
 =?us-ascii?Q?lz7leJYTRUgOj4+GGJfuFeTK1sN/m+lOD6AingoBbZKsuKNfsfvs1xpIjy50?=
 =?us-ascii?Q?Ezw1gBX8RxwQC6mpzP+ghx+RTWkZjsfKg+FBPCbS9nPfMwwh+oKz5MaQzru7?=
 =?us-ascii?Q?ZCVzF/lqfav2XNGLh+pLDx9Ysu7bew/rsMv7fkBxbY7yiUFEhRMTmvk9GtP/?=
 =?us-ascii?Q?oHhaq4OoVKWA0cWV36uPXCvOG/z/E/RGh3nUzTz4B+LOxcJeoQzvww=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 16:37:05.3349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2928fd4e-e577-4c38-96ba-08dd2b4bb154
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974

This patch series converts dt-binding to dtschema and adds reset GPIO
as optional property. 

Rohit Visavalia (3):
  dt-bindings: clock: xilinx: move xlnx_vcu dt-binding to clock from soc
  dt-bindings: clock: xilinx: Convert VCU bindings to dtschema
  dt-bindings: clock: xilinx: Update VCU bindings for reset GPIO

 .../devicetree/bindings/clock/xlnx,vcu.yaml   | 64 +++++++++++++++++++
 .../bindings/soc/xilinx/xlnx,vcu.txt          | 26 --------
 2 files changed, 64 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt

-- 
2.25.1

