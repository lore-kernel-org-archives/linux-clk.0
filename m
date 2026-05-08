Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AEF406287;
	Fri,  8 May 2026 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254455; cv=none; b=UyAa5WRR/IVIBcwYJMQaI+9x591MRBkNeK84NIOojByeQ/jExa/ubRot1HTRJgcX2HM0jdbeb9kDGPzHVOkHfcTOonrXv9502cylxtVwfZ0AZ6oFrHPF/zwU1j9TGWU7/71ij3EyvrzEjbiS7a5S8NQG/UTxqToxUayRmkDjaJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254455; c=relaxed/simple;
	bh=8o1RLPLqw7Q/fiIqOUH5PijDgRryHXsQuxEcHlAGU5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eP24clDt1gaO96dPAco4I/+jAGUDnxsGtjipgTvJ6KW9eOXfIAiiix7OWDvHXdZUo5LJdF6LC3gMOzgroj5udgVQ+86bcpl28Gt1F8Dq4kQnKA73jv+l16S6hYQNXpsQxafQxy4aIW9LpuAf5/hzCgrnsvslvbFjsgtKcKaxo7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AFSfxaAX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AFSfxaAX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F6F835A1;
	Fri,  8 May 2026 08:34:08 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 907A33F836;
	Fri,  8 May 2026 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254453; bh=8o1RLPLqw7Q/fiIqOUH5PijDgRryHXsQuxEcHlAGU5A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AFSfxaAX39J5vqLEKC1A/Tce8RVNIk8zeEfaapI9thtFMVHGnfnggawT/ADjsk2eY
	 tq6RGVgX4hKzqs8TLNbaAo3q2pRT60j4pU+bEsQmne5ew9uHRg6tg4Oxs22LSTiamo
	 PlQ9fYlify6cAQfdyYVnGj9meL1AxvM+4ptwY4/k=
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
Subject: [PATCH v4 15/15] firmware: arm_scmi: Introduce all_rates_get clock operation
Date: Fri,  8 May 2026 16:33:00 +0100
Message-ID: <20260508153300.2224715-16-cristian.marussi@arm.com>
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

Add a clock operation to get the whole set of rates available to a specific
clock: when needed this request could transparently trigger a full rate
discovery enumeration if this specific clock-rates were previously only
lazily enumerated.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v2 --> v3
 - collected Reviewed tags
