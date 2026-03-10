Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99CB83BED78;
	Tue, 10 Mar 2026 18:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168057; cv=none; b=oIX0TC1/jaofEgu81zRV4GxM+GpGX37gi7QuRsl7MIQrcl1bZ+mijiLQmVbRxPuvALUUrufuqqWtHyxajzj++aog/hSrhJALvPaL5fbdeh+qyM9TnU19SyUs9foMy62rUD6g3dmdf6r/DQLHFFRszMeR2xpJ+J3bj35pEyr2ybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168057; c=relaxed/simple;
	bh=rgpT6JeYUUTF8dPGQi0+aswaXnBqWOyh+njR4c8YQ2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mj7BUzo9rD3jv0PF+Ggy7kpoIslJNphVhxtcGueIvZScq8XQ/ENr+s+/ZtI+Xd0OcZoBSJIh2tlMXpYF+1IVBA3KUOQ9kG+AXOtnjNW9AmzSjElLC32RVzBRYbqFJzEHUJ2Y3jc7krf1FKtPwiqoZzKqRqOLqaqaRrxHp52Bd1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BADEB14BF;
	Tue, 10 Mar 2026 11:40:47 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 283403F7BD;
	Tue, 10 Mar 2026 11:40:50 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 03/13] clk: scmi: Use new determine_rate clock operation
Date: Tue, 10 Mar 2026 18:40:20 +0000
Message-ID: <20260310184030.3669330-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310184030.3669330-1-cristian.marussi@arm.com>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the Clock protocol layer determine_rate logic to calculate the closest
rate that can be supported by a specific clock.

No functional change.

Cc: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
@brian: I'd modify further this clk-scmi driver, with a patch on top of
this series, to properly use your new CLK_ROUNDING_NOOP flag once your
series AND another (already reviewed) series on clk-scmi from Peng are in.
---
 drivers/clk/clk-scmi.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index b6a12f3bc123..c223e4ef1dd1 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -10,7 +10,6 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/of.h>
-#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/scmi_protocol.h>
 
@@ -57,35 +56,17 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
 static int scmi_clk_determine_rate(struct clk_hw *hw,
 				   struct clk_rate_request *req)
 {
-	u64 fmin, fmax, ftmp;
+	int ret;
 	struct scmi_clk *clk = to_scmi_clk(hw);
 
 	/*
-	 * We can't figure out what rate it will be, so just return the
-	 * rate back to the caller. scmi_clk_recalc_rate() will be called
-	 * after the rate is set and we'll know what rate the clock is
+	 * If we could not get a better rate scmi_clk_recalc_rate() will be
+	 * called after the rate is set and we'll know what rate the clock is
 	 * running at then.
 	 */
-	if (clk->info->rate_discrete)
-		return 0;
-
-	fmin = clk->info->range.min_rate;
-	fmax = clk->info->range.max_rate;
-	if (req->rate <= fmin) {
-		req->rate = fmin;
-
-		return 0;
-	} else if (req->rate >= fmax) {
-		req->rate = fmax;
-
-		return 0;
-	}
-
-	ftmp = req->rate - fmin;
-	ftmp += clk->info->range.step_size - 1; /* to round up */
-	ftmp = div64_ul(ftmp, clk->info->range.step_size);
-
-	req->rate = ftmp * clk->info->range.step_size + fmin;
+	ret = scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.53.0

