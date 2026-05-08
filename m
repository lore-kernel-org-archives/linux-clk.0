Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEEDC3FD14B;
	Fri,  8 May 2026 15:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254435; cv=none; b=Yv/akqmjyVOC0pPefXq10jtkrR4oeYfG+Rw2IOSKO5FqN/rpEqHt14ix6sV6PXNq6bL/IZmkC63heqIOAkOJ+2/IncLkuEoadb8H5AVNxoWRR0Meu27BqAHCN3YU4lK7AMiJXcV5ThJGjJ3L7XN8BvnoOm+7Yhpz1bYuv+rrbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254435; c=relaxed/simple;
	bh=FCP9MWDXBkmpmaTgWI8hodUMzwfIaYuwHBhh3J2kcKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iAN1CkVEtW0mCHkh75F6OR6+lNlfYE0vxxeYF5TqTTLid1M1sp1JyzULzCExjE6qvUo0C333bX87dc6EHsGsGgFYNQbmloBX5QSxFdIYmUq6i1MOz6qhnnfryFfDmkjkkH0Czt94y7TszaDvcun9Sl+83YOhazjdHN5r8fOmTVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=We8gpuWM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="We8gpuWM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3AC935A2;
	Fri,  8 May 2026 08:33:47 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46A623F836;
	Fri,  8 May 2026 08:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254433; bh=FCP9MWDXBkmpmaTgWI8hodUMzwfIaYuwHBhh3J2kcKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=We8gpuWMVkDmHnui9cmKinnAybqTZNAuKe+hyKXmEsKxKkZEsuPfoOdu5c0DU93NO
	 WNTj7334SG2qs33M4ExZ26Oqu5x7SVvEJjCaDgH21wvTAQnK0HeEQdIauMrEfFf7S1
	 drGlI6jSs+Nfr0IQtbdqdRLaNOUVR8VCtfXTA/Ao=
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
Subject: [PATCH v4 08/15] firmware: arm_scmi: Harden clock parents discovery
Date: Fri,  8 May 2026 16:32:53 +0100
Message-ID: <20260508153300.2224715-9-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
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