---
 drivers/firmware/arm_scmi/clock.c | 83 +++++++++++++++++++++----------
 include/linux/scmi_protocol.h     |  9 ++++
 2 files changed, 66 insertions(+), 26 deletions(-)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ab8c65ed785a..42e666a628c7 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -159,10 +159,8 @@ struct scmi_clock_rate_notify_payld {
 
 struct scmi_clock_desc {
 	u32 id;
-	bool rate_discrete;
 	unsigned int tot_rates;
-	unsigned int num_rates;
-	u64 *rates;
+	struct scmi_clock_rates r;
 #define	RATE_MIN	0
 #define	RATE_MAX	1
 #define	RATE_STEP	2
@@ -469,10 +467,10 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	flags = le32_to_cpu(r->num_rates_flags);
 	st->num_remaining = NUM_REMAINING(flags);
 	st->num_returned = NUM_RETURNED(flags);
-	p->clkd->rate_discrete = RATE_DISCRETE(flags);
+	p->clkd->r.rate_discrete = RATE_DISCRETE(flags);
 
 	/* Warn about out of spec replies ... */
-	if (!p->clkd->rate_discrete &&
+	if (!p->clkd->r.rate_discrete &&
 	    (st->num_returned != 3 || st->num_remaining != 0)) {
 		dev_warn(p->dev,
 			 "Out-of-spec CLOCK_DESCRIBE_RATES reply for %s - returned:%d remaining:%d rx_len:%zd\n",
@@ -486,9 +484,9 @@ iter_clk_describe_update_state(struct scmi_iterator_state *st,
 	if (!st->max_resources) {
 		unsigned int tot_rates = st->num_returned + st->num_remaining;
 
-		p->clkd->rates = devm_kcalloc(p->dev, tot_rates,
-					      sizeof(*p->clkd->rates), GFP_KERNEL);
-		if (!p->clkd->rates)
+		p->clkd->r.rates = devm_kcalloc(p->dev, tot_rates,
+						sizeof(*p->clkd->r.rates), GFP_KERNEL);
+		if (!p->clkd->r.rates)
 			return -ENOMEM;
 
 		/* max_resources is used by the iterators to control bounds */
@@ -507,10 +505,10 @@ iter_clk_describe_process_response(const struct scmi_protocol_handle *ph,
 	struct scmi_clk_ipriv *p = priv;
 	const struct scmi_msg_resp_clock_describe_rates *r = response;
 
-	p->clkd->rates[p->clkd->num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
+	p->clkd->r.rates[p->clkd->r.num_rates] = RATE_TO_U64(r->rate[st->loop_idx]);
 
 	/* Count only effectively discovered rates */
-	p->clkd->num_rates++;
+	p->clkd->r.num_rates++;
 
 	return 0;
 }
@@ -531,7 +529,13 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
 		.dev = ph->dev,
 	};
 
-	iter = ph->hops->iter_response_init(ph, &ops, 0, CLOCK_DESCRIBE_RATES,
+	/*
+	 * Using tot_rates as max_resources parameter here so as to trigger
+	 * the dynamic allocation only when strictly needed: when trying a
+	 * full enumeration after a lazy one tot_rates will be non-zero.
+	 */
+	iter = ph->hops->iter_response_init(ph, &ops, clkd->tot_rates,
+					    CLOCK_DESCRIBE_RATES,
 					    sizeof(struct scmi_msg_clock_describe_rates),
 					    &cpriv);
 	if (IS_ERR(iter))
@@ -542,12 +546,12 @@ scmi_clock_describe_rates_get_full(const struct scmi_protocol_handle *ph,
 		return ret;
 
 	/* empty set ? */
-	if (!clkd->num_rates)
+	if (!clkd->r.num_rates)
 		return 0;
 
-	if (clkd->rate_discrete)
-		sort(clkd->rates, clkd->num_rates,
-		     sizeof(clkd->rates[0]), rate_cmp_func, NULL);
+	if (clkd->r.rate_discrete && PROTOCOL_REV_MAJOR(ph->version) == 0x1)
+		sort(clkd->r.rates, clkd->r.num_rates,
+		     sizeof(clkd->r.rates[0]), rate_cmp_func, NULL);
 
 	return 0;
 }
@@ -586,7 +590,7 @@ scmi_clock_describe_rates_get_lazy(const struct scmi_protocol_handle *ph,
 	 * If discrete and we don't already have it, grab the last value, which
 	 * should be the max
 	 */
-	if (clkd->rate_discrete && clkd->tot_rates > clkd->num_rates) {
+	if (clkd->r.rate_discrete && clkd->tot_rates > clkd->r.num_rates) {
 		first = clkd->tot_rates - 1;
 		last = clkd->tot_rates - 1;
 		ret = ph->hops->iter_response_run_bound(iter, &first, &last);
@@ -618,14 +622,14 @@ scmi_clock_describe_rates_get(const struct scmi_protocol_handle *ph,
 	if (ret)
 		return ret;
 
-	clkd->info.min_rate = clkd->rates[RATE_MIN];
-	if (!clkd->rate_discrete) {
-		clkd->info.max_rate = clkd->rates[RATE_MAX];
+	clkd->info.min_rate = clkd->r.rates[RATE_MIN];
+	if (!clkd->r.rate_discrete) {
+		clkd->info.max_rate = clkd->r.rates[RATE_MAX];
 		dev_dbg(ph->dev, "Min %llu Max %llu Step %llu Hz\n",
-			clkd->rates[RATE_MIN], clkd->rates[RATE_MAX],
-			clkd->rates[RATE_STEP]);
+			clkd->r.rates[RATE_MIN], clkd->r.rates[RATE_MAX],
+			clkd->r.rates[RATE_STEP]);
 	} else {
-		clkd->info.max_rate = clkd->rates[clkd->num_rates - 1];
+		clkd->info.max_rate = clkd->r.rates[clkd->r.num_rates - 1];
 		dev_dbg(ph->dev, "Clock:%s Num_Rates:%u -> Min %llu Max %llu\n",
 			clkd->info.name, clkd->tot_rates,
 			clkd->info.min_rate, clkd->info.max_rate);
@@ -732,7 +736,7 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	 * If we can't figure out what rate it will be, so just return the
 	 * rate back to the caller.
 	 */
-	if (clkd->rate_discrete)
+	if (clkd->r.rate_discrete)
 		return 0;
 
 	fmin = clk->min_rate;
@@ -746,14 +750,40 @@ static int scmi_clock_determine_rate(const struct scmi_protocol_handle *ph,
 	}
 
 	ftmp = *rate - fmin;
-	ftmp += clkd->rates[RATE_STEP] - 1; /* to round up */
-	ftmp = div64_ul(ftmp, clkd->rates[RATE_STEP]);
+	ftmp += clkd->r.rates[RATE_STEP] - 1; /* to round up */
+	ftmp = div64_ul(ftmp, clkd->r.rates[RATE_STEP]);
 
-	*rate = ftmp * clkd->rates[RATE_STEP] + fmin;
+	*rate = ftmp * clkd->r.rates[RATE_STEP] + fmin;
 
 	return 0;
 }
 
+static const struct scmi_clock_rates *
+scmi_clock_all_rates_get(const struct scmi_protocol_handle *ph, u32 clk_id)
+{
+	struct clock_info *ci = ph->get_priv(ph);
+	struct scmi_clock_desc *clkd;
+	struct scmi_clock_info *clk;
+
+	clk = scmi_clock_domain_lookup(ci, clk_id);
+	if (IS_ERR(clk) || !clk->name[0])
+		return NULL;
+
+	clkd = to_desc(clk);
+	/* Needs full enumeration ? */
+	if (clkd->r.rate_discrete && clkd->tot_rates != clkd->r.num_rates) {
+		int ret;
+
+		/* rates[] is already allocated BUT we need to re-enumerate */
+		clkd->r.num_rates = 0;
+		ret = scmi_clock_describe_rates_get_full(ph, clkd);
+		if (ret)
+			return NULL;
+	}
+
+	return &clkd->r;
+}
+
 static int
 scmi_clock_config_set(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      enum clk_state state,
@@ -1067,6 +1097,7 @@ static const struct scmi_clk_proto_ops clk_proto_ops = {
 	.rate_get = scmi_clock_rate_get,
 	.rate_set = scmi_clock_rate_set,
 	.determine_rate = scmi_clock_determine_rate,
+	.all_rates_get = scmi_clock_all_rates_get,
 	.enable = scmi_clock_enable,
 	.disable = scmi_clock_disable,
 	.state_get = scmi_clock_state_get,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 0824a7dc4aae..8046d086a225 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -40,6 +40,12 @@ struct scmi_revision_info {
 	char sub_vendor_id[SCMI_SHORT_NAME_MAX_SIZE];
 };
 
+struct scmi_clock_rates {
+	bool rate_discrete;
+	unsigned int num_rates;
+	u64 *rates;
+};
+
 struct scmi_clock_info {
 	char name[SCMI_MAX_STR_SIZE];
 	unsigned int enable_latency;
@@ -84,6 +90,7 @@ enum scmi_clock_oem_config {
  *		    clock calculating the closest allowed rate.
  *		    Note that @rate is an input/output parameter used both to
  *		    describe the requested rate and report the closest match
+ * @all_rates_get: get the list of all available rates for the specified clock.
  * @enable: enables the specified clock
  * @disable: disables the specified clock
  * @state_get: get the status of the specified clock
@@ -103,6 +110,8 @@ struct scmi_clk_proto_ops {
 			u64 rate);
 	int (*determine_rate)(const struct scmi_protocol_handle *ph, u32 clk_id,
 			      unsigned long *rate);
+	const struct scmi_clock_rates __must_check *(*all_rates_get)
+		(const struct scmi_protocol_handle *ph, u32 clk_id);
 	int (*enable)(const struct scmi_protocol_handle *ph, u32 clk_id,
 		      bool atomic);
 	int (*disable)(const struct scmi_protocol_handle *ph, u32 clk_id,
-- 
2.53.0

