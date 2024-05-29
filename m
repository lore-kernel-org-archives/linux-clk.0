Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35A169AE6
	for <linux-clk@vger.kernel.org>; Wed, 29 May 2024 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975319; cv=none; b=n2jQcCgF52sMQ/WyWeAwChyhJsuaE0X4fLl+QlJ/ucQBQ7BROyt/x1qZm/Fsthp4j8cI4X1r/erhADBUeSp82S5YrE4Bb1D9DUvKWqc2w0ccb/VEhhuXW1iGLCstQhtOJYvxxqZsUKQTvq4TT/K5lvHCvxvpU8zpAMYLIT8eQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975319; c=relaxed/simple;
	bh=p0GwIFvIuNoiDhrfwoSepgtW0f3uoqrFum+m62dhXNY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nG5H0QHcSe1yLGu9s7tU1v2Rp5MgwvyqZtBexKak5eLTk29sldLpFo/PuuDOwwuj7hcQGTdvdUcHb6nu/k1r0FFParOzVygHudwT2NXwT4ADy8JbPAA0fSRNuPAOsYG2Ijo+E+J9DgCOQKuqM0bXmAw9fL7onnFHGNvLM+RehK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by albert.telenet-ops.be with bizsmtp
	id UxbE2C00f3VPV9V06xbEpY; Wed, 29 May 2024 11:35:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFhI-00GI2X-8c;
	Wed, 29 May 2024 11:35:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFiE-008wVt-Gv;
	Wed, 29 May 2024 11:35:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] clk: renesas: cpg-lib: Use DEFINE_SPINLOCK() for global spinlock
Date: Wed, 29 May 2024 11:35:09 +0200
Message-Id: <9073a6bfb7791e492156331fa8a0ea87a7c7cef6.1716975021.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716975021.git.geert+renesas@glider.be>
References: <cover.1716975021.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A global spinlock can be initialized automatically with
DEFINE_SPINLOCK() rather than explicitly calling spin_lock_init().

Suggested-by: Ye Bin <yebin10@huawei.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-cpg-lib.c  | 2 +-
 drivers/clk/renesas/rcar-gen3-cpg.c | 2 --
 drivers/clk/renesas/rcar-gen4-cpg.c | 2 --
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index 5a15f8788b9227d9..42b126ea3e1337c1 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -22,7 +22,7 @@
 
 #include "rcar-cpg-lib.h"
 
-spinlock_t cpg_lock;
+DEFINE_SPINLOCK(cpg_lock);
 
 void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
 {
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index d0129a6509411662..20b89eb6c35c1f07 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -551,7 +551,5 @@ int __init rcar_gen3_cpg_init(const struct rcar_gen3_cpg_pll_config *config,
 		cpg_quirks = (uintptr_t)attr->data;
 	pr_debug("%s: mode = 0x%x quirks = 0x%x\n", __func__, mode, cpg_quirks);
 
-	spin_lock_init(&cpg_lock);
-
 	return 0;
 }
diff --git a/drivers/clk/renesas/rcar-gen4-cpg.c b/drivers/clk/renesas/rcar-gen4-cpg.c
index 8e4559fbb0bc3352..0e2c27adcfe784a0 100644
--- a/drivers/clk/renesas/rcar-gen4-cpg.c
+++ b/drivers/clk/renesas/rcar-gen4-cpg.c
@@ -507,7 +507,5 @@ int __init rcar_gen4_cpg_init(const struct rcar_gen4_cpg_pll_config *config,
 	cpg_clk_extalr = clk_extalr;
 	cpg_mode = mode;
 
-	spin_lock_init(&cpg_lock);
-
 	return 0;
 }
-- 
2.34.1

