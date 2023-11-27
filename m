Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N1hsggPA"
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9223512D;
	Sun, 26 Nov 2023 23:22:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ubo+pepvCD1msJCUK32u89OV3FJbl3H0Oq/TaQispjCTytiaxlrXtVOMLH9k3EyJW2EOX4RQzkKJkVyKU8sfDLarQ4JC8O7S6VzqTbQBptFmSiGmUlZ5htq98qsvQcki/E0mgk3ft3n0Lsvc/5nuGkRzbUql/DDT7Mbs1sjgBfVHlQYlK8qu3hA1yN/0uXtFCC57iWzFv6AMIeYbvv2OPUepPOdi0QXPU7yMhH6wayz9+o8GIzDNJXE0wewVn/MQuGAN1ez8Pyy5o0s9YmAVrwwSwv7L7okIXwbEe6uWqEZV3iFgXxaDpYUsbFa2Kx++nnJeZ7aKd7TJDeUlaF5wbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg36mL8jeW4nFAsUqT0eyQXLfC3uULkqSkMuxSt+Wg0=;
 b=QAIOSWNyLO/1KHOao9DooCk01u31sCSVjZLzU/VOd+NjdUxRh0saEJHHXSRryCKoTdFCbLdVDOTuvzoMipaUCEsKTa3oJ3mx7okJI7cQTYtE4GbpYNtbh1/irzOQ8P+X9/YrgpuWytTLDLyk5H1hCn9FOjULxTKNQxPB+iQHMCy4LgA0UjEfAMSM51DPpwtpdhN4EOoEBO1sYr4VeoZku9pTD8rsH/2M/ll39SJy3A1tHnb9MvMnod1SkcjR6bX0E7FvJru8dAJJ3pjWZedDm5A+9joFzefK9uJT+Mrkit51gEntPqnNjAfLJBZpzYBV7kP/gUl9UxJJBfsofg0WYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qg36mL8jeW4nFAsUqT0eyQXLfC3uULkqSkMuxSt+Wg0=;
 b=N1hsggPA7wtZ89Wt09eZmS674D3Kld5xhw/e7/psM9SSbFNX8B99xrQS0myJyfkcTFIE7GtWtA8km9OWwbCpjovs5EKGCHGmUKJydlD8GkfJRhOdVln17qG265fp2NRtuxQReQcP9CbDPkq8xA7E+NKatYsKKguNAivuC2UfhxI=
Received: from CY8PR10CA0048.namprd10.prod.outlook.com (2603:10b6:930:4b::14)
 by MW4PR12MB6779.namprd12.prod.outlook.com (2603:10b6:303:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 07:22:13 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:4b:cafe::e0) by CY8PR10CA0048.outlook.office365.com
 (2603:10b6:930:4b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 07:22:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 07:22:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 01:22:07 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 27 Nov 2023 01:22:05 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <git@amd.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH v2 0/2] dt-bindings: Remove alt_ref for versal
Date: Mon, 27 Nov 2023 12:52:02 +0530
Message-ID: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|MW4PR12MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a02f28-4b4e-4bb6-93df-08dbef199379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tz/rHLYewfvWiQ/r/daT3m9Gt9bLzdxrdZj/1OZ+jjEzBsmbIHPkj1JKoCKDVl+QDxyWjmFlL51CgXOvD2DDjYG6Un/r89CKpSStl5QLodbEx7prQ+2kl+pQHiHCze6jbngY9GCVz1C7esu8vSO0UYxVrqTNRhR4Ku98Hdebf3KQiMs6x2SWJxAK03pRh6BZdwtT9fC3wg4jc0PD2LN93u1/X/dD9AWiJE2TTEegMbHqeR/r1l5Fi9aUT3WjZAVRkiiGVyPLH+H43QbNB0G2tocq2SUhcNmMIlsfOwqPg3kAqg51mlaUUuLpUtNjBCOAE8GuRPVwqzO+zNK+mttbbpsHn7mZNZOJUFS3aZxvBFyl3tEAhpfEJQ9yBBe5eBsNtKmbAjXvGHDTFyYjNXlwijMKqqUt7WG9pbKwZGl/RSTe1VKEdSbY7PsRMHtbw+VZX8K3yf1gFQp9Rmx4PsATp5VTclC08PECz5j1HILKgPiz7uFuqNhMuBF0EdvL7uxXRfLYTrRNO5vNccqHIFSFa39zrNJWwdui4sArLfqPZ+yAjx+F0WPQhzRuujF9PfVdyQLOcCFD6aVoVOEsDcifIcgvm7othwM1hhJ1aZUmZh+GqoLiuhRe8K32I5DZpkaHV3ZLzDu68+yGHh2JrlHyZIkFAkKrjQ7wx2OEI7QOi2dn1qUc/TdQXfGTGHoAewKvi45wRTJ2gGOtBHMkv+eiVeLHP+xGK4oFbQG/iKLYLEUEjbsdgUhesL1vH0NsxI3sxzldDMR6v5fyierZ7VVhMQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(46966006)(40470700004)(36840700001)(36860700001)(36756003)(82740400003)(356005)(81166007)(40460700003)(86362001)(316002)(54906003)(8936002)(8676002)(41300700001)(70586007)(70206006)(110136005)(6666004)(478600001)(4326008)(5660300002)(2906002)(4744005)(44832011)(47076005)(40480700001)(426003)(336012)(1076003)(26005)(2616005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 07:22:12.9402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a02f28-4b4e-4bb6-93df-08dbef199379
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6779


alt_ref is there only for Versal Net. Remove the alt_ref
for versal.


Changes in v2:
- Have specific constraints for versal and versal net.

Shubhrajyoti Datta (2):
  dt-bindings: clock: versal: Make alt_ref optional
  dt-bindings: firmware: Remove alt_ref from versal example

 .../bindings/clock/xlnx,versal-clk.yaml       | 31 +++++++++++++++----
 .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  4 +--
 2 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.17.1

