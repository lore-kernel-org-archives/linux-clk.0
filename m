Return-Path: <SRS0=tl1f=SB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5A7C43381
	for <linux-clk@archiver.kernel.org>; Sat, 30 Mar 2019 12:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B7F8217F5
	for <linux-clk@archiver.kernel.org>; Sat, 30 Mar 2019 12:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="u/bMzYbB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730510AbfC3MCg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 30 Mar 2019 08:02:36 -0400
Received: from mail-eopbgr700078.outbound.protection.outlook.com ([40.107.70.78]:24544
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730384AbfC3MCg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 30 Mar 2019 08:02:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SWTE08ZUJd2vm9r3+oRr3UlChxjoZONd7NoAYlyISIo=;
 b=u/bMzYbBcBbObiFuqauM3pDL8OgvX7TfLSzKB16YmB3Vck/c72UgEN6M3lJHIGEbvmLW8PhOWq8Ea3B29YyIxwOJN53rhG60lZWUgDKnr016FcJISx4HONrrKam3ca9dBIwgDhaw3G6FiOuqv2j8EGKcw8INSrmwFnPKQXCzYgo=
Received: from SN6PR02CA0036.namprd02.prod.outlook.com (2603:10b6:805:a2::49)
 by SN6PR02MB5248.namprd02.prod.outlook.com (2603:10b6:805:70::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1750.17; Sat, 30 Mar
 2019 12:02:33 +0000
Received: from CY1NAM02FT004.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::204) by SN6PR02CA0036.outlook.office365.com
 (2603:10b6:805:a2::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1750.17 via Frontend
 Transport; Sat, 30 Mar 2019 12:02:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 CY1NAM02FT004.mail.protection.outlook.com (10.152.74.112) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1750.16
 via Frontend Transport; Sat, 30 Mar 2019 12:02:33 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39634 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1hACgy-00021A-NA; Sat, 30 Mar 2019 05:02:32 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1hACgt-000850-MA; Sat, 30 Mar 2019 05:02:27 -0700
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x2UC2LKL028226;
        Sat, 30 Mar 2019 05:02:22 -0700
Received: from [172.23.37.106] (helo=xhdshubhraj40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1hACgn-00083k-Cg; Sat, 30 Mar 2019 05:02:21 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-clk@vger.kernel.org>
CC:     <sboyd@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Subject: [LINUX PATCHv5] clk: clk-fixed-factor: Return EPROBE_DEFER to wait for dependent drivers
Date:   Sat, 30 Mar 2019 17:32:18 +0530
Message-ID: <1553947338-12470-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(346002)(39860400002)(136003)(396003)(376002)(2980300002)(189003)(199004)(9786002)(5024004)(14444005)(36386004)(107886003)(126002)(2616005)(486006)(8936002)(8746002)(6916009)(26005)(50226002)(316002)(50466002)(81166006)(81156014)(48376002)(476003)(2906002)(8676002)(7696005)(51416003)(77096007)(336012)(426003)(6666004)(44832011)(36756003)(478600001)(5660300002)(47776003)(106002)(106466001)(305945005)(356004)(54906003)(186003)(2351001)(4326008)(63266004)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB5248;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 338bacb5-e89f-45c8-8e4b-08d6b50797bc
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4709054)(2017052603328)(7153060);SRVR:SN6PR02MB5248;
X-MS-TrafficTypeDiagnostic: SN6PR02MB5248:
Content-Transfer-Encoding: quoted-printable
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB52487CA8571DFF8AC8D082E1AA5B0@SN6PR02MB5248.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09928BEC91
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 8jBGmta8eXvbg7V3rKuXgAtUEWl7Xp2vWxBgsmfuam85TOz7iTIkUyVg8s9GEnCLgRM60g9AHmx0QXm/Ynx2nQzWnS265Ojvf7F6ccB4vKhdCAclJwlbGyqdA7/D0bXB5LB2qdOBQ2vs7H2AmVDNqt508BQakuQI5GCB1w5hIMAQO4n4NrRpJIIipgKZNeGeGeKhuIPHmkxjGxgdNbvzdtwFX5afSTGPCRmzJj7eyqvTRgoaH8D+S4VMwQQk9vJyZoD8xlYiRq68fXOAajDk/a5Ek1BkI7H7km6gfuCbYQH8mLuLppKPYYcTFJlVGwYRdMLmX9d8p+cukzQeSlhM1EMp0LUKDpm7FOu8/kIWzul5lz1OOaQJ1bRSvhUVVMxOkXymZveL7h9nTV9wNaGcVP0qOyCC50u5+SVcAdwnwCg=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2019 12:02:33.2167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 338bacb5-e89f-45c8-8e4b-08d6b50797bc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5248
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In case the provider clock is not yet probed the fixed factor does not
find the name of the parent clock. This is because the parent clock is
not yet probed and in case of zynqmp the output-names is omitted.

This is a temporary solution however the critical components
like firmware probe should happen early.
Fixes a probe failure.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
v2:Fix the return value in other cases

 drivers/clk/clk-fixed-factor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.=
c
index f3ae4ff..36cbb0c 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -171,6 +171,8 @@ static struct clk *_of_fixed_factor_clk_setup(struct de=
vice_node *node)

        of_property_read_string(node, "clock-output-names", &clk_name);
        parent_name =3D of_clk_get_parent_name(node, 0);
+       if (!parent_name)
+               return ERR_PTR(-EPROBE_DEFER);

        if (of_match_node(set_rate_parent_matches, node))
                flags |=3D CLK_SET_RATE_PARENT;
--
2.1.1

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
