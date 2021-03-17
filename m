Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31515C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 15:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC61964EF9
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 15:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbhCQP6T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 11:58:19 -0400
Received: from mail-bn8nam12on2084.outbound.protection.outlook.com ([40.107.237.84]:20448
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231784AbhCQP6A (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Mar 2021 11:58:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBfyMSQ7EmemN9Sk6bv5T+wCiybGF4AXgX74Xwej1lMg0tD6BAWoevJ9QZ8kh8KF/onDvSdqZKMh7fPp9f1v7grC5/OsKqUXoZbJRD8eCedClxu7y4ULqp78YsSvQpkl5gETBXNRN0r00i79cq3spkQE4gTKXyOiLrKFYdqK+I9haO8LORl+UvvjMRkQ71GHaEnX8SMmjAf8rdAxOe6HeABeoEltkHDahYrV2CG+Yk1kLCcSiGMRqfW59V7TcE+jJZIEMY1pKrQCpirB/hI5NlgT3TqEWV3jqB1ZJXwtInRSj9Na9J6gQlBJ0sHP9+sX6VuAUgtX2PmAOk9czM/8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMZwZqRyvZ1lr0tuvyBWg/upHmVJM+uZPrKn66hfaR4=;
 b=S/kQMjZ91Am1o+vXbaqd+V9bxfK0EiZmojeeG0jEfoVRdkx8pbKl6LTq2pvCE619SSbz0ixqxHLQ59NL/Y8lgcR9cRB7c5Jbui7f4Aa0Lqrff9OYQTS4yVAWBNQA655yWOl2JLfn2y9nAZUF8so2rSfu+kYQlu/oTwGyxhI+Ze+j2KGYRxKgs7l8tflSdmBoD6e0gMEokNKT99pDr2sn8S2S8WGvQciGIXhdoOKLfpNNJo/d3pexqEtXuTpH7WpbjKtauhzXnLDvxIIjym/Nd3gQXSF+KylXeLQqGr2EZnNQ7ROS1VsTAyOZyjKi3EIt2Tddn2MsnGd0UtDguIRyZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMZwZqRyvZ1lr0tuvyBWg/upHmVJM+uZPrKn66hfaR4=;
 b=l/OyuwYJoewgfbvmX51oFp2CXltXmoKxqYXEtRseq5ZlaXUHbeOFKxRWj3d3dBy5UFItcWUOeZTiIzUbbaT29zZGMp3zL4dAa2cieum0Eg9jIRamdQok/825FHUhMMLhsjT0AQWK8wLJDRXRiP35DOWB/skn1POEfp6l8KmuPJ4=
Received: from SN4PR0501CA0006.namprd05.prod.outlook.com
 (2603:10b6:803:40::19) by CH2PR02MB6773.namprd02.prod.outlook.com
 (2603:10b6:610:7a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 15:12:47 +0000
Received: from SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:40:cafe::ef) by SN4PR0501CA0006.outlook.office365.com
 (2603:10b6:803:40::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend
 Transport; Wed, 17 Mar 2021 15:12:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT060.mail.protection.outlook.com (10.152.72.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Wed, 17 Mar 2021 15:12:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Mar 2021 08:12:46 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 17 Mar 2021 08:12:46 -0700
Envelope-to: linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org,
 sboyd@kernel.org,
 punit1.agrawal@toshiba.co.jp
Received: from [172.30.17.109] (port=37512)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lMXqn-0002oR-Vy; Wed, 17 Mar 2021 08:12:46 -0700
Subject: Re: [PATCH] clk: zynqmp: Enable the driver if ZYNQMP_FIRMWARE is
 selected
To:     Punit Agrawal <punit1.agrawal@toshiba.co.jp>, <sboyd@kernel.org>,
        <michal.simek@xilinx.com>
CC:     <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20210316090540.973014-1-punit1.agrawal@toshiba.co.jp>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <10d60612-2ee4-2fac-888e-6a2262f39469@xilinx.com>
Date:   Wed, 17 Mar 2021 16:12:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316090540.973014-1-punit1.agrawal@toshiba.co.jp>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb9b3deb-297c-4c6d-9497-08d8e9571f39
X-MS-TrafficTypeDiagnostic: CH2PR02MB6773:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6773622E8393F0E7F776E6BCC66A9@CH2PR02MB6773.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KxK2QHGGLILUuFDBBHN/qQt8gZaAeTV9PLE5r5g6ca/FL4S70AcsHkZUADJYIiV0VmTxpVTp1YITnvq0sGi3a70wLU/b5EnXSmWQ0Mre9tHktIAriU+2xj3Yi2yFPAb537m6AbViGtVOcPW89HB01FK+bi/6qToD5tjQAbZ1fFes9+vlGzpooP2cAbix53RB46q+9z1OQfN0fDrtZHIfvyXC5zrveKyiPAjU0qBEaYs+m9DG0fB8tJrgsq+tyRKflWNDWp4siN/q6WB4gvqNszlJynkflBN1Jb+3mmDCUu0biTrncfeKR8H0FsXDDtXSna/CbmPThQtBM3i93vgO2/g3+YTw08qNsTFkJug/8qkDH9t+40wHxfqx1D5fUXA8bklUlPmblnw3I11PFVHP0WVDOMZHTUXgB5FODOLyZaFMY+Zfj4/WHtuZLkBIWSN/Uf7RQ6DKiRSXBFD7oinUjtPio/bsNCuR9k19lOJ1W4lb17Sa6bOKCy3qnIjvDuFjCOct1bsGLG0zqROZkLe8/QPojvnVSyfIHG9/tDQcqsYJKd/oTfdt1IiYa76DfzXRVH2vixvz04rRqj60P8OcLZWhKPlAbXJskg6I1mNrnVHEYsEJVDOy/l2jWH+1xI1yha+KAWy+prPD9i8+TZKW5Etn8I3mh5ResAopjg8xIcnj2RIPhA3Ts5xfidrMMJIQVtxJbO9ALqC8MkD2zsbpWg==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(46966006)(36840700001)(54906003)(5660300002)(316002)(82310400003)(110136005)(8936002)(83380400001)(8676002)(6666004)(9786002)(478600001)(31686004)(356005)(82740400003)(2906002)(44832011)(4326008)(336012)(7636003)(36756003)(2616005)(426003)(36860700001)(31696002)(36906005)(47076005)(26005)(186003)(70206006)(70586007)(53546011)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 15:12:46.7409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9b3deb-297c-4c6d-9497-08d8e9571f39
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT060.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6773
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3/16/21 10:05 AM, Punit Agrawal wrote:
> When booting the kernel on zynqmp based platforms such as Ultra96v2,
> peripheral drivers such as that for the sdcard depend on the presense
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

I am fine with it but I think we should fix also that depends on
ARCH_ZYNQMP. ZYNQMP_FIRMWARE already depends on ARCH_ZYNQMP that's why
it is redundant here.

Thanks,
Michal
