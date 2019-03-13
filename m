Return-Path: <SRS0=1SIp=RQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4212CC43381
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 14:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 03C222147C
	for <linux-clk@archiver.kernel.org>; Wed, 13 Mar 2019 14:50:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="U1JIdlGE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfCMOuO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Mar 2019 10:50:14 -0400
Received: from mail-eopbgr770078.outbound.protection.outlook.com ([40.107.77.78]:28750
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726272AbfCMOuO (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Mar 2019 10:50:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9Z8HAjlPds8k3T2rK6yySX8ZdoURTQO4vVEn0pYg+s=;
 b=U1JIdlGEZEBOsST1TKtlSsN9uJxU7J8Dn3BfgTIPAZ7e50qFVs0NIFBcjpbTnKkaZv+AKSz7jX3NDNNnIV/6St0AXIf2DYeszfv879uzsu1+QF3k3lRFeCIXDoSVxWOaQJkjC04NcbjluFCR+IVYsM4ezGJ2GqN820LQNnwqwck=
Received: from CY4PR02CA0027.namprd02.prod.outlook.com (10.175.57.141) by
 BN6PR02MB2802.namprd02.prod.outlook.com (10.175.96.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.22; Wed, 13 Mar 2019 14:50:11 +0000
Received: from CY1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::200) by CY4PR02CA0027.outlook.office365.com
 (2603:10b6:903:117::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1709.13 via Frontend
 Transport; Wed, 13 Mar 2019 14:50:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT012.mail.protection.outlook.com (10.152.75.158) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1709.13
 via Frontend Transport; Wed, 13 Mar 2019 14:50:10 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1h45Cs-000701-Fh; Wed, 13 Mar 2019 07:50:10 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1h45Cn-0001xn-AO; Wed, 13 Mar 2019 07:50:05 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x2DEnv9S018484;
        Wed, 13 Mar 2019 07:49:58 -0700
Received: from [172.30.17.111]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1h45Cf-0001bH-Nt; Wed, 13 Mar 2019 07:49:57 -0700
Subject: Re: [PATCH 0/5] clk: zynqmp: fix CLK_FRAC and various cleanups
To:     Michael Tretter <m.tretter@pengutronix.de>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC:     <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <927354de-9218-04dd-0448-d8ff06b08f80@xilinx.com>
Date:   Wed, 13 Mar 2019 15:49:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190312110016.29174-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(2980300002)(189003)(199004)(426003)(58126008)(5660300002)(107886003)(230700001)(31696002)(316002)(186003)(65826007)(23676004)(110136005)(2486003)(4326008)(305945005)(36386004)(478600001)(81166006)(81156014)(8676002)(6246003)(65806001)(47776003)(36756003)(65956001)(31686004)(9786002)(63266004)(26005)(8936002)(2201001)(76176011)(229853002)(2906002)(54906003)(50466002)(106002)(356004)(126002)(476003)(11346002)(2616005)(44832011)(77096007)(486006)(106466001)(336012)(446003)(64126003)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN6PR02MB2802;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9eaf778b-d3a5-487d-bbfb-08d6a7c331a8
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);SRVR:BN6PR02MB2802;
X-MS-TrafficTypeDiagnostic: BN6PR02MB2802:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1;BN6PR02MB2802;20:zKobfv5iKaxSd1RXTMiIcrP/Av2pSB57RWGtaQLIRxhJ8J9mwy9BctH7SLSQgY+OSdtShgZ9YLi7AkTNvOj77xvR0hMhVuex1WlTy9hOHYNz6qI/12eZV545aAMdJRvKR7K6PjfoN1NAAa7aroiihDsS5XX2LJ6C6kcwAtXai6pfEvH9BVLjbYx+z8rEeZZtDLuM1SdUvVkANWtet2TkIBBmz+m+osHvOJO6+UNg+QwUfGKnhcOhlQD7GVSUJvhZcqF5Q36LgI4zvwWzMyglIO6AvU9HjPRVYD9lkUSL9wffWvR8eAOiD9Ex9LJHoadSeRtCDvIT9iEtxGDAlIvX7xAwjmRt0C4a+HMU30cRGgwJNRqug2rIX1Rj/lCFJe7wtsfZlZXyxOCi7rbf+Xsqa/8BKJ2jkAeraL5X99XCLTv2pBIVfp2K81p0YcchqWO+DTa3MgMmJypLexpD7jZYIesGXkClwJcCUr/+xbhee5GFUUd63qQ98E5RtrljZ4FN
X-Microsoft-Antispam-PRVS: <BN6PR02MB2802A8E6F19F298DDEE9EE24C64A0@BN6PR02MB2802.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09752BC779
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjZQUjAyTUIyODAyOzIzOlBJM2VCT1kvMlJrdkUrbldDRTZBT0VqY25t?=
 =?utf-8?B?dWJUY3hBaXhROTBzQWpMNHRzaGVsT0Q5WHYxM2VvZUM0SGtyTW4wK2FxWGhn?=
 =?utf-8?B?bHExRmh2WS9HSDVEOXZPT3huOStON0xVYkU3S2lJVWFscVpIWlllMUFUSWkw?=
 =?utf-8?B?MnNDR3pSdDRCY05NNEpvZW9lWHBGYmlUM0tXYURLeDV4cDZFVytGNk1ENDRM?=
 =?utf-8?B?T0pNbkRvYTVIWlpMaHBHU2ZuWmtvRlRGQmMybTY4QWtkb0h1cEtlVW9Fd2Vw?=
 =?utf-8?B?TEoyOVMwTE9maXFDNko0YVVFQ3JYN0RsSlcvRFJqTm45Q21wRmhObU9ZT0J6?=
 =?utf-8?B?Zi9DQlRCMUFHakl4N2NhYXkwdFVrS0oyOHJ5R3loSVI0dzJLbkl3WWs3Q2Fv?=
 =?utf-8?B?OEJOR0dKTWNDaEFkNG1CTFZ3SmM3WVBzNm1ZNlhBSThHd2dpZlZ2U0ZKdTB3?=
 =?utf-8?B?dTNyVnpUL0FOZDBrMVBhMkNScFQ4T1Y4a1U0NzkwUEtYWU0wc1QvckVLbnNw?=
 =?utf-8?B?TDN6MmxuOUhDK2tjTXJKUjRCcmorcEpMMHdGWEZjVDh0TmRvZ1pMTUk0UmNM?=
 =?utf-8?B?S3NCT0MwVjdIWjNnVTdjaStUREJiMHdKRzNvdWlCdHRGdmU4NFRVTldIOC93?=
 =?utf-8?B?ZThWU2VwVlh6ZHR2U3NvTkU5aWh2Sm9zRlU5WER2c0VqZmlVdnkvR0JkTm5r?=
 =?utf-8?B?ZkVqWlVrYTFEWVBYcmxxb3czVzZLTmgveEFyYWxHd1RkNE1iaVBsclhMWU9H?=
 =?utf-8?B?TWtWbmY1YWUwakxKbzJMc01XZjRrNzZUWEs2b01NeDlhSDR1ZXN1M2srL0dN?=
 =?utf-8?B?aS84TUJ0bzBHOTFIbGVOSUE0c2VuYUFhM3dXdlB2b0RtWFYyUmZRcnhNNXY0?=
 =?utf-8?B?S0ltejI4MC8yR3prNGpEWnFYQkhIQ2d6RUM2WCsyeFV2TzZjaitRN1lXK0ds?=
 =?utf-8?B?QUxyR3R2aUJob2hLdFBqMFdqOXVVbFN3OUNJS1ljdFJjSkZZaGZHcUdaQzll?=
 =?utf-8?B?YXpMWmFpRk4wRFcrdE9pQTdYMzAweXNVNVhlNUE3ZFY3dFZwZjR4ZnR3cXF6?=
 =?utf-8?B?MDdOSTlMUWN5TnVvaGV0MUFXd1Z5emNrQWJsWHVJdWJDK1NDT0xDYTR4OW5a?=
 =?utf-8?B?dWxKeXpYYUtnOUNKTDVVcW96WERRbmFuUUlzR2UxRERwemJvSXlqSjRSVnVh?=
 =?utf-8?B?MVJHeVd5QlhQSDZRTEtha0V3YWI2MVRJV2s3ek5WUGFoam10bVNiYjZ3akV1?=
 =?utf-8?B?U0NlQkh1NllQdnV4KzRRS3MrYXgvWkNDR2tlU09rOW40SStZOHNlY3pwV2ZZ?=
 =?utf-8?B?bTVVZ05iV3F1TTJpa042VXZXdkVGZkpnTTB6Vk9tVExWS3BrQjVIYXYvaGlz?=
 =?utf-8?B?N0VZNGpqWVVCaVcxZWNQVkRiV29FaThaOUtCaXo0QytSakRBbUNUekxyamw4?=
 =?utf-8?B?anBxVnBqUlZlbUlFZkxEL0YwaFhHWXZlYU5wdDk0WlZsV2l6ekFpdkVyUlZo?=
 =?utf-8?B?ckhSczhPZW96VDh0aWNmaktZc2tQM25YOXVONlE0K2dUeEN0TmswUVhpdGVS?=
 =?utf-8?B?SWQ5dVVGWEkvbXJGVW5jWWtkV2Z2VkpjbGl4d0ZEQmVUWDBNb29lbUdVSnNz?=
 =?utf-8?B?K2NuOW9yaWlsaGVDbmRJQnpmTklyL0xRRW9FcG9ON1Z2M3BwTlRRTFNkdWFq?=
 =?utf-8?Q?gvtfE1nhFymgar8sHU=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: p2FH0aBV71V7orvd0hBlODjSkBZYgqEbCYWceOE4A4QmyS/H5Vw1GcKk1ciKLPeQmY6nCaTMwFJ4dzQg3ywzd/wfzlm97UDYlDWi2tHuXlZFBqYhLOBvqk4LKorXp11X0QMxvogDpNBumhZuqdOuUKOYyDqYuJbhpgnkUHlp3Z2M1uVVXKqaGQCy+CtqEQNFj97JqY/f5nxO8gyUF6M+y0YnnanopFY0QkY2G35bSSXMmW0hYqlFYepH3pOFiEIxqXucducNkG7lSU9MMrBa5T1T3/YOCkfWuoKT+/a2RmU/USxOpqImU04LSrBgDtgUa9w6hPWAXO5iCWhnLSy9No1vnPrKe6X542K8/zNAM2E6QWDZFssiCZVTHLLLYQGbv0945qM1UBPawiEfpR0Pj9czDKC2efgnpDk8q34l3Qs=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2019 14:50:10.9274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaf778b-d3a5-487d-bbfb-08d6a7c331a8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2802
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12. 03. 19 12:00, Michael Tretter wrote:
> Hello,
> 
> These are various patches for the ZynqMP clock driver.
> 
> Patch 1 fixes an erroneous test for the CLK_FRAC flag.
> 
> Patch 2 fixes a wrong function name in the kernel-doc. However, I think most
> of the kernel-doc for the static functions is pretty useless/misleading and
> maybe instead of fixing, we should just remove it.
> 
> Patches 3 to 5 are cleanup and refactoring and make the macros that are used
> to handle the responses from the firmware more consistent.
> 
> Michael
> 
> Michael Tretter (5):
>   clk: zynqmp: fix check for fractional clock
>   clk: zynqmp: fix doc of __zynqmp_clock_get_parents
>   clk: zynqmp: do not export zynqmp_clk_register_mux
>   clk: zynqmp: cleanup sizes of firmware responses
>   clk: zynqmp: make field definitions of query responses consistent
> 
>  drivers/clk/zynqmp/clk-mux-zynqmp.c |  1 -
>  drivers/clk/zynqmp/clk-zynqmp.h     |  6 ---
>  drivers/clk/zynqmp/clkc.c           | 71 +++++++++++++++--------------
>  drivers/clk/zynqmp/divider.c        |  2 +-
>  4 files changed, 38 insertions(+), 42 deletions(-)
> 

Jolly: Please take a look at these patches.

M
