Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF4AC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 22 Nov 2022 13:07:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbiKVNHQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 08:07:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233069AbiKVNHM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 08:07:12 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A645915A;
        Tue, 22 Nov 2022 05:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669122431; x=1700658431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cT2P7D+KHsVNsHeh/fdjbnG586bb89r6zo96DDjOifg=;
  b=kmrIhTxhLCQI5HK5Hi+vOSiUrhG+JI/nNkpkLOROULuXc75F0D/BBvZD
   xhIsbzuxdP0juDwObU9ybGOWWkhxwYbXX5hzy/BhBNKsVfmxGDnQKfttV
   6CCSuS+Zewu/C3exPpY/D8CICjPetl2FTpoZtZNZHg5vKUkS8vzUA5xhq
   DKVYjH1fIEGDMJdjpMo3GuWcrnq46rT21t7MKJiIE5cZDfpzV1CQaklI6
   2mJmon9leRCgfRhGyChn0XT+6D6evYslzafw6p68GHC0GNf2pTipLACsK
   mrVYoqIfab8Xp+MpRWbOzMktbrt8u5S+Ed8t05S/ul84KNzXKyfX3jHXG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="301358047"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="301358047"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2022 05:07:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="619206111"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; 
   d="scan'208";a="619206111"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 22 Nov 2022 05:07:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E5E3212B; Tue, 22 Nov 2022 15:07:33 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 3/3] clk: fractional-divider: Regroup inclusions
Date:   Tue, 22 Nov 2022 15:07:32 +0200
Message-Id: <20221122130732.48537-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122130732.48537-1-andriy.shevchenko@linux.intel.com>
References: <20221122130732.48537-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

For the better maintenance regroup inclusions as follows:
- split CCF related headers in its own group
- order groups from generic to particular
- sort each group alphabetically

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: dropped duplicate of linux/clk-provider.h
 drivers/clk/clk-fractional-divider.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index b6b52b79d671..6affe3565025 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -38,14 +38,15 @@
  * saturated values.
  */
 
-#include <linux/clk-provider.h>
 #include <linux/debugfs.h>
+#include <linux/device.h>
 #include <linux/io.h>
 #include <linux/math.h>
 #include <linux/module.h>
-#include <linux/device.h>
-#include <linux/slab.h>
 #include <linux/rational.h>
+#include <linux/slab.h>
+
+#include <linux/clk-provider.h>
 
 #include "clk-fractional-divider.h"
 
-- 
2.35.1

