Return-Path: <SRS0=VWtO=PX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0B2C43387
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 07:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A16520578
	for <linux-clk@archiver.kernel.org>; Tue, 15 Jan 2019 07:02:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Fccp/veR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfAOHCF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Jan 2019 02:02:05 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:53916 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfAOHCF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Jan 2019 02:02:05 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id x0F6v62q143463;
        Tue, 15 Jan 2019 07:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type : in-reply-to;
 s=corp-2018-07-02; bh=x/B6Lpm1r7OD8k6JMGi+atFvfYSGAuB+es3+JJbzvLo=;
 b=Fccp/veRMxn0g41BydD1altl43GNrwoc6rTtp7Fd+lbAD2livHImtnySm5n4mTCa5JKD
 orrCsm1y/h2Jhd9MKPzdomLMQQx2ZTV7hWOZ1tVh/C3DvR/5EVDNdZUzgUqbjGq+cTdI
 oJDTu98JNaG2MgGknobpZJ5BfFYpn0IF7Pjb86V19821t/NHNVYH3KGHtNW0aHuZnV/8
 0REY5oYz0/doeMnWgIZreM5dc6qnGdrZkAQqEdiIk2wAmlerIydpeqm3Edqu9Xg5+Ep1
 5Ql4NN0xE1v1Ck54mv9YNzQMwmgxDXALwNPIrw4V3Jzs9HMs/EOg6MQhzY+zzwJ10X1Y +w== 
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
        by userp2130.oracle.com with ESMTP id 2pybkca726-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jan 2019 07:02:00 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id x0F71woR015822
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 15 Jan 2019 07:01:58 GMT
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x0F71vHD016069;
        Tue, 15 Jan 2019 07:01:58 GMT
Received: from kili.mountain (/197.157.0.35)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 14 Jan 2019 23:01:57 -0800
Date:   Tue, 15 Jan 2019 10:01:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tero Kristo <t-kristo@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: ti: Fix error handling in ti_clk_parse_divider_data()
Message-ID: <20190115070149.wpiyqw5vqqqsapxt@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154706313779.15366.12078258980663060364@swboyd.mtv.corp.google.com>
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9136 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=837
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1901150059
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The ti_clk_parse_divider_data() function is only called from
_get_div_table_from_setup().  That function doesn't look at the return
value but instead looks at the "*table" pointer.  In this case, if the
kcalloc() fails then *table is NULL (which means success).  It should
instead be an error pointer.

The ti_clk_parse_divider_data() function has two callers.  One checks
for errors and the other doesn't.  I have fixed it so now both handle
errors.

Fixes: 4f6be5655dc9 ("clk: ti: divider: add driver internal API for parsing divider data")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/ti/divider.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/ti/divider.c b/drivers/clk/ti/divider.c
index 8d77090ad94a..4c48ef424ad5 100644
--- a/drivers/clk/ti/divider.c
+++ b/drivers/clk/ti/divider.c
@@ -403,8 +403,10 @@ int ti_clk_parse_divider_data(int *div_table, int num_dividers, int max_div,
 	num_dividers = i;
 
 	tmp = kcalloc(valid_div + 1, sizeof(*tmp), GFP_KERNEL);
-	if (!tmp)
+	if (!tmp) {
+		*table = PTR_ERR(-ENOMEM);
 		return -ENOMEM;
+	}
 
 	valid_div = 0;
 	*width = 0;
@@ -439,6 +441,7 @@ struct clk_hw *ti_clk_build_component_div(struct ti_clk_divider *setup)
 {
 	struct clk_omap_divider *div;
 	struct clk_omap_reg *reg;
+	int ret;
 
 	if (!setup)
 		return NULL;
@@ -458,6 +461,12 @@ struct clk_hw *ti_clk_build_component_div(struct ti_clk_divider *setup)
 		div->flags |= CLK_DIVIDER_POWER_OF_TWO;
 
 	div->table = _get_div_table_from_setup(setup, &div->width);
+	if (IS_ERR(div->table)) {
+		ret = PTR_ERR(div->table);
+		kfree(div);
+		return ret;
+	}
+
 
 	div->shift = setup->bit_shift;
 	div->latch = -EINVAL;
-- 
2.11.0

