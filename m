Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C7EC64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:52:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59E1D221EB
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:52:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728162AbgLBOw3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:52:29 -0500
Received: from mail-dm6nam11on2063.outbound.protection.outlook.com ([40.107.223.63]:35552
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727010AbgLBOw2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 09:52:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MqdQPxCybcMFZyp6gKdw4kjj6ryv+LlbvdZELlRdOI5yma4Ye4ay/ANIqO0LMpM4KnbkiZxk6sKTFiBk3+gv2cPr+RcEq9eeGaqrgS0n3Zp8+wJFh8hTNZNBz9B+kyFZFc5H+eb9ArJ9k8B11UlNvJB2H617QQL061LX4YSudRGUWcyWAIgrsW3xhUWeVaWWso/KwsZDXejG/ug1imA9qhyqL64PIclb5dFU/0xn11x/DOfUu1uYl76uctRHYaF4Nq889XWMasQXeGMxOpxd8YjggA+R/vt8fy9Y5CBuY+3NQie1Bq3EV55Z3oNPFE7qWIjghfO7FSkIX5O2mQGtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOy4uxOkUYmMePMEoqz1NMnLo/hmyCWgUIhzN7tcIO8=;
 b=Sw/N7jmkBreplAqdhwdePS+TKlVe9/ghUjfxVYPU0MZWjeeo7ahroHcVShkOP+O06dMrAbe9fS5k9RskXbq+ewVQmK2yz1IZjryggLUDPbPWDyW7mx3FNXrn/hQVEofo2CdWCMJUQJRVzDEFdCPetUIb3wBaQGnXOtzZFL0C6ymkrQIENvCP5gBGxJSlF7lwjO/Wt//fDI7JXVURuxzF515DF/7f9wtLvFNzHMCMe3+q8xQl0BLijXgOZ30+toSu8Z5WpQY+JV4lZcMd25zUWZczzIHyW9OUc2KG0dG4jXPupURnZK7pmeB8ouz9IywET3dT/GXfjbQL3HGCWzkztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOy4uxOkUYmMePMEoqz1NMnLo/hmyCWgUIhzN7tcIO8=;
 b=FtbFiM3oMZPW08Qy/+QTFJ8UoHxXwXAtkVFekK6ift2kMhCB5WNa7AMO/H898jjvBkEm8eTmm5/j+cc9EkAJt55SVCF4y8jScXPASVi80u6gslGs04J6LEotWmWZD0/FNLxHRKSvnjBPIgc9uQd8gU3s4uTF+Q3E3YuDlyUvzUo=
Received: from SN6PR04CA0104.namprd04.prod.outlook.com (2603:10b6:805:f2::45)
 by BY5PR02MB6517.namprd02.prod.outlook.com (2603:10b6:a03:1dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 2 Dec
 2020 14:51:35 +0000
Received: from SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:f2:cafe::c2) by SN6PR04CA0104.outlook.office365.com
 (2603:10b6:805:f2::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 14:51:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT053.mail.protection.outlook.com (10.152.72.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Wed, 2 Dec 2020 14:51:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 2 Dec 2020 06:51:29 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 2 Dec 2020 06:51:29 -0800
Envelope-to: rvisaval@xilinx.com,
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
Received: from [172.30.17.109] (port=38910)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkTTd-0004f4-A5; Wed, 02 Dec 2020 06:51:29 -0800
Subject: Re: [PATCH 09/12] soc: xilinx: vcu: make pll post divider explicit
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-10-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <3b0308e6-6b34-4e6e-fd7f-f3df54da98c7@xilinx.com>
Date:   Wed, 2 Dec 2020 15:51:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116075532.4019252-10-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0aa313a-2058-459d-0d1a-08d896d1c426
X-MS-TrafficTypeDiagnostic: BY5PR02MB6517:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6517BAE6A32515107B2A8B21C6F30@BY5PR02MB6517.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3M+PJnnvhGbKgnVvGJbNWrdU6QG0By7eZUaKU+DxS0TTfa0QfAeJSY9LHVsey6ZWA5ovBnop1Bs/zM7+Si3cjCKnKhhKHojGPvkkdEz7jZAbcKGyUhb9z0Noixwdvq3OW4TMsD78c08osRI1UHkS/rUCXKKMOIUc5w7hHEmvnSCWsl32QTPh5ST6Lg4DWrPNIwl/TSG1TM+ZYGbIfAg34cOuKsGjJq0xIkcEyL+zecKbo96xxaPKlmvOvP8iLRDCVRgk7W2waqqJwAt/t//AowcMbInu1/axLgVx9uY1kS+xxClJAB++cYuytfY0rZNZzIryizRsnkOs/bu9O/uufm6Z0FXH9oZ9KvFxYvqqC/QuV1n1dbS1bpY7ofqdRF11R7p1jhoo7Bn8iCalINSFadKODwGocqvCiXb89dvrGOTZ25BYAqlEnsB0WR59WYmQ9tgak38E9VVJs5HAA2dUiE6YGiuq4YZLsQRN809Ch8=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(82310400003)(186003)(83380400001)(356005)(8936002)(9786002)(47076004)(6666004)(4744005)(70586007)(31686004)(36906005)(70206006)(316002)(478600001)(31696002)(8676002)(110136005)(2616005)(44832011)(82740400003)(336012)(5660300002)(54906003)(26005)(2906002)(36756003)(7636003)(4326008)(426003)(50156003)(43740500002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:51:35.5253
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0aa313a-2058-459d-0d1a-08d896d1c426
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6517
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 16. 11. 20 8:55, Michael Tretter wrote:
> According to the downstream driver documentation due to timing
> constraints the output divider of the PLL has to be set to 1/2. Add a
> helper function for that check instead of burying the code in one large
> setup function.
> 
> The bit is undocumented and marked as reserved in the register
> reference.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/soc/xilinx/xlnx_vcu.c | 51 ++++++++++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> index cedc8b7859f7..cf8456b4ef78 100644
> --- a/drivers/soc/xilinx/xlnx_vcu.c
> +++ b/drivers/soc/xilinx/xlnx_vcu.c
> @@ -79,6 +79,7 @@ struct xvcu_device {
>  	struct regmap *logicore_reg_ba;
>  	void __iomem *vcu_slcr_ba;
>  	struct clk_hw *pll;
> +	struct clk_hw *pll_post;

kernel doc again.

M
