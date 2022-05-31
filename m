Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF39BC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 31 May 2022 12:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237022AbiEaMpW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 May 2022 08:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243913AbiEaMpU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 May 2022 08:45:20 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6DC76EC70
        for <linux-clk@vger.kernel.org>; Tue, 31 May 2022 05:45:19 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24V9pCAn029689;
        Tue, 31 May 2022 08:45:10 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gc0xg89f1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 May 2022 08:45:10 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 24VCj9vx021942
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 May 2022 08:45:09 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 31 May 2022 08:45:08 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Tue, 31 May 2022 08:45:08 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 31 May 2022 08:45:08 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 24VCixJS028004;
        Tue, 31 May 2022 08:45:05 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH v2 2/4] clk: fix clk not being unlinked from consumers list
Date:   Tue, 31 May 2022 14:45:52 +0200
Message-ID: <20220531124554.275682-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124554.275682-1-nuno.sa@analog.com>
References: <20220531124554.275682-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: zYOxMmob9uu9KK4X_zND-NQQvR5uEKlV
X-Proofpoint-GUID: zYOxMmob9uu9KK4X_zND-NQQvR5uEKlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_04,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=838
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205310066
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When a clk_hw is registered we add a struct clk handle to it's
consumers list. This handle is created in '__clk_register()' per the
'alloc_clk()' call.

As such, we need to remove this handle when unregistering the
clk_hw. This can actually lead to a use after free if a provider gets
removed before a consumer. When removing the consumer, '__clk_put()' is
called and that will do 'hlist_del(&clk->clks_node)' which will touch in
already freed memory.

Fixes: 1df4046a93e08 ("clk: Combine __clk_get() and __clk_create_clk()")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f00d4c1158d7..536c3915de71 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4191,6 +4191,7 @@ void clk_unregister(struct clk *clk)
 		pr_warn("%s: unregistering protected clock: %s\n",
 					__func__, clk->core->name);
 
+	clk_core_unlink_consumer(clk);
 	kref_put(&clk->core->ref, __clk_release);
 	free_clk(clk);
 unlock:
-- 
2.36.1

