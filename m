Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB438E13E;
	Tue, 24 Feb 2026 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935126; cv=none; b=MkmdhaX9kUSrU7jNXKylPJN3wd7KUNISkM8hYV75rzl2KcPXFrLsovLYqed7Fb6BC5VajlK72iH1bEU6sZ4krDNoloObSimwr+vSZkke68dDpqI3bxx2UIgwFZ2PlJ5PP3TvmOaUUbpKXk26qpPZvQRGSDstJ4EgAM/YNIVgytE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935126; c=relaxed/simple;
	bh=tFi9fg1uP1XUevUfrTsOO0Jg6tW0vKpVOsl9G1r8fss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EmG5Bff09UB88fjOQllR8GfEgGX/k+JkWtuz6ChpLjyW5MxZgT/Y4fNd5MrU/P1LUj6U2qNLuABa2NmFU+DX2XDWhOf26hWpcrQiLGZ/+rWxU6YXJbtCf9jU0RPuysEwJJEAMF0UiJ7a2cqOB1m8YQy7TxJWeRCrUPb2bMnuxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHvoDRKv; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHvoDRKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771935125; x=1803471125;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tFi9fg1uP1XUevUfrTsOO0Jg6tW0vKpVOsl9G1r8fss=;
  b=FHvoDRKvn7TgiesOo94T/qWa18uD+OsHrDbIt+n3fnhYet8BNGyJvn2M
   /d1LtNlNDDnUmU+CUuOCeXonC0ZMUNvrtBCXyTn6ItpV0hY1bi99wM/qG
   C83KslSKRtefDd6jvCliy8Q1irtKPA8VzPvVR37cYEzWaLIIOjrtqtlT6
   md/JAUgII+DfUTls6QAkZOPygx01yuFlswI7RRgYHekLNaZQSeaol1JOf
   HbrgMCyjI3mvaM2whtK50G9dQ0fhdI/xRXabWR4dqKwb9NtqLFSwj6T/X
   10d5T3u491x/95GRkzQMwcBObMNMclTI3jS3sU6gLBfQr9GevxW4rEED0
   g==;
X-CSE-ConnectionGUID: vsafvQvKT7S8nK5DmG31Yg==
X-CSE-MsgGUID: UIrRnvZ1Siqt4sS3cY+/7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72920586"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72920586"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:12:03 -0800
X-CSE-ConnectionGUID: Eg4iKcJyTxO4yoHrHr3Yzg==
X-CSE-MsgGUID: o3B1uJn3QSipIN6ZQwA1fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214127532"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 04:12:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9D1E79D; Tue, 24 Feb 2026 13:12:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 3/3] clk: x86: lpss-atom: Read frequency from the property
Date: Tue, 24 Feb 2026 13:09:22 +0100
Message-ID: <20260224121159.3503754-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260224121159.3503754-1-andriy.shevchenko@linux.intel.com>
References: <20260224121159.3503754-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the future platforms we might need to have different frequency
of the free running clock. Allow that to be modified via supplied
device property.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/x86/clk-lpss-atom.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/x86/clk-lpss-atom.c b/drivers/clk/x86/clk-lpss-atom.c
index 57b0823d6ff2..597d20e492d2 100644
--- a/drivers/clk/x86/clk-lpss-atom.c
+++ b/drivers/clk/x86/clk-lpss-atom.c
@@ -10,23 +10,36 @@
 #include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/module.h>
-#include <linux/platform_data/x86/clk-lpss.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/units.h>
 
+#include <linux/platform_data/x86/clk-lpss.h>
+
 static int lpss_atom_clk_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct lpss_clk_data *drvdata;
 	struct clk *clk;
+	u32 rate;
+	int ret;
 
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
 
+	if (device_property_present(dev, "clock-frequency")) {
+		ret = device_property_read_u32(dev, "clock-frequency", &rate);
+		if (ret)
+			return ret;
+	} else {
+		/* Default frequency is 100MHz */
+		rate = 100 * HZ_PER_MHZ;
+	}
+
 	/* LPSS free running clock */
 	drvdata->name = "lpss_clk";
-	clk = clk_register_fixed_rate(dev, drvdata->name, NULL, 0, 100 * HZ_PER_MHZ);
+	clk = clk_register_fixed_rate(dev, drvdata->name, NULL, 0, rate);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
2.50.1

