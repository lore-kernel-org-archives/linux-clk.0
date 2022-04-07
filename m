Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDA5C43217
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 13:30:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244748AbiDGNcQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 09:32:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239754AbiDGNcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 09:32:13 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1B6D69
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 06:30:12 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237CLrJs010324;
        Thu, 7 Apr 2022 09:30:04 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3f6gb7pbcu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 09:30:04 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 237DU3Ou048035
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Apr 2022 09:30:03 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 7 Apr 2022
 09:30:02 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 7 Apr 2022 09:30:02 -0400
Received: from nsa.ad.analog.com ([10.44.3.67])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 237DTsKY026152;
        Thu, 7 Apr 2022 09:30:00 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 2/4] clk: fix clk not being unlinked from consumers list
Date:   Thu, 7 Apr 2022 15:30:34 +0200
Message-ID: <20220407133036.213217-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407133036.213217-1-nuno.sa@analog.com>
References: <20220407133036.213217-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: mMY1kMLtBovxqTGk2gWGtd_1RmfC76Kh
X-Proofpoint-ORIG-GUID: mMY1kMLtBovxqTGk2gWGtd_1RmfC76Kh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_02,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=11 mlxlogscore=806
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070065
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When a clk_hw is resgistered we add a struct clk handle to it's
consumers list. Hence, we need to remove it when unregistering the
clk_hw. This could actually lead to a use after free if a provider get's
removed before a consumer. When removing the consumer, __clk_put() is
called and that will do 'hlist_del(&clk->clks_node)' which will touch in
already freed memory.

Fixes: 1df4046a93e08 ("clk: Combine __clk_get() and __clk_create_clk()")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ed119182aa1b..e82c3ee1da13 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4198,6 +4198,7 @@ void clk_unregister(struct clk *clk)
 		pr_warn("%s: unregistering protected clock: %s\n",
 					__func__, clk->core->name);
 
+	clk_core_unlink_consumer(clk);
 	kref_put(&clk->core->ref, __clk_release);
 	free_clk(clk);
 unlock:
-- 
2.35.1

