Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A02ECDE30
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 07:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACA77214C3
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 07:47:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="NBKzst6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA77214C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbeJQPlg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Oct 2018 11:41:36 -0400
Received: from mail-eopbgr730049.outbound.protection.outlook.com ([40.107.73.49]:50816
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727275AbeJQPlg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 17 Oct 2018 11:41:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/hM3h4vZIpnB5kZoLcngiru4n15AVLG+jtFAIVdyyds=;
 b=NBKzst6NOavWmrvJFQTOdfmwEFvQPHStdvppaaEdJX11bsxNhq8+E1giajddqBF+1KO0Qm36dqr7GU1scGiBn8QkHxuPHGaFn/X4RH3JgCi6qyXeAeBkA81qFyk7r7jHdzgcjJvqzEkGyn7Ma62uyAaR9Q8aGumYrfjn2AXZrYA=
Received: from SN4PR0201CA0035.namprd02.prod.outlook.com
 (2603:10b6:803:2e::21) by SN6PR02MB4463.namprd02.prod.outlook.com
 (2603:10b6:805:a8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1228.25; Wed, 17 Oct
 2018 07:47:08 +0000
Received: from CY1NAM02FT009.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::201) by SN4PR0201CA0035.outlook.office365.com
 (2603:10b6:803:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1250.20 via Frontend
 Transport; Wed, 17 Oct 2018 07:47:07 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 CY1NAM02FT009.mail.protection.outlook.com (10.152.75.12) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1250.11
 via Frontend Transport; Wed, 17 Oct 2018 07:47:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:53533 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1gCgXo-0008TE-Qb; Wed, 17 Oct 2018 00:47:04 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1gCgXj-0002Ce-N6; Wed, 17 Oct 2018 00:46:59 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id w9H7kwNg015783;
        Wed, 17 Oct 2018 00:46:58 -0700
Received: from [172.19.2.152] (helo=xsjsatishna40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <rajan.vaja@xilinx.com>)
        id 1gCgXh-0002CW-W6; Wed, 17 Oct 2018 00:46:58 -0700
From:   Rajan Vaja <rajan.vaja@xilinx.com>
To:     <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <michal.simek@xilinx.com>, <olof@lixom.net>,
        <shubhrajyoti.datta@xilinx.com>
CC:     <rajan.vaja@xilinx.com>, <jolly.shah@xilinx.com>,
        <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] clk: zynqmp: handle fixed factor param query error
Date:   Wed, 17 Oct 2018 00:46:32 -0700
Message-ID: <1539762392-12512-1-git-send-email-rajan.vaja@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(376002)(39860400002)(136003)(396003)(2980300002)(438002)(189003)(199004)(8676002)(186003)(305945005)(81166006)(77096007)(26005)(6636002)(5660300001)(81156014)(54906003)(110136005)(106002)(2201001)(72206003)(48376002)(36756003)(63266004)(47776003)(50466002)(16586007)(106466001)(478600001)(51416003)(8936002)(486006)(9786002)(4326008)(50226002)(36386004)(126002)(2616005)(336012)(1857600001)(2906002)(476003)(316002)(356004)(426003)(6666004)(7696005)(14444005)(44832011)(107986001)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB4463;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;MX:1;A:1;
X-Microsoft-Exchange-Diagnostics: 1;CY1NAM02FT009;1:DWAyyiNV79mKutIlVWbG97zWeTv7HIrnAf3qACojs/UJgGv/0HZQuymh64Pzz64t+Z3k7Ch3zvznliUFKEcl5KSSwSGinWvfnXzrbc8nRdgxo+pIuzHVQ1oDb6gx4NAy
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d631953a-32fe-4e18-c095-08d63404bce0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4608076)(2017052603328)(7153060);SRVR:SN6PR02MB4463;
X-Microsoft-Exchange-Diagnostics: 1;SN6PR02MB4463;3:L3Smes98rxEdANnKlYWLQYhGA+10MJ9x1800KCxIEwEMHvBguUotBBhF/PjqExYfheZVMjzaqvAXcvS1haSKd1MU5hWvoSXR9gE7xK2pcfuq1qpVObvCTETaa/ylEXjq/96jFetI3x2JQJS5yQ+0cPGwfSPuOZC1tGgy1otZ3qaar33dYSe4Tw+aNi6tUfOdmS16rp6flRlsY+DAEQOahr3kBgxBhbmopz4VfCMJiJSyKOlTIziJ43KvKM7jlsN0n0DcCOEzax3o/Y7Wni00mJ6odILQpO6eZGuSO0c8D/VPbnFdOWa6eSqKduC01euTK9T7NjynlGDR4uFj+1Y2N3Qo3Atp9XExb7GVNRsIHSw=;25:tabIo8k1LxuUsmBAefgcSN/MJzv0DgrBwf05OlhwbxBLL0MehZAlheGjB1sYVqerHJTsXEvs8+JOtSima4AQrfDUw3/2/ZfRunAwFMBkoKEpS4ji7/6FeIHQSqt9QoVUQzwNAi8F7qzbW1QH01N7EsRjI31SWIPP5KLtVfyBE01IuC0tO/MA4/RxQOoDiEJFZ0EDJQtsZ4dVZyGlJI6YNghRfSywe5ZNyhYfnfZmJ/dWdDQtw6PpJrprJCbVLj5wBmD3EWdiwwqrFR24jhJ/LvhUc6jK7UlAotudUTDvkPXXjUgB1dA7Qln2nfwsuwggKYwxvEOy8URWqihgBmep2A==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4463:
X-Microsoft-Exchange-Diagnostics: 1;SN6PR02MB4463;31:LYKEKqVLg+KOsEM0G88bcrguWuZvQa8IvzNI2TioIEBhKacYBGcKU0yzpPbBPe05lI5RRodWNKF6DtEJMcKiZ9+YRYepCbOAphrKH1fuWM9AfLFKLU83M0R85KMS5HSU0eVCS8ZgiLwzB0Yn+GCptsVtq4NqzEr0PSfUw/aKPWob4N3PZ57tFQgUvtDLzQkR7PLqxToGHor88rGEf3NAXUWlOYKTIsDiGBjmz43C/5c=;20:tOepkDEgAj/8Vjrci8ro816l7cXyWJI5JZ+CVfiayjNjaW9iCdR0f1RK8nTq75tHipAcMUufHhSfsgbQ2WZFkw3o80XtB71Gfn3RfEtJ5iY92i4ynGAiSOOoVwtafjskvgyXqureVd3hx+EshP0Jp1lZ4MNL7iDSrQjMn8cPI4Gel+sWmKITF1RwiKgZZbXJXHitfXEw66R02yfO1cDMKatcz2RXyWWiG6aSMDZAB74FGjZxZIzRlCezGU4xmSVtDwyFc8t7W2tYMvJdG/S1DKBmOhh4hp0IXFRjg0o48isL1l38Huuwbx7l3KL2wkqvxIu5a5BPxwGBQBwb65XDNi/7NfFXcrJ4i1cU8MYAMY1oqSm8lHH9aNvRT8kZvxaWzJT8dkx9I05wN+/4c+S0LV8IqfPUjG09MXmTp5h9Xz+iShWmptEDEyFXmgRBnWlv7EBQp0IUnjzVUK6UuaBjzWimOp3oNsm1K8f9EySIDXqM1AADqUI8jPkruy21s8QM
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB446325B231386CDCC9EC0726B7FF0@SN6PR02MB4463.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231355)(944501410)(52105095)(3002001)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:SN6PR02MB4463;BCL:0;PCL:0;RULEID:;SRVR:SN6PR02MB4463;
X-Microsoft-Exchange-Diagnostics: 1;SN6PR02MB4463;4:z4Nk0h4E6qhC4bD0dF+88VTr9+vYMa/27Z3xFQylzAsrqfx3uHCM7NmnQpCSg6QnxOupw0yuD4Wk3/pjDXBBb4vCI0dvPhF7W3nNmAHgXnxX2cBMbFqEFnVmPZJHTg4CHHEwaC6Ei1HBvuGX2ip3wK1EBLfC8+cUDgulIUkxsIRP46xH9cd2mg1rFfHeZu/ctdLgZtA24AbXphFQ1VvYPuUlmqSj925ScOdaiudzH3JYZMEohZ4+m937ksM45QnY6WJwJlG8YHZ4kloC4oXEeRjs/0/8Vk1bE/jDkr3JQhbLDCFoafn1gh9D83atfJVY
X-Forefront-PRVS: 08286A0BE2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1;SN6PR02MB4463;23:oMLyTggNsYvm+Zn6HL5c8Pbwn/GtY0zBxBbrmgk1B?=
 =?us-ascii?Q?Pj0cGSY4jHWbqPg7cmqqhNqW4DWBlGXmgxNoQSTHLtXhfy4O/V0iq12QnZfI?=
 =?us-ascii?Q?FUajCgsG1U9R/EIz95LUneWR0b5zNjizdo878UGvTI9sZthIi1FCVfLgxgxm?=
 =?us-ascii?Q?Vpv2pNtWoSkmvI/OuRqtSbyNBK8qWPRXopOdslcysryacxbsZ9js9bJAGW3k?=
 =?us-ascii?Q?FW9w5qYhJuO2/N6AtRR0YFdfE1HWrfI+dB4iZbFX3dy+ehy+u+19ipcLB+7s?=
 =?us-ascii?Q?1Fim6LWErXaecXQpHFsTWrHWR/SMmLLlkvOTJx5qpErXFqm6kLZRFzX8aIQF?=
 =?us-ascii?Q?H8htrAfNN25r0HXDnMYflhpxGj6pLv+h31kYPnUnkcbMsCjF5bUjqU48z43Z?=
 =?us-ascii?Q?142DC0YsxRAcosd1nibo54u7B5mS/OZsagKkwPzcmVRab58Mrz8InHQu2hMd?=
 =?us-ascii?Q?Khm7FiLi9/t+wfzpusi3oyDiJL7wTvERVXOhFc4zW41PB67U83OkAnPww4nz?=
 =?us-ascii?Q?Omg+J3ogCRGoxelshjBm6g+ZDFkEfXDgBOwYINFj1fjP5mKoNUdBuCCCEiJA?=
 =?us-ascii?Q?no2GpxqekVOVVKyJ3oNiNU6mGrozZjKof3YU0rYY6DbF6GssWq2MPDtGqSNu?=
 =?us-ascii?Q?0HFuaXKOLH26qYNPMCGQuAX0BjDXnU2CQxYwVrxtD8ojwOAr2DM1AqTNzWn5?=
 =?us-ascii?Q?5FmU23LsyWvAGEl4C7oYujxrIJwp0qJj19WCjQHVnSxKAn6QSKtJAW4W3tDo?=
 =?us-ascii?Q?h54rtRACnadTldg1kccJVVrjIVygkGTq1c7Mj7EwrST7ZSsr4Zt67wh/jG8s?=
 =?us-ascii?Q?RHpESAkKnIp+fek4Bxd9rmFf28D1rltZYMIWKAamIIato8PNnuTcPr7YA+CP?=
 =?us-ascii?Q?rOPO74hKV0II2Hb+AXmKZlbH3dFcB86gKzarN3KuRSJC1iBwWzCMoQEa6ZAk?=
 =?us-ascii?Q?zsww7N95Yr50oV8Us637O/lEYx4c1xaFRXFePNNm7lyJdDOOiZmhxEmM0w8p?=
 =?us-ascii?Q?U1XFIhdZnSgU9o4GAcK0L8ZaipnnvuyuxA4LIL21IPexqFmjAwx5EyDm+Ixv?=
 =?us-ascii?Q?CBSnUkMXgCqCyy9nIiHIeIAeYVBUsXVR0dberf4zVxWi73Tg8yy22IXX0A2K?=
 =?us-ascii?Q?WmM45lxRtmMh0uioHm/BEMRLuQxhtbhsuL7CwhKHjPdIjETgd8aTnKNH0FLK?=
 =?us-ascii?Q?ZF1fcO5qh4I35k=3D?=
