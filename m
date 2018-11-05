Return-Path: <SRS0=vj01=NQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 654D9C0044C
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 07:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E31E0204FD
	for <linux-clk@archiver.kernel.org>; Mon,  5 Nov 2018 07:38:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="TG/PYZLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31E0204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbeKEQ5R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 5 Nov 2018 11:57:17 -0500
Received: from mail-eopbgr720076.outbound.protection.outlook.com ([40.107.72.76]:63840
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727054AbeKEQ5R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 5 Nov 2018 11:57:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7oDGP4xyZgvvcHlEmDp7NhomFjyK1ShJfzND+kCGgc=;
 b=TG/PYZLxwwfFwB4+Aq/UlXSRMxCCNyLvQB/Wv+cgdPteGVjk8G+d6W8Hm5ABOXsxj/QItKsctqWYGpWaaHqigdrjJlbx3uEFlebWX+se9uPGk2a7PiZdIzP8mOSQKFwewjiGNOh8vFD4wt8l8X6QDG364UNbcti/6zNzsJP2ycg=
Received: from SN4PR0201CA0016.namprd02.prod.outlook.com
 (2603:10b6:803:2b::26) by DM6PR02MB4457.namprd02.prod.outlook.com
 (2603:10b6:5:29::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.25; Mon, 5 Nov
 2018 07:38:55 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::202) by SN4PR0201CA0016.outlook.office365.com
 (2603:10b6:803:2b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.20 via Frontend
 Transport; Mon, 5 Nov 2018 07:38:55 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1294.14
 via Frontend Transport; Mon, 5 Nov 2018 07:38:54 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1gJZTK-0005CI-6T; Sun, 04 Nov 2018 23:38:54 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <michal.simek@xilinx.com>)
        id 1gJZTF-0006HW-2T; Sun, 04 Nov 2018 23:38:49 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id wA57ccOg021989;
        Sun, 4 Nov 2018 23:38:38 -0800
Received: from [172.30.17.111]
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <michals@xilinx.com>)
        id 1gJZT4-0006Gt-2f; Sun, 04 Nov 2018 23:38:38 -0800
Subject: Re: [PATCH] clk: zynqmp: handle fixed factor param query error
To:     Stephen Boyd <sboyd@kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>, <michal.simek@xilinx.com>,
        <mturquette@baylibre.com>, <olof@lixom.net>,
        <shubhrajyoti.datta@xilinx.com>
CC:     <jolly.shah@xilinx.com>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
 <153978972088.5275.4505414322881956934@swboyd.mtv.corp.google.com>
