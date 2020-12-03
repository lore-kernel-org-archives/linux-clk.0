Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F1CC64E7B
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 07:47:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A187120C56
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 07:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbgLCHrI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 02:47:08 -0500
Received: from mail-eopbgr680057.outbound.protection.outlook.com ([40.107.68.57]:38978
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729389AbgLCHrH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 3 Dec 2020 02:47:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IJ8hS6J9mTupkD51gbgKZlsnaGSXgZRSApX7Gq1U9/BBgoelVKNMb4ZbMxUuXtuvYSpDmhuOwLswvztrmAbEgsNmM28LpM42a9l0ZeOvn+HXoq7w/1sAleDH+73ISKGAhqpxaMgD5FivDPyxLSIKbOaHczLdw1iQxVj0ca60Xz4x9nkxT8sTOY1PyH+IroQwSzIzROT9DYm5Fdb8LeI5HioznaHLykxtwLobo4VZum3m/F3wUdHBs72CyhpuN1vDanlEqLxkRxbZpSbNbXeCIzvSEGv8wJb6xt1X/7c/LC4ELA+IeQHN/H6JCXlg58oBbN2ZBsSjJKtaEx8daqdK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiZtw9AOU9NIIFxLExlBSL33XG1RYB+bFknJFm22uwg=;
 b=gNdmb3BIShOiTv/2sQG03Lp6oMQyTf6jj4EqWtLsTU6zQ6sh8EYlKAs2enMzqhd6fz/UqXzsV4OTyCIWwssk0DKcjUTprcDitSBJoFX0nilPBwadbVR0q3WvTgsuJ8m9MI8abic+gPtgu5abenEUCVYJERy6jIr3A5e4MgIXm+XE4PvSEix4Sx8ZpsCgPKEYN8WL8WWP1EqUmGH4CA++i1Ibv6Gh1bLtrVeuyf5JLe2NIIKLU+QT5cAXMxLv/mxR/q5TSJeoatMQtI9QN//MixXblzKwAEntijrq3iRYSASoXBD559TV8SnDRZN/4Z4d7xlXim7JueMIIRisQuitow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiZtw9AOU9NIIFxLExlBSL33XG1RYB+bFknJFm22uwg=;
 b=IR6KPYn9jQOnBiuwF8BFoVh0Znf2IBheKE4OuCq8UtFufg1llBwQ1XDMMCfuYEbg4EzUTZOlUHAj1gOateuVq4x5dFHysFefzM6iAQ1V/qxKvPGI6vaS7IRkChUgZXwuynzI04yNnESYONOAHLJnuKZl7Aj8UFVP33QgOG+Lr8o=
Received: from SA0PR11CA0118.namprd11.prod.outlook.com (2603:10b6:806:d1::33)
 by CO6PR02MB7683.namprd02.prod.outlook.com (2603:10b6:303:a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 3 Dec
 2020 07:46:18 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::ef) by SA0PR11CA0118.outlook.office365.com
 (2603:10b6:806:d1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21 via Frontend
 Transport; Thu, 3 Dec 2020 07:46:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3611.27 via Frontend Transport; Thu, 3 Dec 2020 07:46:18 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 2 Dec 2020 23:46:16 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Wed, 2 Dec 2020 23:46:16 -0800
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
Received: from [172.30.17.109] (port=35872)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1kkjJg-0007qV-B2; Wed, 02 Dec 2020 23:46:16 -0800
Subject: Re: [PATCH 00/12] soc: xilinx: vcu: Convert driver to clock provider
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     <rajanv@xilinx.com>, <tejasp@xilinx.com>, <dshah@xilinx.com>,
        <rvisaval@xilinx.com>, <kernel@pengutronix.de>,
        <robh+dt@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <5dd16c21-b204-bb10-feb8-562a298faaf9@xilinx.com>
Date:   Thu, 3 Dec 2020 08:46:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201116075532.4019252-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 912e74be-b2d9-4623-1971-08d8975f84ee
X-MS-TrafficTypeDiagnostic: CO6PR02MB7683:
X-Microsoft-Antispam-PRVS: <CO6PR02MB76836C594C26715A9B89C882C6F20@CO6PR02MB7683.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c+uxbpUYr2/WVz8jyENrJqDn+oAubniaQLWsMhGvdPywyQx5i2jJ6/QdzWLIuO4Z9v/nO9QZaWmdGLPPX/tBAi0U+DeTpD2pkLA0w9bSHuztcGnJQ4hwlB6gjcFMrUvGM6QxBKTlyTh7iw+YYvz2QOj/0/ivDP7DTmkB1cXe03+4RiLgs6V8uBxlVBpA8xqhfEgNQk1SuQzSHfIyfNw/A1MEK0iO4fdh57jnPIGq0w+6KorhmslAdclN279UF84Eq5Lkd5wXEGW5s+8okzkft36qWbrVyUDwLC2CTCScZeG35ZQ+7T6PqXIhnypGA2RWEOvx8ALmAG8/5qpoAuKxcBIqWLx3kdnhP5VRoFIzyN9CrWqkrxryBJvJ0s4eLqzoE0TKRwotLWy8MeyRoDJSVxPRNBBbRl1GaPPt62QLvN4jt4eIC+RZDvb5pWEvbdgyWfrAuuCWXYR7Qak/i87Ot43A3giTPQ1WP68n8rj09qMNioE+sVrfoZK+nNYfeNWHDpB+F3agvP4XE/Se9wNbfRha2YBvbpcxvhHMJ6LC9LU=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966005)(4326008)(83380400001)(82740400003)(47076004)(70206006)(478600001)(70586007)(966005)(7636003)(82310400003)(2906002)(186003)(6666004)(356005)(26005)(426003)(2616005)(31686004)(31696002)(36906005)(54906003)(9786002)(44832011)(110136005)(8936002)(8676002)(5660300002)(36756003)(316002)(336012)(50156003)(2101003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 07:46:18.0019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 912e74be-b2d9-4623-1971-08d8975f84ee
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7683
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 16. 11. 20 8:55, Michael Tretter wrote:
> Hello,
> 
> the xlnx_vcu soc driver is actually a clock provider of a PLL and four output
> clocks created from the PLL via dividers.
> 
> This series reworks the xlnx_vcu driver to use the common clock framework to
> enable other drivers to use the clocks. I originally posted a series to expose
> the output clocks as fixed clocks [0]. This series now implements the full
> tree from the PLL to the output clocks. Therefore, I am sending a separate
> series that focuses on the clocks, but it depends on v4 of the previous series
> [1].
> 
> Possible consumers for the clocks are the allegro-dvt video encoder driver or
> the Xilinx Video Codec Unit [2] out of tree driver.
> 
> Patch 1 defines the identifiers that shall be used by clock consumers in the
> device tree.
> 
> Patch 2 fixes the generic clk-divider to correctly use parents that are passed
> via struct clk_hw instead of the clock name.
> 
> Patches 3-6 refactor the existing driver and split the function to configure
> the PLL into smaller helper functions.
> 
> Patch 7 registers a fixed rate clock for the PLL. The driver calculated and
> set the PLL configuration during probe, and exposing a fixed rate clock for
> that rate allows to use the existing configuration with output clocks from the
> common clock framework.
> 
> Patches 8-10 switch the driver to the common clock framework and register the
> clock provider.
> 
> Patches 11-12 are cleanup patches.
> 
> Michael
> 
> [0] https://lore.kernel.org/linux-arm-kernel/20200619075913.18900-1-m.tretter@pengutronix.de/
> [1] https://lore.kernel.org/linux-arm-kernel/20201109134818.4159342-3-m.tretter@pengutronix.de/
> [2] https://github.com/Xilinx/vcu-modules
> 
> Michael Tretter (12):
>   ARM: dts: define indexes for output clocks
>   clk: divider: fix initialization with parent_hw
>   soc: xilinx: vcu: drop coreclk from struct xlnx_vcu
>   soc: xilinx: vcu: add helper to wait for PLL locked
>   soc: xilinx: vcu: add helpers for configuring PLL
>   soc: xilinx: vcu: implement PLL disable
>   soc: xilinx: vcu: register PLL as fixed rate clock
>   soc: xilinx: vcu: implement clock provider for output clocks
>   soc: xilinx: vcu: make pll post divider explicit
>   soc: xilinx: vcu: make the PLL configurable
>   soc: xilinx: vcu: remove calculation of PLL configuration
>   soc: xilinx: vcu: use bitfields for register definition
> 
>  drivers/clk/clk-divider.c            |   9 +-
>  drivers/soc/xilinx/Kconfig           |   2 +-
>  drivers/soc/xilinx/xlnx_vcu.c        | 613 ++++++++++++++++-----------
>  include/dt-bindings/clock/xlnx-vcu.h |  15 +
>  4 files changed, 383 insertions(+), 256 deletions(-)
>  create mode 100644 include/dt-bindings/clock/xlnx-vcu.h
> 

I can't see any other problem with this series.
When we are on this. Can you also please fix these issues reported by
checkpatch to have new issues more visible?

./scripts/checkpatch.pl --strict -f drivers/soc/xilinx/xlnx_vcu.c
CHECK: Alignment should match open parenthesis
#614: FILE: drivers/soc/xilinx/xlnx_vcu.c:614:
+	xvcu->vcu_slcr_ba = devm_ioremap(&pdev->dev, res->start,
+						 resource_size(res));

WARNING: Possible repeated word: 'the'
#707: FILE: drivers/soc/xilinx/xlnx_vcu.c:707:
+	/* Add the the Gasket isolation and put the VCU in reset. */

total: 0 errors, 1 warnings, 1 checks, 735 lines checked


Thanks,
Michal
