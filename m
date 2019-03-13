Return-Path: <SRS0=1SIp=RQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB1DC43381
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 14:48:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 67DB721019
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 14:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="PD/oiZvO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfCMOsZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Mar 2019 10:48:25 -0400
Received: from mail-eopbgr770081.outbound.protection.outlook.com ([40.107.77.81]:37860
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725832AbfCMOsY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Mar 2019 10:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTrHRvFWcG5Y8swz1FtZaxINQyPb4MorU7ayOiP8Qs4=;
 b=PD/oiZvOAtW9BFQ54pZMdKeZGcSD7S+pBUymQgNU1C6I8rbUWR3NIIyy3MyyHe91KJN54mfYKHk5OQPIcmjz4W3s6Pd1M1Xn7ofUwOegJTRpRyz8aUpoqxMQi1R3Q7QzSrxb+yT9ex9lN6Tno63z79EJ+pk2OKokH6yJ4YSa2PA=
Received: from MN2PR02CA0016.namprd02.prod.outlook.com (2603:10b6:208:fc::29)
 by MWHPR02MB2814.namprd02.prod.outlook.com (2603:10b6:300:108::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1709.13; Wed, 13 Mar
 2019 14:48:21 +0000
Received: from SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::203) by MN2PR02CA0016.outlook.office365.com
 (2603:10b6:208:fc::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1709.13 via Frontend
 Transport; Wed, 13 Mar 2019 14:48:21 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT009.mail.protection.outlook.com (10.152.73.32) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1686.19
 via Frontend Transport; Wed, 13 Mar 2019 14:48:20 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1h45B6-0006zZ-39; Wed, 13 Mar 2019 07:48:20 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1h45B0-0000u4-Va; Wed, 13 Mar 2019 07:48:15 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x2DEm45D016960;
        Wed, 13 Mar 2019 07:48:04 -0700
Received: from [172.30.17.111]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1h45Aq-0000mY-Gu; Wed, 13 Mar 2019 07:48:04 -0700
Subject: Re: [PATCH 2/5] clk: zynqmp: fix doc of __zynqmp_clock_get_parents
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC:     <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
 <20190312110016.29174-3-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <8fea7830-0d86-1d88-ed12-f5c9ffb907e3@xilinx.com>
Date:   Wed, 13 Mar 2019 15:48:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190312110016.29174-3-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(376002)(39850400004)(136003)(396003)(2980300002)(51444003)(189003)(199004)(316002)(476003)(229853002)(126002)(2616005)(26005)(31696002)(11346002)(305945005)(8676002)(107886003)(8936002)(9786002)(4326008)(2906002)(356004)(63266004)(76176011)(65956001)(44832011)(2486003)(5660300002)(23676004)(65826007)(81156014)(336012)(106466001)(81166006)(54906003)(106002)(6246003)(47776003)(446003)(2201001)(50466002)(478600001)(36386004)(77096007)(230700001)(58126008)(110136005)(186003)(36756003)(64126003)(31686004)(426003)(486006)(65806001)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR02MB2814;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbed624e-f997-4bbb-6dee-08d6a7c2efc5
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);SRVR:MWHPR02MB2814;
X-MS-TrafficTypeDiagnostic: MWHPR02MB2814:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <MWHPR02MB281493FBD095ACCB46A53FCCC64A0@MWHPR02MB2814.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09752BC779
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: T1/o2nQTGE3hjbscE7YvGhL+hZHimHLmR4TBc8y4GzvVayd7v/DklUGcNh8WUYprFXNAwGbIsf2d2uikuwaiLTCNPxpfnoIok5S8P46RIQfM3R28Zw7Sm6UpPWQE/G8Mk57mP3Oa/bpaSMp+Kn2UvugjK5LN/Sy12a8afqsxV9oNHZqLTBd6hdoqjHMNqpMXmJqqMqtFVOW2wSqas/E120PexlynyZCe5oEm8WqzE/PoGWoZ8A47EroHf4zRNs9QAFAfneRJBfes3ZJSSzCnWEL67kMhuChbgZRXlt0EmPOjLe4QZRyDrza5tU0C35QMiIBvYA4Mql3evePVx3PzkqYGfa3XhIod6gLAxxe60XUWTCeXLYEwJ9ax/mo4I4riHPz0EutuiwMZbLgN6g8NTwPkhlICfT1KFMOt9DVuvUM=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2019 14:48:20.4868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbed624e-f997-4bbb-6dee-08d6a7c2efc5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2814
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12. 03. 19 12:00, Michael Tretter wrote:
> The kernel-doc refers to __zynqmp_clock_get_topology(), while it actually
> documents __zynqmp_clock_get_parents(). Fix the documentation to refer
> to the correct function name.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> I think most of the function documentation in this file is pretty
> useless and sometimes misleading. Maybe we should drop the documentation
> entirely, because all functions are static anyway?

Interesting is that kernel-doc is not able to find this issue.

drivers/clk/zynqmp/clkc.c:336: info: Scanning doc for
zynqmp_pm_clock_get_attributes
drivers/clk/zynqmp/clkc.c:360: info: Scanning doc for
__zynqmp_clock_get_topology
drivers/clk/zynqmp/clkc.c:388: info: Scanning doc for
zynqmp_clock_get_topology
drivers/clk/zynqmp/clkc.c:418: info: Scanning doc for
__zynqmp_clock_get_topology
drivers/clk/zynqmp/clkc.c:453: info: Scanning doc for
zynqmp_clock_get_parents
drivers/clk/zynqmp/clkc.c:485: info: Scanning doc for zynqmp_get_parent_list

I think that doc is good because it helps with understanding of code.
If there is something misleading that it should be rather fix then remove.

M