From:   Michal Simek <michal.simek@xilinx.com>
Message-ID: <26e50d25-a02b-5ece-d12d-8c6ee208a845@xilinx.com>
Date:   Mon, 5 Nov 2018 08:38:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <153978972088.5275.4505414322881956934@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(396003)(136003)(39850400004)(346002)(376002)(2980300002)(438002)(199004)(189003)(126002)(230700001)(229853002)(110136005)(58126008)(106466001)(2906002)(336012)(65826007)(54906003)(476003)(446003)(6246003)(2616005)(6666004)(356004)(426003)(305945005)(11346002)(6636002)(65956001)(65806001)(44832011)(486006)(478600001)(14444005)(50466002)(316002)(106002)(4326008)(64126003)(5660300001)(31686004)(2486003)(9786002)(76176011)(36756003)(81166006)(26005)(186003)(36386004)(81156014)(8936002)(23676004)(2201001)(8676002)(47776003)(63266004)(4001150100001)(77096007)(31696002)(107986001)(2101003);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR02MB4457;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;A:1;MX:1;
X-Microsoft-Exchange-Diagnostics: 1;CY1NAM02FT007;1:DpfIib5oKvSeeWCyBASKx8RHOy7U4Sn1/9dzJ91vpkRoSrni3ZUVoMTS4xVRjssg1bDzAwz5nKOLi0s4cZC9I8oWDUHENlrBxBjfPBiwk8sMarvtyhbRpD0wpEmT16mC
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 689cf960-d4c1-4ad5-18d4-08d642f1bd44
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);SRVR:DM6PR02MB4457;
X-Microsoft-Exchange-Diagnostics: 1;DM6PR02MB4457;3:nRg6NqHmq8NvbEv8vXQL0pR9rRjqykj8ikrBRhk670sec9240i0KljvDFUBbKccEwMWPmFfcUhQYhTn1CYdE/9ZfVhUR2ToDgsr2ZQ9MgMPcIcOxqQUz4No8DqWO0+GbceFGZcYkfBHMTXTws2nNBkKceZuzL4E22tc3FokOGf7CLNMsQrz/vN55le8ERzps4J792/hseo3i640dALCBqOyr+IkQTcvYj7HXllL3CjqLiWkKwhcvLGOwEQx9AdLVN3xkbg4123DXlv3leWyLsc5VmCyGH7wmsnCyRLoj5qwFukW0y/eIFOXPiC5yGsFHh8maGuydUiuuCRJjjiavMtlFBg2DMshBRikJBSAnWIA=;25:qgPrn4dt3ry2TMzYvt3A/zjum2ULZlLqsP3QZEW+KUu6tFDLVJK5FbtwOOQMgdrsvLcswzG3TZgSZjHxbhrK4vbOiBJbLB0dojt9bfmTcDHSRTYHPdzTQDsmqd+qt1clNpr9O0RiGiEBVO00h3w4yg8qXnDZNW8bIBnPkfnyAnfC3oCDGJ6MwnBFrzVMWvOiiPYD8yFKsqr4PvCUeQ46fh+jab1Jb5W/mXZaAEeeDVv3DkJbRpMRMFjckmOrcrs+ZpjZgcuzYbMK0oeBRhoUj2IUzuJEkmJePHbgfUV1f5tKGA+KehsZFGkpWGtzVhtbbMsJDJH5NttHcm758ECOXQ==
X-MS-TrafficTypeDiagnostic: DM6PR02MB4457:
X-Microsoft-Exchange-Diagnostics: 1;DM6PR02MB4457;31:YCUlJT7nNN3VUE85tAU1gSAU92B5d3+mjXolDisJOVWDBy/pMIT8eadFjHhkHzjMdrQjfAVGF2lUkZnM0N8txnWmkhJl1eUtg7VoBltUNUMQ+k2YNl88+W1ygdJ5VtEw8FzS3yFoB+TQ48NHVfelf+q9fNisAd3BhU0SmKvkK2wlDn702vowDAxuEl8MSMnQL/4D+2rxEY5hI093l+Mn4bs7w29gaKIjBDFO156fs04=;20:6OpFW7QdMtEZRJnAx45W6Dbw6ZQku653up0bW7/uWBEORq7+N5/MTtfRxgJhHjCCJPXFfdjS0tZhGD6RuHD9xKBP42Wjd9r8WezUmYKh1Mi5JeoK1hXOAwez6zQ2UNvuGYhJXJhcCTMrUwKI75QmLvpFDVlzK7FUS981y3x9mw4IjOlqHPVU5Kgh6OfeI7H6pvQSXdedboYvQK9DX3GSgRhsQlgxb9bqIYUrRSQiGEswI/WTPHlTfkmqTAZASNDZqEE8Yr9PM0jBRwVoaCK0gWxM4/ZU5yJ3Omg0uCmTXNU77zYmSQF5eePkpzkiHZUzzmuAsEG16+4SnHPJsVLF3N72iZsxC/5lsY/68pkPkxpH3jN6BpO8beuD3yvLLlv10ud/WTc5KTB5QVXpmth31ZgL0I5O0yp2TZiMOSUFVpKS4SZVhgbq7l/1rJRBTlxp4wrDu9onO3PPylAb+kFwcP2tDmplDnFD1QCInLpgYZO3GEIKGecNRYHn9FmEUn2X
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM6PR02MB445708E1A922C9810DDD5124C6CA0@DM6PR02MB4457.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231382)(944501410)(52105095)(93006095)(93004095)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:DM6PR02MB4457;BCL:0;PCL:0;RULEID:;SRVR:DM6PR02MB4457;
X-Microsoft-Exchange-Diagnostics: 1;DM6PR02MB4457;4:nLT1dvTbczQlVQJ77WGAFaf0GjNwSohbFmtOBL8f5ssQEev66pn4lu/DWAiaR5R7pikidozKkR6oP9Kk+6NVwSMjFQ16Tpclr5jRMQKwtgXQo6Cqw7mg0E26FHg5Xb9kMfu8i5E1hLj+49pIQQ5cRufau3ALdb+e2hdbSXIf95dpWe1QkazaV/A17wwy8aGwDcYLhWWmYRkdGhxvS169isjMZotaxyAKEpd170zCLtFJyDZ7yx/Wcqf8PwYo5oLHZdJtCg2XxIwaV+cPWkNfrKXc7dWiu89fU9gs0aFtelxWZr6T/00pNNL1Gn1uYwcr
X-Forefront-PRVS: 08476BC6EF
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTZQUjAyTUI0NDU3OzIzOjRPRjIrOU55L1ROYmh5MU50K0NkZVdwUEF0?=
 =?utf-8?B?MTl2bENXL0ptWVlzVkQyWnNENERxd2dvRUlheitLNWtwTkYzYW1pVGF6V1ZH?=
 =?utf-8?B?MmNnSzBKMytJY2ZoWjIvYkZEYUZIQjhJczFrYkk2dzh0TlRBUWN0Tm41NU9D?=
 =?utf-8?B?L2JyUENFSWJ5RFdlZG8xcUQrdUdSS21jTGV6TGQxL0VOb2NNbEw2cGVmQ1Q5?=
 =?utf-8?B?OUdBcVRtbS9jcEFIQmRiRFlacEhIc3l3aFNUNG9HM3lrMXRRbnVBem83TW5L?=
 =?utf-8?B?M3FTcHZPd1VSQ2V6MDZtZFVBZU5kQllMOG9vVUlBK2VqaTJQUXMybHZkV29J?=
 =?utf-8?B?aXU4ZzN2YURYWmZLb05KQ25ZZWVoMDFIZVVMQXdSSDVUV1NJMG8xKzdPaHQ2?=
 =?utf-8?B?b2lseEU1UWJ2bm9SZk5aTmpJWVZjU3BPV0wramZZZlAwUkVBMDkwR3pQd2Jl?=
 =?utf-8?B?SFVpTXdyMGtYSC9zNVgvdTExL0NrWEZvV1NqMjlTbSt6dHNMVml6UmRvSkhP?=
 =?utf-8?B?SzRwZWdBZWVIYXFsN0ZkVUZzanVmcW9rbU4veFdlOGhDKys4TWVMOUs3ekRY?=
 =?utf-8?B?Z3dUL1RqY1BMZUJGTWlzcmJYYUM3UU1wTzVHem1aaThQcC9LVmZrTUxBMGta?=
 =?utf-8?B?RlR2NFNIcEdzTnNxWmpTeW5abGphY2Y2cmplY0J2Tzc1OXZaZnRDeitDeDlK?=
 =?utf-8?B?dVhTYkN6QjVaa1d2SHBCYStKblI4c2dUSWVERXJla3JIb2EzU3FxTTlzU2p3?=
 =?utf-8?B?Q1JGUDc4RzNPYTNaU00rMjFrNnRlWE1PdmJUdzREVTBZMnJqOE5jazNOR1ZH?=
 =?utf-8?B?Z2w1QzFUdTJWeEVtdk1hRWY3QTRQZkZUTDVxckNpc21NNjM3TDJRckVtbnBZ?=
 =?utf-8?B?MVBONldyUmM0WFM5UkwrZWxNVEw2aVFSd2hPbEVyWk1sMXNYQWE0OHVCdjVJ?=
 =?utf-8?B?WE1jU1o4cjB2b0NNcHNYQ1NHYmZPM2xLdkE0dHBUNzFmVEs4dWFFS2FxWjBL?=
 =?utf-8?B?Vml5b3RlMWd4ZTNQR25LQ0xXaVF6aW9YVUo1WmwvbDVWVGRxWFF4bVNiaFd1?=
 =?utf-8?B?RXVtTXRHbXIzTjB0cGxuaGVSQktMZjhtZDltUmZDSCtGU3RtcGc5TjhlSnNC?=
 =?utf-8?B?M1ZPaFdKSkYxZjc3MTZldGhQUTRGNHJwaGdYdjU3RjFoYWxxUStuWksydGs5?=
 =?utf-8?B?TmN3NEJ5NjZPV3c2NlM5ZXBtOTN6NElMTDdQMDJtZWIvWktRaEQvUHRHRXZI?=
 =?utf-8?B?SndKOUZUNkxxaUh1K21IZm9ibU9GSGI0ZCtvQjVxamczNWJCWTBnQ1lGSUlK?=
 =?utf-8?B?NC8xdy9ZWmU0QmVPUzJEaGVsOUJUUU1hTkQ2R3VDemhaOThWMmNWNmU0VHlp?=
 =?utf-8?B?WXhvbUpVWUllb0tCUzl0ZUdFdXlTK3hsVitLOW1sMHlka0dlYmFKWUpXKzJl?=
 =?utf-8?B?cVJ6cnBmTTBsS2hTTXoxM1BQQkQ1d3Y5SWE0RExxQVFZN0ZXL0VLVFRkTktX?=
 =?utf-8?B?UFAxTzlEakRwVlVWSDVDNWZrN2w3WjlDdzdRMys3YkNVKzVZYm5FYjZuUXkr?=
 =?utf-8?B?RStQSWIxY0dlU1QyODNBYUR3MTNxdEt6TFpzbVAzaitlZEt2cDg2eENVcEwv?=
 =?utf-8?B?Y1hYdFQ4V2RVNm1ISHJKR1JtT0d0d1J1S2dTbWJ5UVlqSGI0UnNWOGhzZkV6?=
 =?utf-8?B?RVpWWklIbThlS3IwUnhnSTVsVjRxNHFMSFRiNjdKOHFKTkU0V0M5N1lYQzB6?=
 =?utf-8?B?N1NzLzFqYTVRZllmSjY2U21GLzZDSE8xMlF4dmdKV29UUXZwSXBhVHR4QkNh?=
 =?utf-8?B?ZDU3VU10WDBFd3JVbUxZM2wyUllsVTcwOW9kTFpCeUpiVWc9PQ==?=
