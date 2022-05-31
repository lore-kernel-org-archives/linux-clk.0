Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB66C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 31 May 2022 12:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231168AbiEaMpV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 May 2022 08:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237022AbiEaMpU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 May 2022 08:45:20 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505236EC4D
        for <linux-clk@vger.kernel.org>; Tue, 31 May 2022 05:45:19 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24VBi3Uw029618;
        Tue, 31 May 2022 08:45:09 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gc0xg89f0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 May 2022 08:45:09 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 24VCj8bn021939
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 31 May 2022 08:45:08 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 31 May
 2022 08:45:07 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 31 May 2022 08:45:07 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 24VCixJR028004;
        Tue, 31 May 2022 08:45:04 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH v2 1/4] clk: clk-conf: properly release of nodes
Date:   Tue, 31 May 2022 14:45:51 +0200
Message-ID: <20220531124554.275682-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124554.275682-1-nuno.sa@analog.com>
References: <20220531124554.275682-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: dsm67kWcLPYvF8M8p8tVbzArL7eBdjIY
X-Proofpoint-GUID: dsm67kWcLPYvF8M8p8tVbzArL7eBdjIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_04,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=553
 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205310066
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We need to call 'of_node_put()' when we are done with the node or on
error paths. Otherwise this can leak memory in DYNAMIC_OF setups.

In order to make things easier to follow, an helper function was added
to set each parent in it's own function.

Fixes: 86be408bfbd8 ("clk: Support for clock parents and rates assigned from device tree")
Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk-conf.c | 126 +++++++++++++++++++++++++----------------
 1 file changed, 78 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 2ef819606c41..b8ea4f93f35e 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -11,11 +11,78 @@
 #include <linux/of.h>
 #include <linux/printk.h>
 
-static int __set_clk_parents(struct device_node *node, bool clk_supplier)
+static int __set_clk_parent(struct device_node *node, bool clk_supplier,
+			    int index, bool *stop)
 {
 	struct of_phandle_args clkspec;
-	int index, rc, num_parents;
 	struct clk *clk, *pclk;
+	int rc;
+
+	rc = of_parse_phandle_with_args(node, "assigned-clock-parents",
+					"#clock-cells",	index, &clkspec);
+	if (rc) {
+		/* skip empty (null) phandles */
+		if (rc == -ENOENT)
+			return 0;
+
+		return rc;
+	}
+
+	if (clkspec.np == node && !clk_supplier) {
+		*stop = true;
+		goto out_of_put;
+	}
+
+	pclk = of_clk_get_from_provider(&clkspec);
+	of_node_put(clkspec.np);
+	if (IS_ERR(pclk)) {
+		if (PTR_ERR(pclk) != -EPROBE_DEFER)
+			pr_warn("clk: couldn't get parent clock %d for %pOF\n",
+				index, node);
+
+		return PTR_ERR(pclk);
+	}
+
+	rc = of_parse_phandle_with_args(node, "assigned-clocks",
+					"#clock-cells", index, &clkspec);
+	if (rc) {
+		clk_put(pclk);
+		return rc;
+	}
+
+	if (clkspec.np == node && !clk_supplier) {
+		*stop = true;
+		goto out_clk_put;
+	}
+
+	clk = of_clk_get_from_provider(&clkspec);
+	if (IS_ERR(clk)) {
+		if (PTR_ERR(clk) != -EPROBE_DEFER)
+			pr_warn("clk: couldn't get assigned clock %d for %pOF\n",
+				index, node);
+
+		rc = PTR_ERR(clk);
+		goto out_clk_put;
+	}
+
+	rc = clk_set_parent(clk, pclk);
+	if (rc)
+		pr_err("clk: failed to reparent %s to %s: %d\n",
+		       __clk_get_name(clk), __clk_get_name(pclk), rc);
+
+	clk_put(clk);
+
+out_clk_put:
+	clk_put(pclk);
+out_of_put:
+	of_node_put(clkspec.np);
+	return rc;
+}
+
+static int __set_clk_parents(struct device_node *node, bool clk_supplier)
+{
+	int index, rc, num_parents;
+	bool stop = false;
 
 	num_parents = of_count_phandle_with_args(node, "assigned-clock-parents",
 						 "#clock-cells");
@@ -24,53 +91,12 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 		       node);
 
 	for (index = 0; index < num_parents; index++) {
-		rc = of_parse_phandle_with_args(node, "assigned-clock-parents",
-					"#clock-cells",	index, &clkspec);
-		if (rc < 0) {
-			/* skip empty (null) phandles */
-			if (rc == -ENOENT)
-				continue;
-			else
-				return rc;
-		}
-		if (clkspec.np == node && !clk_supplier)
-			return 0;
-		pclk = of_clk_get_from_provider(&clkspec);
-		if (IS_ERR(pclk)) {
-			if (PTR_ERR(pclk) != -EPROBE_DEFER)
-				pr_warn("clk: couldn't get parent clock %d for %pOF\n",
-					index, node);
-			return PTR_ERR(pclk);
-		}
-
-		rc = of_parse_phandle_with_args(node, "assigned-clocks",
-					"#clock-cells", index, &clkspec);
-		if (rc < 0)
-			goto err;
-		if (clkspec.np == node && !clk_supplier) {
-			rc = 0;
-			goto err;
-		}
-		clk = of_clk_get_from_provider(&clkspec);
-		if (IS_ERR(clk)) {
-			if (PTR_ERR(clk) != -EPROBE_DEFER)
-				pr_warn("clk: couldn't get assigned clock %d for %pOF\n",
-					index, node);
-			rc = PTR_ERR(clk);
-			goto err;
-		}
-
-		rc = clk_set_parent(clk, pclk);
-		if (rc < 0)
-			pr_err("clk: failed to reparent %s to %s: %d\n",
-			       __clk_get_name(clk), __clk_get_name(pclk), rc);
-		clk_put(clk);
-		clk_put(pclk);
+		rc = __set_clk_parent(node, clk_supplier, index, &stop);
+		if (rc || stop)
+			return rc;
 	}
+
 	return 0;
-err:
-	clk_put(pclk);
-	return rc;
 }
 
 static int __set_clk_rates(struct device_node *node, bool clk_supplier)
@@ -93,14 +119,17 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
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
 
@@ -110,6 +139,7 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 				       __clk_get_name(clk), rate, rc,
 				       clk_get_rate(clk));
 			clk_put(clk);
+			of_node_put(clkspec.np);
 		}
 		index++;
 	}
-- 
2.36.1

