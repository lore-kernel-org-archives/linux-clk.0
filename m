Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173485;
	b=vA1Cbrd4JY2Q1ckOuggWxcv1Lx5CV9ab6dgjQlBFQwzggo6UQP4W5ACPX3UhtwPYR5E+
	 wkJzUpB1R6j4c9LYrygJoYG81ouvXteqIvxWdckcjDGsYXooG/bz2sMkIHAYk6NewZNje
	 M4uQb0ISTXrReDo6XjaOejNKoS05GovAbw50Cn6X07R0pGsCWHd/6OchbGrwJ7fG5ju3F
	 zrGXs49A+D7DmGrdbBptoLJNOZaQNfHyTHcd9aa91nRCUVTu9piQfXeBQP7zcGmkuRYQ0
	 PRm5JOrtuUGHUljNsLRP21cg1ErQBJNqFc86tpjnzsP1S7VFZ72xsZhFN5TBskkNXqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Iye3U/dlGnZ00j+zjr7HAr1TeijBnNq2JkuJKGfJwwY=;
	b=mpaUDZSG7MGZQzhQjZd+LzXuwSCTW2lIkVEOU6BgO/MHJ0okCUXnRC4KpPr9alFP1jMC
	 Mkpbf2DX0xp5mYmCk+qgLzvp36bCvBGxO6KQtzE5XQiONsjE5EERSDLEBERnRSR7moAb4
	 dhZB5ydZn6AdQFDsNmBDbm+MHDOa0Lno3/9Oc2y6pykVl6hoQMVHiS+ggsxvCc2Qnyk/1
	 igEKh7NXV4DqKWeP5hxCBa9weeJKTRGz40Bf2rIANtT4eWZphDGDivEsNudd71lYWMR65
	 FXIE87TE5Nu0jjm5qC4M5KHydnbGQVpCyhlcQz9JEwMc+iQTqLlRPmUoxOciNskAkwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eUFPTEYu;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C84606A32A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 07:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04C84606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eUFPTEYu
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso471980f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173483; x=1793778283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iye3U/dlGnZ00j+zjr7HAr1TeijBnNq2JkuJKGfJwwY=;
        b=eUFPTEYuWWk3vbc9XWvlH2BlVk7sDoYniIKaACUAPTVadYzh2YiOHwL9bC4PjTkxKv
         Qwucdi8AvUdnGNgB1Ox8sV01tCXYu8QotrE3MdyjPCUp8ezCPwq/ZbELSt1/+eipXh9T
         PUrmWBOjntU+YFYIfkWzgSM1IF41jHTSxwAFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173483; x=1793778283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iye3U/dlGnZ00j+zjr7HAr1TeijBnNq2JkuJKGfJwwY=;
        b=xShPD8TCvFofy/6qUHubEuec2B9KnCj7iCWgUKm/2SCnkHOXYy4YYWysRx56yZF3Jb
         F86WBJNgmbak+/QtTcWUE2g+SwrLtxGZnyFC9RBq11++NeTgkND3lhqjTtSMaUg4N6+g
         6vXflslXi4kNc61gKa0AmRoYGVV3CbCv/m0Scd4uFXS0otjq7udFWgK2yJURBhMbD3cL
         Nw8dlKGtpSiRRfAGUfD73mgKNCG2paBwNSodq4pcMjfRweo9S+ygNams+Es9FRs6rvg6
         d41jxpZ7m6ymPG5AGGOhCSuZBX2shKq3OqjQ3tvUpUj9C4MrsT3Qz3N4oprQh+uot85Z
         fz3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPut27vPOAKH7qx45kKKhc5UJ/b08tdXepDUwAMmyWdEIkvre8/5Iy3Ue6qRxv5O69jZ/POVW+GQI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoTOE5MGNSwi23/QoXQCM50WtiDjrORjuKX3kv3eeMncPlH2rm
	ZXJ69PgnwdJ3HzSd0LHVeILQRRu4zNvIMYmDsWLos1AYSEL1mHc1wvpyofgSC4XYAFk=
