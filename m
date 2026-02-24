Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA7B38E5CD;
	Tue, 24 Feb 2026 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935126; cv=none; b=o+wE5JQO+319kUDO+Ko2Va6vpumZLfKhJ2dHpvmeMSJyEJcGMIKlmYE+wazn8uwYeTNfA1zcEpTzsaLXUWRHtzbNkgbuOvw7+aRSW0Do+Zfnzrhzn53tu9TpYEvHD7KJm7pAipXIdtUux6T6zUBz2xbUS9qLYe/uHVxrk9/rstc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935126; c=relaxed/simple;
	bh=I0mYqhvzI6tjUXR2e+8NvjJ4XCKCN0IIiIvaYDU2sXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAH7xeJSq8RjTHdecIEBzry4zZH2IFUumcKwYueizh254XYQCI1ezgUEyLXwZoQ9fmSjO2g7Bs5K7G3eH9/XGZq3wd4pDnwHhmZyapn4IwyhZmqJyxi5+34FKQz52G41VzeYRVZXr/F8nOBZDnZfFIX25uHx9AhNDGiS6z/qZ1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/i8MwIN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/i8MwIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771935126; x=1803471126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I0mYqhvzI6tjUXR2e+8NvjJ4XCKCN0IIiIvaYDU2sXQ=;
  b=i/i8MwINjIKYd9Tl/2/VH/0rBxPLW8CCRxnoDhZMY6Av/wgeGNJjCP+G
   t1Ojnl98KXQvyQ1pkhm/9qFeuoNkdNzG3G2FfC3o/LRSKJciHSvlJeeqZ
   nc2bfVrPOlzDrIHQUVKGQDMFD5OdI6siXZ3NwzoTosEgDF062FQwrbNHE
   /jHZfuUZO6+FwdH9RSo6xWKomAC7pv+jhrguYNAHjv4M99dv3rkYSIuwE
   gyAJt1HjQaSkpVTifsRH0dA17dwPabYNR8OI3+ErUcMfl9R/QRRIWpdox
   KR6bSZGV471qqTOSsBGsGaUkdpYcSpL/o6eAp3908gQxCDYWBCQxuiI13
   g==;
X-CSE-ConnectionGUID: KqYLfXCpRCWHSxVUs2mVig==
X-CSE-MsgGUID: B9uilg1pQQmmDWpk8ulDCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72920589"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72920589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:12:04 -0800
X-CSE-ConnectionGUID: 9yvq//m/Qy+wb2bwxBmNmA==
X-CSE-MsgGUID: kSgNFBcATuK4tApazA+4gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214127533"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 04:12:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 98B209B; Tue, 24 Feb 2026 13:12:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 2/3] clk: x86: lpss-atom: Use temporary variable for struct device
Date: Tue, 24 Feb 2026 13:09:21 +0100
Message-ID: <20260224121159.3503754-3-andriy.shevchenko@linux.intel.com>
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

Use temporary variable for struct device to make code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/clk/x86/clk-lpss-atom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/x86/clk-lpss-atom.c b/drivers/clk/x86/clk-lpss-atom.c
index fb8637c472f2..57b0823d6ff2 100644
--- a/drivers/clk/x86/clk-lpss-atom.c
+++ b/drivers/clk/x86/clk-lpss-atom.c
@@ -16,17 +16,17 @@
 
 static int lpss_atom_clk_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct lpss_clk_data *drvdata;
 	struct clk *clk;
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
 
 	/* LPSS free running clock */
 	drvdata->name = "lpss_clk";
-	clk = clk_register_fixed_rate(&pdev->dev, drvdata->name, NULL,
-				      0, 100 * HZ_PER_MHZ);
+	clk = clk_register_fixed_rate(dev, drvdata->name, NULL, 0, 100 * HZ_PER_MHZ);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-- 
2.50.1

