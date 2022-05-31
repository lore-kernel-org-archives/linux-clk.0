Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33214C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 31 May 2022 12:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344325AbiEaMpY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 May 2022 08:45:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344329AbiEaMpV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 May 2022 08:45:21 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F21686EB22
        for <linux-clk@vger.kernel.org>; Tue, 31 May 2022 05:45:20 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24VBDQ0I029516;
        Tue, 31 May 2022 08:45:11 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gc0xg89f6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 May 2022 08:45:11 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 24VCjAxR021949
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 May 2022 08:45:10 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 31 May
 2022 08:45:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 31 May 2022 08:45:09 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 24VCixJU028004;
        Tue, 31 May 2022 08:45:06 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH v2 4/4] clk: use clk_core_unlink_consumer() helper
Date:   Tue, 31 May 2022 14:45:54 +0200
Message-ID: <20220531124554.275682-5-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124554.275682-1-nuno.sa@analog.com>
References: <20220531124554.275682-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 4yliJ2mdLh9zTjOmm6cXbU3kKcptXJrf
X-Proofpoint-GUID: 4yliJ2mdLh9zTjOmm6cXbU3kKcptXJrf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_04,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=747
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205310066
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There is an helper to remove a consumer from the clk provider list.
Hence, let's use it when releasing a consumer.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a18f78f1ebca..022beb868894 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4418,7 +4418,7 @@ void __clk_put(struct clk *clk)
 		clk->exclusive_count = 0;
 	}
 
-	hlist_del(&clk->clks_node);
+	clk_core_unlink_consumer(clk);
 	if (clk->min_rate > clk->core->req_rate ||
 	    clk->max_rate < clk->core->req_rate)
 		clk_core_set_rate_nolock(clk->core, clk->core->req_rate);
-- 
2.36.1

