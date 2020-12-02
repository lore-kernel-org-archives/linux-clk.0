Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C6FC64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:42:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E894221EB
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:42:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgLBOmV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:42:21 -0500
Received: from mail-eopbgr700055.outbound.protection.outlook.com ([40.107.70.55]:3424
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726207AbgLBOmV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 09:42:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aqw/TC471LXBOvRjMcsBqdRllb59agMq90uKN4W5zwRc/bP/1KhT/hIGsE2Urdt2l2TPrvg182kZx54I6FrgDhnwq7Avoe54sgMgHKvtIayLReZQBLVmJZgYB9OEFxu9AiJZuBvNzyKhemO7ZCtsQVYT+FITRXvFU6Wm4IaYk5XKTDDK25d1jWD7seEZwN7opRgI8NA1ltp5dIJWu6VqtahpjpjzQT5Qx/6Va7+OoX20gojqNuOs/uX3ieiGU2LiWfxi2jrk5qHGg+6ZRe8McRMvEHAlcnveg/aneM8/xWGWIDYao+/CdUrsQBZ1gXF3OMUsg7PAluIRwbwHA7OZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EexsPDwBjm7vHcFiu5gpiFBp7jZDB5sGTMyWGkA0GDo=;
 b=niy3s9FiUSCBw5qhkXes3+DJt0LeWCximwe05wCWCmtQPP3TBK59XatZ4tJIQwq2DSwL3SVaO8tv2t1teud3yyUj0AYYjxczZ0mTYyBz14g59HvGcutUx9gF4Qu+HXsfPu7cl70Ab5Lg24p1353vWFt6Vt4XAo9SyU33XGVjG+FM02rc0eT9kco1AIBVWczXSjFyv0rD/XWPvq1r2a2rHcZ9ooYWcJHSOajMu1sz8f67pNiz76yrzwyybw4OliDEjw4fY/nSr1e8n+HEtyrDOQberTFi6GtWE3rVj8WRHpaY9uPvl81+oLqN6F03M8for9BoFJeMnPBEVBPI1c47dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EexsPDwBjm7vHcFiu5gpiFBp7jZDB5sGTMyWGkA0GDo=;
 b=lQJ9BbbE4QQVCnAPLCutYWoerctEtK+IqXFAJA8Oz1RVOvFxOHw01kOXW6xNDptAYQuiRP3gQpHKQqT71g1FfsPO8Q3U60GOHZpiHb+KeJzguoqtjksmk6K1byH7z82Ze7flOWK2CKnBlkMV0fBDq9dAE4FAf4TRa2s8Tjd+8J0=
Received: from CY4PR21CA0042.namprd21.prod.outlook.com (2603:10b6:903:12b::28)
 by PH0PR02MB7446.namprd02.prod.outlook.com (2603:10b6:510:15::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 14:41:33 +0000
Received: from CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::6f) by CY4PR21CA0042.outlook.office365.com
 (2603:10b6:903:12b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.2 via Frontend
 Transport; Wed, 2 Dec 2020 14:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT063.mail.protection.outlook.com (10.152.75.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Wed, 2 Dec 2020 14:41:33 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 2 Dec 2020 06:41:32 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 2 Dec 2020 06:41:32 -0800
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
Received: from [172.30.17.109] (port=38088)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkTJz-00057i-OF; Wed, 02 Dec 2020 06:41:32 -0800
Subject: Re: [PATCH 07/12] soc: xilinx: vcu: register PLL as fixed rate clock
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-8-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <dd21102b-599a-25d9-433b-9eb38419ffb5@xilinx.com>
Date:   Wed, 2 Dec 2020 15:41:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116075532.4019252-8-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98371215-31f8-44e6-980d-08d896d05d52
X-MS-TrafficTypeDiagnostic: PH0PR02MB7446:
X-Microsoft-Antispam-PRVS: <PH0PR02MB7446AD6173A66A6CD72032DCC6F30@PH0PR02MB7446.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y09EJusS2U3jjvnJGT+wf2F5JNH9UVMPr53YtqmD7sE0rQ4ZRJc5qC5V47XQFIEDZQjSTi6mz1ov2/oNC6jJekI2pfXYX3LOcYXA2rVNQHpG/rEosYrIAGtOPOSP4sTNZ76n6a1WAjmVpGChhr4m2ol7L1ngcPI6GtWqZB9+6jhg49tT69E81aFNDdu0X28BzCMsRvMDBBXaAN5o6AgUe6zB88j1Q2+VVIjMsoFX7o+HBlYggXOumCrHscgsIw3T8Q48EIPG94wKQUtlhpcNUtiSRSQFkEZmRvtlUlYFqBI95qlWQPZ33gbwfqdKQ14eVQ7Ts4DnKhIK8pTOqsDzqdYbaME8T2+5P+eBe/XSKU6jzrSb1sUeyuHx1UCNgpqFSBhednKpceLGIeOGYXTMo4Wx8aAo782n5h+zUftPomzcZopQtgp4YXZEXW2h0mCsKUoVp+o7tpvRl9ZvrUHSNLisMqb7k0LUwssg/LiAJk4=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(5660300002)(6666004)(82740400003)(7636003)(70206006)(356005)(31686004)(2906002)(47076004)(44832011)(4326008)(2616005)(70586007)(9786002)(83380400001)(31696002)(336012)(36756003)(186003)(8936002)(426003)(8676002)(26005)(110136005)(82310400003)(36906005)(54906003)(478600001)(316002)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:41:33.5353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98371215-31f8-44e6-980d-08d896d05d52
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT063.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7446
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 16. 11. 20 8:55, Michael Tretter wrote:
> Currently, xvcu_pll_set_rate configures the PLL to a clock rate that is
> pre-calculated when probing the driver. To still make the clock
> framework aware of the PLL and to allow to configure other clocks based
> on the PLL rate, register the PLL as a fixed rate clock.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  drivers/soc/xilinx/Kconfig    |  2 +-
>  drivers/soc/xilinx/xlnx_vcu.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/Kconfig b/drivers/soc/xilinx/Kconfig
> index 0b1708dae361..9fe703772e5a 100644
> --- a/drivers/soc/xilinx/Kconfig
> +++ b/drivers/soc/xilinx/Kconfig
> @@ -3,7 +3,7 @@ menu "Xilinx SoC drivers"
>  
>  config XILINX_VCU
>  	tristate "Xilinx VCU logicoreIP Init"
> -	depends on HAS_IOMEM
> +	depends on HAS_IOMEM && COMMON_CLK
>  	select REGMAP_MMIO
>  	help
>  	  Provides the driver to enable and disable the isolation between the
> diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> index 34f3299afc0d..725e646aa726 100644
> --- a/drivers/soc/xilinx/xlnx_vcu.c
> +++ b/drivers/soc/xilinx/xlnx_vcu.c
> @@ -7,6 +7,7 @@
>   * Contacts   Dhaval Shah <dshah@xilinx.com>
>   */
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/device.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
> @@ -80,6 +81,7 @@ struct xvcu_device {
>  	struct clk *aclk;
>  	struct regmap *logicore_reg_ba;
>  	void __iomem *vcu_slcr_ba;
> +	struct clk_hw *pll;

this is introducing kernel-doc warning. Please describe it there.

M
