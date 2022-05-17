Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D5DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 17 May 2022 13:36:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347913AbiEQNgY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 May 2022 09:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348111AbiEQNgH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 09:36:07 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2446F96
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 06:36:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,232,1647270000"; 
   d="scan'208";a="119949063"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 17 May 2022 22:36:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.244])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C97A740061B0;
        Tue, 17 May 2022 22:36:02 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Julia Lawall <Julia.Lawall@inria.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        cocci@inria.fr
Subject: [RFC] coccinelle: Add test for unnecessary check before calling clk_disable_unprepare()
Date:   Tue, 17 May 2022 14:35:56 +0100
Message-Id: <20220517133556.6934-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_disable_unprepare() function only calls clk_disable() and
clk_unprepare(). Both of these functions already check the clk ptr
passed in using the IS_ERR_OR_NULL macro. Many drivers already omit
any checks on the clk ptr, so it is safe to assume this is true for
all call sites.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
Note that this is the first time I've used coccinelle so there may
be some clangers in the script below.
---
 .../api/clk_disable_unprepare.cocci           | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 scripts/coccinelle/api/clk_disable_unprepare.cocci

diff --git a/scripts/coccinelle/api/clk_disable_unprepare.cocci b/scripts/coccinelle/api/clk_disable_unprepare.cocci
new file mode 100644
index 000000000000..17f00d3653c9
--- /dev/null
+++ b/scripts/coccinelle/api/clk_disable_unprepare.cocci
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Unnecessary check for valid ptr before calling clk_disable_unprepare
+///
+// Confidence: Moderate
+// Copyright: (C) 2022 Phil Edworthy
+// URL: http://coccinelle.lip6.fr/
+// Comments:
+// Options: --no-includes --include-headers
+
+virtual patch
+virtual context
+virtual org
+virtual report
+
+@depends on patch@
+expression clk;
+@@
+
+- if ( \( !clk \| clk != NULL \| !IS_ERR(clk)  \| !IS_ERR_OR_NULL(clk) \) )
+{
+clk_disable_unprepare(clk);
+}
+
+@r depends on !patch exists@
+expression clk;
+position p1,p2;
+@@
+
+if@p1 ( \( !clk \| clk != NULL \| !IS_ERR(clk)  \| !IS_ERR_OR_NULL(clk) \) )
+{
+clk_disable_unprepare@p2(clk);
+}
+
+@script:python depends on org@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+cocci.print_main("clk_disable_unprepare call",p1)
+cocci.print_secs("Unnecessary check tests",p2)
+
+@script:python depends on report@
+p1 << r.p1;
+p2 << r.p2;
+@@
+
+msg = "ERROR: clk_disable_unprepare already checks for valid ptr so check on line %s is not needed" % (p1[0].line)
+coccilib.report.print_report(p2[0], msg)
-- 
2.34.1

