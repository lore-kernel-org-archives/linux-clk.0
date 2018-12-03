Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77054C04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 14:52:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DFCE2082F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 14:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="jmGYAOsZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DFCE2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbeLCOxc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 09:53:32 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:37510 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbeLCOxb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 09:53:31 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.22/8.16.0.22) with SMTP id wB3EnGwd010157;
        Mon, 3 Dec 2018 14:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2018-07-02;
 bh=7IGCfNexcCbBWRaXmweXARE2lBLfn74PlRz0eF6jDy0=;
 b=jmGYAOsZ/3mOIGkN3uGQ9UQ3CLUwlJ39XhU5c7xYPCfIsxd8at0Xdd4C4rxeEK9HY8Cm
 vjXqVEsPXIhzaPVWenyEG2i8QECnkpPo9cXbxVeb8DFTXG1mSKT4HUKtCgdrSHMfQgns
 FqE6hIpPJMcKVbsDpP0pL10big0bVq2oE4LZbQrmk8npUsQVlPDNguBBeM9Ws56MGbXP
 r1FO5S0hbBssd8Gvl2S/CfaLCYm4ZSrHY1d2X8XENhYVScORpPaPGzVn2mKNLy9AD9PM
 7M25I/0S6JeJmWdjzi9/7gCE6ARX24/G2FffDa5qsZr7o6/lSDBgpUC/wDvrLDfYJzWD Nw== 
Received: from aserv0022.oracle.com (aserv0022.oracle.com [141.146.126.234])
        by aserp2120.oracle.com with ESMTP id 2p3j8q6t6x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 03 Dec 2018 14:52:11 +0000
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserv0022.oracle.com (8.14.4/8.14.4) with ESMTP id wB3EqAai032252
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 3 Dec 2018 14:52:10 GMT
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id wB3EqAZR010056;
        Mon, 3 Dec 2018 14:52:10 GMT
Received: from kili.mountain (/197.157.0.63)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Dec 2018 06:52:09 -0800
Date:   Mon, 3 Dec 2018 17:52:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Tejas Patel <tejasp@xilinx.com>, linux-clk@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] clk: zynqmp: Off by one in zynqmp_is_valid_clock()
Message-ID: <20181203145200.o6gnv5fhuubfgg4u@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9096 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=887
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1812030140
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The > comparison should be >= to prevent reading beyond the end of the
clock[] array.

(The clock[] array is allocated in zynqmp_clk_setup() and has
clock_max_idx elements.)

Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/zynqmp/clkc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 297f16a20bfc..f65cc0ff76ab 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -128,7 +128,7 @@ static const struct zynqmp_eemi_ops *eemi_ops;
  */
 static inline int zynqmp_is_valid_clock(u32 clk_id)
 {
-	if (clk_id > clock_max_idx)
+	if (clk_id >= clock_max_idx)
 		return -ENODEV;
 
 	return clock[clk_id].valid;
-- 
2.11.0

