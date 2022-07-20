Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F28C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jul 2022 13:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbiGTNjA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jul 2022 09:39:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbiGTNi6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jul 2022 09:38:58 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE8E4BD0B
        for <linux-clk@vger.kernel.org>; Wed, 20 Jul 2022 06:38:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UmyrybGPxZzVMhKupE5kJPeq4s7tzCBK0z3K+WbGZco9MAMTxmjxBu4SNvQ90POiOARfpONrMLjWV5PSr5Uztj6RAPrjKWy75rbyoHRtQT7pHDAhzKvkis5igRgoj6eCsr82oh7crmpoXBwGvtdkRJKldqojyAU/M7+NLXbauvdCy8ZBteoEzPNmPaWbS18J7hAhxk8TflecsPkPyXXw78kSlr00FLKENpyN9ERCn4QZlopUurigI+l6F2TeF8h/lV99TKH2W/Z15cs2ciu17nTD4UE+kkYukYyehehxcjMOHUPH80bDU2K9WuYciBwKMDq+QGvRSqMaySXztf5c3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=seE8MfmjKbigDOgXNPZ/xlLgyQxSPwWzkiaKOeFrK4s=;
 b=mAu/DZHQ+gzJmekaS20Y1PnsxXkZ1zXv8eAHqBUlK5wKVniKuD/a6jQtm5znpXnlOcdjHUMNsev6z7FEb/CCTe1rgut7A0ZpIyo9oxtT7i0mLCWXjToRDoQOjd1QRJm1TrhdP3yG58cMeSX4/pvg+5tyJp0XOgH2d9rPZiPtyAiiZUntDkE30T9LSOehljiHOe/CTIB6np/VU1xMwvbwlpwxf7AMRvY1scd0qcXinDZ+YmWfLv8lrpjWlXQeLuN7nztnjvpc0VWjCi3trbnNNu05eTAonQ8K7/xi5cYKJFf8huBSbJVrZLNkMc4KOm4v/OVbBvyjgZ0J4/I8xKWBmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=seE8MfmjKbigDOgXNPZ/xlLgyQxSPwWzkiaKOeFrK4s=;
 b=MwIg8ogFmX7FPQlTDSKewdvoBISQ9Tm+qjNxGGsxEJiYB3X00kSyK+1WBvJZPCcGUPCLA/oTAnZXgOXMZs4Qn0AwmJr9I0BAs5u1/6VhyA+TXvae+fEVOpyUlJkAXhRzEcWQfvZmbd1yHet4QHUVHE0H8RJ0zLXBWlehZADxgak=
Received: from BN9PR03CA0954.namprd03.prod.outlook.com (2603:10b6:408:108::29)
 by BY5PR02MB6914.namprd02.prod.outlook.com (2603:10b6:a03:239::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:38:51 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::c5) by BN9PR03CA0954.outlook.office365.com
 (2603:10b6:408:108::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.23 via Frontend
 Transport; Wed, 20 Jul 2022 13:38:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Wed, 20 Jul 2022 13:38:51 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 20 Jul 2022 06:38:48 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 20 Jul 2022 06:38:48 -0700
Envelope-to: git@xilinx.com,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 mturquette@baylibre.com
Received: from [10.254.241.52] (port=37854)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1oE9ua-0005Jt-0o; Wed, 20 Jul 2022 06:38:48 -0700
Message-ID: <a51299f1-0163-96a2-8c2c-57d15189d1fa@xilinx.com>
Date:   Wed, 20 Jul 2022 15:38:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] clk: zynqmp: clock fixes
Content-Language: en-US
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        <linux-clk@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC:     <mturquette@baylibre.com>, <git@xilinx.com>
References: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <20220510070154.29528-1-shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c567577f-bf45-45c3-de5e-08da6a552e9b
X-MS-TrafficTypeDiagnostic: BY5PR02MB6914:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8UpeozxyU4QzZTv6H4Cj8/iuAi7x34BbDSiM4doX2yYOFaRLBqw0zw/3yoWs/4hBsVimReDJ6zurNvr6ZdRWerKQxELOntzHtCE28/Iv7s6+hjb5ioBdtAvfMYZLMrxWDWXT8uMgw2/XtEhwvEM+R7AdB6+X2bCU/xYPQcNPBMRfYCQ6cATpDsKh+7F+REYjLNLarERz+H1PbubeZBMf5m6JmjYU32+90FfIoS6YamPMzamsmGcjq+Ry1azVpNYkepoOnK++T9CRlnadrxV5BmTgS+6J6cP5aT54T7jYmiaWU8fIPje81uKE2f/QuvxQnaVZHInwxbjRm6/a1i/Wupnb0uCTa2UTjvSIZLLb8e0D77mW41Kv+Iu98SXy8ZOmE4iuB8Rp5lozTPrIqsbJwpSGasVs7Xr0WGNAm1sT9YFq7ED7XaPbiGR9xt8JqRq77ucCYKeB8Vw/Yxj+4mIS2tVwthRfADi3t8K1slsowXLRdNuqxOo7kPUD/usCAKOhPqzYipfHZwdk19ZsecDJjt5zuw50Z0Kpimp0/EyyNBBCz8YNhFZszFSUCz5dKIDaT4+5q7AD+JcSNExzoBVVxBgyRg8/0brxDeqvc2s0nucEiACdvg1CU4ZNsnfacC3ECHwR3R9O4EQJzCZIh4NGw+ty7uyS1omrRIgpA2RkmdgQrhOKSzjDJo6b77ig3B6c5rcaTFQUGXlWFexskxgE87+GfIFuMnyBZ+zkeAhDqk83FN1/67SKZzjVIYepyKqinr5+zwxSdLjzzGivKfjC+QjtWFNUN/1hfOfLtW3xMmeXlUV3q92cmoX7NLpYGEriytF4F8qW5LTK09OKgG1180EprJYfsS6JO6w4QIeoRuqte1IE35z825rQLrOjKPKI+Q3XjnXIHVa7PntYjcJphUp6YLC/63N2zb+/W6CdDePxM9XnbsmO/4BkrZ4xnFs
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(346002)(376002)(39860400002)(46966006)(40470700004)(36840700001)(70586007)(70206006)(40460700003)(110136005)(54906003)(316002)(36860700001)(26005)(426003)(83380400001)(8676002)(336012)(31686004)(36756003)(31696002)(47076005)(82310400005)(40480700001)(4326008)(186003)(44832011)(2906002)(6666004)(9786002)(8936002)(45080400002)(53546011)(41300700001)(107886003)(7636003)(2616005)(4744005)(478600001)(966005)(82740400003)(356005)(5660300002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 13:38:51.1671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c567577f-bf45-45c3-de5e-08da6a552e9b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6914
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 5/10/22 09:01, Shubhrajyoti Datta wrote:
> Below are the
> As part of discurssions on [1] there was a suggestion to use
> strscpy. Which is implemented in [2] and [1] null terminates
> the string.
> 
> [1] https://www.spinics.net/lists/linux-clk/msg60795.html
> [2] https://lore.kernel.org/all/DM6PR02MB6635E9F94E9A5FFC06188EF2AAAF9@DM6PR02MB6635.namprd02.prod.outlook.com/T/
> 
> Ian Nam (1):
>    clk: zynqmp: Fix stack-out-of-bounds in strncpy`
> 
> Shubhrajyoti Datta (1):
>    clk: zynqmp: Replaced strncpy() with strscpy()
> 
>   drivers/clk/zynqmp/clkc.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 

Acked-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