X-Microsoft-Antispam-Message-Info: gq16zM+jaqfHV919sWmmn5FRkl01fHW4Nr0ENMSSxGtU7NHhSpIjGLAnSZPq9T5ruBly3RftxpTEmcNPAgOLT3nLJbZtpAzgFj1IjG3bJpmRcL3ZvGgsk76L3a2E3KAtSen6q5rD4DJk/JogDdGh0Vis6SIiSSJ91aVLOMz+IN0sCSdpdNS0dR0k6Sp19MZG41kVrvHhmFNqhGhUC18BfDeI+ICCFqKjnd+qX0fTSJON6JqrVerh8gHTmn2jEPIiJr3yBGoGFFag0adX+Id+iSnsb1Sd240wdZ9kfRG8jju3+jwOQzyURONjrH9KLHG0vbAyabGHxjXNf5jpZDY6z0vPzxWgVveltqxxQRgKOFk=
X-Microsoft-Exchange-Diagnostics: 1;DM6PR02MB4457;6:9iFrvSbWJFSzcUoatoZI03CHgMy3bkaQieC7/BLS1lHPSUX0N2ExyIxGrFceGd4/1vPeCjJkXX9KKCEVIksoWod2INqfBQiE2PYiWZ7lL2s+3LP4DIJq1N8e1Wn3qStFX21O5zOMympwW9r7qGC1R+fWsk2xg7roCRsmIxyP0ko42ahUA1oDoMcU0vveaAFHWnsaZeBa7dlIkQmpsrvMdADU5FLnMZMT5TWJgRMU211Vx+bGEEQTykbtJ/YLfVtviyBtngen2DJ8lGJt6Asm1HGY3oqTVgOPvYnFsRqTvqXRj8TEvPsAO9KkdNY4kau65wF63WM2zPI7djrk708179DdDwWd+AmiN/+DxNvLi0vSvMUWjOf7WehFtnTzeUvrda2dsT5ciVT0R1GNya3IqV1ptd9hnDehtn9bx7sIS78eCSN3ON/lvXwgu8tJrLxX9vMIrQVKGdPJwv0L2VVhUg==;5:LZCbyVzfJF6YiWWPY1U7kP40K0wEx3IIC5eYWDRWkEdRjsVr4b8QXg5UcuHBgAiMFcIbjwpQ6HyBWOSFP22t20c/W4YpHSPq8HbS56Kec0uIi47YVb4si/DeruJqJ8GEP74Z6ZR1tTmXA0rd+0V05EhREkRXyps+Ag7y2ET2QJw=;7:r4gSDhyUiZJQLMZY5zRUnyMuQS3lFU9SoJDJVFRFwTAaT52FezCbh+RuwInyxF6G18Tnum+xtoWvFzrx2S7dG+WFcVjBT+EDTeL9ZpwAnUS/h0G9Po+lgJ7Kd5LQ6im7G4egwNMsqpH7YbkTnK22KA==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2018 07:38:54.5974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 689cf960-d4c1-4ad5-18d4-08d642f1bd44
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4457
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17. 10. 18 17:22, Stephen Boyd wrote:
> Quoting Rajan Vaja (2018-10-17 00:46:32)
>> Return proper error code in case query for fixed factor
>> parameter fails. This also fixes build warning for set
>> but not used variable 'ret'.
>>
>> Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
> 
> Fixes tag? And I think this is going through arm-soc already? If so,
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 
> with the appropriate fixes tag added.

It was really just about to merge this via arm-soc tree because of
dependency on firmware itself.
It is the part of v4.20-rc1 now and it can go via your tree.

Anyway v2 is required with Fixed tag anyway.
Rajan: Please send it v2 with Acked above.

Thanks,
Michal
