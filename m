Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A682218AAD
	for <linux-clk@vger.kernel.org>; Fri,  3 Oct 2025 22:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759530686; cv=none; b=SMIcwiaWAN3h/iE9hO7KMuan6eNZ4Eycw5CeVijEA4Kzfg4BfmVJP0p5kckB+Lqp7zaUWkC7b0x0kJ5JAsYa7RzsdE4SwW3g1afuGZCMy0aaMEG9yYdz2sG5nGqKQGcJ7jPkg5yEMyg350KQnws2vs3C71aOPhbILqAi6slwpyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759530686; c=relaxed/simple;
	bh=LSUtld1vXJ7UebrIto66QF7WBG0KFZJsNyNCCCc4iP4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KBFXwGwvRTvCsvFMGa2mFlNSaOG8wbaLdCDxElYyDP4BHSZnEShpqqrKrisOw7zEMKEHqv4/mhrxJTLj67rOHP3M6PbyDVPYTvOAlrKnh/fFcSUwFSL8+kiBU5a6wdl306bhNLgxSIu6YbEzQdkOSnRWensbXqPyfm2dONU6UVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jC9rbgfG; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jC9rbgfG"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 593MVCNB3572787;
	Fri, 3 Oct 2025 17:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759530672;
	bh=+kDtmN6WVR82xzpGdOTOf2TenVP6eDzHENc6p74nyNE=;
	h=From:To:CC:Subject:Date;
	b=jC9rbgfG7/5O9Go9htdpELtOUfOnSlWKmg11une0rHr6n/YO8b7Me3dDcXlsy89tD
	 gVyWM0K/osgpUJZk3P3plbm9jD39nCZ/vx5BZYA/5XPfDOfgolxv5nDIyaJbgl2EZq
	 fj5fKS6jWI1uLZ7h/mn/9TaCJ/rXO9JzY1SW/9q4=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 593MVCPe1489194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Oct 2025 17:31:12 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 3 Oct
 2025 17:31:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 3 Oct 2025 17:31:12 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 593MVCf14022029;
	Fri, 3 Oct 2025 17:31:12 -0500
From: <rs@ti.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <mwalle@kernel.org>
Subject: [PATCH] clk: do not trust cached rates for disabled clocks
Date: Fri, 3 Oct 2025 17:29:18 -0500
Message-ID: <20251003222917.706646-2-rs@ti.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

From: Randolph Sapp <rs@ti.com>

Recalculate the clock rate for unprepared clocks. This cached value can
vary depending on the clocking architecture. On platforms with clocks
that have shared management it's possible that:

 - Previously disabled clocks have been enabled by other entities
 - Rates calculated during clock tree initialization could have changed

Signed-off-by: Randolph Sapp <rs@ti.com>
---

I'm hoping this will start a bit of a discussion. I'm still curious why people
would want to read the rate of an unprepared clock, but there were so many
logged operations on my test platforms that I assumed it must have some purpose.

Either way, I don't believe cached values should ever be trusted in this
scenario.

 drivers/clk/clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 85d2f2481acf..9c8b9036b6f6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1971,8 +1971,16 @@ static void __clk_recalc_rates(struct clk_core *core, bool update_req,
 
 static unsigned long clk_core_get_rate_recalc(struct clk_core *core)
 {
-	if (core && (core->flags & CLK_GET_RATE_NOCACHE))
-		__clk_recalc_rates(core, false, 0);
+	if (core) {
+		bool prepared = clk_core_is_prepared(core);
+
+		if (core->flags & CLK_GET_RATE_NOCACHE || !prepared) {
+			if (!prepared)
+				pr_debug("%s: rate requested for unprepared clock %s\n",
+					 __func__, core->name);
+			__clk_recalc_rates(core, false, 0);
+		}
+	}
 
 	return clk_core_get_rate_nolock(core);
 }
-- 
2.51.0

