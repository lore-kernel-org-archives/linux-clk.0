Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C36AC433E0
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 14:23:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44ED664E70
	for <linux-clk@archiver.kernel.org>; Fri, 12 Feb 2021 14:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbhBLOXV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 09:23:21 -0500
Received: from mail-dm6nam12on2077.outbound.protection.outlook.com ([40.107.243.77]:58753
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231809AbhBLOXQ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 12 Feb 2021 09:23:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ddiR4lvGfKN58qLwtp21hKqQzrmCc1x8zS/cFGH+LFzmvjrBs89Ue71PJ78VfQXbQ+zE8ZHw+8x54COwmGbHQP0aFsilrdDAuFwAHexTl0+d9XTnVhYG0X7N5iyIGJVkVVeOQUbTLkRXwJEPmIwR5k9IU5/sHMeGM3Ll6Ydrg2bQZbVhGSvyTwdgR8Bz+sjWEIrplzAc5Y0C2uL8GDcJWxAGY0Csc7GoAmBLvwn8wppFNw0qNKaDyTtjLV7bWfOR30wwdJxrYJQyaRx/M8WYoQPm0tfZEoC28lTp+mnhnpT/JDrLJ/TKBS4JqNBM9/dOysozve0wzB5NCCucleN3kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMbp7bGH8O4crNbX0Uwmib2tV+PrlV1JDgbTvYheJqI=;
 b=KboWI7PdnPVm8djXUiv+3JmZwtQ8iP57YBs9lc5uGgSH3LsHhGcleAbj3QwfQzPVSLh5V94BQFN/BOuMyrje4u6K9JCSICjFpYIxIWfgaxe1hNjeErUPVFmrS2A0MaLltKhnnz0bGMTKF2yHCA6QJwrh6jtr1EqKAyMWjWj4PSBT7TomaP+296DuLgNeHusks3NnJDPktEdKJBiWlR/Ib/n3H38FuNDjoftJc7isa29iZ6yZc7SgAMDhpRPfdUnFFcBSc+7h0kC4+gFPWq3PM93wJMXiTV2URSAaKO8ekV02g6m00AzM/DEghUHkm0VaUHA2Wbf/+yOOxoBAZ0P5Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=baylibre.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMbp7bGH8O4crNbX0Uwmib2tV+PrlV1JDgbTvYheJqI=;
 b=IgF6HmjuC7qPFlV8KYi/r0Kp3QBF8B2dLwjiC3pf0rS4om+hB2zfLWAbX+uA3yid70P2xgVBqvrkjKKhKV68JkzjCbLYjHUHBmclBejGw1n7o4ZgOG9HbsToQEWtk817aZh4vUqE1nnP52jm9+y+2CWFr6JJHbdcoEIDvRJGHJI=
Received: from DS7PR03CA0247.namprd03.prod.outlook.com (2603:10b6:5:3b3::12)
 by SN6PR02MB5182.namprd02.prod.outlook.com (2603:10b6:805:69::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 12 Feb
 2021 14:22:21 +0000
Received: from CY1NAM02FT045.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3b3:cafe::6f) by DS7PR03CA0247.outlook.office365.com
 (2603:10b6:5:3b3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.28 via Frontend
 Transport; Fri, 12 Feb 2021 14:22:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT045.mail.protection.outlook.com (10.152.75.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Fri, 12 Feb 2021 14:22:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Fri, 12 Feb 2021 06:20:05 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Fri, 12 Feb 2021 06:20:05 -0800
Envelope-to: git@xilinx.com,
 mturquette@baylibre.com,
 gregkh@linuxfoundation.org,
 sboyd@kernel.org,
 devicetree@vger.kernel.org,
 devel@driverdev.osuosl.org,
 linux-clk@vger.kernel.org,
 miquel.raynal@bootlin.com
Received: from [172.30.17.109] (port=48580)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lAZIh-0006zL-QF; Fri, 12 Feb 2021 06:20:04 -0800
Subject: Re: [PATCH v7 0/7] clk: clk-wizard: clock-wizard: Driver updates
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
CC:     <linux-clk@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <devicetree@vger.kernel.org>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <mturquette@baylibre.com>,
        <git@xilinx.com>
References: <1604502407-14352-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20210121153947.04da6fc1@xps13>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <ed0d242b-203f-6166-95a3-1e9fe45bb689@xilinx.com>
Date:   Fri, 12 Feb 2021 15:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210121153947.04da6fc1@xps13>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38a0ff53-511a-4050-2a50-08d8cf619c29
X-MS-TrafficTypeDiagnostic: SN6PR02MB5182:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5182BB46B1123DBAF88AD1ACC68B9@SN6PR02MB5182.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSl7P+ad7OnwG0ZJSfmjVYrDrJpO0w3SW58Y5DRggJb5/ElRa9ZpizwawiOlpUowLOjHaJo+eC3xuT746WeHa9VlCL0RNqxsidaLamf2DoWtkNGTd/WLP9v0cNSyoWTspwLkAF7FxBgAjx6v/AKxpc4zOokQW2hv1MRpo1Hr7JwKZNFvot24yfq4Co3zxTngSsUzWv8DYn63jfi/h3vAjOR94rVm44Qv4TOFt1d/H3ApQ3/7yNiGfhzdxrssrg8KPwSAlBrirgehHwMubcLg3S9IBLPD4FevRHR7AgzBwSJJ2wJ02AD/qHKzsEOCpDFonHApQzgv9D8Tbnyw5NNAFdk2PaPhV3D7x1nNuSvv7jX4yLdkXT9kloniyOFjCrXzB7MnLwGjO10HiHIz1aB6ZcOdBd6gEB2NhLEWdKCxsNaUMGKvyg5CxioEJYaWDI8IucSUrfFIiMGdjPW+6Wh13NSa+kUY+qHcRw9xOdUd2PHrGo+ctLq5VP96XTYKGVStUtqLGDGLO8W9bLOGQKn3GX1XgqT3zaC7ByDKDCI/UcNRpEuh5KZt4Eq58t+00yjUdkg+jl3iBMEd6ihQXQro9P2LWuNGNKa3nyKwqs6kUtOQqBXcUDKuYn6T66mc99NCZRlQsA8enIsvsv8yDo6bwjzlXIliUNLoa7liCctPAF4MTkJGGrpjPq2zEwKQEeOLS1UUrdoUzD5iUgn8/Q1D0JfZOdb3uZdnw5RA4F+evJSsrb7Gthee+9N+aWseIfY+XZRvE3twEaF6t0zam5J42T5SG3CZOU1Ex1nr6nIp+6Q=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(46966006)(36840700001)(9786002)(336012)(7636003)(426003)(110136005)(26005)(316002)(36906005)(186003)(31686004)(82310400003)(478600001)(6666004)(31696002)(5660300002)(2616005)(70586007)(70206006)(2906002)(44832011)(36756003)(36860700001)(82740400003)(6636002)(8676002)(53546011)(54906003)(356005)(107886003)(47076005)(4326008)(8936002)(966005)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 14:22:21.1016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a0ff53-511a-4050-2a50-08d8cf619c29
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT045.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5182
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Miquel,

On 1/21/21 3:39 PM, Miquel Raynal wrote:
> Hi Shubhrajyoti,
> 
> Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Wed, 4 Nov
> 2020 20:36:40 +0530:
> 
>> In the thread [1] Greg suggested that we move the driver
>> to the clk from the staging.
>> Add patches to address the concerns regarding the fractional and
>> set rate support in the TODO.
>>
>> The patch set does the following
>> - Trivial fixes for kernel doc.
>> - Move the driver to the clk folder
>> - Add capability to set rate.
>> - Add fractional support.
>> - Add support for configurable outputs.
>> - Make the output names unique so that multiple instances
>> do not crib.
> 
> Can someone tell me the status of this series? I think it would
> benefit everyone to have this driver "officially" supported in the
> main tree, unless there are crucial issues; in this case it might be
> good to know which ones?

v8 was sent here.

https://lore.kernel.org/r/1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com

Unfortunately v9 is required.
Shubhrajyoti: Can you please keep Miquel in CC on v9?

Thanks,
Michal
