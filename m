Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54437C7EE31
	for <linux-clk@archiver.kernel.org>; Tue,  6 Jun 2023 10:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjFFKzP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Jun 2023 06:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237007AbjFFKyN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Jun 2023 06:54:13 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::61a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11ACD273D;
        Tue,  6 Jun 2023 03:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OBj8PzqhlxAi6EUD/dqkj04+9Zougngo+9nOVcDmVnEUHQLkFe738LbgvAD4IDtVgZmYUL+FQABfsOXKM8pJY8bL5ZYCsgclk+GiCv5RwhKHJnqtnjfobXJOQvPdm/kGlJ0BhD4aVElK54gPmNCV+3asHOFerQCI7uuV4N9RbJVriTrLFFwqXqajg0ZeO1Brq7msQQnhnWM3VuIMd3WQHRLK8OdPw1q6f2gMn/J5qTu172sTo4lggwm9kZYvb9lsqq5b+K5aYSS7tN20TyK8C2UDKFW6uYW+px6U3mcHWbuej6nJd7G3Uav8PhXZJiQ4c6tX5AvNcdEbuwkwIYkqvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELRAgOxs4uJmjzcYyeR4e4TnkSSlb1dWbXAOHywMCOU=;
 b=I3nOE2XNKx8c4N5WgwgcZGxufrX5kEwhGurjzAL+fDOTTiAyiFBJc2c0veJVb1JxFYpwnn6DpcbmPjliPM4EqjNuLq/JabWoa7KJNYYIrfvkhIuTCme6ccHss7vYV1qRv1MxRQsGjzTsxqSfcKq413DuEI1pJNfJXIoxX1I498UVzyywH/HAiSNswhyvR2hl97sD7bm4pLoS8Aoz6u44PmNF+x4ZDAytxscAW6+up0Nojx1/mHMOMgsPusRv88p6oDh6m7LlcNRyqkNqZvvH7l4hKgOHzrCXfDA4Xo1/xqX9HBi6glPFgnLttJHY+of8SaEPcS3FxsEpri381MLaSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELRAgOxs4uJmjzcYyeR4e4TnkSSlb1dWbXAOHywMCOU=;
 b=wvu57EubK9k2jmkgNgR6TZKfh1cntoLbLm0CB4rjcgMEkl1zFlZYZkBFy/H+8Cdczs7cGfSh5IGf2Ayoq0qo7sJhzX0GoYT4SvbWqU30s7dRZROuR71ZkrqzKoq6avlqXBnBdfRtK6DGC3XU0QSsEK8mBshVVNJNEJ6g2lFTk8g=
Received: from CYXPR02CA0060.namprd02.prod.outlook.com (2603:10b6:930:cd::7)
 by PH7PR12MB7453.namprd12.prod.outlook.com (2603:10b6:510:20a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 6 Jun
 2023 10:50:37 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:cd:cafe::62) by CYXPR02CA0060.outlook.office365.com
 (2603:10b6:930:cd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Tue, 6 Jun 2023 10:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.13 via Frontend Transport; Tue, 6 Jun 2023 10:50:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 05:50:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Jun
 2023 05:50:19 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Jun 2023 05:50:17 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <michal.simek@xilinx.com>, <mturquette@baylibre.com>
Subject: [PATCH v4 0/2] clocking-wizard: Added support for versal clocking wizard
Date:   Tue, 6 Jun 2023 16:20:14 +0530
Message-ID: <20230606105016.31364-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|PH7PR12MB7453:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d7eb71-dcd9-40ab-e3d1-08db667bdc3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rrrCu7TBKEyWNLDpqr1jpaxnUr9Y1GeSvQX3bQ48Ga97Pd4qSUyOy4llIHDZYTUqa0nRRzNywkoE/IPYVpMUcyOnnCoXEc/0y1OdjmaU8fwRSHn1ve37FUTZOKn4TYQf0Lva76EcvzcOs443IdbZIFrRMFVCEbB6veAwVnGUNG+sLXK2YRiQPRaElzzMVaSG+wfAggQBVtTtnwdK8cn5/VXnuiueIVmEcJYQidT9U+21+HvQr38nut48RXnFUkZYMj4LEzNYEvYZBbb8XANhyUbgqjVcLlxQawl2ARyO46bs6WuR7BVxDb9B+uc2F1mAbkzF4YtUG1C3sxqDYEp3tmqGrPdwXyEKvfUmUNv9Z7Jg32/hI4u3Jaomg1Zg0QrQBjNkBSUAVOGf1GntFqsN+Lz3lm1viON7ww5KQHfwinpQF1ag2QujENZBO5WpSogeQXldVlLOyL8sQ9PXIyWJ4QydLxagY7ZThMqZkLGEPdPrnbnmRiuKhymlSzRw6trobmxbw6jxpLAUw2WFYECU0d9Prcv9T1d42DefOC8pybM/NX68gtVjiuQix+g4Ucfi1CO7wp1BHcrpkB98hmgOdPBmPeqwCgfX8/a+6jGVrJRbABhmc5GdBAp1FlViE2rz/SjonTNHFE20UrM0xnsIojVO3IpZGb3b1V2nB3zeJ86O4IuEenbU0ZMHtY8Co/s86k6tYAaqnRTzq65S0TKyQZcbQXXbGLMZTgP1ltFzShtu7ofiFvnz5BU4742tIfqs/2ywXreRTX5cbxPU7Kg72QIbMlAt1wmJPsv/MDXO7w0=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(36860700001)(186003)(966005)(41300700001)(2616005)(26005)(426003)(83380400001)(336012)(1076003)(6666004)(47076005)(316002)(40460700003)(478600001)(54906003)(70206006)(356005)(82740400003)(81166007)(40480700001)(8676002)(82310400005)(5660300002)(4326008)(86362001)(44832011)(8936002)(6916009)(36756003)(2906002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 10:50:36.3992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d7eb71-dcd9-40ab-e3d1-08db667bdc3f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7453
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Add Versal clocking wizard IP driver support

The Versal clocking wizard is clock circuits customized to cater to
clocking requirements. It provides configurable number of outputs.

Datasheet link: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard


Changes in v4:
Add Ack and subject
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
 drivers/clk/xilinx/clk-xlnx-clock-wizard.c    | 507 ++++++++++++++----
 2 files changed, 403 insertions(+), 105 deletions(-)

-- 
2.17.1

