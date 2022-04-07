Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A97C4332F
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 13:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242932AbiDGNcP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 09:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239753AbiDGNcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 09:32:13 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB3A4D7B
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 06:30:12 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237CJkdF006293;
        Thu, 7 Apr 2022 09:30:04 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3f6kd55r00-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 09:30:04 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 237DU3cR048031
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Apr 2022 09:30:03 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 7 Apr 2022 09:30:02 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Thu, 7 Apr 2022 09:30:01 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 7 Apr 2022 09:30:01 -0400
Received: from nsa.ad.analog.com ([10.44.3.67])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 237DTsKX026152;
        Thu, 7 Apr 2022 09:29:59 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 1/4] clk: clk-conf: properly release of nodes
Date:   Thu, 7 Apr 2022 15:30:33 +0200
Message-ID: <20220407133036.213217-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407133036.213217-1-nuno.sa@analog.com>
References: <20220407133036.213217-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 9L68Lez2dx1sALKcpwZiFjlpefp0bjLe
X-Proofpoint-ORIG-GUID: 9L68Lez2dx1sALKcpwZiFjlpefp0bjLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_02,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=691 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070065
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We need to call 'of_node_put()' when we are done with the node or on
error paths. Otherwise this can leak memory in DYNAMIC_OF setups.

Fixes: 86be408bfbd8 ("clk: Support for clock parents and rates assigned from device tree")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
(cherry picked from commit 69eb47a26e7f728a5c052687380993cd9a0dd643)
---
 drivers/clk/clk-conf.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 2ef819606c41..d6065cdf1540 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -33,9 +33,12 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 			else
 				return rc;
 		}
-		if (clkspec.np == node && !clk_supplier)
+		if (clkspec.np == node && !clk_supplier) {
+			of_node_put(clkspec.np);
 			return 0;
+		}
 		pclk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
 		if (IS_ERR(pclk)) {
 			if (PTR_ERR(pclk) != -EPROBE_DEFER)
 				pr_warn("clk: couldn't get parent clock %d for %pOF\n",
@@ -49,7 +52,7 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 			goto err;
 		if (clkspec.np == node && !clk_supplier) {
 			rc = 0;
-			goto err;
+			goto err_of_put;
 		}
 		clk = of_clk_get_from_provider(&clkspec);
 		if (IS_ERR(clk)) {
@@ -57,7 +60,7 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 				pr_warn("clk: couldn't get assigned clock %d for %pOF\n",
 					index, node);
 			rc = PTR_ERR(clk);
-			goto err;
+			goto err_of_put;
 		}
 
 		rc = clk_set_parent(clk, pclk);
@@ -66,8 +69,11 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 			       __clk_get_name(clk), __clk_get_name(pclk), rc);
 		clk_put(clk);
 		clk_put(pclk);
+		of_node_put(clkspec.np);
 	}
 	return 0;
+err_of_put:
+	of_node_put(clkspec.np);
 err:
 	clk_put(pclk);
 	return rc;
@@ -93,14 +99,17 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 				else
 					return rc;
 			}
-			if (clkspec.np == node && !clk_supplier)
+			if (clkspec.np == node && !clk_supplier) {
+				of_node_put(clkspec.np);
 				return 0;
+			}
 
 			clk = of_clk_get_from_provider(&clkspec);
 			if (IS_ERR(clk)) {
 				if (PTR_ERR(clk) != -EPROBE_DEFER)
 					pr_warn("clk: couldn't get clock %d for %pOF\n",
 						index, node);
+				of_node_put(clkspec.np);
 				return PTR_ERR(clk);
 			}
 
@@ -110,6 +119,7 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 				       __clk_get_name(clk), rate, rc,
 				       clk_get_rate(clk));
 			clk_put(clk);
+			of_node_put(clkspec.np);
 		}
 		index++;
 	}
-- 
2.35.1

