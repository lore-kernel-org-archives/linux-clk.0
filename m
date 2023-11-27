Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QItrh3zy"
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2048.outbound.protection.outlook.com [40.107.220.48])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57481182;
	Sun, 26 Nov 2023 23:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ni+ACBI7+R5UyRDc6i5LYrxisOKdv0tyQ0bVB15qN2ML9LottI/4PkaNCC0VceJFYnuA34P5P1oPpsFRaoQGNbCBV0a6RMsxZlpUHlhdWGu3M0GUe82X47YElfR1ZXnBLLaJNyD4dZuS7NqzrpvPkyYxo/yjEp1fYgkRYycU3ZlGRsacmJtnTBFhBXffI3FZiIO82NCjgzl6vvVrK7tyD6JZFLyuR6FFYCf2iGLXU8IJXKG4hGaLbZZ1p+Sq9pvaNK5KJ0SbjHQRtzLJsBJdEWwryJcFIEZ/npQCRXxDbwBSiQtr+E8rcGY3yjwTxjwD68ZI7cl+PXFjnE6Uug3agQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVdNIuQVW1tHMJXdrMOdThM7xVOSXqpsseOyTeNqQFI=;
 b=lvajGyvukkK/ON7WUVyO3VjVCLmJBVU/siUVaImKqFFmMLDjCGW9tVbF/Jsxtq3eSVoPYFDLIrz8JdT/Rs7Di52bzKrAtvLUsdD6gOrYce0NPNPrmVhlNQkilxjyA54IVZpyEv7XloiIubw1TboqzRA4Qig66v06As/JqcQkvPQUbJ7Bd+7B48p1JSUHbRleL2pPNIVKdkFymqNJHxY9vb/tN3QxrcG+AICYbe6EW7FgfDUklVEy8sUwDyAwAIdv6e4HQTq/2FnKuaNXZYF6jm5hBehRn6MkyYGlaz2xPBTWOZEFCzGwKeDNFDLlM2HKgmRG1/dK40vMduRWgk02Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVdNIuQVW1tHMJXdrMOdThM7xVOSXqpsseOyTeNqQFI=;
 b=QItrh3zyZQOpENGwNTs1o2rkWZpqUpQdU1xbXQOVOAQz9Y2l3pBKth65EgKTPouOgoSh+YdDzEsIKmqwS3PRJLfQ+EIy7nTd/lb0Ig9KCKqGCsi+FBrl8gSCBUEs9HMjMRsGQAf2m41TdBxSWk5zFLFRAXbcMK6CjOyFK4cVLXY=
Received: from CY8PR10CA0042.namprd10.prod.outlook.com (2603:10b6:930:4b::15)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Mon, 27 Nov
 2023 07:22:39 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:930:4b:cafe::fb) by CY8PR10CA0042.outlook.office365.com
 (2603:10b6:930:4b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Mon, 27 Nov 2023 07:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Mon, 27 Nov 2023 07:22:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 01:22:30 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 27 Nov
 2023 01:22:31 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 27 Nov 2023 01:22:11 -0600
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <git@amd.com>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH v2 2/2] dt-bindings: firmware: Remove alt_ref from versal example
Date: Mon, 27 Nov 2023 12:52:04 +0530
Message-ID: <20231127072204.25879-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
References: <20231127072204.25879-1-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: d0308070-1071-4f74-53d0-08dbef199fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VHj8cgxmuty7YRPZnqFljIZXcqcTSQtdaocJe0xaUz4UyQ8U9odTm5w1Oaf/UgregfMlbce4iO/nOkd3uKLjqdhg/X4Gn74E8UVmbTcuqGuQN+8O1sNaoA8iPoFzoDCzGrnSZqxj6SxVtW8oxzu/ZUYl9Z7tfcYBkndDZPKCyg0nnKjvq16Yl9rWzPHBzRusg5ZYcUJP1Kc+3DK4y0besP2CMeJMK+YUqrjAA18es1ZFIQ506m9NiB1ZB1M5ktrWj+IR7khV+8JaGcB0VFn2oqr3hcoAWLWfxWQcjfI/16+0iW/jY/r9mtO/4jA5iW5mjN27irgOar0+s4nPm1T7qxGdClpLhxmU3/R4fEylxUXByjaHHUKHwqEWfqJtEfhN8aP1rl7reIgju4iZ7AFdiVBpLwqdK5ieYJzzFts6Kji1HjHZkS+0JZiLy6io9a2jIjbu89VRgLx8GHO788Lo4QDhmG7L+g+eNjZSugdj40d4lY2EQofNNDIkfTCy4GdM7ALzFEUYZEdYnRBP8YLwTbodu4mdcxGV+L2PtwR5URrpN6CQ1vF0e8nQ6LMEvY9YrZlT2d3QexbACxV2qY45h3wSHYJ63PWnoRH2vDRkTFy0bGenlwCHo3B21DsUW/Rb4s+Iv1P5n5WY/J+dnp5JBg2MClhWoML7K+rupTH2QiMl0oa7vOso2ir0Pvj1serwtKUnp3P7V0Ehj8fYcIct+k14lzJgGSeubZ9meyFcVEckmqrVIfLgAe6pEnFv52VzFRSJU/j67imYOk2p7UmOZw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(40460700003)(1076003)(2616005)(26005)(6666004)(336012)(426003)(82740400003)(4326008)(8936002)(8676002)(44832011)(5660300002)(86362001)(478600001)(70206006)(70586007)(110136005)(316002)(54906003)(36860700001)(83380400001)(356005)(47076005)(81166007)(41300700001)(2906002)(40480700001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 07:22:33.7528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0308070-1071-4f74-53d0-08dbef199fe1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100

In the previous commit (dt-bindings: clock: versal: Make alt_ref
optional) the alt_ref is removed from the veral-clk. Update the example
accordingly.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
new patch addition

 .../bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
index 822864488dcb..8e584857ddd4 100644
--- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
+++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
@@ -95,8 +95,8 @@ examples:
       versal_clk: clock-controller {
         #clock-cells = <1>;
         compatible = "xlnx,versal-clk";
-        clocks = <&ref>, <&alt_ref>, <&pl_alt_ref>;
-        clock-names = "ref", "alt_ref", "pl_alt_ref";
+        clocks = <&ref>, <&pl_alt_ref>;
+        clock-names = "ref", "pl_alt_ref";
       };
     };
 
-- 
2.17.1

