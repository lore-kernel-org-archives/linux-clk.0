Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50940C43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 19:34:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D0912177E
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 19:34:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbfBRTeT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 14:34:19 -0500
Received: from mga04.intel.com ([192.55.52.120]:3948 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726941AbfBRTeT (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 18 Feb 2019 14:34:19 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2019 11:34:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,385,1544515200"; 
   d="scan'208";a="147840171"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2019 11:34:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 0BE9BBB; Mon, 18 Feb 2019 21:34:15 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        linux-acpi@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] clk: x86: Move clk-lpss.h to platform_data/x86
Date:   Mon, 18 Feb 2019 22:34:15 +0300
Message-Id: <20190218193415.79716-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk-lpss.h is solely x86 related header. Move it to correct folder.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/acpi_lpss.c                         | 2 +-
 drivers/clk/x86/clk-lpt.c                        | 2 +-
 include/linux/platform_data/{ => x86}/clk-lpss.h | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename include/linux/platform_data/{ => x86}/clk-lpss.h (100%)

diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
index 5f94c35d165f..1e2a10a06b9d 100644
--- a/drivers/acpi/acpi_lpss.c
+++ b/drivers/acpi/acpi_lpss.c
@@ -18,7 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/clk-lpss.h>
+#include <linux/platform_data/x86/clk-lpss.h>
 #include <linux/platform_data/x86/pmc_atom.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/clk/x86/clk-lpt.c b/drivers/clk/x86/clk-lpt.c
index 6b40eb89ae19..68bd3abaef2c 100644
--- a/drivers/clk/x86/clk-lpt.c
+++ b/drivers/clk/x86/clk-lpt.c
@@ -13,7 +13,7 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/platform_data/clk-lpss.h>
+#include <linux/platform_data/x86/clk-lpss.h>
 #include <linux/platform_device.h>
 
 static int lpt_clk_probe(struct platform_device *pdev)
diff --git a/include/linux/platform_data/clk-lpss.h b/include/linux/platform_data/x86/clk-lpss.h
similarity index 100%
rename from include/linux/platform_data/clk-lpss.h
rename to include/linux/platform_data/x86/clk-lpss.h
-- 
2.20.1

