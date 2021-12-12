Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8D7C433F5
	for <linux-clk@archiver.kernel.org>; Sun, 12 Dec 2021 18:06:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230472AbhLLSGh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Dec 2021 13:06:37 -0500
Received: from mail-bn7nam10on2069.outbound.protection.outlook.com ([40.107.92.69]:51872
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230468AbhLLSGh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 12 Dec 2021 13:06:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6rm9ouzyd5sOKdJrcmph+6HGGQzd/txuWwc63bvib+at0W0NDyPR4bd8kS0d3iwA52CZ/QfNNVPo4OY6dN+zNbnnFfau7Sb89KrUbJdSAK1n2OwR6iolUCrl0eIC8jWEIdSC+er50nsvhhqgkysXJPQIvrFWEMtG1UOIQHhv51S9H0WSBxa6ZVagz9gaMLCkKGqhdFGtb3sCmUBSatRA3bAGwUszwbgjKSn4rJzM4ytPyGqTAQKMWpeNP7mwoh6Mv4n+hg9BI87+wnM6+hEEbcEcE0OyiQ0Xy+4iC3xU1miRbZNrwvmdYvGfIEi1SVIvT2TrN7LfFYyTI//MJiIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lFaL0U10nTm+MxEpOd8rWCodw6RVoiIwUrCcRscsAc=;
 b=KLSAjpeXbm6dkTIBSS+JCPfuEYlQJfIJ2A7687xjKX3TnPG36wUajCOhIw76KUMedq8m//KVh3pu5LyAq2F9ff711LZpFMn/QDGkOBi/u1F8fx4qxQYI+J+UviGjQfhhRCB5DnlMIFegcMqp3rhIKafa4utEa7qvuMEoCh5yTNrs9Rgr7ky3tDBvx7ZZqNcuj6TX+sl3AKaWelLBObO4QLB8/EZjPF/q7rogCOL+tOzYOnIo7q4hhdf/Qs5DF0R6QHYQRQsn8lSt5ADwIzX1lcFyFm6L6xq8JU2Saj5Pq+Kr4dLrc1nP4tRcSBWMYEVU44ZTyLDpiId/PTOSkvzz/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lFaL0U10nTm+MxEpOd8rWCodw6RVoiIwUrCcRscsAc=;
 b=PiY9DyH8ELaGhILQ1CA5DRq5+IaOv+ZrMrSml/XPXPm5ohQCGpCwmv5kcXuAUD9sfTouTJHGdjBRy8U8XPHDcJqj0jFoOkAlpyH6E43TgWW3NUrOVbZJ0/9yyZVZsn/pW0rRw+DDPt8wJqLoShruBXnh7xhnmaCcMpBqbQxxoHk=
Received: from DM6PR18CA0032.namprd18.prod.outlook.com (2603:10b6:5:15b::45)
 by CH2PR12MB4937.namprd12.prod.outlook.com (2603:10b6:610:64::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Sun, 12 Dec
 2021 18:06:33 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:15b:cafe::bc) by DM6PR18CA0032.outlook.office365.com
 (2603:10b6:5:15b::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.12 via Frontend
 Transport; Sun, 12 Dec 2021 18:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4778.13 via Frontend Transport; Sun, 12 Dec 2021 18:06:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 12 Dec
 2021 12:06:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 12 Dec
 2021 12:06:32 -0600
Received: from chrome.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Sun, 12 Dec 2021 12:06:29 -0600
From:   Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
CC:     <Vijendar.Mukunda@amd.com>, <Alexander.Deucher@amd.com>,
        <Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
        <Mario.Limonciello@amd.com>,
        Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Subject: [PATCH v5 0/5] clk-fch: Add support for newer family of AMD's SOC
Date:   Sun, 12 Dec 2021 23:35:22 +0530
Message-ID: <20211212180527.1641362-1-AjitKumar.Pandey@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0e30beb-95ab-4209-6fac-08d9bd9a2167
X-MS-TrafficTypeDiagnostic: CH2PR12MB4937:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4937A47CE87BC8D98B8D88A882739@CH2PR12MB4937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNQygKajTRtlq3jvS6j30fAvvh/9g3F2mqxshhuz7253h/DZICneSIXWJsGs/sX7PziGJb9KokHHa8cO4dpidTVw6Lu1YlLkwSFyW4BPedjPT0qCcm97fyZlkxA6R6EvNg2UFUqy/+vSb4+urM8l+u2fZQJD+CR5WWbBcXqq9Gn4PGm3lgNRnw91pRUI2UPGnpENeRcrvzyUWS9pTg2cE3G9n80HLSv5O7JYxj6SW6naVn3tUGXy71xxEXBHX8ydc7RPklX0fMCQFer8qJ/fkUVjuX6XsE8kof3kSDRukxyD2Fw4n6THDcYod+O8bkjAg3y5G14Q+fUEOY/WsPFMksK73+vj7iNROGp1sJ1v4S/sZo6+wGSNjpcHT/w5Uyic34u8eRm//aRTtBv3Bhd3EMlHg4tJ9ulO3nbOtkbBSeabueapvTI5EDiMNCEmiG5CCFE6du1rYxik/8DvWFDkMHmfqQ6k/R8x8Srt+A3bjKmfnurW2vfm+HMv92hlmMUKjJgDFURHnfi17ojVXjFf0Dg7gTmOJ0sZS+4hLBzzaDsGALHP0HpV0VVLeXSsDEi15/cZN67+GCy9FOlYZ7A0XB1TDn+w8tDc+3jy4DWnaMJEEKAsWff4enK2wrsmoMCc71BygqL0Gs6XL3lDrdodZK4Tor5JolvQPpsRtBlHviJvmPMG2xWGH14AGraWrduiUkW3hc/2Pkj/xYZinr6qtF/RF0n0BOo9vjwwKfNNutcSXjinpo9ERO+puUptwDWKNldNmALhRVAEyRWpaSG3QKGVclay29cGJdGt+72j2iA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(426003)(36756003)(81166007)(2616005)(1076003)(54906003)(8676002)(6666004)(82310400004)(336012)(40460700001)(110136005)(2906002)(4744005)(7696005)(70206006)(5660300002)(70586007)(316002)(86362001)(8936002)(508600001)(4326008)(47076005)(26005)(36860700001)(356005)(83380400001)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2021 18:06:33.1603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e30beb-95ab-4209-6fac-08d9bd9a2167
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4937
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

changes since v4:
- PATCH 1/5: Revert pci id check with default support for newer ASIC
- Drop [PATCH 6/7] and [PATCH 7/7] as not required with newer logic   

Ajit Kumar Pandey (5):
  x86: clk: clk-fch: Add support for newer family of AMD's SOC
  drivers: acpi: acpi_apd: Remove unused device property "is-rv"
  ACPI: APD: Add a fmw property clk-name
  clk: x86: Use dynamic con_id string during clk registration
  clk: x86: Fix clk_gate_flags for RV_CLK_GATE

 drivers/acpi/acpi_apd.c               | 11 ++++--
 drivers/clk/x86/clk-fch.c             | 48 +++++++++++++++++++--------
 include/linux/platform_data/clk-fch.h |  2 +-
 3 files changed, 44 insertions(+), 17 deletions(-)

-- 
2.25.1