X-Gm-Gg: AYBFou39CzaFi7ral8BsiXKtuNqgOi4HMapEuHv7RMGJBuoPUe0KQXuOptfeFK9p+/z
	WVB1ZzbuYCoWOfxYwPR97Ytrc518T634knCoyctvK8JTYQ7ncEI1LAEq7yrljhWQz1nqxtkqIFb
	ir5/z8MY2zk/HeXSH1F34zGXYDucLg6/KNajiBNvMdrn1bhqESSyp/onwT1dDvqmuPAgrjQxr/O
	8a3wQRTh02C2Du9t43t66SMDzAtNGEKFK6c0CZNs1tQjjWlitOBUWzIUzYC0bYvYHeBgz+qmuXu
	UEmVz/rdhShVslUfjyrIeLn5QGrDwdzsAeGfQXV/owCGQiZxCrgdBGsK0IK6D+TX4UhVGUzFNBR
	AEvsa3nz0gVffzaDXJWxtMUV+VxnlNt7A8HtonD6hP4I+XQW3lWrQVVtErWmcm+D+bnbwPX7W3c
	JbJ5WlNmU2demJiQcVSfEaF0akP0OXwWW0kLQ1Cbaad4/U1qb1yXcoGQn3z3nTKuiPye/00OXFK
	X1xzJF3CToLPLC3bmAI8F3uPhsBsyhMu0sGjDbcPt63lvReBF/OUpCCUPRS+ygt4rU4yR5ELOkO
	D+UvpOklJua+iDz+5EzswD5rECZbQ8jv3ac/lEOytyupp16J2H8tLeUkj18IA8k0GfHIgBwa467
	miL45q6mUeWuXZxZpuh0kmpPTYIEJk/643k1++eF1YummhS/JOkwDJOZnhyKOH8p3Zz1oFGRBMO
	N/R4a9kW4lE1T2VgipgEaar7MUJA==
X-Received: by 2002:a5d:4f07:0:b0:48c:7ee3:e07d with SMTP id ffacd0b85a97d-48e5d312c2bmr2716635f8f.52.1793173483413;
        Wed, 28 Oct 2026 00:44:43 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v3 2/3] clk: ti: dpll: use the generic spread spectrum configuration
Date: Wed, 28 Oct 2026 08:44:08 +0100
Message-ID: <20261028074436.1958132-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
References: <20261028074436.1958132-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock framework provides a generic API and DT property for spread
spectrum clocking (SSC) since commit c86814e70390 ("clk: Introduce
clk_hw_set_spread_spectrum"). Implement the set_spread_spectrum callback
and convert the deprecated vendor specific properties to the generic
configuration, so that existing DTs keep working.

The SSC registers are programmed at the next rate change, as with the
vendor specific properties. The generic framework expresses the spread
in permyriad rather than permille, hence the change in the deltaM step
computation, and also supports up-spread, which is rejected as the
hardware does not support it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Keep parsing the deprecated vendor specific properties

 drivers/clk/ti/clock.h    |  2 ++
 drivers/clk/ti/dpll.c     | 20 +++++++++----
 drivers/clk/ti/dpll3xxx.c | 61 ++++++++++++++++++++++++++++++++-------
 include/linux/clk/ti.h    |  9 ++----
 4 files changed, 70 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index d5e24fe4ae3a..83225e506314 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -271,6 +271,8 @@ int omap3_noncore_dpll_set_rate_and_parent(struct clk_hw *hw,
 					   unsigned long rate,
 					   unsigned long parent_rate,
 					   u8 index);
+int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
+					   const struct clk_spread_spectrum *ss_conf);
 int omap3_noncore_dpll_determine_rate(struct clk_hw *hw,
 				      struct clk_rate_request *req);
 int omap2_dpll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req);
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index e01272cd628d..1329b4bc02f0 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -51,6 +51,7 @@ static const struct clk_ops dpll_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
+	.set_spread_spectrum	= &omap3_noncore_dpll_set_spread_spectrum,
 	.get_parent	= &omap2_init_dpll_parent,
 	.save_context	= &omap3_noncore_dpll_save_context,
 	.restore_context = &omap3_noncore_dpll_restore_context,
