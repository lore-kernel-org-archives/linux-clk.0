Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D51C64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA37E21D42
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgLBO3B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:29:01 -0500
Received: from mail-dm6nam11on2074.outbound.protection.outlook.com ([40.107.223.74]:29774
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728069AbgLBO3B (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 09:29:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/MVwOVaSb6I1IoeWMoD2QeMvZKNTZv66s24lx9Na6+3RYU+BQR+9q5Pw8DOz6Q7PIFBSSe2q1zjPZAMr3uhQkOmMFuX+7g0T00rhylxcKqHS89HgUcQl5TMpPUBfBq5kt4byqi/EK/t2PcWnOd6zlfLikcQoc4sxbRZ7o67/2prfTmj0rfL3rdwzdTtV9kUaPeDpmmhWvzIbBKFXxyLDTbSeT1ius/y5YSJU44dlEvLwFENuMIFmWiZnTLT2K3Jlz3T8b9lBiPXFWt4ZBhWS1JkdtkYCF6P6fMza6uSU6dvNyoW1v9Ke3dv2I0wtTW1r8pduvpmSbA6nrUabftWhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs1CCCqxcIxy8kTaiq6PiX8MlI+I6cXFGZg/MnCLKu8=;
 b=IrI/POjR0lWmjkc7m7BmysJanWh+uZVael+p0Kf5TIJdPG+TZMJeJGMFHD72XhpBaq5PulfsHrbbDH+7KgtLyARfiumC3qMnLKgIbzmfyYVOw3EJBr4lYay0YCsJgIIAd/WN35/IQiYYFJAtDdOboP2rkDlrJYlLSRbU3s9LSSJqjVPH6pRaKveXyFdYkBnU2bbjOQ9w1cjwuAY2V2HTJdEUVIjoY2L3e5FCEapMOV+Ho4hqGyyOL9I6plQZMY9HlbniSW8kGObwo+2FG6S4OYB93xyiWf0o77kCx87BXl/ugYB2CUzL7lHbIVmRqBINagGJpLAu6/MLANXdffctYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bs1CCCqxcIxy8kTaiq6PiX8MlI+I6cXFGZg/MnCLKu8=;
 b=i/FtapJSYTE8iqSk25Vyg5rx6hI4kTIw1jXWUdhNWf/Uvg3JbIlx+V8WK1PCAgctt9UAa0rcXCUT9yBBpkT56MwbkbWV60NLT0e7iXgKcdNBevgRjMtnsx+6rWVl++eXOH5QqteWKf32xe+d+xGA2oze/G2FBXeHxomg8QnV3fQ=
Received: from CY4PR06CA0068.namprd06.prod.outlook.com (2603:10b6:903:13d::30)
 by MN2PR02MB6128.namprd02.prod.outlook.com (2603:10b6:208:1b9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:28:05 +0000
Received: from CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:13d:cafe::f5) by CY4PR06CA0068.outlook.office365.com
 (2603:10b6:903:13d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 14:28:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT016.mail.protection.outlook.com (10.152.75.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Wed, 2 Dec 2020 14:28:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 2 Dec 2020 06:28:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 2 Dec 2020 06:28:04 -0800
Envelope-to: rvisaval@xilinx.com,
 dshah@xilinx.com,
 tejasp@xilinx.com,
 rajanv@xilinx.com,
 mturquette@baylibre.com,
 robh+dt@kernel.org,
 kernel@pengutronix.de,
 sboyd@kernel.org,
 devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 m.tretter@pengutronix.de
Received: from [172.30.17.109] (port=36864)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkT6y-0003U6-Cg; Wed, 02 Dec 2020 06:28:04 -0800
Subject: Re: [PATCH 02/12] clk: divider: fix initialization with parent_hw
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-3-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <cf775d45-439a-c6d5-de45-3c37f41f226c@xilinx.com>
Date:   Wed, 2 Dec 2020 15:28:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116075532.4019252-3-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ddfaa1a-f0b5-4923-ad28-08d896ce7bc7
X-MS-TrafficTypeDiagnostic: MN2PR02MB6128:
X-Microsoft-Antispam-PRVS: <MN2PR02MB61283F707156C75EFED267AFC6F30@MN2PR02MB6128.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SM+Qp159ymmSfPBhlP90hOQvu/h80cWgDJFaglVXHJ3DKPAdFuNCfrs71E7anLaTsfKpWi9kNAL6vQLRxbByKxeo+ImZnUDyghcVsYRb4HWM6v+PJFpafq7S0PPhpKZUIvL4JccFdriPfcOj0THnWwtpTv2R1Cze59g6R9bprNLp0W8l2Z8HfUwLzMQy8Pax/0agE4vQSEgmzvIlYG1mCHnLlMrRaJO2jT0qOS47jG36IR8o9pv5uyeLFsvzipTMOqvtGgr+3J9rKbhuGPLaMwYAKYpSLhLvcAJvipFoFSRvk/4U5Ov4CQMzrzgOQDidCi4MGojJwwV0A8fU1xfHvNfQgPAQkDGK1BlIfqkvkC7Uy6cLTolvDZ8e/pYuBYz0SVG2qOvsbbMmbVGh4AChTOUOz22FnscOKX5u+R8D3Gy2zeAfHV8edJvW4z8WIUIjRWC9Md562Wd9syzx/8x+e5vCP8MBHGSXGiU+p7qNr6Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(46966005)(316002)(54906003)(83380400001)(110136005)(426003)(36906005)(47076004)(2906002)(31686004)(7636003)(8936002)(36756003)(70206006)(6666004)(8676002)(356005)(9786002)(70586007)(82740400003)(44832011)(26005)(2616005)(31696002)(336012)(186003)(5660300002)(478600001)(82310400003)(4326008)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:28:05.6398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddfaa1a-f0b5-4923-ad28-08d896ce7bc7
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6128
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On 16. 11. 20 8:55, Michael Tretter wrote:
> If a driver registers a divider clock with a parent_hw instead of the
> parent_name, the parent_hw is ignored and the clock does not have a
> parent.
> 
> Fix this by initializing the parents the same way they are initialized
> for clock gates.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/clk/clk-divider.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index 8de12cb0c43d..f32157cb4013 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -493,8 +493,13 @@ struct clk_hw *__clk_hw_register_divider(struct device *dev,
>  	else
>  		init.ops = &clk_divider_ops;
>  	init.flags = flags;
> -	init.parent_names = (parent_name ? &parent_name: NULL);
> -	init.num_parents = (parent_name ? 1 : 0);
> +	init.parent_names = parent_name ? &parent_name : NULL;
> +	init.parent_hws = parent_hw ? &parent_hw : NULL;
> +	init.parent_data = parent_data;
> +	if (parent_name || parent_hw || parent_data)
> +		init.num_parents = 1;
> +	else
> +		init.num_parents = 0;
>  
>  	/* struct clk_divider assignments */
>  	div->reg = reg;
> 

Can you please review this patch?

Thanks,
Michal
