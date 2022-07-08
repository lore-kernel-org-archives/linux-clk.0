Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D534C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jul 2022 10:41:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237440AbiGHKl2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jul 2022 06:41:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbiGHKl1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jul 2022 06:41:27 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0657E038;
        Fri,  8 Jul 2022 03:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DO5hPUBEG6ocWg+1+xQasAA37o9pl1qN/YZzG0tofb5ZSWnAIzlzYaDAV4sZ5k8N9H0jCujwiNLLo1KiyFjka0CU8nylS7JeYoxRMEuhauZExKwSUCzY9Bwhu/7ECgPIvB4xA34SFWlXSxMvFvWVEVP9ch4g5u7eZpY8qYAqeANY4ipIYzroBoTLUVk+7m0yuNetig6+ELh810rLM7xAUh9vJanyABBI8c7bUmMU6cPhJDZQ6T4nyNf7JVup+ecpkAWwM3OM22T3K05XXSsl2azeRYlNUZnhTkB66n1HYt5f/DaQQHwpLsPX81z+1gcNpOMuwDFEg4ROB3pUFTZrfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90MzNZc10A94jHqE6NRh124NIE8mwX4QghNfjB23utg=;
 b=FdDrD1J5eeR4XHlYV9b+reuQjuQnAd5u75Ub1CWYvMs2qeTkALNDQZSNvniUHZZ4iuD2BynbnCaIoi1Jr1igBFnrzTZbkXZM2PORbXgV9sB6yXtUn4CeGB1m8m1Bbv3yw6d7/Js1ZN7GL9Il4y6SBMP6EjoVtsNtTk05nnC7JtlOKlroibFfsPV/uUVv2MtMrMeOSr1g9ghehlS3EBuBVMK6+H/FT3Tm+DYc9Y6dmo7MGm7O3uTB519MdGvnyDSOefq0ha401TL4w6K/iZ7hNneULHnhcZfMEa2s+Uhb9lqJb3erKOlAX7WjVgMYzTj+YW/sPon0QzvRJZp1I/HSeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90MzNZc10A94jHqE6NRh124NIE8mwX4QghNfjB23utg=;
 b=Pke8lCNIaNnEQAFZtMLPd7BDlXSNYl55P0QoJ7bdKv0VQSOUQctXO/zaPlZ948TxofHuVL4XIlWbgXGJyAuE652MOINx2pSBShGKfj7ZXND3v9ssSe2cOex5YExorK2+JS5e/e+4rdBvkz8rD8r/BGw9S4g57JDoTczJ1AE6K38=
