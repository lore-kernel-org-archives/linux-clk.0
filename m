Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5645231AA8F;
	Tue, 28 Apr 2026 20:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407419; cv=none; b=TppEL1RcChaU4hQUXAdeWrpCPX4e6X6iLWjutPdsAorGnGXnyEs46gPMTu2n2uKf3Om/k3xbXFBD1Yqd1gBKL1bAM+InJ2I7LxBXZODSiiM65kA0UkJ4QkF9fZqL1+izrMaC2Zi9A5FWlxg/3DK38Py/CHjWqVG9jXFOLe4/wk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407419; c=relaxed/simple;
	bh=FCP9MWDXBkmpmaTgWI8hodUMzwfIaYuwHBhh3J2kcKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b2z5+dXbFf1KCX/VRnXzRyP6R0EI39IH0rE+99VjGhhDH/1oqlaHvgpEY9zCDWgEiO48HneTy0oGLZKzKyggWzJvG0iHfkj4OMNjpMnANYwIcWGO+ffVXUTHEUUhSm2sJlTq6x8F4dyPWK1qL9J6s2yGjvH9E+0HAxBGacNjcbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dpe6DzK+; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dpe6DzK+"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41B531C01;
	Tue, 28 Apr 2026 13:16:52 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF53B3F763;
	Tue, 28 Apr 2026 13:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407417; bh=FCP9MWDXBkmpmaTgWI8hodUMzwfIaYuwHBhh3J2kcKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dpe6DzK+9m+K4NwKt0FoWDDVcTtvjQx2HvJxkemaZkUvsIQJKuYWheQ4vdWRez6Yp
	 cGOfYFbzoVxSHMCqcmUH4hwdRfeUSoDeL0ll58r2/4zFHqUh8PaIseJTS2wZXP7WC+
	 RVEenmDDDlLc1YP58my65VERLEe0b0BwuVgwvHI8=
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
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v3 08/15] firmware: arm_scmi: Harden clock parents discovery
Date: Tue, 28 Apr 2026 21:15:15 +0100
Message-ID: <20260428201522.903875-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428201522.903875-1-cristian.marussi@arm.com>
References: <20260428201522.903875-1-cristian.marussi@arm.com>
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Reviewed-by tags
---
 drivers/firmware/arm_scmi/clock.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index c9b62edce4fd..d07cfef243fd 100644
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

