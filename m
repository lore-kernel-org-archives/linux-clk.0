Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58526AD0
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 17:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730394033; cv=none; b=Z8QFCzNjRqSI2fItr6m059nQlXJIHEYCFPvzjnY5vggu37pUJ+yZ59pwl1hZpxwmzvs9uERwKQzJ1QdjJRKueryaEXQj15Jq/GHDAPFr5885modfN2XZF3vzHOiS3wNKrJ7/52kJr5HDwJkXfrsCzfBL9ydBu9hh73vu5msA568=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730394033; c=relaxed/simple;
	bh=+PAOFwsgnSghgLjjAyebEJJRF/OgGK6zoG47VW+z0IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T1LSI/Py+BZq37BBWMXg1s6QSrYVNdU12kAe4SCrkYH47RdRQ5OG+ol5BDKG+DBKHh2QRRtIv4Ui4CIWtNcGDNK3Ff2wnnFz5Ejg17WzqaszXCtyEPr1jN+frJbvirhQRrcd9czI6Rvqb9J03bWkBPjSvHcr9ighwb3fCzM0eZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=rn8W7ok+; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="rn8W7ok+"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F077C892B4;
	Thu, 31 Oct 2024 18:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730394029;
	bh=92Sy6UDwL/ps4AVz4KDD4tlQVW8dKGo+enny9ATdi/Y=;
	h=From:To:Cc:Subject:Date:From;
	b=rn8W7ok+xoK/3atYWX260xLtWpY/OFjHeu/yW3HPUiFltXynjdWPNf/Rg9h+vsvav
	 xfc2acyIVryKtFo1x5VRFubzNzIyhS5WvDcu39HMjJbHd66Ml0vEZs4aGYB/tknE8P
	 kOrZ/deOA6DZcwNOW/haFyf+0JjGCnvMJdEYvKBUEu1KDl6VLYAQXXp266dweOZlcx
	 1wNbiFp6NP2RJZSfL6pfFcT8SoAEppYFMytU3O1UzZLq1PN4Yv1Dr8wF1Gf4ji9V5C
	 ks3SjAyULhhP++L3DvYeTC60xGfn0T2OLlnBK35kKJdOepu1vTGmkWfQqa+N76JDfq
	 lZdkMjKp8B+sw==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: zynqmp: Work around broken DT GPU node
Date: Thu, 31 Oct 2024 17:59:33 +0100
Message-ID: <20241031170015.55243-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The ZynqMP DT GPU node clock description is wrong and does not represent
the hardware correctly, it only describes BUS and PP0 clock, while it is
missing PP1 clock. That means PP1 clock can never be enabled when the GPU
should be used, which leads to expected GPU hang even with simple basic
tests like kmscube.

Since Xilinx does use generated DTs on ZynqMP, the current broken DT
implementation has to be supported. Add a workaround for this breakage
into the clock driver, in case of PP0 enablement attempt, enable PP1
as well and vice versa. This way, the GPU does work and does not hang
because one of its pixel pipeline clock are not enabled.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/zynqmp/clk-gate-zynqmp.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
index b89e557371984..b013aa33e7abb 100644
--- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
+++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
@@ -7,6 +7,7 @@
  * Gated clock implementation
  */
 
+#include <dt-bindings/clock/xlnx-zynqmp-clk.h>
 #include <linux/clk-provider.h>
 #include <linux/slab.h>
 #include "clk-zynqmp.h"
@@ -38,7 +39,13 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
 	u32 clk_id = gate->clk_id;
 	int ret;
 
-	ret = zynqmp_pm_clock_enable(clk_id);
+	if (clk_id == GPU_PP0_REF || clk_id == GPU_PP1_REF) {
+		ret = zynqmp_pm_clock_enable(GPU_PP0_REF);
+		if (!ret)
+			ret = zynqmp_pm_clock_enable(GPU_PP1_REF);
+	} else {
+		ret = zynqmp_pm_clock_enable(clk_id);
+	}
 
 	if (ret)
 		pr_debug("%s() clock enable failed for %s (id %d), ret = %d\n",
@@ -58,7 +65,13 @@ static void zynqmp_clk_gate_disable(struct clk_hw *hw)
 	u32 clk_id = gate->clk_id;
 	int ret;
 
-	ret = zynqmp_pm_clock_disable(clk_id);
+	if (clk_id == GPU_PP0_REF || clk_id == GPU_PP1_REF) {
+		ret = zynqmp_pm_clock_disable(GPU_PP1_REF);
+		if (!ret)
+			ret = zynqmp_pm_clock_disable(GPU_PP0_REF);
+	} else {
+		ret = zynqmp_pm_clock_disable(clk_id);
+	}
 
 	if (ret)
 		pr_debug("%s() clock disable failed for %s (id %d), ret = %d\n",
-- 
2.45.2

