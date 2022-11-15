Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A18DC43217
	for <linux-clk@archiver.kernel.org>; Tue, 15 Nov 2022 14:50:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbiKOOuR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Nov 2022 09:50:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbiKOOuP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 09:50:15 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2087.outbound.protection.outlook.com [40.107.101.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1E410FF2;
        Tue, 15 Nov 2022 06:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQOMwC/GTp9bAQ6KgWPTYngBYNLS3Gmik/htbIw+xTpo8B/BjrnfchcxR0xQMMcIk3a0LQMt+lOUoJk+YB6bhR9xqTvTG+mgghQcpMyccBkKx0E0O6IMZl3bwutuow3Z/juaqzvjEbW/yxHghgcOdPY9XthExmb55VXdTK6SWsIZXiLD/70IB2wjNldFDwdLGy9R+3Tv8KlHAkxBLcb5So36D+dvS2fO6k4mJh1f0xyL0kLegoG6o3CkFVA1yhXtxR2OyHMFXcXgNMbgq7nVHI4tcsxbnw4gNM1NPcMIElt7r2TxsJjb+4eVIgLoXhZ4uqtHpeKfi92non//lYE+BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KryX//HyzIhx8TarQq/+BAlSZrlSUkxZf9VsFElKf/o=;
 b=j99vVfSURUSd2bDb+iZmVSuDSitu6scRnWVXH+uLp8FDFD4qcLrz5Lu/zNCi68UUn3MvQKTC+tpROXCKgmb16xrWno4RoJQnleXmhH4r8ngRdpbGcRBtCRCNIucBSyu8X70qx1Gi9dyDN3M3Kuapi3A56nmnHB7U3XyZzgeXg983KUk9rt5PCP+ZZq80HSf/K6kMviPbIkstcCG5NQ+ENcAtZHSvtY6DZEg0nyJOBumXDrPLuikI4gYlU4DbcDV64qXuFZe/Q3OMsjaWhLzGkg23KB1cz54GqTe1i65UGZaJnEYqgtcyd5OIhoLq/yXZp6hNzkq5062brotP6XxqOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KryX//HyzIhx8TarQq/+BAlSZrlSUkxZf9VsFElKf/o=;
 b=qZhyccbWJRptned81WFYZm6MXcPEenpgjs2FVMXYRX1V0cAL8hhKj482wVd7DKgOFdVXBDFRIUtoZgSeqdrbiWG64BLUUOI3FLXiCQrXa5FX95jzHFEiMC3QXRLCzeUkeA5M0/3OAR1cbDO4IVY/jKItUY/CELOuwT1DEiiwM1I=
Received: from BN7PR02CA0018.namprd02.prod.outlook.com (2603:10b6:408:20::31)
 by PH7PR12MB5878.namprd12.prod.outlook.com (2603:10b6:510:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Tue, 15 Nov
 2022 14:50:11 +0000
Received: from BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::70) by BN7PR02CA0018.outlook.office365.com
 (2603:10b6:408:20::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 14:50:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT039.mail.protection.outlook.com (10.13.177.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Tue, 15 Nov 2022 14:50:09 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 08:50:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 06:50:08 -0800
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 15 Nov 2022 08:50:05 -0600
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@gmail.com>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v2 0/2] clocking-wizard: Add versal clocking wizard support
Date:   Tue, 15 Nov 2022 20:20:03 +0530
Message-ID: <20221115145005.4747-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT039:EE_|PH7PR12MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c57a4f-bbd2-435b-0513-08dac718b15b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPdJTQaXYuwPeAaEoFV7XVHlJoTIQzZGf6NmWSSEq8bfDDIPdtQqsVwdUrgZNEsKVprgL9PEyjWchiu5njItbQDnotnciao0bIrjPj5rHVLm8TRPCDA0OPcaQkEkDhTtMaU955L8IM2BGONAhXnNs8DKCHrEy0cI+dPVOQlGId0pKBRUFjIUHJu1Fr9kbWg3CblLDTjF+AiTvlD9ir6xXaEZjZyS+I3THtwVALJRcOpsYhfespTr6qWe/JAhBdmR0I++Gz6OproJOqtn+gKc+fSizxAgpcyr/DbwQ/vGGEotTvi99QW+UMSrH+RdsUP+0rpufNNzuPQZZzw4piXYeyJ8IC8U7nvR1OttSWqIbyfKWjLBIsKGULENMFXlTuFyMrRDsBeS1e3rfeuV6FE1aJLhABZGUouCwORedlS/yE4OB85TTG/gC6q1p0EPrfgWp20oNmkZxuTKuYnKDIKEKC8AghVrJAdGRP/IidlH8VlxGd/od6M2O+GchqyF4rDOo6EEhAktbme1h3qoiEO3OjClP33ytFvyieNh0+l6zT+KOtYTDFTEJ99fWA8iBcVLmyDfXGLTiIl7LKyGMvQyAgtJU2DxNaq+X1uYKGWd+BC/EvXw/Jn0Rp9zBwGYyK/dFMeVllfTOHoS0r/UaxZKxZxydfu4VIl99M8kL/IWXyOFJXC6Fh8o0BVpgr8C0PbnGmzHCG8BNeya3/bVVtkebpmX/r+XeqlaHekA/yq1vM3E/vZljbxK4rsWBsrG315NDbGN6YtxLtdStsbnbqArXy46DoOSQT0OXWm4piey+by4AxaCCpSCxqq/mdR0/MkxPiC9h7zo1jNAc7d+T2IyPg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(40480700001)(36756003)(186003)(40460700003)(82740400003)(26005)(44832011)(336012)(2616005)(83380400001)(86362001)(8936002)(41300700001)(5660300002)(4744005)(316002)(2906002)(36860700001)(478600001)(81166007)(356005)(966005)(6916009)(426003)(47076005)(1076003)(54906003)(4326008)(70586007)(8676002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 14:50:09.4552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c57a4f-bbd2-435b-0513-08dac718b15b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5878
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Add Versal clocking wizard IP driver support

The Versal clocking wizard is clock circuits customized to cater to
clocking requirements. It provides configurable number of outputs.

Datasheet: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard

Changes in v2:
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in driver
update the warn
Update the compatible to reflect versal

Shubhrajyoti Datta (2):
  dt-bindings: clk: Add binding for versal clocking wizard
  clocking-wizard: Add versal clocking wizard support

 .../clock/xlnx,versal-clk-wizard.yaml         |  65 ++
 drivers/clk/xilinx/Kconfig                    |  13 +
 drivers/clk/xilinx/Makefile                   |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c  | 739 ++++++++++++++++++
 4 files changed, 818 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,versal-clk-wizard.yaml
 create mode 100644 drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c

-- 
2.17.1

