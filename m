Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ADE2AD13;
	Tue,  7 Jan 2025 04:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736224854; cv=fail; b=clBD98QzrpEpQyeWM86d+39buSEfTquh/XcvWUk4Hh17PjL08fQl7GohBsY7yDbCU+kCVZLaOCcne4eoDUcXsEFCMZVOxa8/pMQ4z7lPfh15gocg3zI2ikjqeFfOMPjYmizSk/Qqgu6poWqAXdWFWa/F+jYikpIVfmH+Xl7ZFAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736224854; c=relaxed/simple;
	bh=CzZISi+xyOX4OZ/vuXuT8yoKtpP0aHYoHpq3Pv/AFA4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nrpi4/Q0SVzNLJ0YmKlTEYEN/COjyP8LovxtBHUmoVcfUtNmm2FMKM40yZG/GOvSvesUtZ7ATM8UM8TzzcQxvzS8aIw/2ndkDqtWrfIQhsY7gNdVnnrvyKsjZ1+QZ1NfXe38vCD90aSFdoyaT5jzuQYdEl4+gjve3JHPsB2wXXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=2qXO++HZ; arc=fail smtp.client-ip=40.107.94.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2qXO++HZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6SWOhMxC457/+IhyGYw00YR/vYxqk/D+gAC9WA8uAltAeBI5MrkjriVXvTWNRLMp92E3b72aswtU6fEnT8jbs1xFLIVcnsEOrH3oYVHCLQU9SrlQMcizApGVPYtCIh281KuP7HDSl87cPrDezid8RHZ3bUbKW2O+kB9Vd1+VuYqIfN7JX1I4DDLKVyt1HeDZ1x9mGl6sYQryd3mIY27bGTJORuRI65y3/HkiuRYfbu6ZwQelVnuCFsQx6v2U9qBl/pqOSuCG6CNgSirtHytmID03SJnTfyD7NnHMURm8g/fi329AsvHrU7RcNQX+82VBNxF2zDzUpaQkCVayCD+PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8cU2gZ+8rBhCU6o0WmeqB717k3CttLY9/tYupwkgPc=;
 b=jaJHRU24VW1Pu0ALlX3JF5bAnlIj54sZd2TJ3E7uNsggsx3d5sBE8+LmDueRJKdegaCqpvIQw/gjjCrHU8cy6U7b5Mub6g669MnO4WkQa8CvlPhxBF2V6gfSyUl9Udh/aDpLh1lh1PcEa9s/gCZnNV2uP6qN/OlgqOAGO+/H5amPHpwinKjVNHaBsf9d7apSst2wd6Rl7CkUlr/yDR+sCb+LAz35ZF7WS6a69JagTA7BQKUerVKmNiG1HQ+I2AI4pCYZv8d8s5gM7w053mcol3CpbbqE/V7oADnP6q8kmOuL1nfLa6GANrMPDNKA9Tjx+BFVrG3xsM/w01rQmdUCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=baylibre.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8cU2gZ+8rBhCU6o0WmeqB717k3CttLY9/tYupwkgPc=;
 b=2qXO++HZbT5PHpOhaheMCCBKAdiDWNfK7gfCwjlC8j7lcZd1shetABY9kobotL2D6fFWMM0U/UheLJDhi/45Iriv1NNQ/18AyKX652whHKxGE82R1HdSo5UvN8AP2bkMNWpZfPuMcwjr/MEchPwRanfBj144FGWhnVJplCkZ06A=
