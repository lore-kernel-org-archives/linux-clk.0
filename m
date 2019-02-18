Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1000CC43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 09:19:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF6F220C01
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 09:19:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XIAF7+Bp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729384AbfBRJTX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 04:19:23 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:50278 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728823AbfBRJTX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Feb 2019 04:19:23 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x1I9JGuZ195481;
        Mon, 18 Feb 2019 09:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=M954avB/laBTcALGxO8t1bPyIaPOPrDubmrKdgGbcuQ=;
 b=XIAF7+Bp2RGQMR6lka0ZCxE/Sr0klfGizksTtiC7Dy71WVx7KYB0IqTdsSTyVlWZZzwz
 pOyoof8umQSKPkBNFFq8GUKlxQXBA3JSciN/TfvaQusaZxXI/BazDJFUMpnj058jq51Y
 WMTLF+JKrWGxwzYp0fuYuHahKVQmiP7DyeP3nD9PdwPRbOzSSOSuMXitcMmu8V7qRbv2
 dfe6QdUZLpKe1M+GhIutCLviuT1Xo8r4GZTAx++3inHIKyiqdLv5dh/Ki/6gro7xOQ3C
 AEHNSfEgD1kF5AZt9zIGYVYIRS0VD6WLoc0HYjxV8gfO+yO/aot9Rc1oPc3vTxnGVhzG Nw== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by userp2120.oracle.com with ESMTP id 2qpb5r4ye9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Feb 2019 09:19:16 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id x1I9JFLj000853
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Feb 2019 09:19:16 GMT
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x1I9JEv1006679;
        Mon, 18 Feb 2019 09:19:15 GMT
Received: from kadam (/197.157.0.22)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 18 Feb 2019 01:19:14 -0800
Date:   Mon, 18 Feb 2019 12:19:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Yuantian Tang <andy.tang@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: qoriq: Improve an error message
Message-ID: <20190218091906.GA7712@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9170 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=991 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1902180072
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We intended to print "ret" but there is a copy and paste bug from the
previous error message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/clk-qoriq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 0e84f6dfa54e..1212a9be7e80 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -1148,8 +1148,8 @@ static void __init create_one_pll(struct clockgen *cg, int idx)
 		pll->div[i].clk = clk;
 		ret = clk_register_clkdev(clk, pll->div[i].name, NULL);
 		if (ret != 0)
-			pr_err("%s: %s: register to lookup table failed %ld\n",
-			       __func__, pll->div[i].name, PTR_ERR(clk));
+			pr_err("%s: %s: register to lookup table failed %d\n",
+			       __func__, pll->div[i].name, ret);
 
 	}
 }
-- 
2.17.1

