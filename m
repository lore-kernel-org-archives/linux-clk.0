Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A331C433DB
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:37:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 080F964FC0
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbhBEDhI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 22:37:08 -0500
Received: from mail-mw2nam12on2088.outbound.protection.outlook.com ([40.107.244.88]:44965
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230123AbhBEDgu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 22:36:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J0a4QJdlQWYxo3ID5OlvanHagfRONMONxrbEqvD2hRau0yf6qnPdTgQdRPWuEKw59sMCkAXLXCKLlZOvwGSP0faujS5kZFWIFJj6NTGx+u8CfTn/bBTpavgngFLTYqYMUwgd1Bxjfcy0vJHyyMPU13UITEV11tNPEeDabuZ7VxsmvUxDKZHIlij1nt3JXd6suug6uKwEL84CI3HyDs86MQva4Cqytmw7+gu6BGErnfkJGtHMb85RFqgbJmUOHM+YlP8qHag0F4VRC7Xug0xfeMOqfw1eUy2g16vDEKMvyVrfuNEsLETKJ3v5z4HthOA/gVD9dwPODcvC+geXo+7DWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIdPCqXaLIqQAA8x71+Q7Da05Tb+IFC5cGnNxqrjE1U=;
 b=GH1sZwx8ggBLtxfbXP5WF4TeKCgqU7hl9zIDpQpW/xhWjNafPJkkkoXm+ZJviVGgnuSS/OFWm53kltxQfhPZxY4mQa8ugVk8BcESQITt8SbP2BN9VWAJdRMkM452HpgS7m9xCDqWLR/AE+gHGQKq4djpTrIpBEQD3KogPsrf/0amlBNu5sCJ+ubuVkDrV/olGrDXXQNOQ2HnyK38+9X4mogW6+I6utZomIo06Lt0L5FIrBSNE+UCWSW8bj7vRmHcM+2BAfIzQ1aup9vFaLm+rtwWApu551vs7ISO8ySH6b2YBRAmXs91U+kwJHnnxSMvX3LZnAJomNtS27YmAd+s8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIdPCqXaLIqQAA8x71+Q7Da05Tb+IFC5cGnNxqrjE1U=;
 b=SVPK3NMN25de9aDTC86vSYg1VxC9u8BbYT7cBGJa0c/nfVpN2FbxpCbtbkWpN1KvqQuJ8Vmyt/RYC4iLDPb+WMUUHCx9JRtHRjCM2YdtXhcC8j39L77+0BMtWGzHyW8+SlM/ZqprWIKrOebK1EK4RMv9ZAn7/lei5z3kUxSRHAE=
Received: from SA0PR11CA0109.namprd11.prod.outlook.com (2603:10b6:806:d1::24)
 by SA2PR02MB7657.namprd02.prod.outlook.com (2603:10b6:806:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 03:35:51 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::10) by SA0PR11CA0109.outlook.office365.com
 (2603:10b6:806:d1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend
 Transport; Fri, 5 Feb 2021 03:35:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3784.12 via Frontend Transport; Fri, 5 Feb 2021 03:35:50 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 19:35:43 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 19:35:43 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org
Received: from [172.19.2.30] (port=57600 helo=xsjsaeedn50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <saeed.nowshadi@xilinx.com>)
        id 1l7ruH-0000iH-40; Thu, 04 Feb 2021 19:35:41 -0800
From:   Saeed Nowshadi <saeed.nowshadi@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <git-dev@xilinx.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
        "Michal Simek" <michal.simek@xilinx.com>
Subject: [PATCH 1/2] dt-bindings: clock: si570: Add 'silabs,skip-recall' property
Date:   Thu, 4 Feb 2021 19:35:03 -0800
Message-ID: <1612496104-3437-2-git-send-email-saeed.nowshadi@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com>
References: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93a79fb7-dc6f-41b1-69d1-08d8c9872293
X-MS-TrafficTypeDiagnostic: SA2PR02MB7657:
X-Microsoft-Antispam-PRVS: <SA2PR02MB7657076F4EFE8049CFF75784AFB29@SA2PR02MB7657.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k2dK8FnRXZLfzS3/WszhoeP7Wbe8u/T8vBIUvoq3vx8LAuGTRwxGmwYHBpAP0bkq2L01CLzIaBQZUiqp/V7LPvULMs1pZN3aMYKLdskwRhauoA+j/J75zkUtjqQcq0dQrwBK0koqp2wLOnj+aLwKFFDdZob3SobpdrVLRnnPzNyafZIfhqN3TWtjQ00iDjMoQzQCd1qWRP3x0+g5bOrwCghS+b4UdtbZUV9EhWt4mL88rTFN0OmlzOIATktQA46aTzt3o2FqKyTFRel3VACgjgkHLQXNq+Lm+1kpJaTJ+FHhwgAEFRbWb0QTeSxdmzBlBewbTfDR6DgGkNBbSwxfdU8+reSzmIMoGY06XEJnt9dFAn1WwGGIMfWPvs6BoswLPXpuasdllLCKGXhe9aW+0PtBL/ispTf5zXHUCG1noyKQuaHD92qtFDkG9j+a1YCYFsN+92NPjCWyUWm0dYb8wxIB/k5L0vYITmuC4h+Y5OL1xqj0Uwf3x/9eWD7ccsgqafLFIEvQiM2kU6nRWvk7lXIgagmVaCPm8qEug339/9v8V20dxPPhqNdGRW2wncA6N9ctdNuObT/Ew16H7FgAUefKqFVEfnnAbXhSSu7rUyKvPHQFov39VRETr/2M5QWQeQOpBoDpkiKjw/eV1JQ2IiixaVVf0Ty4jeh2GOzAGRHfbxCtE7rzDnUj24W/hv3f
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(46966006)(186003)(478600001)(107886003)(9786002)(4326008)(7636003)(26005)(36860700001)(83380400001)(2616005)(356005)(44832011)(2906002)(8676002)(47076005)(426003)(5660300002)(70206006)(82310400003)(36906005)(4744005)(8936002)(7696005)(36756003)(54906003)(316002)(70586007)(336012)(82740400003)(110136005)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 03:35:50.9969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a79fb7-dc6f-41b1-69d1-08d8c9872293
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7657
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add an optional property so the driver can skip calling the NVM->RAM
recall operation during probe().

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
---
 Documentation/devicetree/bindings/clock/silabs,si570.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/silabs,si570.txt b/Documentation/devicetree/bindings/clock/silabs,si570.txt
index 901935e..5dda17d 100644
--- a/Documentation/devicetree/bindings/clock/silabs,si570.txt
+++ b/Documentation/devicetree/bindings/clock/silabs,si570.txt
@@ -28,6 +28,8 @@ Optional properties:
  - clock-frequency: Output frequency to generate. This defines the output
 		    frequency set during boot. It can be reprogrammed during
 		    runtime through the common clock framework.
+ - silabs,skip-recall: Do not perform NVM->RAM recall operation. It will rely
+		       on hardware loading of RAM from NVM at power on.
 
 Example:
 	si570: clock-generator@5d {
-- 
2.7.4

