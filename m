Return-Path: <SRS0=l6vu=7L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE49C433E0
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 08:09:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FA22207BC
	for <linux-clk@archiver.kernel.org>; Fri, 29 May 2020 08:09:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="idlWh8/V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgE2IJ1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 May 2020 04:09:27 -0400
Received: from mail-eopbgr680042.outbound.protection.outlook.com ([40.107.68.42]:34814
        "EHLO NAM04-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgE2IJY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 May 2020 04:09:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=je5ulaOA1SZR2Qt7Ed5JSsl1cU8yRvCQ5YUUN41XCI1LlUJbJX7tFtw6WMsZ0OlXseMtjO+v6whuC/qndMM6Vg01JdMBafKoc/jEn+bhuqt8nTThRbLUp2zQSeWUaLGBpGjyWIYKrgPImNaCAL3YV9EAk+iiy1lEVceMdLh/XLL6Aux1U3Y4EqfbmgsCO0IJElNv7gTiStcvUmtPhpOGBsxH/Y6RrPVLPYseOUOjkz3npcjrHpbOK/b6p9N11mPCVplWEer/xbjFF6vnAl9Y7gIf157DgrkPNqfgkfO4hbONgwJTD5akvjYy3VQYLJn7v8VsgoqoGBJtD9HXJoUQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSqTSO+2O5AOxlI6moB2Ieua0s23ZI67j2RKtCupJ28=;
 b=B5BIr6HItsMYIU+mMZ71VedB9yg+MgQmmtjBUqWcSgPeSyxgK7R5D96q6SDA4+rwZ8SH2gsztvgb6B1obFRqlqYoHR56uQRSLzLwWYLSFBSKWxCBurMgnGIO2lUy0kgFLRSuMepkJQKtdt8SmcojHaN7qJjPKHG23FHLpymGK/9NX5G/auD63d/tkPNiYR6piLpTZSNKe3JVQBTXITTjaOj/1wBLbErTjzz2YSZdxjpoQUKgj410dOw1zkYm7uumkEFNLznF68/rJm6vVUu71M3gCEb6wgMaNu8D0fctTx8C9i1+reprF8G8+obHAmKvcQTsl7zQkKA8FF24BsfSFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=arndb.de smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZSqTSO+2O5AOxlI6moB2Ieua0s23ZI67j2RKtCupJ28=;
 b=idlWh8/V2kGsNgEr6o654L2JAtY3CI51ktolO/rtAJbM5NMfN2q2mYGrHZwH/2ox43tpC8YvZ/asWvRbqZfk1uO+wMzJtiYQivlCLQKz8P7DUH4b9YcF3N/qELxHxxBCgb6swtfHh6EKn0fHC3RSDw5dpDs6ZNkna7p6n9OpzJg=
Received: from SN4PR0201CA0035.namprd02.prod.outlook.com
 (2603:10b6:803:2e::21) by DM5PR02MB2345.namprd02.prod.outlook.com
 (2603:10b6:3:52::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Fri, 29 May
 2020 08:09:21 +0000
Received: from SN1NAM02FT063.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2e:cafe::6b) by SN4PR0201CA0035.outlook.office365.com
 (2603:10b6:803:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend
 Transport; Fri, 29 May 2020 08:09:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; arndb.de; dkim=none (message not signed)
 header.d=none;arndb.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT063.mail.protection.outlook.com (10.152.72.213) with Microsoft SMTP
 Server id 15.20.3045.21 via Frontend Transport; Fri, 29 May 2020 08:09:21
 +0000
Received: from [149.199.38.66] (port=33139 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jea4I-0007bp-98; Fri, 29 May 2020 01:08:42 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1jea4v-0003Ly-10; Fri, 29 May 2020 01:09:21 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04T89GGk000426;
        Fri, 29 May 2020 01:09:16 -0700
Received: from [172.30.17.109]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1jea4p-0003JS-Qq; Fri, 29 May 2020 01:09:16 -0700
Subject: Re: [PATCH] clk: versatile: Fix kconfig dependency on
 COMMON_CLK_VERSATILE
To:     Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc:     SoC Team <soc@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>
References: <20200527181307.2482167-1-robh@kernel.org>
 <CAK8P3a27RkBkt5mnBeVJ-67MnJi29Dc+jYL2Q8JskaZ1W_XrKg@mail.gmail.com>
 <CAL_JsqJ83UJ0Roy_NJBLXuvhPG2zBDod8ZgSGrEtpKSnYPtowQ@mail.gmail.com>
 <CAK8P3a2S-8fvyiKTk+o876r1XMV6C=HipiRutSWSe0P2rdL4Xg@mail.gmail.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <65db9ced-c579-4373-4b94-910f3a8bec99@xilinx.com>
Date:   Fri, 29 May 2020 10:09:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2S-8fvyiKTk+o876r1XMV6C=HipiRutSWSe0P2rdL4Xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(39860400002)(376002)(136003)(396003)(346002)(46966005)(26005)(47076004)(478600001)(70206006)(70586007)(8936002)(83380400001)(8676002)(4326008)(9786002)(107886003)(2906002)(82310400002)(31696002)(81166007)(44832011)(5660300002)(356005)(186003)(316002)(6666004)(336012)(31686004)(2616005)(53546011)(426003)(82740400003)(36756003)(110136005)(54906003)(341764005)(42866002)(43740500002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ceee02c-98df-4960-4028-08d803a797c0
X-MS-TrafficTypeDiagnostic: DM5PR02MB2345:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2345DCC588C8EEA51FCE16BFC68F0@DM5PR02MB2345.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04180B6720
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMJouu4hjJUgB+xA8kQiVgAw/7mdX1np8DppBu+RSVOtWbBGlPEKbBki5v41tCkF5GWO5TABiur7WN60y3Vz8ofx7jQQ9obzDiJ0jaCFB1np8ae/8YEpCKSwg9nBX6i+zG3eF91QLHORWBh9TZLnn3yMxMpuLRrwefWXJgdOvI+tKsOQa71zoHMYnhraSb+8QoilqLLSKMO9hegLA3qSsj1TXl0rtIiSjGnHV/rvdiWQKWTOv4eiSczcPJZyrmvosbGwjvjneXOWTuo//G5k3qajv4bWZn0as3P7a6zFaQlbCddgioZXDQtJKrpxoLImBniMTXEnu1lW+Q5d3SlH4WIFDuStdDygFitEb3q3dTDTaV75YzdN7KSHz9eXZDXVEoECmyrYJ5tYWok5NlPrT59/GC+DAJiAPHaUNsBiyJLnrZDKFuqAf8dk3MXSt0oV1YT7QSzDevbtVX9XI3aqaiyCP3HDUv8aJgeaoWWF8PE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2020 08:09:21.3171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceee02c-98df-4960-4028-08d803a797c0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2345
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29. 05. 20 9:38, Arnd Bergmann wrote:
> On Thu, May 28, 2020 at 11:29 PM Rob Herring <robh@kernel.org> wrote:
>> On Thu, May 28, 2020 at 5:57 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Wed, May 27, 2020 at 8:13 PM Rob Herring <robh@kernel.org> wrote:
>>>> diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconfig
>>>> index a0ed412e8396..8c1b0e8e8d32 100644
>>>> --- a/drivers/clk/versatile/Kconfig
>>>> +++ b/drivers/clk/versatile/Kconfig
>>>> @@ -1,11 +1,8 @@
>>>>  # SPDX-License-Identifier: GPL-2.0-only
>>>>
>>>> -menuconfig COMMON_CLK_VERSATILE
>>>> -       bool "Clock driver for ARM Reference designs" if COMPILE_TEST
>>>> -       default y if ARCH_INTEGRATOR || ARCH_REALVIEW || \
>>>> -               ARCH_VERSATILE || ARCH_VEXPRESS
>>>> -
>>>> -if COMMON_CLK_VERSATILE
>>>> +menu "Clock driver for ARM Reference designs"
>>>> +       depends on ARCH_INTEGRATOR || ARCH_REALVIEW || \
>>>> +               ARCH_VERSATILE || ARCH_VEXPRESS || COMPILE_TEST
>>>>
>>>
>>> I've applied this version now but added ARCH_ZYNQ as an additional
>>> dependency to work around one of the warnings we got earlier.
>>
>> That's just spreading a copy-n-paste error. Why don't you apply the
>> Zynq patch I referenced if Michal never did?
> 
> Sorry I completely missed the reference from your previous email.
> I've applied that patch on top now, reverting the change I did in the
> process.
> 
> I had noticed that the Zynq Kconfig seemed rather odd, by my interpretation
> was that it had been added intentionally in order to use an existing clk
> controller driver for configurable logic on Zynq that was not part of the
> main DT file. As Michal already confirmed that it was just a mistake, I
> agree it should be removed.

Sorry I didn't sent PR yet but I have your ICST patch in next branch.
Arnd has applied it already that's why won't be sending PR just for this.

Thanks,
Michal

