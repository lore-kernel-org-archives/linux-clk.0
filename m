Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F138BF9D;
	Tue, 24 Feb 2026 12:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935125; cv=none; b=S9Fl81eXZ1szFiCKmx57YMMZKRL6Lq0raIZBhbBAyxu/Cnh1IRRXAEp0vDfvYgXC3pCOe/jODdIOe8NjKOOefkvwVCyykf+Hg2NZ8NPopnMZ/G/W6H7pZB6FiGTwEoUP1dx6cEW7iKCx7yrUMz5+z9Utg5llOsy0+gV3NwK8JKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935125; c=relaxed/simple;
	bh=4iMXLSu56thh5PFuRksUF2seRl+tVAhhYZeNlDqsbx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELPEhBQuBHxzmkkw84DRkyidK0/zYTRRjVWM4jTgqCgyFroVfwc0t1/KGS2RiUyVYOOl9w0+ePX4xtKraSPf+/zjMBDmKohRj136wKFqOtm5KOQtA1bgRJvrxOGMoaJkw8LqjaP7lyKKrylFFBgCJraRjWJ7HxgdqonrPWXoBj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YY+CkVyA; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YY+CkVyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771935124; x=1803471124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4iMXLSu56thh5PFuRksUF2seRl+tVAhhYZeNlDqsbx4=;
  b=YY+CkVyA+WRF0AZr6d8lH0wdEkCMwMbz0tdnKIk7mQJgJibhCUnR0u9i
   1GuL+PX/QsbS0WS+BPhx1A3xyChjOLQpc2khBo68DODE5XuJYMWKl3UJG
   Q/NBp7eHU39EBAlo1ZIr+OcmkcVoQqrsqh+3iYcQGptl8Ax4M30KI7AHM
   W6zzHP1bKsjJXMWIc1NYGh4VMdM/oJdjJQiJlgzY46dw7Z67pmOl0Z7T0
   zPysJtqNpbf53YcsZzpGzBgeVWojFfoTrT0wxxLJJQRuU7t6kZMN64xHX
   xip0PtO+jOzKkQGEZ6IZkR3Iabd2O0pVOpEuPxkDmNvutMa94PrkbJuAi
   A==;
X-CSE-ConnectionGUID: hu00qx9DQ0anZxvQSf4uPw==
X-CSE-MsgGUID: TywbFf6nQkuLDeAtbi04UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76809052"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="76809052"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:12:03 -0800
X-CSE-ConnectionGUID: 7Gzh8nxVSIK0W1sBZXBHyQ==
X-CSE-MsgGUID: MzJy+1djTHKoOprSdQkgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="215121372"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 24 Feb 2026 04:12:01 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 946C299; Tue, 24 Feb 2026 13:12:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 1/3] clk: x86: lpss-atom: Use predefined constants from units.h
Date: Tue, 24 Feb 2026 13:09:20 +0100
Message-ID: <20260224121159.3503754-2-andriy.shevchenko@linux.intel.com>
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

Use predefined constants from units.h to make code robust against typos
like how many zeros to put.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/x86/clk-lpss-atom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/x86/clk-lpss-atom.c b/drivers/clk/x86/clk-lpss-atom.c
index aa9d0bb98f8b..fb8637c472f2 100644
--- a/drivers/clk/x86/clk-lpss-atom.c
+++ b/drivers/clk/x86/clk-lpss-atom.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/platform_data/x86/clk-lpss.h>
 #include <linux/platform_device.h>
+#include <linux/units.h>
 
 static int lpss_atom_clk_probe(struct platform_device *pdev)
 {
@@ -25,7 +26,7 @@ static int lpss_atom_clk_probe(struct platform_device *pdev)
 	/* LPSS free running clock */
 	drvdata->name = "lpss_clk";
 	clk = clk_register_fixed_rate(&pdev->dev, drvdata->name, NULL,
-				      0, 100000000);
+				      0, 100 * HZ_PER_MHZ);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
2.50.1

