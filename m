Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC85E95A91
	for <linux-clk@archiver.kernel.org>; Mon,  9 Oct 2023 07:17:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345372AbjJIHR2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 03:17:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344984AbjJIHR1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 03:17:27 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32E8A4;
        Mon,  9 Oct 2023 00:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik3aVDiHLRb2Kd0gMrbmXoF9OsTLYUlU0rg7ApYrJHsjw42Lr2iDs2H2ZHPt23ivBGmcC4AXHm0XVRvGyWdTejJkreIlcrhC0+VeoHAboTWseKFqMISQ7OiAB6CKnZI1sRs1xFTce9WawbXdVQXfSVN3TNruFjjBYV8jVzhfnptZaxYrWiwZBGnJVO2/lzINsojyuuWXRXq+hihTFTdp/hFo2elZtZ/JZUM9Jng1q/fLH1a09NPGKblcwvzaT/52rmZFUKUlAeeRHXlaDDguCb9G4Ust5VmVPvSuBw7132jAqUZe+6VhZqWfeXgIRW4uBfa7ZA5s/SvktDy0s/bEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zndPdkoj2wT8zCmWAIo2I/EuhHbdxUgyMXxPrwxXE18=;
 b=kWSEKsD/Wb6pIUm3234b7ElYHAP4ACWtgYUlKFmvIannLuNJumyNJ87nOwghIUbx4FaI0oK2iLc44KPulZTxQRTGujUj+Ic+uglkhIzfjYnbR0/tcSQUMtG6lYqcuvNBkSsUws+lXCy38TjFZWEhXfB3Nyrof1T9nrRVbDmKuyBX4Sy4DQoObldkndtLYC95Frk/XugpA+zoXcK3UHZww/DKvABU7qekJc1DiyfUgL9+qAZoHRVyJr5H2wektulqFDb/s3Fz/Cck4e9K1Oc3DldTGH8Gg/JF0HTqpVUylGQTBC4tSsxODhZwG5V5xmgExf/Y449EsJ+laxJGbdMK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zndPdkoj2wT8zCmWAIo2I/EuhHbdxUgyMXxPrwxXE18=;
 b=clg4aUG4zraZYVsDlxn7+EFsVyExIM8e+iJya/y/GcnMFw6sZwkAJZPCf4tHHSipEJj1ZzqEsO70wFoCPDO5L7Xh8r2oYu4cB0xgFP4uMcKucT6DTGGuC/AX3pvI/nueCTtdw7WILykCIDlunoqioUiEkZ77GvFTRyOyKWKzrEs=
Received: from MWH0EPF00056D17.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:1b) by CYXPR12MB9386.namprd12.prod.outlook.com
 (2603:10b6:930:de::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 07:17:22 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2a01:111:f403:f807::1) by MWH0EPF00056D17.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.4 via Frontend
 Transport; Mon, 9 Oct 2023 07:17:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.2 via Frontend Transport; Mon, 9 Oct 2023 07:17:22 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 02:17:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 9 Oct
 2023 00:17:18 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 9 Oct 2023 02:17:16 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-clk@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>, <sboyd@kernel.org>,
        <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
        <robh+dt@kernel.org>, <conor+dt@kernel.org>, <michal.simek@amd.com>
Subject: [PATCH v7 1/2] dt-bindings: clock: xilinx: add versal compatible
Date:   Mon, 9 Oct 2023 12:47:11 +0530
Message-ID: <20231009071712.26469-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231009071712.26469-1-shubhrajyoti.datta@amd.com>
References: <20231009071712.26469-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|CYXPR12MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3a2278-7319-4001-5829-08dbc897c833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0d2nv468e9t/Q4goWlHfpIhze5cy7BOIsY02TmJe3D4HEvuJMSKGciCE/2vx2cpf/osa/LwpCS4fkNjafCj0vRbiSt8QJczk2Cj2uiHbqb2Md1DHrxO3sdEvmCM6xnMQwek6aE4218BDVEqtKAXURacI9OjlOxsqgDTtwJVmscbMpt34IuBCNLjYqNe6CdbRf20furKUWyOd5gxLeh0UrngujXHxBuGTh0qJl3wjhua/B0nRsUuK0uizdhjGM/EkIlgyN6RETuX5D77wv0MOcoYI8jDAKRpIkYadwNxqo5Gzo9BY+V9ML3gdArIOaLO+X16wOxzLLPT/G0lOBhL73FMnkCQ8pJCQtNT9Mq6vYWKluTA9siPo+pcM6rUCAOo0+pzvwaMMC79NP41b5vqpA7XNBFkBnyobu6dAVsvNF6N8sVbP8UGDu0cha03mC62w2jLxkrWa5RtYL/NxW/tFyS3Mpqxkndx/6r0Kx9kyDciyhhLh9NodI058sdKGyyPQ/TpG9t4FeP9SXH2FYDitlsf7MRHAej9o2bmeMvqzm9FjIK3N9ePZ1b5E53PGpg92hG5ZinavNbqly8Oaxqsox2+7Z/L4zeConvJZME+fe8kn9A6thOMw1zI7/DNtoIElMNHSfi8OoQ0rFTKbN48dXmFPr2mMRhxv6L9by/O01ipciqKx8u6p9jb6eWLKYmPD/v2O+r/uiotQ1LZs2h70tLpsaw4lrlEfnVwDtix0o25BdrHxS38vNvVfuloVB3fR7I8u12MCNiHUoFfYdQxeaQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(64100799003)(82310400011)(451199024)(186009)(1800799009)(46966006)(40470700004)(36840700001)(81166007)(356005)(86362001)(36756003)(40480700001)(2906002)(82740400003)(478600001)(4744005)(41300700001)(8936002)(5660300002)(4326008)(8676002)(6666004)(44832011)(83380400001)(426003)(336012)(2616005)(1076003)(40460700003)(36860700001)(70586007)(70206006)(54906003)(316002)(6916009)(26005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 07:17:22.5919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3a2278-7319-4001-5829-08dbc897c833
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9386
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the devicetree compatible for Versal clocking wizard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

---

(no changes since v4)

Changes in v4:
Add Ack and update subject

 .../devicetree/bindings/clock/xlnx,clocking-wizard.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index 02bd556bd91a..9d5324dc1027 100644
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

