Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33150E95A91
	for <linux-clk@archiver.kernel.org>; Mon,  9 Oct 2023 07:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345305AbjJIHRZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 03:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344984AbjJIHRY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 03:17:24 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2064.outbound.protection.outlook.com [40.107.220.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E4E94;
        Mon,  9 Oct 2023 00:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FL2LAaz+WXGvGMUhcvOGQEdO5EOejsp2+Jt9jqt9sHKxMaIndcfloFe5MpdLk51agLj9Nk7Zu8+eXMUa099cFg90c0tiJlYzsjFzs0/WMiILnBQiLzj+KCkNG9bWMj04kk+n3xDTeHIFC2YDztua6vhTZjYI3EItSma7gbTzR1Is2LbxokE+/t4Q0RVg1y6BWOn8r/XxROlelF7BtrGDQnXlNvjb0nfS47s0+2zXVxsnIQMtwx1CaGTStRCnPI7kCLemo/Z4AsFbXQZhsH7+MeycBoF7uxa1RVamMdNvCI77+5MIX1af3NpGP2flvjHl6mwHqe8NzoLpJqU4+PeWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1sbFrf8B8Vy8B9FsGdnuqN9IOo4kNajPWZr3sCS2aE=;
 b=gF2d0vOnb8zFOwcEFgCNU8SwP2A7+0Kr9P3HaC/RTje9fSQZe6YwiwEMtpBgc/n6k7UvWv8R5n+IFSg/IH3/lorpfW+6KT8O1Yh+EFK2tgKzQ6vqsCGKYVGAz059EL0XGUfwxMxhVVb8i8SR2vlPCoGNlb9bR5UWPzdSm5POY5I73ivBynJe1kt/b5wbhpb1NUk//TzdPY3hid7ocWHYd8xE3+Is+vzxUC8IIukWkPe77atFKCnwwPYRd1x7E6kykOEpuXL95kK3goHEZEhfExbYNFYziVY1YhU/SnKYevBDcLtZScZ6PaE99S59bD4WpBoICecu3U983tbNy8JisQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1sbFrf8B8Vy8B9FsGdnuqN9IOo4kNajPWZr3sCS2aE=;
 b=ucxlvaEZv4i1Df4xeO92lWD1NpZ3AKZ1NLdQ5Hu3Da2fbyXAxlZUSuTlr6qzOEV4qcG9yHQVOaoCDid5CBEpgJ+9QbFmZICaOQP1EKbJhGLkCWMrYFa1nm8KQdRr2QmIl51CfvWlpQdj0GnB+VvRgENB2Ng3Fq6n+pA2BSgW190=
Received: from MW4PR04CA0378.namprd04.prod.outlook.com (2603:10b6:303:81::23)
 by CH0PR12MB8487.namprd12.prod.outlook.com (2603:10b6:610:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.34; Mon, 9 Oct
 2023 07:17:20 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::ba) by MW4PR04CA0378.outlook.office365.com
 (2603:10b6:303:81::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36 via Frontend
 Transport; Mon, 9 Oct 2023 07:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Mon, 9 Oct 2023 07:17:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 02:17:15 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 02:17:13 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>, <sboyd@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH v7 0/2] clocking-wizard: Added support for versal clocking wizard
Date:   Mon, 9 Oct 2023 12:47:10 +0530
Message-ID: <20231009071712.26469-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|CH0PR12MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: 30457765-ef24-43b9-fa56-08dbc897c66e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZePIHPc9YI5UIMxpdSA2HKNv9GIP2ih8psiNQkODPi0gy8FIlrPsmTGBpHHrASajPKo9xzZLO/7lVEYlEvD9XVJ1YTNX3lSDaPCQIWTPpF8NGR+f97TWW/Ghjg66h6cVqcGqgBTHd5a7lqJlEJgKJUGJW3p/lEM3PprplmUaZVc+hPCK/mYOFvgew9Ke+5ba5fm8fbPCTN+9vUGPNXUoNET7mw4bBvcL755eKYCQH0rCxY6lYHFZUgGOO5p/ivWBtR3dhcmIHB+ypP0KIVltFsvV5PuWepEFwcWJ5cz4Ocr41P0wD8YftsM7i7fB/xkG4pqFwKueEZSc7gRNqcvYhQKSFCdk70TKpzpxqLOPcyDbBAHwltfLGHDwKPWdg4w+rgEk3GoPyuUCRi7evy7zgptSbQ6epxInWoC4vrGik0FsaL0PlKTGYk00iYzsGWHvSUSfWH4trVgjwgFBMY3lZYBPsZT+x6ezi9YHs8bgi9vm8nZB2aZD5ouHJpSPcrECAyW1j4mOxyv8KShf7L6nI3vvpYMJXlYih8bF8R0NpK2ChJ+3RvSetPSe+DrG2yG0HGPynFtAa8abRnAjZrIbeeWxMu4bAQSxb8eekbPOGbcDoqwTcCkQzDJV2xN/v02ynSEZ0azqpNCeexgmNtDeGd8ASMNSzvBdBFdS296viSqiqOavuHETY2nsX2mEaW+2LGDsUhrzjCr6aHcbuzznyLvUucT/2nPjFX+w0Eu7XcFgDTlizNfiaGJthqq+MccVTrk7EZX11+AsX+G7bKrlxvCborMK5TdDqE68HbAzGO8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(81166007)(356005)(86362001)(36756003)(40480700001)(2906002)(966005)(82740400003)(478600001)(41300700001)(8936002)(5660300002)(4326008)(8676002)(44832011)(83380400001)(1076003)(426003)(336012)(2616005)(40460700003)(36860700001)(316002)(70586007)(70206006)(54906003)(6916009)(26005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 07:17:19.6117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30457765-ef24-43b9-fa56-08dbc897c66e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8487
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Add Versal clocking wizard IP driver support

The Versal clocking wizard is clock circuits customized to cater to
clocking requirements. It provides configurable number of outputs.

Datasheet link: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard


Changes in v7:
Remove the unused variables

Changes in v6:
Update the commit message
Remove the closes tag

Changes in v5:
Update the commit message
register separate clock ops for versal
use device match data

Changes in v4:
Add Ack and update subject
Update changelog
Fix warn
Previously we had tried to upstream [1] separate driver for
clocking wizard. It was decided to add support to the current
driver. So abandoning the series.
[1] https://lore.kernel.org/all/20221122121255.6823-1-shubhrajyoti.datta@amd.com/

Changes in v3:
rename the clocks to clk_in1 and s_axi_clk dt
rename the clocks to clk_in1 and s_axi_clk in driver

Changes in v2:
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in dt
rename the clocks clk_in1 to in1 and s_axi_clk to s_axi in driver
update the warn
Update the compatible to reflect versal

Shubhrajyoti Datta (2):
  dt-bindings: clock: xilinx: add versal compatible
  clocking-wizard: Add support for versal clocking wizard

 .../bindings/clock/xlnx,clocking-wizard.yaml  |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 626 +++++++++++++++---
 2 files changed, 536 insertions(+), 91 deletions(-)

-- 
2.17.1

