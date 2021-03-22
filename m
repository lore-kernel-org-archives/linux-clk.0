Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27A0FC433C1
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 08:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D092C61967
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 08:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhCVIR4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:17:56 -0400
Received: from mail-eopbgr750040.outbound.protection.outlook.com ([40.107.75.40]:18086
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229897AbhCVIRS (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Mar 2021 04:17:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVDHzsmMnFV0eX9veRirgbGvlw5dOYNk0YTJI1dAboJpgnrwljLVOwLdsWey7zvdO6IEDOCHYkNBX0YoUz3xHNZh6s/PL4R7RzN4DgjylRNrFUnJA9UgUjhGMxfGV9mYTWZuXui7Ah7eUoFAE6P6yk4D9frwjJVKTwHZc7niQb9ewvVP7+DL21FA1U7q/KYyuWshxqfygLHdabPKo5D8FHXmqQTy8Mkl++Tf00F65Ak8HT4fgLmJFwykANR6lCEmCMaHrF8LhYnGvrCfnPt4j37Insa3nrFckcj7qBIQNSX5WTtcGjbWdzUAQxL2lXf7UBI2ik7c0dhdZWwiuaBUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtxLk18I/+ktfwrsTEQ5lV9YRW/3yjZCpeqfMXaqcBw=;
 b=W7mao9DT8g/9Ts/B1NgVtj/vjf/wewhCvn6oFlgOONOme2PYCL8fIerkGOCKehPFunpIndScNNAYCneS0+FtCoV4TeTrTYNF95hNxqRdBo+2p2F2gGEhXCdNoYSpSxgs19xvMWbKO9sFbSxFODBC7Pqf/OkA7vdDYps9w7Hp/ekhmvOT21owgRBL+AiUzrtohmLLA2nSvRwkbLjYCd9fN9D0G/rW3QNza3MaVTaKuYVMokF1sN235uRzjuc64TdUCFn1YYNf5mTk8Cr8jm2gOSzLdgKul3HoATTFwvfh8OxewT3iZFqU4XuoNg5TYWY3WA2REBUuvKtoXaRao6JxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtxLk18I/+ktfwrsTEQ5lV9YRW/3yjZCpeqfMXaqcBw=;
 b=krRzUCkUmPAlV6qZvx94Bm+eWJaGIk+8+4z39AHwEbqwGSMXHM1WIu4id850+2TYN/NUwiHSVUVHp2eOo4HG0g4BtJc4sMVhKIjjXtJkeiFN+rbTUgXCTSgcNcF2J898vY5nCHyTDIHZ6+C6Qysph6pbWf7vJq8KEtUCHzCJj98=
Received: from BLAPR03CA0053.namprd03.prod.outlook.com (2603:10b6:208:32d::28)
 by CY4PR02MB3317.namprd02.prod.outlook.com (2603:10b6:910:7d::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:17:16 +0000
Received: from BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:32d:cafe::d0) by BLAPR03CA0053.outlook.office365.com
 (2603:10b6:208:32d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 08:17:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT014.mail.protection.outlook.com (10.152.76.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.24 via Frontend Transport; Mon, 22 Mar 2021 08:17:16 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 01:17:15 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 22 Mar 2021 01:17:15 -0700
Envelope-to: linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 punit1.agrawal@toshiba.co.jp
Received: from [172.30.17.109] (port=51738)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lOFkR-0008Pk-2U; Mon, 22 Mar 2021 01:17:15 -0700
Subject: Re: [PATCH v2 1/2] clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE
 is selected
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        <michal.simek@xilinx.com>
CC:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
 <20210322061754.1065367-2-punit1.agrawal@toshiba.co.jp>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <34f7de13-71bb-9653-52d1-c3376729d046@xilinx.com>
Date:   Mon, 22 Mar 2021 09:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322061754.1065367-2-punit1.agrawal@toshiba.co.jp>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96abf6e9-e320-4e63-0c9d-08d8ed0ae7ca
X-MS-TrafficTypeDiagnostic: CY4PR02MB3317:
X-Microsoft-Antispam-PRVS: <CY4PR02MB33179F17F21DC3E339DA0A66C6659@CY4PR02MB3317.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ltFl50zjWdjdce9RMB+sAiPpg1HbxfZw3k05cj9lrXUl2v/oSS0aMssS5gpk9pTHJ+VzU4Z8LgKFRYth/xJrfUTdzDd+0Ic+01ffnbmlZQ2rKKKsSlKATMbWHsPx/dO0be66veYBlfgvKMvZJ8wRYKx0k89btB9TEyGSLSlNJOdfuqF3V8RNjaiSGcMtFYn/aC5ZoJZ3hK2jqDpKKejodpfJ0Tji4qssRlMTOMyDyL+PP1hipTkFD9pT5MORlHDA8OvYO6UzZ+mnDd1wttaM4OjXh44kiBw0+Ex2tIlzBNv8iAFXZ8r+wzVJgrG1iDCYf4GjJe1+++JpSSKX1W+8Jg+n2NFw/eGC+7/+FfmpjEU1aVNoNa34THNHKbA3gpsagg1roSXAelnqjAtgKuGUOhuQrOds0GRT06LsKlAsPziy255TXth29jOjC01lvSPi2P2Q8D19nYT2QljY63yE16lL7ml1m+ZkrkGIEhzsxfFuqUdDCRs/9uBtmdc9FNnhcyJYi9pSlc9MLwETd0QisTR3mokNfBrKxNQvJ5DCzwpmT/QB++cwDRXXVtrXyKyqTLEqVcpNbV+RZ1nJGlQkezR2AVAifkD3peScsGHGYGDyiftaI/eOswWlFrwUivRBJAtdCox5HJDCaF7OxWgaqKJK5XTT2YUCTTRs7axsLl/6gDQqiy7/t2Z3r2S9njSM1qf5ABspivpT3UbAhSnHoA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(39850400004)(36840700001)(46966006)(356005)(70206006)(7636003)(83380400001)(2906002)(4326008)(31686004)(82740400003)(9786002)(5660300002)(316002)(8936002)(478600001)(36906005)(70586007)(8676002)(4744005)(54906003)(336012)(26005)(47076005)(36860700001)(36756003)(6666004)(110136005)(31696002)(53546011)(186003)(2616005)(426003)(82310400003)(44832011)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:17:16.5580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96abf6e9-e320-4e63-0c9d-08d8ed0ae7ca
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3317
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/22/21 7:17 AM, Punit Agrawal wrote:
> When booting the kernel on zynqmp based platforms such as Ultra96v2,
> peripheral drivers such as that for the sdcard depend on the presence
> of clocks.
> 
> Enable the clock driver if it's dependencies are compiled to avoid
> building an unbootable kernel.
> 
> Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---
>  drivers/clk/zynqmp/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/zynqmp/Kconfig b/drivers/clk/zynqmp/Kconfig
> index 17086059be8b..14e4f5c55525 100644
> --- a/drivers/clk/zynqmp/Kconfig
> +++ b/drivers/clk/zynqmp/Kconfig
> @@ -4,6 +4,7 @@ config COMMON_CLK_ZYNQMP
>  	bool "Support for Xilinx ZynqMP Ultrascale+ clock controllers"
>  	depends on ARCH_ZYNQMP || COMPILE_TEST
>  	depends on ZYNQMP_FIRMWARE
> +	default ZYNQMP_FIRMWARE
>  	help
>  	  Support for the Zynqmp Ultrascale clock controller.
>  	  It has a dependency on the PMU firmware.
> 

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
