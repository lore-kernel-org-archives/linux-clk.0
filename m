Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F372C77B78
	for <linux-clk@archiver.kernel.org>; Tue, 18 Apr 2023 10:29:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjDRK3u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Apr 2023 06:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjDRK3o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Apr 2023 06:29:44 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6675188;
        Tue, 18 Apr 2023 03:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA0S7A+dwmkuMkiBH1WTRlYljtWUr/9EryjjieUhmASKDxd4yk0K4+d9xws5i4m+VgeWhiu121M/m66S+caQE5udgC6NvjPqJ9/lIcQFRp7htlZ6gbrqqGTKbfUlkxzDNIrN42vamCO7A9iGmOdhM4edQvEWxGWUqu2rdm0uvnpr67nq1peVGK0ZZVkm6CURR7L8ThvSWCfuOpGAwMqWTPkpSqzbIr/3C7NAcF+b4KO1YABk/DvmE7Ct0WsOquWoqjZ4iCltOvp0eYgoEuzvPgJ0r0u7kgIEDQ9UrdhkTR1R6r8LI4D7z2eTyjMteIKasoeFpdWJ33Vk5+p7mVM1rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4Ze9zUeZ86WNjnfZLZVqr5mL6h/pEtzRWTng9B5IDY=;
 b=bj5VcYUm5bx2uHzLNC7vo8IgbKy/SAN1Yzcd5xUXoihNcAILkibSJrSS218n4SSRuDbPSMjl0UF0yM3story8kPu5kHXZmka6CMQwlSTlejVueJOTGU/g0Q5oJQ5SB+JknXXzu9wXUcB81mgE+lawgi6wGw4ytJzP8tCjf26Bk42m3ZN/fW/iRxWWGpEnTPHbg+rGqmhNCLVfohLG+sdOPA4BHZ1/itZ0TAPBYCNK17KaVqGGagU0BMhaDsUgNRpkaxlEXcFJkz9f0vXzSB9VcGbmzKcOC0dkovYYtxIi/8WezCMeC56BjjQ44HMJJ7WKHf1IGUZQlYAbMwrZ5fy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J4Ze9zUeZ86WNjnfZLZVqr5mL6h/pEtzRWTng9B5IDY=;
 b=VpgHY9O52TMtwHlYE54B50z/itiJnG6zjrvfvD4oji9AaWt3TibdV4+aM/o8TRimWTE+dTcFyxfdPUP0kP0cEpudAdNeSGJG5xU4LCR6FspVPrtAVY8LfFOoXY1Zgexhvr1lyPiknYVMY+42Fcqy+zosHvYFo/mweNIyTUON5is=
Received: from MW4PR03CA0210.namprd03.prod.outlook.com (2603:10b6:303:b8::35)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Tue, 18 Apr
 2023 10:29:42 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::10) by MW4PR03CA0210.outlook.office365.com
 (2603:10b6:303:b8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.47 via Frontend
 Transport; Tue, 18 Apr 2023 10:29:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.20 via Frontend Transport; Tue, 18 Apr 2023 10:29:41 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 18 Apr
 2023 05:29:36 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 18 Apr 2023 05:29:04 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@amd.com>, <linux-clk@vger.kernel.org>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>,
        <krzysztof.kozlowski+dt@linaro.org>, <michal.simek@xilinx.com>
Subject: [PATCH v1 1/2] dt-bindings: clocking-wizard: add versal compatible
Date:   Tue, 18 Apr 2023 15:58:54 +0530
Message-ID: <20230418102855.6791-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
References: <20230418102855.6791-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: 471bb201-cb71-492a-52e7-08db3ff7d23e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wuWppzFhY85gmbWMt67gzxnYuqL9lT9n/JSlbXnPP2THxhLDQiH0Hrudiht9DOj2CGpiMXuXq203UhhGttytII4XyNtrkykZm2SAqyqtEA6nFWGq8YFK4LCf6qc3KEaT7YL3ApHR7XxJ2PCHkG92wYT4++rPN+ZFu61RsGIgnciLJBJDF0L5iv++zo0Harekk4AJnSYA9Ea1yfBwTYVjVi6EYdOab3uzZ939SZbE6E7cirH9v7YVEfxadIChyv/JS4q6LPymeh/O7ZegpPWB6jto2e0x1E4cznbilT/PMvbZuLOT/BTb3GJWnttIlz66gE7f1iF7yUJkaymYNkjksIkK5KunNQA0gs28pzrJjPfqEt4pQZo0UeBDOWVorRBkFGqd1/DFEloqE2VC4fSnNgrRwmTDfOd0t8kHEEVb89ddi7DZ5NCsgXyNAzj4tPfF1lA02c3fnL5js5edUotaT4EXBVFYhFEIkWib775foH6u++3bz91/bj/5fgBml8sDAT6iRJMfbhFsfjzMdubqSxD27wAf+ZJVqcxYrKqsyqiPIms8PKVhd4IQ4NpW0tf8W54rOFrh4X/ADGE1/AzCPwPNnlSol7uwTwpFVOnsVhLqHx3Lv/AXSgfp0/loBnm5fypd1X3vvAFS9LG7MdhJvU2F9a6OEpXn22UV0RbUaFQRFhLCAPWjBm1t1EHQlcvm4LC/u75zy3ZqJYuhgW33cTQSi7+loCNJ053wJu8GeUU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(36860700001)(336012)(4744005)(2906002)(82740400003)(5660300002)(36756003)(316002)(40460700003)(86362001)(44832011)(40480700001)(8676002)(8936002)(356005)(81166007)(6916009)(82310400005)(41300700001)(426003)(70586007)(54906003)(70206006)(83380400001)(2616005)(47076005)(26005)(1076003)(478600001)(6666004)(186003)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 10:29:41.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 471bb201-cb71-492a-52e7-08db3ff7d23e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the devicetree compatible for Versal clocking wizard.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index c1f04830a832..896e0bdee6d8 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -20,6 +20,7 @@ properties:
       - xlnx,clocking-wizard
       - xlnx,clocking-wizard-v5.2
       - xlnx,clocking-wizard-v6.0
+      - xlnx,versal-clk-wizard
 
 
   reg:
-- 
2.17.1

