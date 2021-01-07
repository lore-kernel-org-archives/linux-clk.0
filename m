Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB44BC433E0
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jan 2021 10:03:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5996622248
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jan 2021 10:03:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbhAGKCs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Jan 2021 05:02:48 -0500
Received: from mail-bn8nam11on2060.outbound.protection.outlook.com ([40.107.236.60]:20064
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725974AbhAGKCs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 Jan 2021 05:02:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1DFtnpma8oN5qj0yaN2DWK+VhSelzVoeUBmb7T7iCGhZpplHonFwjFOOSFlWxw43VwGA5O8HctlznCMujQMdGDWscKBKXPe8t1uIJ+TT783NDc4VYYBYv2rkbm9Gw+cCRzgk9wHyNFgchCRCVf7F7s5Uu+F5oaNSrxoTwqVyJHmv+rsV/UTQg6b1Pj9sNYswEF+o3hK75z9kOyETGqKNYWp99hkgQAVhA7SieGoId/JhKWht5ONnDDyhdKJMJ2r4Pl8gA8FtnrL9ZpH0F8/VOMDF80H2jyd9GO32D0r2p7Kl0Qq/ZfNwu8YbORtFFw3h05PHfSqkjwJZ0G0t42tiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBaNHcbctW+uhW804joNrtCVewp/bkwxkWlk3Yg2tJ8=;
 b=Jeyi5sQBI0SrRajXR+hGlATuj3q3hdzCeEZ1klD+ensrk9t2apY1Zinx9jtQxIUgbYVX9H6tAJV3Z9+vYd1YlID+LxrF3hFKs1CE/d5Gm1VK9sV7nfVEXK+95pRghihioMw8BMJ/PVnE+Foa9/tSgOMmHWHBxixsTfxt7xL92o9qG6gwRqXV4E3/l55HhWf0eOorZjeieqwivqXFQJuBT+HQnYM07CGWxW4ICPGJETBcXRqUBsPJSqEMLeu/MyoaBuWQuJ0ReJ8OIUBqEzIQz6PqTpQWSYfagzNTipyPwwBZm+bH1OIElx8mFU3TTnl+/eSw4W5DA15THDJTfYQxsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBaNHcbctW+uhW804joNrtCVewp/bkwxkWlk3Yg2tJ8=;
 b=YKl+9nEUsglVWA2g/iUjFn5lz7D49S1EgzHa9ngW/jGsopvQy+mfjXGsbnu/PoQowPEhOTgSAu0yr65LgipA18n2r5rDIxnK08i1OzzCyk05qWtP2WuRz6FJMT/7uxl3Oyj6/mYv5iYluEtI3K6FkzOYPgMEImm4Ca0x9JLuNQE=
Received: from CY4PR15CA0004.namprd15.prod.outlook.com (2603:10b6:910:14::14)
 by SJ0PR02MB7536.namprd02.prod.outlook.com (2603:10b6:a03:32a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 10:01:55 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:910:14:cafe::f5) by CY4PR15CA0004.outlook.office365.com
 (2603:10b6:910:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 10:01:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 10:01:55 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 7 Jan 2021 02:01:53 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 7 Jan 2021 02:01:53 -0800
Envelope-to: rvisaval@xilinx.com,
 dshah@xilinx.com,
 tejasp@xilinx.com,
 rajanv@xilinx.com,
 sboyd@kernel.org,
 mturquette@baylibre.com,
 kernel@pengutronix.de,
 linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 m.tretter@pengutronix.de
Received: from [172.30.17.109] (port=43990)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kxS76-0005V9-V1; Thu, 07 Jan 2021 02:01:53 -0800
Subject: Re: [PATCH v2 09/15] soc: xilinx: vcu: make pll post divider explicit
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201221150634.755673-1-m.tretter@pengutronix.de>
 <20201221150634.755673-10-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <d0c78b40-f5b1-f1d0-ec9c-bfb875be745f@xilinx.com>
Date:   Thu, 7 Jan 2021 11:01:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221150634.755673-10-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e273a892-0cb5-43d0-b396-08d8b2f34368
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7536:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB753626EC9671AC89ECB4713FC6AF0@SJ0PR02MB7536.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: moUa3apquT2GzO8O5Db3ei4mxp61TDHDlQmpRW7i50rMMK8WwATl0ghkCJoeDH3rlN+uMzu9cmRsS33ha62OBoe+0vOYvv1guUDjjkpfoRh90LeZ1cDSnnNu3K6b0x2soZ3Y/1PvBFUdqZjMaQwuVH5pUjcDbgPf+B21o/l2KytakgYo41r5Kl1x8HxDmiTGRe+QQiWBtmxy4GEK+xpS9ADIC3tHzu8j0f7BMGJUinliCkyF0UB9XwjH/QsNBJtTQK2YqezJq3qqFnfWQ1VcA9By2CwOcWcgcuQf4l6eLvUKdZfkMo+8C2g77wgFpjXfCNMFA/NDx+iwRHgqpSXBpKmCui3PSzDHpueXBn7ARCh1c0Y/HLDxqpc8Mpvxn0st+vuI7DLJyGZqorqGXIMuUa0ONnnwAfS3hlSt/fmeImHvJiCpl1ciBzp219lm/bT84aPPt6K8JM3UGfUTp/3yx4BCGJOomz0TbFqTilONAQ6j+q3Nv4kiiFeWp7GG9ekiFkVUrxvBbodYGw8oU/ybHlqTq8dfLCBvIsCVX5mnwJP5RwIIP0YVKpJAOdw+HCd2
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(376002)(46966006)(31686004)(356005)(83380400001)(7636003)(31696002)(336012)(2616005)(47076005)(26005)(82740400003)(186003)(4326008)(110136005)(54906003)(44832011)(316002)(8676002)(82310400003)(9786002)(36756003)(8936002)(426003)(36906005)(2906002)(478600001)(5660300002)(6666004)(70586007)(70206006)(34070700002)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:01:55.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e273a892-0cb5-43d0-b396-08d8b2f34368
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7536
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 21. 12. 20 16:06, Michael Tretter wrote:
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
> Changelog:
> 
> v2:
> - Use clk_hw instead of name in xvcu_register_pll_post
> ---
>  drivers/soc/xilinx/xlnx_vcu.c | 51 ++++++++++++++++++++++++-----------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> index e38e9c8325a7..6dc58cf58d77 100644
> --- a/drivers/soc/xilinx/xlnx_vcu.c
> +++ b/drivers/soc/xilinx/xlnx_vcu.c
> @@ -81,6 +81,7 @@ struct xvcu_device {
>  	struct regmap *logicore_reg_ba;
>  	void __iomem *vcu_slcr_ba;
>  	struct clk_hw *pll;
> +	struct clk_hw *pll_post;

drivers/soc/xilinx/xlnx_vcu.c:86: warning: Function parameter or member
'pll_post' not described in 'xvcu_device'

Thanks,
Michal