Received: from MW4PR03CA0296.namprd03.prod.outlook.com (2603:10b6:303:b5::31)
 by PH7PR12MB9204.namprd12.prod.outlook.com (2603:10b6:510:2e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 04:40:45 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:303:b5:cafe::88) by MW4PR03CA0296.outlook.office365.com
 (2603:10b6:303:b5::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.18 via Frontend Transport; Tue,
 7 Jan 2025 04:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Tue, 7 Jan 2025 04:40:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 6 Jan
 2025 22:40:44 -0600
Received: from xsjssw-mmedia4.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 6 Jan 2025 22:40:43 -0600
From: Rohit Visavalia <rohit.visavalia@amd.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vishal.sagar@amd.com>,
	<michal.simek@amd.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Rohit Visavalia <rohit.visavalia@amd.com>
Subject: [PATCH v2 0/2] dt-bindings: clock: xilinx: Update VCU bindings
Date: Mon, 6 Jan 2025 20:40:36 -0800
Message-ID: <20250107044038.100945-1-rohit.visavalia@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|PH7PR12MB9204:EE_
X-MS-Office365-Filtering-Correlation-Id: c1e4d6e0-d56a-45ac-79a5-08dd2ed57338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VjHCPBz6kcWIN7tZjBo2Dij/qdkyAbQF9EK9WjVB7/MR8Fdllu7y20F8jdGm?=
 =?us-ascii?Q?5y8C/DKZGDCnR7fmwKZGsBAvjLEJkaU2LA5ByI1xDCBNAREb5mSV1hCCoy6f?=
 =?us-ascii?Q?YzyDFaeh1LEEN3YQ4uN2f2A2elwwCuxLkq4VsLhj/cJqlYC/mgWWfUTaqaSC?=
 =?us-ascii?Q?rh1luzcq3Mfhv61Gaw70629VMjOwkxv1b1zjjXl9Kq8COtkL2mZCjH21Y+sf?=
 =?us-ascii?Q?ENzGvLIiokroWBhnzcbZ1iMtUmaql7oROJd0feoekP3Mbcg+mJjK715qHYE9?=
 =?us-ascii?Q?Vy/OD55J2jHM5gsG1W6LawfS+0rcegIfk6Kv9Z0YWBsXM9yu18BTB/kfguhe?=
 =?us-ascii?Q?OYEr7Tc1+WGBt7LEo7w6XnPXA1jVRvU1vOZ8d4d3arG51bXZn2Hf29NX3+bM?=
 =?us-ascii?Q?O05sxnc64/zmuwleVO/QCBILuNb4EOPnLs2d5q7+walhzNwizko4Ri6l5/mm?=
 =?us-ascii?Q?2Am2um2FYvOjiEvvb3B/4YdtoKPvbEfuziIaq+o//QvNq7ynfSy7Zf+g3Vhb?=
 =?us-ascii?Q?1Zhy9/wJJZN0Hw8kIW4il6r+8GyDeXWJd86uktBc+0Sr5CPaNxelIQDrbkUf?=
 =?us-ascii?Q?ZxgSAA0MB9zdc7+0OmCC3i67gDgxMUOHW1FmfPM0bkaxpYrPAtMn2UZFbrqN?=
 =?us-ascii?Q?QS+yhLdgeUMI5oqmdtDS+wN+XOxPdEE0rqT6IzK5mKiESviFXJSmmCri3xI/?=
 =?us-ascii?Q?kCxoS7V9DAYms64Dk06HP/0jaMsxtOYg4HCKvM4ZOx4kmW1qeDINKFPCKQOO?=
 =?us-ascii?Q?qj2NNmLxK+6Qg+5zFFEydfbjcRE+kRA5O4NrvXCGhwE/mG68zZvXxCKiG5Ew?=
 =?us-ascii?Q?T6JPeVF1PnOuSjPB2d9Uv6VFkE5rB4UvKnGF2WjcFgd65xVfch43GYKv8Au8?=
 =?us-ascii?Q?sWfKPWBgTrH/lFZVuLaCXkhJN7Fm8cIYuQhSO/qP+SeD/xT3v5/OnrAcCEBU?=
 =?us-ascii?Q?fq0Z4ME5VIbvbbpFNBjaf6FC6SAFxIS3cKHSMFam4Daz9TX4Vv4FgWwZl81O?=
 =?us-ascii?Q?vg6urZZq8c2sdYrFrezi0nEqK17WwuTHw9nr95qhhvtWSk1w8zUP7cNwViac?=
 =?us-ascii?Q?LoMRAJ7tORutIue7rwHRdSEZWQUr4hEQ0GcfQYaVEFUGnAYB+N6sx/GNknM8?=
 =?us-ascii?Q?fXj2Rul2onRQL0h/7RmbKy9aWqVJwdtHyw5ATy3Idp5RGxX0siqJU8uVb1Fi?=
 =?us-ascii?Q?+7s70AaA/OUO4/oTcIBCKOATmjBvsFtVY5xaAPGZM71i3dwVvkgqgDj0DhWb?=
 =?us-ascii?Q?HrK3j3mlyXjgWrOA3T7v1kvzMQ83klv7ixtSaYsZKzrrEMjGBuaqZQGSoven?=
 =?us-ascii?Q?RFHAamzUxOuFQA6Pj8XJHf7VYkuc8s0UA/Gx+ZvALY1bIJ7oZXOxmbz5JOq/?=
 =?us-ascii?Q?/+xsw4xO5iM4uKSA+aa91pH8c4LVD72AVpyDdysFazr5eECXwkY+FrraEGGJ?=
 =?us-ascii?Q?Ahr1+1rhkbCds4lbecjTpW3+YAKF0re2xktKmrZyAxl2OElMXwq5KeXNPT+9?=
 =?us-ascii?Q?uuAkBoNa0pTx3f8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 04:40:45.0752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e4d6e0-d56a-45ac-79a5-08dd2ed57338
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9204

This patch series converts dt-binding to dtschema and adds reset GPIO
as optional property. 

---
Changes in v2:
  - dropped patch 1 and move the file during conversion
  - dropped description in schema
  - updated commit msg for change in clock ordering
  - used decimal number for GPIO

Link to v1: https://lore.kernel.org/linux-clk/20250102163700.759712-1-rohit.visavalia@amd.com/

Rohit Visavalia (2):
  dt-bindings: clock: xilinx: Convert VCU bindings to dtschema
  dt-bindings: clock: xilinx: Add reset GPIO for VCU

 .../devicetree/bindings/clock/xlnx,vcu.yaml   | 59 +++++++++++++++++++
 .../bindings/soc/xilinx/xlnx,vcu.txt          | 26 --------
 2 files changed, 59 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,vcu.txt

-- 
2.25.1