@@ -63,6 +64,7 @@ static const struct clk_ops dpll_no_gate_ck_ops = {
 	.set_parent	= &omap3_noncore_dpll_set_parent,
 	.set_rate_and_parent	= &omap3_noncore_dpll_set_rate_and_parent,
 	.determine_rate	= &omap3_noncore_dpll_determine_rate,
+	.set_spread_spectrum	= &omap3_noncore_dpll_set_spread_spectrum,
 	.save_context	= &omap3_noncore_dpll_save_context,
 	.restore_context = &omap3_noncore_dpll_restore_context
 };
@@ -278,6 +280,7 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	struct dpll_data *dd = NULL;
 	int ssc_clk_index;
 	u8 dpll_mode = 0;
+	u32 ssc_modfreq = 0, ssc_deltam = 0;
 	u32 min_div;
 
 	dd = kmemdup(ddt, sizeof(*dd), GFP_KERNEL);
@@ -349,11 +352,18 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 					&dd->ssc_modfreq_reg))
 			goto cleanup;
 
-		of_property_read_u32(node, "ti,ssc-modfreq-hz",
-				     &dd->ssc_modfreq);
-		of_property_read_u32(node, "ti,ssc-deltam", &dd->ssc_deltam);
-		dd->ssc_downspread =
-			of_property_read_bool(node, "ti,ssc-downspread");
+		/* Deprecated, superseded by assigned-clock-sscs */
+		of_property_read_u32(node, "ti,ssc-modfreq-hz", &ssc_modfreq);
+		of_property_read_u32(node, "ti,ssc-deltam", &ssc_deltam);
+		if (ssc_modfreq && ssc_deltam) {
+			dd->ssc_conf.modfreq_hz = ssc_modfreq;
+			/* permille to permyriad */
+			dd->ssc_conf.spread_bp = ssc_deltam * 10;
+			if (of_property_read_bool(node, "ti,ssc-downspread"))
+				dd->ssc_conf.method = CLK_SPREAD_DOWN;
+			else
+				dd->ssc_conf.method = CLK_SPREAD_CENTER;
+		}
 	}
 
 	if (of_property_read_bool(node, "ti,low-power-stop"))
diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 8c51b988a04f..634fe0a1f9fd 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -295,30 +295,32 @@ static void _lookup_sddiv(struct clk_hw_omap *clk, u8 *sd_div, u16 m, u8 n)
  * omap3_noncore_dpll_ssc_program - set spread-spectrum clocking registers
  * @clk:	struct clk * of DPLL to set
  *
