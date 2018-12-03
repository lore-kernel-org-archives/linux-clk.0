Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 590D6C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 14:52:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 203882082F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 14:52:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YT5qnaY4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 203882082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726456AbeLCOxT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 09:53:19 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:47130 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbeLCOxS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 09:53:18 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.22/8.16.0.22) with SMTP id wB3En0VO041243;
        Mon, 3 Dec 2018 14:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=kK8t4gIrCejQ9DE+rBo9YO7MdxTHlLyZTisot7FsNu4=;
 b=YT5qnaY4i4pKOvcjy5sb6OES80/2IIqy2F0MtPwFmlvQK3NCibrVa60tJitfoBKBPC10
 c7yb2Jf2lR2SpsyEKQZJHgjHbeXXw1hGxy2aSBFobMJi/a5/N8qwYxPYrXMBn9HM00lT
 UAlrsaRmq5ov2a390EWzJIS8ptRtzfj9XXPBuxvBYV+ijAg2NUFeFx5JF67urcYHXxN9
 +CL+3ZBBogkpWvpFiX+S/YVcIri784ezKQnsJSVWgRNf83alBZu55PynwZ1teI/dWyJc
 Z/sJCumYsd1zJ9heAolk2FVmuXfK+BfFqZFqm4ILhr03/17aPytXzdJoPvBrfVM2QlZx zA== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
        by userp2130.oracle.com with ESMTP id 2p3hqtptdv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Dec 2018 14:51:58 +0000
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id wB3EpqKF003568
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 3 Dec 2018 14:51:52 GMT
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id wB3EpqJt030702;
        Mon, 3 Dec 2018 14:51:52 GMT
Received: from kili.mountain (/197.157.0.63)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Dec 2018 06:51:51 -0800
Date:   Mon, 3 Dec 2018 17:51:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Chao Xie <chao.xie@marvell.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: mmp: Off by one in mmp_clk_add()
Message-ID: <20181203145143.qogc62x7ftx4zv4l@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9096 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=830
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1812030140
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The > comparison should be >= or we write one element beyond the end of
the unit->clk_table[] array.

(The unit->clk_table[] array is allocated in the mmp_clk_init() function
and it has unit->nr_clks elements).

Fixes: 4661fda10f8b ("clk: mmp: add basic support functions for DT support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/mmp/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk.c b/drivers/clk/mmp/clk.c
index ad8d483a35cd..ca7d37e2c7be 100644
--- a/drivers/clk/mmp/clk.c
+++ b/drivers/clk/mmp/clk.c
@@ -183,7 +183,7 @@ void mmp_clk_add(struct mmp_clk_unit *unit, unsigned int id,
 		pr_err("CLK %d has invalid pointer %p\n", id, clk);
 		return;
 	}
-	if (id > unit->nr_clks) {
+	if (id >= unit->nr_clks) {
 		pr_err("CLK %d is invalid\n", id);
 		return;
 	}
-- 
2.11.0