Received: from BN6PR13CA0066.namprd13.prod.outlook.com (2603:10b6:404:11::28)
 by SN6PR02MB4671.namprd02.prod.outlook.com (2603:10b6:805:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 10:41:23 +0000
Received: from BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:11:cafe::56) by BN6PR13CA0066.outlook.office365.com
 (2603:10b6:404:11::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 10:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT064.mail.protection.outlook.com (10.13.2.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 10:41:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 8 Jul 2022 03:41:16 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 8 Jul 2022 03:41:16 -0700
Envelope-to: git@xilinx.com,
 devicetree@vger.kernel.org,
 shubhrajyoti.datta@amd.com,
 linux-clk@vger.kernel.org,
 git@amd.com
Received: from [172.23.64.3] (port=53935 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o9lQB-0008OE-MW; Fri, 08 Jul 2022 03:41:16 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <devicetree@vger.kernel.org>
CC:     <git@xilinx.com>, <shubhrajyoti.datta@amd.com>,
        <linux-clk@vger.kernel.org>, <michal.simek@xilinx.com>,
        <git@amd.com>
Subject: [LINUX PATCH] dt-bindings: clock: versal: Remove alt_ref_clk from clock source
Date:   Fri, 8 Jul 2022 16:11:12 +0530
Message-ID: <1cbbf50917ef9d2e2bc2c8862cb8425d54959049.1657276107.git.shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e55b1f9-7854-4dcc-89e0-08da60ce670b
X-MS-TrafficTypeDiagnostic: SN6PR02MB4671:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D2oiLf2Mtf9+NbnGsgYMtqMgz8P/FbZuiWefR1jxGr5L6aqIWV4zlMYKmIFSHYvW4vkxelwVKcuxJYK4P/hE27/N7y6k8DmK+Cp7FKlfqp9mMDq1s6WWqyjmQD3s67ziu9gWA5nDIq6N/pYgYIcViHCkDOQfaQV2HSvBlTk4mwwpEm1hggN5cYXCYlsV+xBSYu9oNNgEDiC59ydVR0thm/bPPFrOYr7tJG1rqXmrnkosU6Y9/gpSU46+sihnZl8TUpLlG+YsffpFC9y7hqcGZbDEyUBxX8SuC9Qp1oamwrPhJfSauR4hKlI77Eb59O21az/7p4hetwaWb5UZaHXW5zFSDV50xVjIx08+uBZOMzEVPIz6oP0RiHkGbNIokuEfATUzuH3mt7yDfm1h2sEtXRuijVGJB4l+q723y6FWaUsJbbJr9zsqECEuAfYgKlk36njkX+9KkUrzwNQ/0R5AMYCqXlySgdOLeRtrsShwZYn9fxUEzhK3opbb4lD3nBCnSVHCyvgenX8C4314isRuVdb1M4R9ULeGY7123mNqcsiVgVs7VzLDSAdnKIzOs69lpzkmcw90EEyBsxyfEoCH458TiNSQr5A4G1sa1eYeRCdGAAmuViyGEngAs4dIE8W9TbMAupHQfGRKcL6bFSJuJll4qpqvl16DjFF/f42dU0L3kaARMgBpObRdxVPa7ledI/T+1e7+2KX9SUaPbgVZerVH6erije1TYGhfOWIR0K0AJbAdTf0HGWLSwieBi63gZk745rtGANYtv5xdfTrioGhUhKl9gP2p8hloX2OB85wixVsMEej60n/RjoClU0wHm/leU8vuajsNNsieAkb4+yKFbEFTL4Ic+GigWpyAHJ0qGbpGRsuSgyIpJtMwjQts
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(136003)(346002)(40470700004)(36840700001)(46966006)(40460700003)(36860700001)(8676002)(4326008)(70586007)(70206006)(5660300002)(41300700001)(356005)(478600001)(8936002)(6666004)(40480700001)(83380400001)(7696005)(26005)(44832011)(82740400003)(9786002)(2906002)(7636003)(316002)(426003)(966005)(47076005)(2616005)(82310400005)(336012)(186003)(6916009)(36756003)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 10:41:23.3435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e55b1f9-7854-4dcc-89e0-08da60ce670b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4671
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

alt_ref_clk is applicable only for PS extended version.
For PS base version there is no separate alt_ref_clk.
It is tied with ref_clk. The commit
2b2012d1c1d8 (clk: versal: Remove alt_ref_clk from clock sources)
removes the alt_ref_clk from the u-boot code but not the yaml.
Remove it from yaml as well.

Fixes: 026049cf37f2 ("clk: versal: Remove alt_ref_clk from clock sources")
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
u-boot commit refered
https://source.denx.de/u-boot/u-boot/-/commit/2b2012d1c1d8515417ba139339d0aa9b47789dca

 .../devicetree/bindings/clock/xlnx,versal-clk.yaml          | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index 229af98b1d30..59aaaffbdc9b 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -30,13 +30,11 @@ properties:
       clocks to the given clock controller.
     items:
       - description: reference clock
-      - description: alternate reference clock
       - description: alternate reference clock for programmable logic
 
   clock-names:
     items:
       - const: ref
-      - const: alt_ref
       - const: pl_alt_ref
 
 required:
@@ -56,8 +54,8 @@ examples:
         versal_clk: clock-controller {
           #clock-cells = <1>;
           compatible = "xlnx,versal-clk";
-          clocks = <&ref>, <&alt_ref>, <&pl_alt_ref>;
-          clock-names = "ref", "alt_ref", "pl_alt_ref";
+          clocks = <&ref>, <&pl_alt_ref>;
+          clock-names = "ref", "pl_alt_ref";
         };
       };
     };
-- 
2.17.1

