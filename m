Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFCBC433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 08:04:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiI3IEK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 04:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbiI3IEJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 04:04:09 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD051F7EE2;
        Fri, 30 Sep 2022 01:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHASLVd3Tid21qEA6w19xMg1I3MbALO+eMkjtQNJxpb1JVJeRlWdUCOPFmZQj51Qebw7DEqdUEpJFZf2PnwZBsF+SkJkMnDEXRQzRnrnr9UFpNkIjACZg1zclrPalgQC9aW8G+qqqTdvXkSMUor0HMFC8AKyIrvqQzwErYpKIPby5pL+OpfpUZGN4AhAt4hN0ujeM0EinBGbFZgO1rN1MGeYbewHli4lFweQTBDynCX2UYmnX+l1v60GNt7hY7Z9NeUJSZ6Wg7ZaacptgMGRT5IazYxHmjKI7OSknx8zZbqq6GK5zo92hXprw8hLkc/cn6VTjKPdacB7/ZlZGTMTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQevmAJLY131BZcOKlIU5IGPcbgBGlvuuPUZLE7UKiQ=;
 b=l3MFygaNm16YIbaa0cmYudq/amYikxC4IwTZGaSr9LeN/TEJMW7HMHFtSZ2A6zpp1LVEdUgp2mD7Q7HkiqegcIWsDbs07c492Gh2w86YztHW0lIuz/ez7W6U99O39gBi8DhYi8h3EX5DAgItT0wtMK5gggD2jdKlUsRGY2xi3nVGKcpcbCstffmdMhtYRATzgz8zt/hBdTzurYDBqJnlLmx6kXYgOIKYSezrm7H4Q81T+ex7PYbESY520m9rl+IJwz0kbOK74YA7mz3xzVGkSsLjGVE7nNAOwDwUjbuZ4+/Kw9ncQhm9K0nJfv772qi2mG7VTjlrlIAskwZo2ajfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rQevmAJLY131BZcOKlIU5IGPcbgBGlvuuPUZLE7UKiQ=;
 b=N8NgqdNc168fSC0Eo473rr5c8b/C/s4oLVHfl/IaTMJFiToXPZ0DE6hOthB9mDwKcqQx32JrW1EbLxF/LiFQaIpnvnj5NdiRMt0ytedBgifQMk2UEJ9mOYSsFajZPQVTEy5mNYl7wreo6tfiWVH/btm5sP42aIp7ZGv+pLFhmoc=
Received: from BL1PR13CA0220.namprd13.prod.outlook.com (2603:10b6:208:2bf::15)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Fri, 30 Sep
 2022 08:04:06 +0000
Received: from BL02EPF0000C408.namprd05.prod.outlook.com
 (2603:10b6:208:2bf:cafe::49) by BL1PR13CA0220.outlook.office365.com
 (2603:10b6:208:2bf::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Fri, 30 Sep 2022 08:04:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000C408.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.13 via Frontend Transport; Fri, 30 Sep 2022 08:04:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 03:04:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 30 Sep
 2022 03:04:04 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 30 Sep 2022 03:04:01 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <sboyd@kernel.org>, <mturquette@baylibre.com>
Subject: [PATCH 0/2] clocking-wizard: Add versal clocking wizard support
Date:   Fri, 30 Sep 2022 13:33:58 +0530
Message-ID: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C408:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3a0881-3635-4016-853b-08daa2ba5841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ta5GsGMVI8MQFT3a1l9xHELP8dI3r1LgcCUol/ILTADcREDigxLyT4AHGpD6WpbwzqGLAR1c0xu8tH/ByuwtPk+XBKve955yW8A1PWnpocRSHM6buVk1gHzI6VYb0P/XHsCoWfZQcTvbTu/kktKI6mnPJegJgEhoGQuwe27/gvfl0AiCLWMNlKITk7aS+G3yIJST8nKzaGPlJ7m7O8FHNdZGDt95XSt+RPknvAvv5KgrQXto+WdhgjWqMTcFwRdXD+60AyupJc2XxL0DkoEF29Ouko/skqvHp08tTzquDgmYSzhU2XDNeeCJfmUNwoDYmop884SnZcGYqCbWJ3BiQ5GO3Oeemr1YMf+z7KGjpb/Jy36bH12BhEi7j4otQys20zU1txkdgAuVstN7NLFVTTw/goQFErVRsojJUm9rn1w8sa6bkOmCjQzhwc7/qPdV1Z4I68XVW2JSRdyl+uorKTGl4/iiRxLNrufv/OVzHIzpKhwzmc99aED774bCwLWzFurBrgcnq6Sq7hW+kbx/lbunAta5uAflV99eAuZ+IF9bwzsMmzZVUvprFv3XpPXYxSRXSGkRltxqwIK+IOj1hL3hZQ9Q09OlTw2EFruaVES4AwkwjtPsJb1DZ+aOPqNlStNGrRxhREr31yhuqR89TmMklPjHyBXeH9gJC6vS5mSrEgxHkyWYI2wADg6uS5LahJJ73qiDVEK/5dBZ26SwE1P4kuXmLg8i3TmIBPbp5npAPUVBKJImU/ZO7N1EGOdqsctp+KWtblFZhk3RstZUbKmFqhOke+8wxaGImOfF55AXz7+/qF9RkBrN8J5eDE5ZB5SogR+LZfgGWK5a0IOweQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(86362001)(4326008)(81166007)(36756003)(36860700001)(356005)(82740400003)(186003)(1076003)(336012)(40460700003)(82310400005)(26005)(5660300002)(4744005)(40480700001)(41300700001)(478600001)(44832011)(966005)(47076005)(426003)(6666004)(316002)(2616005)(70586007)(83380400001)(2906002)(54906003)(70206006)(6916009)(8676002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 08:04:05.3868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3a0881-3635-4016-853b-08daa2ba5841
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C408.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Add Versal clocking wizard IP driver support

The Versal clocking wizard is clock circuits customized to cater to
clocking requirements. It provides configurable number of outputs.

Datasheet: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard


Shubhrajyoti Datta (2):
  dt-bindings: clk: Add binding for versal clocking wizard
  clocking-wizard: Add versal clocking wizard support

 .../bindings/clock/xlnx,clk-wizard.yaml       |  66 ++
 drivers/clk/xilinx/Kconfig                    |  13 +
 drivers/clk/xilinx/Makefile                   |   1 +
 drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c  | 740 ++++++++++++++++++
 4 files changed, 820 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clk-wizard.yaml
 create mode 100644 drivers/clk/xilinx/clk-xlnx-clock-wizard-v.c

-- 
2.17.1

