Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530DFC64E7B
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 09:15:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF9582222E
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 09:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388590AbgLCJPJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 04:15:09 -0500
Received: from mail-mw2nam12on2043.outbound.protection.outlook.com ([40.107.244.43]:38464
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729939AbgLCJPI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Dec 2020 04:15:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuXb6bURZbePZYCC3xDTxnV6KkzNgCtC79VL8uGhME5AsSA4o66Da0ZJl7BvDvYUpfnNEhMLQBZgXRdvFJ0Bpr3omaqiE7kCDQWkqkmd1c1t9fpBbuGjpNr0n5qTpN5w/29pDK7M+NLA2JOClSJs2Q9sr5TDhOZAl4/ocH6EpxnwmyVBc/ofAbKRJjzFHMapTdUAtv/06gMXAi7dKyIXmmIGjdLZEhD/ETfxoqxwslaiTQD/K+cvRJWZC3VaHcstKDydjEhpCah0fK7/cQ8AmY5Wv7U5mEpkFkxQU/MwMslcoIUE07qiPKw6jd3cY5kxGDwOPfQHqAVDjuZdrnEteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvTLBB9Nsox3VRFjaby7V2119KPZqqFx/NsQriGmMXY=;
 b=CTvwzww3XrKJ9Nw1aY2vrPckyMMIC9zGN/ch3ey9JaYdaYtfqRAuVTToNC1OKKVHdMsqat6mCpP4KlcgD7HHwsDatwk6Am763jtXLCuD4Vq/JQ3wHA5HfOOAQDOgIU5GjAq1R+doB/nqckx0sEV9WRC2W2kEyd8Ef0s+qNxnwNQf4+TR6aDe45bIyyG/PqiN7iVNjFcKP9t7Ve5JFZ9eznJkLMPCv1FLZ52ddznfCPkb0C+eSfXLTAoHK4pO6HvvHiYNKDH7X+BvOC7U00Hcpny9Kpx9j137S4cTRcGvvX7Y064SLPi0A3aGA6UmJ3il4RbCLoF2C/lML0Z5YToIeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvTLBB9Nsox3VRFjaby7V2119KPZqqFx/NsQriGmMXY=;
 b=oJ+3OS3q/iRUKaYVT3/IrtM+7PKLLY798z4EsmtoTI8h19OYCnLipqoGWtNZPTj41+WELrD7N84+WGpKBGjVCPbv3iiJHKkU+tci16wiTH8+9L/eshDET3xgcTlKBL7gvR/GzDJDITupe15X8dqi5Vqa7/r4xirc7Fx/AWBFyAk=
Received: from SN4PR0701CA0039.namprd07.prod.outlook.com
 (2603:10b6:803:2d::28) by SN6PR02MB3917.namprd02.prod.outlook.com
 (2603:10b6:805:2e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Thu, 3 Dec
 2020 09:14:14 +0000
Received: from SN1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2d:cafe::3e) by SN4PR0701CA0039.outlook.office365.com
 (2603:10b6:803:2d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Thu, 3 Dec 2020 09:14:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT007.mail.protection.outlook.com (10.152.72.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Thu, 3 Dec 2020 09:14:14 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 3 Dec 2020 01:14:11 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 3 Dec 2020 01:14:11 -0800
Envelope-to: michal.simek@xilinx.com,
 rvisaval@xilinx.com,
 dshah@xilinx.com,
 tejasp@xilinx.com,
 rajanv@xilinx.com,
 sboyd@kernel.org,
 mturquette@baylibre.com,
 robh+dt@kernel.org,
 kernel@pengutronix.de,
 devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 m.tretter@pengutronix.de
Received: from [172.30.17.109] (port=44310)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkkgl-000270-Ef; Thu, 03 Dec 2020 01:14:11 -0800
Subject: Re: [PATCH 00/12] soc: xilinx: vcu: Convert driver to clock provider
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Michal Simek <michal.simek@xilinx.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <5dd16c21-b204-bb10-feb8-562a298faaf9@xilinx.com>
 <20201203090031.GB21858@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <5aef18b3-beca-a99d-9423-07e7e4e2cf75@xilinx.com>
Date:   Thu, 3 Dec 2020 10:14:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201203090031.GB21858@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb21c128-56c8-47ba-9cfd-08d8976bcde2
X-MS-TrafficTypeDiagnostic: SN6PR02MB3917:
X-Microsoft-Antispam-PRVS: <SN6PR02MB3917078FCDAD8AB66D24AA0DC6F20@SN6PR02MB3917.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJiUyfCKFMIPpegKX7VqCT4j2hsAnefkjQl9PJ9zl1o/MuSX5TBk4s6GTtxMJO8WPBBJlTlQatPmpdHYORjwHEsRRRtoBcODeQ5ttyW74GH+EIiP86ps7781Kuia7VjAiaG+A9wPW+XuOtr8BDG6H0FN2hit53H0zt80gxz4H9DiVopDs2crqncRhxnD+3ems4srvm8vG7aeQQyAKU9k+kf6CLXL///vFS2jekl3tyZv55B2Qyv52eXw2ZEEcEYaEf7LWN8rwdJqVqVbV4Bnig4UVQZfcZxw5PWcGH6RmKj5fRBO8OfB8UBRlUG8V4ZZIg6bODZerQXOnBuBsv6nBTdheW2ATncJ+gizyP/tZlx4qyuSg72ZTJz9/pKZvg8TUzQbZiyCSCET4DbGipPcyfWexRuyMXABphjXvs98uk+1UdH90lhyyPnybZ/1z46dM7aWYBswe9Q+LuWxqJONCVVl+wZLI/OzsZoGJMKzqa3+7rcAcp9H14L2PwBExbesdvcwGtshuEPTEvvoZHNyMQ==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966005)(6666004)(31696002)(2616005)(186003)(47076004)(70206006)(966005)(336012)(44832011)(7636003)(356005)(426003)(316002)(54906003)(36906005)(36756003)(110136005)(26005)(5660300002)(8936002)(83380400001)(478600001)(70586007)(9786002)(82740400003)(31686004)(82310400003)(8676002)(4326008)(2906002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 09:14:14.3601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb21c128-56c8-47ba-9cfd-08d8976bcde2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB3917
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 03. 12. 20 10:00, Michael Tretter wrote:
> On Thu, 03 Dec 2020 08:46:12 +0100, Michal Simek wrote:
>>
>>
>> On 16. 11. 20 8:55, Michael Tretter wrote:
>>> Hello,
>>>
>>> the xlnx_vcu soc driver is actually a clock provider of a PLL and four output
>>> clocks created from the PLL via dividers.
>>>
>>> This series reworks the xlnx_vcu driver to use the common clock framework to
>>> enable other drivers to use the clocks. I originally posted a series to expose
>>> the output clocks as fixed clocks [0]. This series now implements the full
>>> tree from the PLL to the output clocks. Therefore, I am sending a separate
>>> series that focuses on the clocks, but it depends on v4 of the previous series
>>> [1].
>>>
>>> Possible consumers for the clocks are the allegro-dvt video encoder driver or
>>> the Xilinx Video Codec Unit [2] out of tree driver.
>>>
>>> Patch 1 defines the identifiers that shall be used by clock consumers in the
>>> device tree.
>>>
>>> Patch 2 fixes the generic clk-divider to correctly use parents that are passed
>>> via struct clk_hw instead of the clock name.
>>>
>>> Patches 3-6 refactor the existing driver and split the function to configure
>>> the PLL into smaller helper functions.
>>>
>>> Patch 7 registers a fixed rate clock for the PLL. The driver calculated and
>>> set the PLL configuration during probe, and exposing a fixed rate clock for
>>> that rate allows to use the existing configuration with output clocks from the
>>> common clock framework.
>>>
>>> Patches 8-10 switch the driver to the common clock framework and register the
>>> clock provider.
>>>
>>> Patches 11-12 are cleanup patches.
>>>
>>> Michael
>>>
>>> [0] https://lore.kernel.org/linux-arm-kernel/20200619075913.18900-1-m.tretter@pengutronix.de/
>>> [1] https://lore.kernel.org/linux-arm-kernel/20201109134818.4159342-3-m.tretter@pengutronix.de/
>>> [2] https://github.com/Xilinx/vcu-modules
>>>
>>> Michael Tretter (12):
>>>   ARM: dts: define indexes for output clocks
>>>   clk: divider: fix initialization with parent_hw
>>>   soc: xilinx: vcu: drop coreclk from struct xlnx_vcu
>>>   soc: xilinx: vcu: add helper to wait for PLL locked
>>>   soc: xilinx: vcu: add helpers for configuring PLL
>>>   soc: xilinx: vcu: implement PLL disable
>>>   soc: xilinx: vcu: register PLL as fixed rate clock
>>>   soc: xilinx: vcu: implement clock provider for output clocks
>>>   soc: xilinx: vcu: make pll post divider explicit
>>>   soc: xilinx: vcu: make the PLL configurable
>>>   soc: xilinx: vcu: remove calculation of PLL configuration
>>>   soc: xilinx: vcu: use bitfields for register definition
>>>
>>>  drivers/clk/clk-divider.c            |   9 +-
>>>  drivers/soc/xilinx/Kconfig           |   2 +-
>>>  drivers/soc/xilinx/xlnx_vcu.c        | 613 ++++++++++++++++-----------
>>>  include/dt-bindings/clock/xlnx-vcu.h |  15 +
>>>  4 files changed, 383 insertions(+), 256 deletions(-)
>>>  create mode 100644 include/dt-bindings/clock/xlnx-vcu.h
>>>
>>
>> I can't see any other problem with this series.
> 
> Thanks for the review! I will wait a bit longer if there is some review
> feedback by Stephen regarding patch 2, and then send a v2.

Definitely good idea. We are also waiting for his review for others stuff.

Thanks,
Michal

