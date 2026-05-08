Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C73E40242E;
	Fri,  8 May 2026 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254450; cv=none; b=pv4cnhOBONM8AS9RrNf7Dl+EiQlllSrlma87ICIsSyv1KyBONrOwO+DXApBQr0gASjBGjM4oY1yDu9Gf22gpcBUQHM28x/vWamGzsDnrWh5khdioQ4zecK8X/EAfMB+FtX0Pv0bxOwZL2zvYwBJlKSvb3scqANY5keHpiARr8Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254450; c=relaxed/simple;
	bh=At/1NpD+zdqtqKE6HMLapbaZvJjKAhoJJTEqLPkqWfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qpdz9UPr68RgK500Vlj1/oDEqametFsyiuPbUm5ICE8fwaZ852bSMelzU4/6OIkkQBv3t3XnlGabxzcasLwXr9yH3srA6upuC4mq4ONXGQgcXRPpGV1LmmctwazwyqhlRFfvS3gW8nC+Vtl/3AXjYDPWZaW3QwPAysTqR9qe1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=QZ6TouT3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="QZ6TouT3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32CBB35A1;
	Fri,  8 May 2026 08:34:02 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2114F3F836;
	Fri,  8 May 2026 08:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254447; bh=At/1NpD+zdqtqKE6HMLapbaZvJjKAhoJJTEqLPkqWfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QZ6TouT3ZGJ7qEAg8FD3TpLIafElxJjwmuyEGROlbpoHTelSmQwt3xHbAexTMv1dk
	 2L6z3dliHwtwV0aUvqG+w/ZLWio+J95UzuVfN+njTOvaq6gJimMwPQ/z/P1KJ1Auh1
	 2r+MPEoumi0f/gpx79hdaUubalaOalb1NO2F2X3w=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v4 13/15] firmware: arm_scmi: Use bound iterators to minimize discovered rates
Date: Fri,  8 May 2026 16:32:58 +0100
Message-ID: <20260508153300.2224715-14-cristian.marussi@arm.com>
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

Clock rates are guaranteed to be returned in ascending order for SCMI clock
protocol versions greater than 1.0: in such a case, use bounded iterators
to minimize the number of message exchanges needed to discover min and max
rate.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 -> v4
 - Fixed dev_dbg() to printout tot_rates [Geert]
 - Fixed broken build by renaming to iterator_bound_cleanup()
v1 --> v2
 - fixed final ret value in scmi_clock_describe_get
---
 drivers/firmware/arm_scmi/clock.c | 90 +++++++++++++++++++++++++++----
 1 file changed, 81 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 8ce889dfc87b..955bb9565ce3 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -160,6 +160,7 @@ struct scmi_clock_rate_notify_payld {
 struct scmi_clock_desc {
 	u32 id;
 	bool rate_discrete;
+	unsigned int tot_rates;
 	unsigned int num_rates;
 	u64 *rates;
 #define	RATE_MIN	0
@@ -483,15 +484,16 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	}
 
 	if (!st->max_resources) {
-		int num_rates = st->num_returned + st->num_remaining;
+		unsigned int tot_rates = st->num_returned + st->num_remaining;
 
-		p->clkd->rates = devm_kcalloc(p->dev, num_rates,
+		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
 					      sizeof(*p->clkd->rates), GFP_KERNEL);
 		if (!p->clkd->rates)
 			return -ENOMEM;
 
 		/* max_resources is used by the iterators to control bounds */
-		st->max_resources = st->num_returned + st->num_remaining;
+		p->clkd->tot_rates = tot_rates;
+		st->max_resources = tot_rates;
 	}
 
 	return 0;
@@ -514,8 +516,8 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 }
 
 static int
-scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
-			      struct clock_info *cinfo)
+scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
+				   struct scmi_clock_desc *clkd)
 {
 	int ret;
 	void *iter;
@@ -524,7 +526,6 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 		.update_state = iter_clk_describe_update_state,
 		.process_response = iter_clk_describe_process_response,
 	};
-	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
 	struct scmi_clk_ipriv cpriv = {
 		.clkd = clkd,
 		.dev = ph->dev,
@@ -544,17 +545,88 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id,
 	if (!clkd->num_rates)
 		return 0;
 
+	if (clkd->rate_discrete)
+		sort(clkd->rates, clkd->num_rates,
+		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
+
+	return 0;
+}
+
+static int
+scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
+				   struct scmi_clock_desc *clkd)
+{
+	struct scmi_iterator_ops ops = {
+		.prepare_message = iter_clk_describe_prepare_message,
+		.update_state = iter_clk_describe_update_state,
+		.process_response = iter_clk_describe_process_response,
+	};
+	struct scmi_clk_ipriv cpriv = {
+		.clkd = clkd,
+		.dev = ph->dev,
+	};
+	unsigned int first, last;
+	void *iter;
+	int ret;
+
+	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
+					    sizeof(struct scmi_msg_clock_describe_rates),
+					    &cpriv);
+	if (IS_ERR(iter))
+		return PTR_ERR(iter);
+
+	/* Try to grab a triplet, so that in case is NON-discrete we are done */
+	first = 0;
+	last = 2;
+	ret = ph->hops->iter_response_run_bound(iter, &first, &last);
+	if (ret)
+		goto out;
+
+	/* If discrete grab the last value, which should be the max */
+	if (clkd->rate_discrete && clkd->tot_rates > 3) {
+		first = clkd->tot_rates - 1;
+		last = clkd->tot_rates - 1;
+		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
+	}
+
+out:
+	ph->hops->iter_response_bound_cleanup(iter);
+
+	return ret;
+}
+
+static int
+scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
+			      u32 clk_id, struct clock_info *cinfo)
+{
+	struct scmi_clock_desc *clkd = &cinfo->clkds[clk_id];
+	int ret;
+
+	/*
+	 * Since only after SCMI Clock v1.0 the returned rates are guaranteed to
+	 * be discovered in ascending order, lazy enumeration cannot be use for
+	 * SCMI Clock v1.0 protocol.
+	 */
+	if (PROTOCOL_REV_MAJOR(ph->version) > 0x1)
+		ret = scmi_clock_describe_rates_get_lazy(ph, clkd);
+	else
+		ret = scmi_clock_describe_rates_get_full(ph, clkd);
+
+	if (ret)
+		return ret;
+
+	clkd->info.min_rate = clkd->rates[RATE_MIN];
 	if (!clkd->rate_discrete) {
 		clkd->info.max_rate = clkd->rates[RATE_MAX];
 		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
 			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
 			clkd->rates[RATE_STEP]);
 	} else {
-		sort(clkd->rates, clkd->num_rates,
-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
 		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
+		dev_dbg(ph->dev, "Clock:%s Num_Rates:%u -> Min %llu Max %llu\n",
+			clkd->info.name, clkd->tot_rates,
+			clkd->info.min_rate, clkd->info.max_rate);
 	}
-	clkd->info.min_rate = clkd->rates[RATE_MIN];
 
 	return 0;
 }
-- 
2.53.0

