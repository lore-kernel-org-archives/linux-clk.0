Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246E9C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 08:17:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDF3D61967
	for <linux-clk@archiver.kernel.org>; Mon, 22 Mar 2021 08:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhCVIRW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Mar 2021 04:17:22 -0400
Received: from mail-eopbgr760048.outbound.protection.outlook.com ([40.107.76.48]:41442
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230001AbhCVIRC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 22 Mar 2021 04:17:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CzC2YtO7jbs8mdkTU7cStGpmAnOg4jvKXk7jBibBx2B0qHVSRks/5VfuX76dWEdZ5lsGMJPqiFzGrNejpGhq3SHXvn/nRxjFRU3EkNJEkLIxAFmWOfyUW+wyd8Bo2ievVWdYrI2lIplsbGihfdjLkFX/TsHn6JAvOj6NnbGA9TXoGoBjkmXzjPFnxiaFYI4f5IW5lPJ4JjUiuG4u+KOdv9zannJKzA+hh8WEsOmFPDFDzQZgaMdFdOPmVxevaoGTZYprOagJIUAeqIov2mA/LqtveGYQdPztx2hPgNGk/naI0Jmdav15UND4bum0pDIenNzTbWhjdpLMYf2A2H0gWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2M1UqVyRq7ydOJNxyzaTnDVpegkjDns7i3VNLWWcKw=;
 b=FYzDBId7JDniLY/pquz5osIFw4gCFETNDfcV9AKncLhyZgeAWa+D7/GWQjSpCvvZs6FxdKlg4RNzNBoI5FdxrAKKUXTFKX5ySjIVo5t1Wn5tvsmarMvDzRKjbq4doERMCfd1jHU64P9kbWFyvk90/Z//7GrLlBAIWcSCdLA6Uwg+EKGLeFwgMMYrxcUwawr8DvQ5b+825sVAgfJiIE65yHC+RSzD0dgcxEmrcCk3tSUaC5HXozZ4Ryy+Em/ZVD92MlpVajLlkm3Cz7Et1rmtfyasq3suJkY32DOpphREUWkcA20rrCWsrhzUFeVuqlRFqaFFM54ZLR6+krt3GsTEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2M1UqVyRq7ydOJNxyzaTnDVpegkjDns7i3VNLWWcKw=;
 b=JmgGwfzpj/NNhk7GOAmx0B/Ggdv4yQlAAcC+wJWaRPhzqQUHvF3fljIuUo8LZp86rVz+TbTVx1WjIc8wqAHFNr/8Sw8sW8pWcuUo1G3zD9OuQQLmNrtapO3vDVliMti1p1jrRqApQzs9jvsDiN99MkWGiV+vlKjztX163u3TTCY=
Received: from DM5PR13CA0024.namprd13.prod.outlook.com (2603:10b6:3:23::34) by
 SA2PR02MB7772.namprd02.prod.outlook.com (2603:10b6:806:149::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 22 Mar
 2021 08:17:00 +0000
Received: from CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:23:cafe::b7) by DM5PR13CA0024.outlook.office365.com
 (2603:10b6:3:23::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.10 via Frontend
 Transport; Mon, 22 Mar 2021 08:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT014.mail.protection.outlook.com (10.152.75.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3955.24 via Frontend Transport; Mon, 22 Mar 2021 08:16:59 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 01:16:59 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 22 Mar 2021 01:16:59 -0700
Envelope-to: linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 punit1.agrawal@toshiba.co.jp
Received: from [172.30.17.109] (port=51714)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lOFkA-0008NL-Pb; Mon, 22 Mar 2021 01:16:59 -0700
Subject: Re: [PATCH v2 2/2] clk: zynqmp: Drop dependency on ARCH_ZYNQMP
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        <michal.simek@xilinx.com>
CC:     <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20210322061754.1065367-1-punit1.agrawal@toshiba.co.jp>
 <20210322061754.1065367-3-punit1.agrawal@toshiba.co.jp>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <5a22c6b0-cda1-c6a1-72d1-a13bca5ad9a5@xilinx.com>
Date:   Mon, 22 Mar 2021 09:16:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210322061754.1065367-3-punit1.agrawal@toshiba.co.jp>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3b895f7-e5ce-4ace-1057-08d8ed0add97
X-MS-TrafficTypeDiagnostic: SA2PR02MB7772:
X-Microsoft-Antispam-PRVS: <SA2PR02MB7772280DD75358B5F2047F97C6659@SA2PR02MB7772.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2FyAZ2hswFOiYzoUsrLOepV6b0fzw+sIq8VjAXO4EXAxGsdrYkBasbUMgPFaRSJsW0xm49EAdj6KuaYvwtQOefMcx9euMy0mK30ctGA8vg3wiD274A/FVQib9xTLFhASMzDOH8ndUAHqCGTu4VmxbILO0ZDuhSLpdLR8bL1gekirFAabsMuKIa5PUJgkMHBRCTH/iR67hvkouMzDGVwjz2ZBMCx4PEguEYxZ0BF2LX1TewuO62nDk65yr5JBo2oclSSOz/YXWIFipaL1q0kdzcIfEdUpeOavwF8FhbKDNg/+BTKc4qI6AbTfixYTlTjU4aKS/eYaBSDC4GowzpgAiFdY8GjOwwhpHFNcKOtTd8VYBN3lg3OBfASPaI1LnOSfoZNh3og5WZv68837vZbo/6/+KeUBwo781cHsx2PhbkFfpPEUNJPxd5SREYqyd5XhDC2Q1cIbmZYsor0kEMB//LbipMyaO5SFHVXdvufU/a2gfn4PRHazlMeXgmp8mnme7TaBVmq4+mJJAR+Ixc+a5B4M+HprWuUEr4n1c9woYsfwpRCbTqeIO+U7x3schtcyKCY36k2nAam/zZzPVrsYCCW859NAnRMkGOkyy/LJfr9WkP6sZuZ1MDeqfu4jw4Ru9TmZt68Yv2d/oN+5mR0z+fpLayFFJsm7kKjOjroPcZpo3c3jr32xSHtN8ujfJw6kJzHeMM91eoMZYua3jv+hsA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(376002)(396003)(36840700001)(46966006)(186003)(6666004)(53546011)(26005)(7636003)(70206006)(426003)(4326008)(336012)(36756003)(70586007)(31686004)(47076005)(82740400003)(2906002)(44832011)(356005)(2616005)(83380400001)(9786002)(4744005)(478600001)(54906003)(31696002)(5660300002)(36906005)(316002)(8676002)(110136005)(82310400003)(8936002)(36860700001)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:16:59.5426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b895f7-e5ce-4ace-1057-08d8ed0add97
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7772
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/22/21 7:17 AM, Punit Agrawal wrote:
> The clock driver depends on ZYNQMP_FIRMWARE which in turn depends on
> ARCH_ZYNQMP. Simplify the Kconfig by dropping the redundant dependency
> on ARCH_ZYNQMP as it'll be applied transitively via ZYNQMP_FIRMWARE.
> 
> Signed-off-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
> ---
>  drivers/clk/zynqmp/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/zynqmp/Kconfig b/drivers/clk/zynqmp/Kconfig
> index 14e4f5c55525..00df6be25c5d 100644
> --- a/drivers/clk/zynqmp/Kconfig
> +++ b/drivers/clk/zynqmp/Kconfig
> @@ -2,8 +2,7 @@
>  
>  config COMMON_CLK_ZYNQMP
>  	bool "Support for Xilinx ZynqMP Ultrascale+ clock controllers"
> -	depends on ARCH_ZYNQMP || COMPILE_TEST
> -	depends on ZYNQMP_FIRMWARE
> +	depends on ZYNQMP_FIRMWARE || COMPILE_TEST
>  	default ZYNQMP_FIRMWARE
>  	help
>  	  Support for the Zynqmp Ultrascale clock controller.
> 

Reviewed-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
