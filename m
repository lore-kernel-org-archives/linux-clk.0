Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C78C433F5
	for <linux-clk@archiver.kernel.org>; Thu,  7 Apr 2022 13:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239754AbiDGNcR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Apr 2022 09:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240229AbiDGNcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Apr 2022 09:32:13 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38AFCDC5
        for <linux-clk@vger.kernel.org>; Thu,  7 Apr 2022 06:30:13 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 237Cij7p010319;
        Thu, 7 Apr 2022 09:30:05 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3f6gb7pbcv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Apr 2022 09:30:05 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 237DU4pr048039
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 7 Apr 2022 09:30:04 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 7 Apr 2022
 09:30:03 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 7 Apr 2022 09:30:03 -0400
Received: from nsa.ad.analog.com ([10.44.3.67])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 237DTsKZ026152;
        Thu, 7 Apr 2022 09:30:00 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [RFC PATCH 3/4] clk: refcount the active parent clk_core
Date:   Thu, 7 Apr 2022 15:30:35 +0200
Message-ID: <20220407133036.213217-4-nuno.sa@analog.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407133036.213217-1-nuno.sa@analog.com>
References: <20220407133036.213217-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 29C0mGVIk_lo4gzIgFOFVmnDfFlEcWgN
X-Proofpoint-ORIG-GUID: 29C0mGVIk_lo4gzIgFOFVmnDfFlEcWgN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_02,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=893
 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070065
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As we keep a reference of the parent clk_hw, we should refcount it.
Otherwise, we could end up with a use after free situation. With
the following topology:

         providers              |   consumer
+----------+     +----------+   |   +-------+
| clk_hw A | --> | clk_hw B | <---- | clk C |
+----------+     +----------+   |   +-------+

Being clk_hw A and B provided by the same device, removing this device
will effectively leave clk_core B with a pointer to clk_core C which was
freed (clk C holds a reference to B and hence B won't be freed).
Thus, when we do remove the clk consumer, bad things can (and will)
happen.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/clk/clk.c | 80 ++++++++++++++++++++++++++++++-----------------
 1 file changed, 51 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e82c3ee1da13..a2d8778ca3e0 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1851,6 +1851,47 @@ static void __clk_set_parent_after(struct clk_core *core,
 	}
 }
 
+static void clk_core_free_parent_map(struct clk_core *core)
+{
+	int i = core->num_parents;
+
+	if (!core->num_parents)
+		return;
+
+	while (--i >= 0) {
+		kfree_const(core->parents[i].name);
+		kfree_const(core->parents[i].fw_name);
+	}
+
+	kfree(core->parents);
+}
+
+/* Free memory allocated for a clock. */
+static void __clk_release(struct kref *ref)
+{
+	struct clk_core *core = container_of(ref, struct clk_core, ref);
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (core->parent)
+		kref_put(&core->parent->ref, __clk_release);
+
+	clk_core_free_parent_map(core);
+	kfree_const(core->name);
+	kfree(core);
+}
+
+/* deal with new, old parent references */
+static void __clk_reparent_refs_update(struct clk_core *new_parent,
+				       struct clk_core *old_parent)
+{
+	if (new_parent)
+		kref_get(&new_parent->ref);
+
+	if (old_parent)
+		kref_put(&old_parent->ref, __clk_release);
+}
+
 static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 			    u8 p_index)
 {
@@ -1878,6 +1919,7 @@ static int __clk_set_parent(struct clk_core *core, struct clk_core *parent,
 	}
 
 	__clk_set_parent_after(core, parent, old_parent);
+	__clk_reparent_refs_update(parent, old_parent);
 
 	return 0;
 }
@@ -2118,6 +2160,7 @@ static void clk_change_rate(struct clk_core *core)
 
 		trace_clk_set_parent_complete(core, core->new_parent);
 		__clk_set_parent_after(core, core->new_parent, old_parent);
+		__clk_reparent_refs_update(core->new_parent, old_parent);
 	}
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
@@ -3477,6 +3520,7 @@ static void clk_core_reparent_orphans_nolock(void)
 			/* update the clk tree topology */
 			__clk_set_parent_before(orphan, parent);
 			__clk_set_parent_after(orphan, parent, NULL);
+			__clk_reparent_refs_update(parent, NULL);
 			__clk_recalc_accuracies(orphan);
 			__clk_recalc_rates(orphan, 0);
 
@@ -3599,6 +3643,7 @@ static int __clk_core_init(struct clk_core *core)
 	if (parent) {
 		hlist_add_head(&core->child_node, &parent->children);
 		core->orphan = parent->orphan;
+		kref_get(&parent->ref);
 	} else if (!core->num_parents) {
 		hlist_add_head(&core->child_node, &clk_root_list);
 		core->orphan = false;
@@ -3677,10 +3722,14 @@ static int __clk_core_init(struct clk_core *core)
 		}
 	}
 
-	clk_core_reparent_orphans_nolock();
+	/*
+	 * Some orphan might be reparented to us grabbing a reference. Hence,
+	 * this has to be initialized now.
+	 */
+	kref_init(&core->ref);
 
+	clk_core_reparent_orphans_nolock();
 
-	kref_init(&core->ref);
 out:
 	clk_pm_runtime_put(core);
 unlock:
@@ -3894,21 +3943,6 @@ static int clk_core_populate_parent_map(struct clk_core *core,
 	return 0;
 }
 
-static void clk_core_free_parent_map(struct clk_core *core)
-{
-	int i = core->num_parents;
-
-	if (!core->num_parents)
-		return;
-
-	while (--i >= 0) {
-		kfree_const(core->parents[i].name);
-		kfree_const(core->parents[i].fw_name);
-	}
-
-	kfree(core->parents);
-}
-
 static struct clk *
 __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 {
@@ -4068,18 +4102,6 @@ int of_clk_hw_register(struct device_node *node, struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(of_clk_hw_register);
 
-/* Free memory allocated for a clock. */
-static void __clk_release(struct kref *ref)
-{
-	struct clk_core *core = container_of(ref, struct clk_core, ref);
-
-	lockdep_assert_held(&prepare_lock);
-
-	clk_core_free_parent_map(core);
-	kfree_const(core->name);
-	kfree(core);
-}
-
 /*
  * Empty clk_ops for unregistered clocks. These are used temporarily
  * after clk_unregister() was called on a clock and until last clock
-- 
2.35.1