- * Enable the DPLL spread spectrum clocking if frequency modulation and
- * frequency spreading have been set, otherwise disable it.
+ * Enable the DPLL spread spectrum clocking according to the configuration
+ * set by omap3_noncore_dpll_set_spread_spectrum(), otherwise disable it.
  */
 static void omap3_noncore_dpll_ssc_program(struct clk_hw_omap *clk)
 {
 	struct dpll_data *dd = clk->dpll_data;
+	const struct clk_spread_spectrum *conf = &dd->ssc_conf;
+	bool downspread = conf->method == CLK_SPREAD_DOWN;
 	unsigned long ref_rate;
 	u32 v, ctrl, mod_freq_divider, exponent, mantissa;
 	u32 deltam_step, deltam_ceil;
 
 	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
 
-	if (dd->ssc_modfreq && dd->ssc_deltam) {
+	if (conf->method != CLK_SPREAD_NO) {
 		ctrl |= dd->ssc_enable_mask;
 
-		if (dd->ssc_downspread)
+		if (downspread)
 			ctrl |= dd->ssc_downspread_mask;
 		else
 			ctrl &= ~dd->ssc_downspread_mask;
 
 		ref_rate = clk_hw_get_rate(dd->clk_ref);
 		mod_freq_divider =
-		    (ref_rate / dd->last_rounded_n) / (4 * dd->ssc_modfreq);
-		if (dd->ssc_modfreq > (ref_rate / 70))
+		    (ref_rate / dd->last_rounded_n) / (4 * conf->modfreq_hz);
+		if (conf->modfreq_hz > (ref_rate / 70))
 			pr_warn("clock: SSC modulation frequency of DPLL %s greater than %ld\n",
 				__clk_get_name(clk->hw.clk), ref_rate / 70);
 
@@ -337,9 +339,10 @@ static void omap3_noncore_dpll_ssc_program(struct clk_hw_omap *clk)
 		v |= exponent << __ffs(dd->ssc_modfreq_exp_mask);
 		ti_clk_ll_ops->clk_writel(v, &dd->ssc_modfreq_reg);
 
-		deltam_step = dd->last_rounded_m * dd->ssc_deltam;
-		deltam_step /= 10;
-		if (dd->ssc_downspread)
+		/* spread_bp is in permyriad, convert to percent first */
+		deltam_step = dd->last_rounded_m * conf->spread_bp;
+		deltam_step /= 100;
+		if (downspread)
 			deltam_step /= 2;
 
 		deltam_step <<= __ffs(dd->ssc_deltam_int_mask);
@@ -353,7 +356,7 @@ static void omap3_noncore_dpll_ssc_program(struct clk_hw_omap *clk)
 		if (deltam_step & dd->ssc_deltam_frac_mask)
 			deltam_ceil++;
 
-		if ((dd->ssc_downspread &&
+		if ((downspread &&
 		     ((dd->last_rounded_m - (2 * deltam_ceil)) < 20 ||
 		      dd->last_rounded_m > 2045)) ||
 		    ((dd->last_rounded_m - deltam_ceil) < 20 ||
@@ -682,6 +685,44 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return ret;
 }
 
+/**
+ * omap3_noncore_dpll_set_spread_spectrum - set the DPLL SSC configuration
+ * @hw: pointer to the clock to set the spread spectrum configuration for
+ * @ss_conf: spread spectrum configuration
+ *
+ * Stores the spread spectrum clocking (SSC) configuration of the DPLL. The
+ * configuration is programmed along with the DPLL multiplier and divider
+ * at the next rate change. The hardware supports center-spread and
+ * down-spread only. Returns 0 on success, or a negative error value on
+ * failure.
+ */
+int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
+					   const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
+	struct dpll_data *dd = clk->dpll_data;
+
+	if (!dd || !dd->ssc_enable_mask)
+		return -EOPNOTSUPP;
+
+	switch (ss_conf->method) {
+	case CLK_SPREAD_NO:
+		break;
+	case CLK_SPREAD_CENTER:
+	case CLK_SPREAD_DOWN:
+		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp)
+			return -EINVAL;
+		break;
+	default:
+		/* Up-spread is not supported by the hardware */
+		return -EINVAL;
+	}
+
+	dd->ssc_conf = *ss_conf;
+
+	return 0;
+}
+
 /**
  * omap3_noncore_dpll_set_rate_and_parent - set rate and parent for a DPLL clock
  * @hw: pointer to the clock to set rate and parent for
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index 54a3fa370004..107056120c2c 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -65,10 +65,7 @@ struct clk_omap_reg {
  * @ssc_enable_mask: mask of the DPLL SSC enable bit in @control_reg
  * @ssc_downspread_mask: mask of the DPLL SSC low frequency only bit in
  *                       @control_reg
- * @ssc_modfreq: the DPLL SSC frequency modulation in kHz
- * @ssc_deltam: the DPLL SSC frequency spreading in permille (10th of percent)
- * @ssc_downspread: require the only low frequency spread of the DPLL in SSC
- *                   mode
+ * @ssc_conf: the DPLL SSC configuration
  * @flags: DPLL type/features (see below)
  *
  * Possible values for @flags:
@@ -124,9 +121,7 @@ struct dpll_data {
 	u32			ssc_modfreq_exp_mask;
 	u32                     ssc_enable_mask;
 	u32                     ssc_downspread_mask;
-	u32                     ssc_modfreq;
-	u32                     ssc_deltam;
-	bool                    ssc_downspread;
+	struct clk_spread_spectrum ssc_conf;
 	u8			flags;
 };
 
-- 
2.43.0

