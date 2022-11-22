Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88352C43217
	for <linux-clk@archiver.kernel.org>; Tue, 22 Nov 2022 12:14:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbiKVMON (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 07:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbiKVMOK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 07:14:10 -0500
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7905A12D3B;
        Tue, 22 Nov 2022 04:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQ3sHfDiAZwYfmyL/yrPmwMGw+rBXdpW5MuEB5hqp4Hqa2LG/ZroMzrFtQr0gefIQRIthi090oc5afawV5i7x3Q98gwBLsphOJZi1HJAPTBUYQRknJYhrHLI2ZKeAMiTYPa5hP3DgjUl9KMJazB5RFhkOrtzkq5J6kwLL4U1gA7ryDV7jDgjIKK2+blgMW0Xfqym44LkO8YqVAQJgaNFhlsAQa8FGx8mUUSa6v9YQVhpaaACPS3r9ntPrK2zqGeEmshzhaghT9JCub6nxXcLLkoGB332jy5qkQE+FV9bF1mGaQlwq4n3YcCE4vGouvpjvEGVuT0bUwliQ5yvLxeEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJIvbq1Vb6T3+WO+j7GVlP7E6z8WEf30hailPYcbsm8=;
 b=T2ubjSc13y3HhgpctPg2RTIvZgGqwduWU8N0LHngZUNKVrmhwXPZUnIngjFjxWeuyuMbrmqG3CNWpp/x3KV20OENpm/fM8zDa/4DEVXQcLNS/VeS6LqvYnN4+GtHbimglalopiEnvlwaKyVkh58UuS5G5eSj+kKCRpFtA2FY1pxhFNhQrezazAQfd3g62yBvs8d/vRIdV7MbJMLi8a0vEOSVy5eaOD3Uha8y3TzHOiFS+HQWf0NXqPWTjJgTEuD2W0Nahq2+gyw6v3sgSrOfXgiVf6THUons6ZtuPo71UUOOxhi7ZDqXcqToEZjvOK/hEesK4I0hKs7iZQ+JbL48vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJIvbq1Vb6T3+WO+j7GVlP7E6z8WEf30hailPYcbsm8=;
 b=M2CQS4UMB9a4Xq7c95etd7uIBjsRTZ9wDJvzXlFYIULkALmasvPMDPGvjv2YDDORt3faqA5dLg9SI11oR35xbwoSRQLXFFpEa8l0JM3T6FlG09DFYNNB2e28waLeRd90GB48W6L7u2zajhQLce9tnTaftqI1IiCAaHz2/9bimjY=
Received: from BN9PR03CA0063.namprd03.prod.outlook.com (2603:10b6:408:fc::8)
 by LV2PR12MB5918.namprd12.prod.outlook.com (2603:10b6:408:174::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 12:14:04 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::fa) by BN9PR03CA0063.outlook.office365.com
 (2603:10b6:408:fc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15 via Frontend
 Transport; Tue, 22 Nov 2022 12:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Tue, 22 Nov 2022 12:14:04 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 22 Nov
 2022 06:13:23 -0600
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 22 Nov 2022 06:13:21 -0600
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <michal.simek@xilinx.com>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH v3 0/2] clocking-wizard: Add versal clocking wizard support
Date:   Tue, 22 Nov 2022 17:42:53 +0530
Message-ID: <20221122121255.6823-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT006:EE_|LV2PR12MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7fe1c6-fbd2-41ae-f34d-08dacc830c3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8kaS6ynWUvIPHDrDa1OGwYgkchwYvEhc5evY2JnxZ294F44wPuvnQzzn/3rR9I7JcB1M/GPInX/ikFwlvguXlCKS0vq6Uei3B+bEaKZm/GDtrtXg1qCSBP6Ovms2gXZIWrkFaEwm/UrR4xHwKWs2j1nWUo0xlJir7Hah1XFBGPYA1eq1O1fZtd3KO5RHodxwQcIIjPkoJlnJ2C5PbJqjrZ3FPbHpRk796lOZ4uqXJwdBHeiUKlUrTkgOSVqdRWFCdGW9xurQ1BzNKFfrA2s/raCje+atUVFMIe0gPABUey0jhqsGjbNORc4uLyVCcTiSPUOvd6F5izhJAxv69V7bCMAVpRYeUfeVBMGLabXJP3uMc+bPg753GnODXpTv5+4TuHXPrmHGMkz8AAbDcTbsVpNmwVUdH6QX3kgG8Irxc4pvTewKq7ziX3/4SN0BKCMRQhArYPF3ucPVV8QNvh3Bsld4J3dXlkY7wAotGcF5hLjzhasF1Yb1uajQCMH5Xm+4fJv3+X0Yd65YwKu3BUGyNZoV/SngLZzxzfUU657Krovx7PcH+LNB9lxsbbITu/KhhoRaQHDJ/RBIqggpeK58KFlrguYpdzEy1ydLV5EX/SJAYgLcGnO679NWl+IDPtCoUJehNUc/bvawrt/CASMfZ0yUPeoN8etPuRvJDvM/99qlwEjMvWxJePp/cAX1e4A+BXAZM+iDNyNKMgAze91HRpva4IK4t12fZ6dTVQBO1buZadxjbkk4jW6xoAywvrtbKzbxGdTfrDtWKh0ealM5g==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(36756003)(82740400003)(2906002)(41300700001)(356005)(81166007)(44832011)(47076005)(83380400001)(426003)(36860700001)(86362001)(4326008)(8676002)(316002)(70586007)(478600001)(70206006)(26005)(186003)(1076003)(336012)(966005)(6916009)(54906003)(5660300002)(8936002)(82310400005)(2616005)(40460700003)(40480700001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 12:14:04.4177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7fe1c6-fbd2-41ae-f34d-08dacc830c3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Add Versal clocking wizard IP driver support

The Versal clocking wizard is clock circuits customized to cater to
clocking requirements. It provides configurable number of outputs.

Datasheet: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard

Changes in v3:
rename the clocks to clk_in1 and s_axi_clk dt
rename the clocks to clk_in1 and s_axi_clk in driver

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

