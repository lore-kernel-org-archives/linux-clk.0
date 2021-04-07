Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F35C433ED
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 10:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CF7B610F7
	for <linux-clk@archiver.kernel.org>; Wed,  7 Apr 2021 10:13:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbhDGKNc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Apr 2021 06:13:32 -0400
Received: from mail-bn8nam12on2062.outbound.protection.outlook.com ([40.107.237.62]:23872
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236082AbhDGKNb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 7 Apr 2021 06:13:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bD1wMbUnuZdoTC8J3fE1Bz3EJNYgejZHv64T+UINIa3uE17lniMPDkGQVq4TCMDiTLqH/nzIXRRl4rNdv/kk4I0UHl21fQ3a64VzuRYyoceoZvuBLocs4oL5HjMQHGOQWJWer02qLxjxZMTQIVpl04PAW/wTP2+P6P/K8gXQTSGcwIQILCIVjnfOhiD/bX74eU36E5kZYVqvBvdvwLMORiQmXsmO1mU3Dnmq2lde6+TANZ+VzN4+RURC1e90+PF0tGVW2tXLbZMJ3+d2ajv9hsee6a96wt6msMVeYhqo7TYW7ka7SHhorT2ol/7lHQRh7EOF8Niwh8/swOoZhg356A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQDyogBvIaYmefD7L1jzUne8/4vOCJmQy6RGOuxKQGs=;
 b=LHASlS3t0M2o5jGzQCPUwsauTCMpserVlK8JzK9pPHBEJ4Yvao2Q5VGjsJ6Tfmap1bgtEqwuuZ8crde4ryCZ4LaihCOwdBy4TfIo0mtncfVpWl4crT1EGapdJWKL7W0edFw++PMK4EJbzQHH2BLd9zc8f4fjl7j2r0qR7tfDw5QAGhF0IsGY4wjMbJdpch2fpFGSprGZBEmFvkvwPLCQB/Ea+0DVwviE/fh7XvV+Q5aoHrZaXPkUCxMMY0+hlUsnFKp1XlNEgTZz80M0RgAr/GBz+oazmQScrgwy4VEMMOx7nkH4dwa4Hb/nxYqu+aTht/s3OZCMYGRjUist1ex7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQDyogBvIaYmefD7L1jzUne8/4vOCJmQy6RGOuxKQGs=;
 b=Y3ALVAVT0yUZj6eQElkkMYy1x5aVdo0Og9SoBUZxmGMCH4Lez2/NYDPhOciwCRGTiVtFJxJCSSFdBj0P3ETBtVDYIY3nD0SQHwA9v4seoGhx4rIm9mN6iyEXaiODURSDLNxmG7hUc8rdo0BSKKv9p2yGW96Nhfo0m5/N2zg/iPc=
Received: from DS7PR03CA0095.namprd03.prod.outlook.com (2603:10b6:5:3b7::10)
 by MW2PR02MB3708.namprd02.prod.outlook.com (2603:10b6:907:2::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Wed, 7 Apr
 2021 10:13:18 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::1c) by DS7PR03CA0095.outlook.office365.com
 (2603:10b6:5:3b7::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 7 Apr 2021 10:13:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3999.28 via Frontend Transport; Wed, 7 Apr 2021 10:13:17 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 7 Apr 2021 03:13:15 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 7 Apr 2021 03:13:15 -0700
Envelope-to: linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 punit1.agrawal@toshiba.co.jp
Received: from [172.30.17.109] (port=56792)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lU5BT-0001Wx-8B; Wed, 07 Apr 2021 03:13:15 -0700
Subject: Re: [PATCH v2 0/2] Update ZYNQMP clock configuration
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        <michal.simek@xilinx.com>, Stephen Boyd <sboyd@kernel.org>
CC:     <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <de18fa79-1e83-30e1-6b41-f41360e22837@xilinx.com>
Date:   Wed, 7 Apr 2021 12:13:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35880e5b-14d5-4fca-c1ef-08d8f9adc397
X-MS-TrafficTypeDiagnostic: MW2PR02MB3708:
X-Microsoft-Antispam-PRVS: <MW2PR02MB3708FF2208E43E135A156A97C6759@MW2PR02MB3708.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZMcAnCjWZx/BNgBsegLVQ3wBxm66GJErsch1nHqNv/vgCY6pEkb78A/tmiOvELX+j7U+LpKWjaGR29Mcszme8EjUgcrRaXrs/a12FVyDOg45DlibRgy2IkU19vMoTOfe/eOGOMx7D4q30e94Gia+UYYZ3a67ht1fdE6w5NxRTLmuPXVa+2fTO7Ph31+hWDbK9J9LCJr08EbxwUqZKJqOQYyINcWf3VRmhBnUW1+P8WM9m4N7kOSRSApYxDVZw14QY0ciJB2il6BS/NCsAnkfc77s1qKb8KdD302Vvzt/OAv+3HwA9G9pIJL4N2KfusFyc+BCoY3BpgyDwwvxFQxl0OUXN/CT9PrDuvNr0rKOaEuxqBujPcU0Q8Xu17ddEs9+s2bJMd/q+UpVNC/UY1xCFmnPYubExnAleQn+YeaNkGX/OuqhgyyNEz8Oj+1BARBE/EfnAShF5Xf8qfxOeJZz65iMlY54Ycipa3FffglVWQlNqwsqE9jWOT7j1gGEbZiAFGMyM57/mHEaIBmjjTA8DVcL1bsIiwOdJ+oFkGpu/vH3QN1Z3qX9JOBsWcE3r/SjfER9VZiXZ+1fC/k1LUqPhh1XfwOaZmmq+SovNFhX4eK1wkm8YSxc0QYW4DnuqOGokfesKuxF0me++BaYh4Y3F3MCmKywXO0w0KAGZVUmDCiVoFbEK6HtaDcLadKU/7Oxw+eXTUxy74GwN5g1G0hrxXhJTYztpyCrT3KivA4W6e2r1+dZBbH2FOUv5AtJWd5kMT8bpW4Zx6bZoLCWIShYr+qX754EVeg2g7ufpfOZCks=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39850400004)(396003)(36840700001)(46966006)(8936002)(966005)(7636003)(356005)(36860700001)(82310400003)(8676002)(82740400003)(31696002)(36906005)(54906003)(47076005)(336012)(426003)(9786002)(26005)(4326008)(6666004)(2616005)(36756003)(53546011)(316002)(186003)(44832011)(110136005)(4744005)(70206006)(2906002)(83380400001)(5660300002)(478600001)(31686004)(70586007)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 10:13:17.8456
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35880e5b-14d5-4fca-c1ef-08d8f9adc397
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3708
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On 3/22/21 7:17 AM, Punit Agrawal wrote:
> Hi,
> 
> Here are a couple of patches defaulting the ZYNQMP clock configuration
> if it's dependencies are available. The clock driver is needed for
> peripherals such as micro sd card required for booting.
> 
> The second posting adds a patch to drop the redundant dependency on
> ARCH_ZYNQMP requested by Michal.
> 
> Thanks,
> Punit
> 
> Previous posting -
> 
> [0] https://lore.kernel.org/linux-arm-kernel/20210316090540.973014-1-punit1.agrawal@toshiba.co.jp/
> 
> Punit Agrawal (2):
>   clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE is selected
>   clk: zynqmp: Drop dependency on ARCH_ZYNQMP
> 
>  drivers/clk/zynqmp/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Can you please take this series? Or do you want me to take it via my tree?

Thanks,
Michal
