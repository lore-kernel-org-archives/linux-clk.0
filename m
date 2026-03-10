Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE883D3CEC;
	Tue, 10 Mar 2026 18:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773168086; cv=none; b=rrSoSDARGrxuO2SDviEjYl/svJQfoPa4RiTgKLEUpflBE40Soq5J4I3KkciWjqzBAAHXBPg4aukcjaevZg2OcZ/rO62rP0ygFHsIJoED+Mz5ef6iYjKW2hdeLG2c2E7pRGQe7DVOii6RkVBIHVyFeW5hSXdHx3E6J54pRvJv74Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773168086; c=relaxed/simple;
	bh=gVTXXUE7IQUGsVeOy2FxRTwfLfEGpwrdcxq04i0MjL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKrxPuFMjuKcaOTBvILN8tdxvFwYzoqNHZXANqUJ7sOgn7ZqEULmYF1m0FCVoHnmE7cchq35x889WjNu/rWPzbwdeMXJnHpkTaFtCBKmVGxax5PPomWxaCx4hiFgE4Q++hgx3xZ2FGoAY7dAWmXz2o8kuSl/lEMnu6266dMhPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F7031596;
	Tue, 10 Mar 2026 11:41:12 -0700 (PDT)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9CA273F7BD;
	Tue, 10 Mar 2026 11:41:14 -0700 (PDT)
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 09/13] firmware: arm_scmi: Harden clock parents discovery
Date: Tue, 10 Mar 2026 18:40:26 +0000
Message-ID: <20260310184030.3669330-10-cristian.marussi@arm.com>
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

Fix clock parents enumeration to account only for effectively discovered
parents during enumeration, avoiding to trust the total number of parents
declared upfront by the platform.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/clock.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index bf956305a8fe..5f6b25c7b523 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -270,15 +270,15 @@ static int iter_clk_possible_parents_update_state(struct scmi_iterator_state *st
 	 * assume it's returned+remaining on first call.
 	 */
 	if (!st->max_resources) {
-		p->clkd->info.num_parents = st->num_returned + st->num_remaining;
-		p->clkd->info.parents = devm_kcalloc(p->dev,
-						     p->clkd->info.num_parents,
+		int num_parents = st->num_returned + st->num_remaining;
+
+		p->clkd->info.parents = devm_kcalloc(p->dev, num_parents,
 						     sizeof(*p->clkd->info.parents),
 						     GFP_KERNEL);
-		if (!p->clkd->info.parents) {
-			p->clkd->info.num_parents = 0;
+		if (!p->clkd->info.parents)
 			return -ENOMEM;
-		}
+
+		/* max_resources is used by the iterators to control bounds */
 		st->max_resources = st->num_returned + st->num_remaining;
 	}
 
@@ -293,9 +293,11 @@ static int iter_clk_possible_parents_process_response(const struct scmi_protocol
 	const struct scmi_msg_resp_clock_possible_parents *r = response;
 	struct scmi_clk_ipriv *p = priv;
 
-	u32 *parent = &p->clkd->info.parents[st->desc_index + st->loop_idx];
+	p->clkd->info.parents[st->desc_index + st->loop_idx] =
+		le32_to_cpu(r->possible_parents[st->loop_idx]);
 
-	*parent = le32_to_cpu(r->possible_parents[st->loop_idx]);
+	/* Count only effectively discovered parents */
+	p->clkd->info.num_parents++;
 
 	return 0;
 }
-- 
2.53.0

