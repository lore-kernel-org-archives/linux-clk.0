Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584B359D62B
	for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789656036; cv=none; b=eNeIy++5rL1ebur6p3hTNKw0DMFMK8htYcUgH1XdDUwT9sKlubpg1cra5DiTu57TzrV6HsAgY1weJSNjoMK9Cp+MFEyPNlaqDPDt7UR65mIz7asBekrd0w+TbYUZU1WRXqZwM3IE9DYrb2CHLFyA64+3rEKCf9dBAJf/z5Uv99k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789656036; c=relaxed/simple;
	bh=/ljWtQbvCbnAarjsu/KjV9ylCl0oApVddfRRNtpEpVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DjWk/gWIS7OhbOSFPMul4Yc8o8pNIbJkubGrs0im9gG/4TaPEDWHSEjb0Xq7pM87VfKURGLmIG8PO9DUBmRl4IahcNivAEPy3MUDhA63p7mPTlShzI9gFJlKgx42XBrOs7E459/cYjWCaX43h5MT0xpAJd/V3c+p1cvWidNL0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oe6Do+nY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oe6Do+nY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 56025C5CD78;
	Thu, 17 Sep 2026 14:41:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE9645FAA3;
	Thu, 17 Sep 2026 14:40:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A7B111C78B65;
	Thu, 17 Sep 2026 16:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789656017; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=n60VNP1rYbYSk/XVU1s5FrwiahICW4rLKU6O54GD+p4=;
	b=oe6Do+nY2S3n1zplinSdAdvH1uEvIfNeW13BN0x+ZeYxR/8855mugGIPxrFJBd1nobCv5+
	AVkT3DXHznZmB0h8KWJLDP2VP5+DzozFoaTok7otOwOl91pzE27AeI4/31BFPkIpwKiUuE
	1yya1ap67NeZd0WLBikoA1N9HZb0WKwcm6zA7+zVyEbhG7Pnnt1gQuqGMqaHcU0uL7TDuF
	JxCw5JRdJOFVmPszDrP3gWaPxIA1GzzwkIvbZqxucSJ/qJRmbsWNiUcLzkqq90+LvT3RJy
	1kp2ftdvNfzJSxmOQOKFO/OXSWUlRgizD+Zs7d7Dbhwo+lpIxh0YKbMSpaWxoQ==
From: alexandre.belloni@bootlin.com
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: disable unused clocks registered after boot
Date: Thu, 17 Sep 2026 16:40:10 +0200
Message-ID: <20260917144011.3014860-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

clk_disable_unused() only runs once as a late_initcall, so clocks
registered afterwards by loading a module are never checked and may be left
running needlessly.

So record when clk_disable_unused has run and afterwards, schedule a
delayed work to run the scan when new clocks are registered.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clk/clk.c | 50 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..f455d2482a5a 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -24,6 +24,7 @@
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/stringhash.h>
+#include <linux/workqueue.h>
 
 #include "clk.h"
 
@@ -47,6 +48,10 @@ static LIST_HEAD(clk_notifier_list);
 static HLIST_HEAD(clk_rpm_list);
 static DEFINE_MUTEX(clk_rpm_list_lock);
 
+static bool clk_disable_unused_done;
+
+#define CLK_DISABLE_UNUSED_DELAY	(HZ / 2)
+
 static const struct hlist_head *all_lists[] = {
 	&clk_root_list,
 	&clk_orphan_list,
@@ -1511,7 +1516,7 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+static void clk_unprepare_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 
@@ -1536,7 +1541,7 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
 	unsigned long flags;
@@ -1585,21 +1590,14 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static void clk_disable_unused(void)
 {
 	struct clk_core *core;
 	int ret;
 
-	if (clk_ignore_unused) {
-		pr_warn("clk: Not disabling unused clocks\n");
-		return 0;
-	}
-
-	pr_info("clk: Disabling unused clocks\n");
-
 	ret = clk_pm_runtime_get_all();
 	if (ret)
-		return ret;
+		return;
 	/*
 	 * Grab the prepare lock to keep the clk topology stable while iterating
 	 * over clks.
@@ -1621,10 +1619,31 @@ static int __init clk_disable_unused(void)
 	clk_prepare_unlock();
 
 	clk_pm_runtime_put_all();
+}
+
+static void clk_disable_unused_workfn(struct work_struct *work)
+{
+	clk_disable_unused();
+}
+
+static DECLARE_DELAYED_WORK(clk_disable_unused_work, clk_disable_unused_workfn);
+
+static int __init clk_disable_unused_init(void)
+{
+	if (clk_ignore_unused) {
+		pr_warn("clk: Not disabling unused clocks\n");
+		return 0;
+	}
+
+	pr_info("clk: Disabling unused clocks\n");
+
+	clk_disable_unused();
+
+	WRITE_ONCE(clk_disable_unused_done, true);
 
 	return 0;
 }
-late_initcall_sync(clk_disable_unused);
+late_initcall_sync(clk_disable_unused_init);
 
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
@@ -4462,8 +4481,13 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	clk_core_link_consumer(core, hw->clk);
 
 	ret = __clk_core_init(core);
-	if (!ret)
+	if (!ret) {
+		if (READ_ONCE(clk_disable_unused_done))
+			mod_delayed_work(system_power_efficient_wq,
+					 &clk_disable_unused_work,
+					 CLK_DISABLE_UNUSED_DELAY);
 		return hw->clk;
+	}
 
 	clk_prepare_lock();
 	clk_core_unlink_consumer(hw->clk);
-- 
2.55.0

