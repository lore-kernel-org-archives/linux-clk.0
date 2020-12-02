Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BC7C64E7C
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C6AF217A0
	for <linux-clk@archiver.kernel.org>; Wed,  2 Dec 2020 14:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgLBOee (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Dec 2020 09:34:34 -0500
Received: from mail-mw2nam10on2081.outbound.protection.outlook.com ([40.107.94.81]:6112
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727460AbgLBOee (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Dec 2020 09:34:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3gdGYMTzm1RqpSX73+qFpBIZFZ/jXo2Y3d3DE7w7y3ZB8iAwp8LPtjryozgxSh5UvaexWXfTtGcDjN6EdfB/Wu5jS7+wYC2MUIzTQnZ/WrqnsbjM/Yfjs8C2BDTseHlb/Jz/Wyzcw0dKQnXhaywWL/NrAbnVWPacbiUfbqT5e7RI31Rr+CgEozqcaBrGbEWBT0+r9dubpd0Pq7Tpe8bVrQxj2npBmZoTOIYC7JtVMHW3y4gaTqcAJ1hMUKuL0VsPIGnzdlOMoAChBuz4yqdzPe7z5vYTLsmuOwvVZSCAsbUJAjiX167gsjPXpaaxoAKiOlLn8S1067at4bjUaL/yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc1bPpjlIuXfxqfyLxQZtqIKc8rvYDDvKN848EOB3Dw=;
 b=iapUrihG0oBcRyoRrcvu5HGt1XOFjDotBsJYK/hydCq5e0jft1a9Y4Tzd5hELQApiqaF/Vk3OW5c7gR4XlDY0kNm9/cWbb2byWiBR1K1oAHMdQ5Yw9jp6Gx4k4aHqF4hnKWXyDQmehiPRLmowVYdpPswZu/MG9NImJ3FNVC8NzG0LQIj0VguEKA4HIFFqnCNvHmjsr20fQ/xWUeWvapuJtIu1VT8F4Ij/NdCLnYK56doF1iy2cV/fr2jZ8q5KcmDp/zzReCcR2XBJCNqOXBfmqXD0izmuEedSHw0b2YY1DEfYQTfoeopGg7mVcnMJPTtiCkJAxH/YgXGDgDtARyxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vc1bPpjlIuXfxqfyLxQZtqIKc8rvYDDvKN848EOB3Dw=;
 b=F/FZytQXJCVBEpnyTUwcOLofUWXrDhZ4sdu3OkZAmfhb7aAfBL6kaf+A7OYfDmG50tO8pKZnQ8jVHszMQDKIN4Pz3j3IrJ1kLospi1B42zO2/vBRbxaNrDe7OCKFTpbW2AizuZTPCroR3bh4Lvv8BKosovfmmdn4v8EhiMDRYVA=
Received: from CY4PR22CA0094.namprd22.prod.outlook.com (2603:10b6:903:ad::32)
 by BL0PR02MB4387.namprd02.prod.outlook.com (2603:10b6:208:45::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Wed, 2 Dec
 2020 14:33:41 +0000
Received: from CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:ad:cafe::52) by CY4PR22CA0094.outlook.office365.com
 (2603:10b6:903:ad::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 14:33:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT020.mail.protection.outlook.com (10.152.75.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Wed, 2 Dec 2020 14:33:41 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 2 Dec 2020 06:33:40 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 2 Dec 2020 06:33:40 -0800
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
Received: from [172.30.17.109] (port=37388)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkTCO-0004I2-B0; Wed, 02 Dec 2020 06:33:40 -0800
Subject: Re: [PATCH 01/12] ARM: dts: define indexes for output clocks
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-2-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <8534d394-0ead-e17b-f70f-597cb307ae1f@xilinx.com>
Date:   Wed, 2 Dec 2020 15:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201116075532.4019252-2-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c45010ef-073a-4ca1-17d3-08d896cf43e0
X-MS-TrafficTypeDiagnostic: BL0PR02MB4387:
X-Microsoft-Antispam-PRVS: <BL0PR02MB438705114C267AF268E3EACEC6F30@BL0PR02MB4387.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b7CqL4PGawP5wB2t8WxbFYJ5t0JGsTVtkNySrewZe5cA/NQepUPqmHJSMkmITtdJhYLnweoT0XZhOqrWqAO+RxHqye9i9882B00tch/FFQxwGFOcNZdWAeqMbxEH1AVORZbbkemhG6mS06llrLKrGH2c+QAkcOegnsXgXO+Ho+NN3EtafVJhJyTMC6WziTlwW0oEUfKWmIcoesLaF8O12SHIi4x3j56gDgY6w1gmUHBSSjiYp2tOrvVDokFCadNaau8VPeDyXA8Jug7ZFb1t8S+CZRXP9m1CthDd91N40S2f7ahucDHoi1cyHnS6HZ2ttcnC6QiXco0TVd7ZQxOImJMDzK0S3WrllukJGFdYstNunjGZUWmFtRoR8prPqbyTzcoog7GIW/TFkwXLZNrJ2ixHEoLhc45slTDYrUFSdNMKV52VkY9ETyOTS1oRG6fG5sZcNsXwzmEFqC73u8mPKbbkjlrymFpXemMwQTX4AcM=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966005)(54906003)(9786002)(110136005)(8936002)(31686004)(2616005)(186003)(31696002)(26005)(6666004)(4326008)(70206006)(82310400003)(5660300002)(316002)(44832011)(8676002)(36756003)(356005)(83380400001)(70586007)(82740400003)(47076004)(336012)(426003)(7636003)(2906002)(478600001)(36906005)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 14:33:41.3451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c45010ef-073a-4ca1-17d3-08d896cf43e0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4387
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 16. 11. 20 8:55, Michael Tretter wrote:
> The VCU System-Level Control has 4 output clocks. Define indexes for
> these clocks to allow to reference them in the device tree.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  include/dt-bindings/clock/xlnx-vcu.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 include/dt-bindings/clock/xlnx-vcu.h
> 
> diff --git a/include/dt-bindings/clock/xlnx-vcu.h b/include/dt-bindings/clock/xlnx-vcu.h
> new file mode 100644
> index 000000000000..1ed76b9563b6
> --- /dev/null
> +++ b/include/dt-bindings/clock/xlnx-vcu.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2020 Pengutronix, Michael Tretter <kernel@pengutronix.de>
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_XLNX_VCU_H
> +#define _DT_BINDINGS_CLOCK_XLNX_VCU_H
> +
> +#define CLK_XVCU_ENC_CORE		0
> +#define CLK_XVCU_ENC_MCU		1
> +#define CLK_XVCU_DEC_CORE		2
> +#define CLK_XVCU_DEC_MCU		3
> +#define CLK_XVCU_NUM_CLOCKS		4
> +
> +#endif /* _DT_BINDINGS_CLOCK_XLNX_VCU_H */
> 

Missing vcu in subject but I can handle it myself if others patches are
fine. If not please fix it in v2.

Thanks,
Michal