X-Microsoft-Antispam-Message-Info: /0a5B1W8JB4PL/i6j6xU9nO5twWJ2L44yVgU80yLOJop3GmgxE/M3795n0XTHSHBwypo8kORumoxaVTMTtoiWodl7fISmjNQi7eZCrk5i8e8l0P8tjLGYvax3Tx/WLqju6KxJwZ6jT2aGztEfFiyWrCYxArAtgANHvFooai+CBzLPz4Efc7f2S7wynriURgKfBa26CyUU2Kq5WHEuo35ngfpCaamcX2s661wcT4aneaEHBxsouly8r5pmzq/rqzZNkJDCPi7gGUyFq93tOCQjvUx14qQoA+9BCXscdy8iq25Sy1hKx9OevCEdqaUXcgc7CuQ2q4K/AB4DUVUlGh7LA3XPJM8pRhqqkXgox2sZPU=
X-Microsoft-Exchange-Diagnostics: 1;SN6PR02MB4463;6:aLwfre3eVNF2bz/ZZgXB55M1en432bt582rI5P65t5hzx5dOyLTUYtyC0pDWFTofaoZkQk0jK+agrqQHqwPGS/UzirENzDyGA5/emnLylzeALnWqZ0/FWUOQ66fx2mTM7kOvqr/TaK8bimwutPCop5koOL/ouTlplehTzoJqQfqXZR8Ekxpz0i2tstuIusq0zPyhtSdfOCJYB0xBAY3UvsD2Lu02G6VqUtYh+PzUng04m9iT6HXcJ1hv2WQjvQ0Ircb+2cHpCEQA5/eFcTDxLeD/PSKJq+maJSP8RyIMA96gg7zdArufrSQkkCzLmkb+RlxCZMo1hJGZnEilp1daeOzn4ucYUaz4bssoVyzx7JMGRf/1AZWeWbYJcNkRTjFYQi1pB/ocF+fRBXnJQEXKH7wF6aU0tdVW6tcUCs/wJWcdsluXxHCf0GxeJoyRa1M4ef8yAH6fiHkiMBKxcpge2Q==;5:ZrxgpRdpp5tDcFmXmOs+SgsyLlsw0BNQ0P24Rp2hnFgT+VOnZ/tlurCIkgIpip0w1LnkSgabT/XWzvichJsUzKbtH5dlg5pitnNasHlgSXJpk2M1wZOXEtfs8ml+0X1t9IJnM1bTnzO2ekO244BnSI99mPgU99aJVbqxP6Ua6Q4=;7:c9SD8xZFrQQ1kFHkisV8wHriIWbhhZdAjoSJkmPRDGuK2JIY3JMH37hANxRmffTAU3kNIAo9+rljSVd9WwYxXCFA9Yd1a63/F6Y2dP+PL3mg4KMqEBGiRCKhKL8W5nlidCT7aApMGem1qXs0H/DFC9f1GT+0TYokt5yg5PODJTLNLPq/tFWaboUWhNdpM9aTJitkbVc4RmttFLzHTt0PYKpFLrhnj/AWmpSIbLKPRyb8bz7ZXW6zrQVn/w9aedqO
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2018 07:47:05.3956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d631953a-32fe-4e18-c095-08d63404bce0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4463
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Return proper error code in case query for fixed factor
parameter fails. This also fixes build warning for set
but not used variable 'ret'.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
---
 drivers/clk/zynqmp/clkc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 9d7d297..297f16a 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -279,6 +279,9 @@ struct clk_hw *zynqmp_clk_register_fixed_factor(const char *name, u32 clk_id,
 	qdata.arg1 = clk_id;
 
 	ret = eemi_ops->query_data(qdata, ret_payload);
+	if (ret)
+		return ERR_PTR(ret);
+
 	mult = ret_payload[1];
 	div = ret_payload[2];
 
-- 
2.7.4

