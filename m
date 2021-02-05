Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58930C433DB
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:37:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A70964FBE
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 03:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbhBEDgy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 22:36:54 -0500
Received: from mail-co1nam11on2071.outbound.protection.outlook.com ([40.107.220.71]:22880
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229841AbhBEDgu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 4 Feb 2021 22:36:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2L81WYLORq8Non/HlCByOxJBasHU1E1insDm9bWI0jhuH0i3N8aZKX4zpxnb6X+1ZBe0o8HaALxsrtey39sdZ6nqvcJWTxtJ7QX2rTYHqSgZgDM5tmqOFlYaogkD7ptZpkq2rX404bTFZJ7MCuE8CMMwUSkH8jVLtJRkEZxeD1pa5omkH3w061VsbEJrFHTKVZbXlwcaooRHkZaowiodHPUMW5f/5eZV6bf99bwQHK3snq5QgCArPeVtJ2rFUyJ7Qp5hwfZZ/6cuRSMW59HUJ6ixqZikA58GwN4HGJerD96CG90I6lKKdgBD8cgP+jY/mAT9orRH/JdSSJjn3oc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlGDE0TZ9mOzHkiI+gO6ciZ9DmhTp41LMafBs74nwds=;
 b=YS+GLGf6yKP/a8QLacY94BjDNuhvGWitDH/CyNqT5g7BSpANThDt1Trxo34AaxJAtm3NEsJQXMRK4V1m2AGGOcDEwPv9iAds/y/NiPHhMJoZD9VjYwiO38i1EZrZ1j72qQDeKCiu9ADewUnEotSTshFEvw1KqL+9COCReKYaPLQrldEy0skBuYGZ1RjXBUyW64fgcUD0yYKxlrt7WW9OXnq+cNErpPHBP0XoTbgZDdqfpvjkpuL7f1TtjbLXex4aNliCy/J6J67zLioDrXHJu661sdlU2MAqwzePBoLwCJ0+79cjynPwAPUTyeDxJe6oD7A8ZyE8w4HC6IUWnh30aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlGDE0TZ9mOzHkiI+gO6ciZ9DmhTp41LMafBs74nwds=;
 b=cdDU7181hpac27PeYTXIzk6+SNkAuwdBFvb/7tKoaeINopcr8d9SLzTdiB0c6fPJNEOp7oBabWHYY82tD4bzidu6RojrqjwmAk/8G8RBtyueTNjY96nHDwfu0uWvB2zHdcCWKVmJMQEFPu7WRzKtV5zqcdoTmkwhE2vS0Mrkfgc=
Received: from SA0PR11CA0110.namprd11.prod.outlook.com (2603:10b6:806:d1::25)
 by BYAPR02MB4613.namprd02.prod.outlook.com (2603:10b6:a03:57::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Fri, 5 Feb
 2021 03:35:43 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::15) by SA0PR11CA0110.outlook.office365.com
 (2603:10b6:806:d1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20 via Frontend
 Transport; Fri, 5 Feb 2021 03:35:43 +0000
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
 15.20.3784.12 via Frontend Transport; Fri, 5 Feb 2021 03:35:43 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 4 Feb 2021 19:35:42 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 4 Feb 2021 19:35:42 -0800
Envelope-to: git-dev@xilinx.com,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 robh+dt@kernel.org
Received: from [172.19.2.30] (port=57600 helo=xsjsaeedn50.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <saeed.nowshadi@xilinx.com>)
        id 1l7ruH-0000iH-2w; Thu, 04 Feb 2021 19:35:41 -0800
From:   Saeed Nowshadi <saeed.nowshadi@xilinx.com>
To:     <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh+dt@kernel.org>, <git-dev@xilinx.com>,
        Saeed Nowshadi <saeed.nowshadi@xilinx.com>
Subject: [PATCH 0/2] clk: si570: Skip recall NVM into RAM operation
Date:   Thu, 4 Feb 2021 19:35:02 -0800
Message-ID: <1612496104-3437-1-git-send-email-saeed.nowshadi@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7044f8f9-0a69-4cfb-6fcc-08d8c9871e03
X-MS-TrafficTypeDiagnostic: BYAPR02MB4613:
X-Microsoft-Antispam-PRVS: <BYAPR02MB46134677C4CDBA88DEAB1BFFAFB29@BYAPR02MB4613.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0PbE/Nq1Ry2JJgfvYTcGYDZlAY4PCEzqgcbGXCX6ePZFf4McoefJgKeSgm8Er89Wmib57BA2siorMj221teOB3aYBXspwfc6a51NpVkvlFkke7h+9n6iLjuGP4WPplElir7u5gb2rW5s+1xIYoXCHIZXR17jCEzVFEkFjrEzdJDSI4tYbXkSWu/mVzwnLOW4lOFGqHerdC3jULm8xNGD65aTudpHCL9Lh/GVomeLBhcKBWm0d7AUp5b/trqz193iva6VaLGq8T2t9b6Il/dyFxvnPY0gI9mKlaWXgx688J5ilYeew+GSbEegoxK3ulP1y8ABIDYcPBSfjHbAh/LOQJ6NbtZTDXS09lJ2KZGWdKP3I/L5TUyG6oPgM/mmCnVvFKnYuIGM9heiPIwUdrDKe0QlMeqKB69n1ELyp80Dkv49GjSSqExGV6VeSEGDoeE8V6aciQMsrgcW+tnYG2JysroJQxD8Xl/aKeK2GVMg9ofnKvvvv6SF8Ai10mZXDSAPAN/r0KRl+3E94NnsXXzdJLbbSCne2oFAo2SgmFcQQeIOp6pq0kpFe9CFnPdEiFtEtyQbI60VT/q8GpMnk9mh9bVucYiBCAhFSLYurxLFSYBKr6v6hsFKZxWXfNCuY6qLKfTn1VrdiQDrP8iT/1HaOfETyZeUAneNDSCd8Mpxpx2lCcNrg14KrJMyO0OTZ2e
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(46966006)(9786002)(36906005)(36860700001)(8936002)(82740400003)(70586007)(107886003)(4326008)(426003)(478600001)(54906003)(2616005)(6666004)(7696005)(356005)(8676002)(83380400001)(186003)(26005)(70206006)(82310400003)(316002)(336012)(7636003)(5660300002)(4744005)(110136005)(47076005)(44832011)(2906002)(36756003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 03:35:43.3415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7044f8f9-0a69-4cfb-6fcc-08d8c9871e03
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4613
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Silicon Labs' si570 clock driver re-initializes the register space from
non-volatile memory by issuing a 'recall NVM to RAM' operation during
probe(). This operation causes the device to re-calibrate the frequency of
clock out. If the clock is being used while this operation is occurring, a
pause/glitch could be detected on the clock out.  For use cases that the
clock frequency needs to remain consistent from power on, a device tree
optional property is added so the recall operation could be skipped.

Saeed Nowshadi (2):
  dt-bindings: clock: si570: Add 'silabs,skip-recall' property
  clk: si570: Skip NVM to RAM recall operation if an optional property
    is set

 Documentation/devicetree/bindings/clock/silabs,si570.txt |  2 ++
 drivers/clk/clk-si570.c                                  | 16 ++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.7.4

