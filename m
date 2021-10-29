Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460F5C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 257336103B
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbhJ2GfV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 02:35:21 -0400
Received: from mail-mw2nam08on2075.outbound.protection.outlook.com ([40.107.101.75]:24352
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231964AbhJ2GfU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 02:35:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q26Qw8NA8twHj7n5ylHbjXNmXZUM2QqyZe0j9zIXD16SoyqF7kmN7f4pAwvKU2wANyQz0AufiEKnGCTFfXZNlnGlF99myn+XXw3sBCcPU3FyOAkM+yq0Y4yrXKw3imVxF7JO3okRPBeGN0OSw5YTRdrueHBIw7U3T/BAn13XPO/9ha3dcViFPqt1y7PA8ZeWlgGvIIXcfauI+3UROFlb98gKhBFvQZWL6xzJcjbJUFVp5sT/kEr8jiOZkIR85JhDeBWiXdN307sQbkELk5aOuQKJm87M0gHFZkYnEFaTW2jPhy2QZ/Z4/ROgws4DVppryfl7OBIRoQCs75jWYkifnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMkJcQpQjZh/Wykfi+cDOg40OYwR2GIEUrUoY+y1QUU=;
 b=Q8GwG8GMq7y2RmLHNIwTrxWv6Nty9uWY1cG7zZZ1fCpVtwgBFo1SKYDefkFfJtOQkLrW5fdKdIXYThFxTzZLU4CRXh0cb6vCFAXCtgYnrIPyynrMmqpHra42xqI5u9CN2LF+xuZWzPF1ZSJYHFlLQr4qqH/qmXbGESRfT3Ai+IhrnOTJ43akR9tDHDhhyrjNZTPNfIccvVBl8iS0mYjjMxr4zTsTOP/XOVls/mkDQ0ixohc2cwnDD95tbpYDoAt0XtYy8FOIAHdxuQ6lHMhevS79PYy3XvucJGyHfNuU3+QC9eYfZaSrGj3RDQ+lSfTP6+nyrFvsQfmPkyA1R9vRew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMkJcQpQjZh/Wykfi+cDOg40OYwR2GIEUrUoY+y1QUU=;
 b=MxLM4n6kIsfL1EqArmVy06yR82JRsiy2rGc226SacIZKnIhjCwQRZ6cO+K5MCTGctOw+Z6wB2g4l0hjkZWU+g6l/v0j+Phpw/f2FxV5cUnxBoTdcH/tO85UHEmqCJYXVyCX48+SMI+Eg6ncUxcV/adLsLWk81vfrWn/aBD36hUA=
Received: from MWHPR22CA0064.namprd22.prod.outlook.com (2603:10b6:300:12a::26)
 by SN1PR12MB2494.namprd12.prod.outlook.com (2603:10b6:802:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Fri, 29 Oct
 2021 06:32:50 +0000
Received: from CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:12a:cafe::92) by MWHPR22CA0064.outlook.office365.com
 (2603:10b6:300:12a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Fri, 29 Oct 2021 06:32:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT056.mail.protection.outlook.com (10.13.175.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4649.14 via Frontend Transport; Fri, 29 Oct 2021 06:32:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 01:32:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 01:32:48 -0500
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2308.15 via Frontend
 Transport; Fri, 29 Oct 2021 01:32:46 -0500
From:   Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
CC:     <Vijendar.Mukunda@amd.com>, <Alexander.Deucher@amd.com>,
        <Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
        "Ajit Kumar Pandey" <AjitKumar.Pandey@amd.com>
Subject: [PATCH v2 RESEND 0/5] x86: clk: Add config option to enable 48MHz fixed fch clk
Date:   Fri, 29 Oct 2021 12:02:23 +0530
Message-ID: <20211029063228.578909-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4973c738-0f07-4466-fc4f-08d99aa5edb1
X-MS-TrafficTypeDiagnostic: SN1PR12MB2494:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2494CA9449191DD3DEFD965882879@SN1PR12MB2494.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 41459SyNH92289+hfSQ662/XckrAarrRuFl7ymMHc0ar5DhLX7g5VpVLOlhaEEaxZU4yo0olHqRn85tCJmm5IJUVqRkir+9b7wWlaL73SvT/FQF4SCvOUjA6B7g1b1TqLP0Ab3pHntv0wVUh/9wXrkrI+6jPbYEjLeIIek/fKH6sVDFol6jw6Zjpk1G0SWW8onsD9PULrULP1QUpox4WZ/u3lSnCtvbS8VO5To/w+N0NkjuRV+yDSOEzraxIT17Q0NQwR+otbQXlG4+9vMH1FcQu3l5kBie/ycgd6vHVl5IFmjj6Nfd2fFg2IMEsVJuR45q6ajjSfYvlbhD7h7LyaO9tso0RB1e/5q41gr0u4UTwrNcHl1irID8X4kUch/dJHofH+cb5JQZxJe9Z9r15z+wOS1UGM/BT1Nqp4mLNIKNhnOz3KJZOM9RScHStaPOg6AzsVlqj/2bsIm3ZGOcldJOgfDcaupzrS6pzXPfjOUuP4usB7ze02TG7T1Ys/4XpmPOB2EO5MuDNP7sl5Lj79/PPnb+6vTn7dl53dHqlGGD2WwHx0sEssmB1fVQR9HMH0TrBnqnhaiVCoKk9/KPOds1SUl9vMqAUWk5mdJSWvZL2r42/XVU31Ltbr/RowgVGug/rx/xXTX+f4fM6Ns9zqVXg6dPdAay2yZkNRAuXaqrYy/7zXfUAk1JXXrWdLK7mNFBDu/VeCYruyIEgMPbCUqrZXueet4s6ZHyEjvX1unw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(6666004)(81166007)(336012)(508600001)(2906002)(4326008)(54906003)(47076005)(110136005)(82310400003)(5660300002)(186003)(316002)(356005)(426003)(70586007)(7696005)(1076003)(4744005)(70206006)(36756003)(36860700001)(8676002)(86362001)(8936002)(2616005)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2021 06:32:49.6212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4973c738-0f07-4466-fc4f-08d99aa5edb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2494
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

changes since v1:
- Remove unsused variable

Ajit Kumar Pandey (5):
  x86: clk: Add config option to enable 48MHz fixed fch clk
  drivers: acpi: acpi_apd: Remove unused device property "is-rv"
  ACPI: APD: Add a fmw property clk-name
  clk: x86: Use dynamic con_id string during clk registration
  clk: x86: Fix clk_gate_flags for RV_CLK_GATE

 drivers/acpi/acpi_apd.c               | 11 +++++++++--
 drivers/clk/x86/Kconfig               |  5 +++++
 drivers/clk/x86/clk-fch.c             | 26 +++++++++++++-------------
 include/linux/platform_data/clk-fch.h |  2 +-
 4 files changed, 28 insertions(+), 16 deletions(-)

-- 
2.25.1

