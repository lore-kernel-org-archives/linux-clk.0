Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E52EC433DB
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jan 2021 10:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D58C423138
	for <linux-clk@archiver.kernel.org>; Thu,  7 Jan 2021 10:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbhAGKLK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Jan 2021 05:11:10 -0500
Received: from mail-eopbgr760045.outbound.protection.outlook.com ([40.107.76.45]:61771
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726313AbhAGKLK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 7 Jan 2021 05:11:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XX6CwEV52ZjxmilgwLjAadVY00fxYOqc4cbatH2kC/JYvstT81dwn/Q+JBQRr+XzmVn5zO35XiwM0PjD5iMqX4kS+lQm7XinuwBhMqkWZ9ShEsUgsK/AnulkBYiG+V5dosk5zS5lKM9Q7bnE1uJVGRhQhKlUXD/F7wIM7ifHGwGHQBU3TaGxxrpzpKSCvSDrFeUH58hwRhsepetxNbcN+hNsLa5LG+7iyBAxE1CN3kH++utZvkuhTK8AbL3tM7tYFNBwSoELYO2w8zbalPnCdpox7GvHVIa6yrbbSLGO1qrXsUTrV42rzxxxp5joyaabDisqH9K2dv4cHllAkWGChw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq5TmQnX69fF9CFCW6YvhFKyUHBI7ETJ/73jmn1a92A=;
 b=gtlWVs0EpEdhgALFxQ1rpBk39yeYzAOZzhKTctzVAjETADauJnb6D3S3r7VE6M7bCRC+UzolQZmguwhBLP2uCI9SRDiv6Zuf5r+EdNqPqMeYvVxk/7xDdBlzzlfBTNu6YWxovS3ofAg9TTUt4UnCxGNFKGoaCLd8Liv1zMOUu72SXSp6a2n31rCJYZyTzFkpdqHKSr8x/SGe5+Efty8W19MwTCCj/GZw7eonJu105clv6kUNkfEoZWFDJ5Hsj0h8BE94ZqKlM9+ieFcoFKu82v3JnKX//ZYqsB2WnTn+xX8zA4gb2qz3jfbxjFd6MLGcrzVzfSff6T4TXt4i7hV9Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xq5TmQnX69fF9CFCW6YvhFKyUHBI7ETJ/73jmn1a92A=;
 b=J04hxb2OG1xaB58A0IINQvaHIP5eqDLi6ufNbikjdY1Dr+8NBHkuw+3grytrVbgNPZfB1EIViwYMiIc79rYauzSa87lrLNItb2x8I/CiFlAaMk2Ji9IG7kmpjsdr9DPD/Jejmb1NlNrRzEwGDxyUdN5FT8wrtHTH+WL6cyvUPb4=
Received: from MN2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:208:239::17)
 by CH2PR02MB6373.namprd02.prod.outlook.com (2603:10b6:610:7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 10:10:21 +0000
Received: from BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:239:cafe::64) by MN2PR08CA0012.outlook.office365.com
 (2603:10b6:208:239::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 10:10:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BL2NAM02FT056.mail.protection.outlook.com (10.152.77.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 10:10:20 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Thu, 7 Jan 2021 02:10:17 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Thu, 7 Jan 2021 02:10:17 -0800
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
Received: from [172.30.17.109] (port=44708)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kxSFE-0004KT-UA; Thu, 07 Jan 2021 02:10:17 -0800
Subject: Re: [PATCH v2 00/15] soc: xilinx: vcu: Convert driver to clock
 provider
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201221150634.755673-1-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <192e181d-c092-a647-7a50-c172291b944f@xilinx.com>
Date:   Thu, 7 Jan 2021 11:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221150634.755673-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ec71176-3415-4557-98db-08d8b2f47109
X-MS-TrafficTypeDiagnostic: CH2PR02MB6373:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6373A1DCDC2B6382137A8B57C6AF0@CH2PR02MB6373.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBHTeqQeYifKS3+LynzsvrDYWJOQKLM0IjYP+7J66v2kk/sAMLac/kIedSPMPpAb/H9EfccTeALBn3RDPIrRUijfMCdmJoBsLj0BFV30AKd6QFdtw1aNe3BZWAbokJcB1xqKrDdpvb3e9BnwkGcBx+FLrr5yPdedukLepiumSvD13t+X/cxDeaWFznW3bUHvvCUVPbBNrIz/Fl//AfKM33h8/LfMpf6lrGDZy0DGqTrOGeRwDGckmDeYU8Qk5sWENjMtgM9WCMsROa+xMs5Da9hocW1qMmD3xGBbClhkTXjl7u7qDzgU57mXvBNNIlbxM1+mHE9/V3S2GasXWI19z56DD2SFLC6HcqTUxBGLKCZ5NdTaUL4vF5xdpM8QEfrf/8qcQ4b4de79ZUpm1t+fIPcwnWlSy3ks1AFIKUgoBVpP2BdMLQ0ODXMMwWyV0JPOIHr/xvXF5zuTdgEaZpbQW38sq6yQa4gNEzvG9oeUEsah8fQxEyCwmRSTNx5ADr4sVGF8teZHWUNtxqX18Yj4KUiOJTKJPmSW4O5AFP4RInuE/72YEd6nkDH9AtO4PVE6L5FbKgwSlZGsb1ieohT+bOxMKyDLQpgL6EwXSkDdzpzgnYfUdfUiIcaRkro8ZZGbutqOW05dyOoTHuCWcJz/CA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(46966006)(82310400003)(34070700002)(7636003)(36756003)(82740400003)(356005)(8676002)(5660300002)(4326008)(83380400001)(47076005)(36906005)(966005)(478600001)(316002)(31686004)(54906003)(70206006)(70586007)(6666004)(110136005)(44832011)(31696002)(9786002)(336012)(2906002)(426003)(8936002)(26005)(2616005)(186003)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 10:10:20.9744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec71176-3415-4557-98db-08d8b2f47109
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT056.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6373
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On 21. 12. 20 16:06, Michael Tretter wrote:
> Hello,
> 
> the xlnx_vcu soc driver is actually a clock provider of a PLL and four output
> clocks created from the PLL via dividers.
> 
> This is v2 of the series to transform the driver into a proper clock provider
> driver.
> 
> The main changes compared to v1 are:
> 
> Get rid of the "dummy" clock and remove the manual switching of the mux in the
> output clocks. The driver now uses the pll_ref as a bypass clock. As this is
> not documented, I am not sure if this is actually the case, but without
> another signal for an external clock to the ip core, this seems plausible and
> avoids changes to the device tree binding. The reparenting happens
> automatically when setting a rate on the output clocks.
> 
> Add a few patches to cleanup checkpatch warnings on the driver itself.
> 
> Move the entire driver from drivers/soc to drivers/clk, because the driver is
> now actually only clock provider driver.
> 
> A more detailed changelog is attached to the respective patches.
> 
> The series is based on the zynqmp/soc-next branch in the Xilinx downstream
> repository [0] which should be merged to mainline soon.
> 
> Michael
> 
> [0] https://github.com/Xilinx/linux-xlnx/tree/zynqmp/soc-next

Series looks good to me but not clock expert.

Stephen: Please let me know if you want me to take it via my tree.
If yes please ack that 15/15.

For the whole series please add
Acked-by: Michal Simek <michal.simek@xilinx.com>
when that minor kerneldoc issue in 9/15 is fixed.

Thanks,
Michal


