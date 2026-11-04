Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787474;
	b=ShhUsXa9kprAuc31zjpnpvk0ZxSoMTBt/U4BMpTczUtafPiajtMfUpDQO2Cd124+r6xN
	 +svDc5TiE50eh6B1kO6j5DgLBUba1majADP4nq2gkCZymbEVSR3d0Ufb/seDg2YJO1HIh
	 d5Sttd3Dyto+e9jz6cgFrB9C32nNkNnB5u6+s1D6AVXMmn1kP9mfCQdgFDDaBCpkJSV1N
	 VAvoZ1ix1HCL3FLq5bAYSLHChysooY5KcHlyDozZ4+s6GkYqNsoOjOQS+FKL9yEY4gn3z
	 zjnRJPwWgeh/2hkeYp9eRMnDGVAYVrGjYzeRTQFmbQF51ZZRbS4STA1HG0/W84b+4KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xtoytOhDAraaCDXzQjcwaANupRV+STFp2/XgbK9TFAs=;
	b=Iaw3KGS2UB4DAaYXeIkv/ZobsuhKqEQy3Hfu1O4sfjjuOpYl3uU2DvIgpF6INTGjz4Jt
	 kAJCTWKXVvGJuRlWcteIBf/mGkjaRlz7mKoI8pEjPqABQj/FWiwXoaKveMzpB3DkEoRLt
	 02fsd3Qsqcd+3RbvEY1HfbiKFwPinHQt/FRuudkf+3go0FxMmbM9fwYgJ2DjvcxwBb+Z6
	 8iHtz3VYTys5V5RFT1Hdn8R7Kd5FdojV9lYbAfpJ05zM0jLiKNXcI2PqEp0lp9ZCKb5ko
	 f1WusW5Vqr3mg8TVG2SmSKfvxhNZ8rcCKH/f2anEtas9+/COjfXlkY40kngLOZw9deA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=S7HhkdTG;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFFC606D816
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BFFC606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=S7HhkdTG
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso451313f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787467; x=1794392267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xtoytOhDAraaCDXzQjcwaANupRV+STFp2/XgbK9TFAs=;
        b=S7HhkdTGOyRcJMtGX7RPVi4hyuYUlMDS4cMWphvplpqhUgArFUPW1mnk9AALYDRz5o
         mQXHkul9YAPB/gKNpsg5cWMPP6y7DXFSDVomzWzZG4BNgp8b53DQzVYDna28lNpJxRXP
         k8tWmB+ViMhFQae99RWz8QUi5jU36RWAyOoxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787467; x=1794392267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xtoytOhDAraaCDXzQjcwaANupRV+STFp2/XgbK9TFAs=;
        b=SZ20DYeNBlsGoT3bWtCtLhqp3XM9g5h37cYkW+thyW0TRMIwSkifxD3pdXP2kFOknP
         ruN2fZlA+7TECHS80yVmUvZh6CobxBWy2ZmytlpYufmPhygBr7oYLz1SZKvRduw/O/8Q
         6LCeSyCQat/XldO9n5pH6fQDQiP7KH/E9BpcJ6jXomINPMWGw88yM0Tb56MKXqbisJAe
         i33lFCVyMgnTkXa4mRA+TWsnlAzGsMiWaEXDHg4r0iRxPluzFTjuGdj5TtbxSgQ1D17E
         fxWcxYEATHWvDfhxt1NUNJHmsAmTQk5uEjdBQAGgupotvtmI5iDMvwXmNPn/xU0qDkPG
         SCHg==
X-Forwarded-Encrypted: i=1; AKwUvBwo9TLuIgdaZvLefJoQscG3qdVK+Z6pzoWQ4KKbZK9Ct9NEhl1oVdQ8v2mbhLaVJzAclYX5nIG9fbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dS0LRb0/BJpxHJ8MkUMHcwRlcL1H319pDii05wGA+z1MNWgV0
	3wZW+XyQ31Mf2q+7zf6jVrTlu9S0T7CD4jj203en1KZrgrdMi8n+hhn9C2BonqzBxWs=
X-Gm-Gg: AYBFou2gjATV0Bm3po6vQSBdPzrxcpMHlTdv6dI/9ao6GbgBgq28BG+SwHN1nudzY7t
	6QoJ6k2ThMkB3MGGBnn0Ze7AfV1b9gzY7OnhScW2jOgj/f3eJRVBS3hgpZwILikWPeTeGvMDv8Y
	goAsYrFiVeUAJQ3V3GctR7jcgzDIqXecIxHf6wN7ZdPAXXaYdEyjGEZMn5gZUTA4UUVHt4tb22w
	cpLPZMTzByBZ4AAr5GxX7xXeKsW+Lv/9+NMD9b4YJZSVAGr+mCxfdYXuVnQhE/HxyITJm/+7ZJH
	ozxU7CHqGGUZyE1BHf7suTo7wrPuFfHtgYz/qwMl4QKrMZ8rr7cQnnTPbEGa5QzR4JTycT6DuXw
	2EU3sqJV5WsVhuoTS0x+Ei2kbrQdE9m7XN/Ypf6w8nJmGiZSL3fZVBbKeFaOVDZfPTNyS/5QrpO
	R1qrlKg/rDIv05tUrFNsuynfJMPx7H5srlkg+IUj7hwlFs+5LLXOhh38Ipo6ffkPUTTrLQ+SavU
	fDcrBFHOLV7iunq3q/hG3IdzE9rmUfDi8VXgcU3uH/Y3yUlv03HAoDMid7l6wjvhymxRLVCFvYZ
	9P+qCvgd7GlZYGkEQd/az79qjQT9X+ZEX2GcOZyekmtV/rj/h53hEe7WaxbQaCon1cvWL8odBKI
	hsot5XynAn5b6/wziJI0ie3f6QkaTT/eAJmexyosAMyZjg1Lo9zsY
X-Received: by 2002:a05:6000:2310:b0:490:a3e7:8af3 with SMTP id ffacd0b85a97d-490a3e78cd2mr400000f8f.35.1793787466939;
        Wed, 04 Nov 2026 02:17:46 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:46 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Tero Kristo <kristo@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v4 2/3] clk: ti: dpll: use the generic spread spectrum configuration
Date: Wed,  4 Nov 2026 11:16:56 +0100
Message-ID: <20261104101732.4043372-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
References: <20261104101732.4043372-1-dario.binacchi@amarulasolutions.com>
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

Changes in v4:
- Keep the reverse Christmas tree order for the variables list
- Check the range of the deprecated ti,ssc-deltam property
- Drop the checks already done by the clock framework

Changes in v3:
- Keep parsing the deprecated vendor specific properties

 drivers/clk/ti/clock.h    |  2 ++
 drivers/clk/ti/dpll.c     | 21 ++++++++++++----
 drivers/clk/ti/dpll3xxx.c | 52 +++++++++++++++++++++++++++++++--------
 include/linux/clk/ti.h    |  9 ++-----
 4 files changed, 62 insertions(+), 22 deletions(-)

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
index e01272cd628d..60150006ee0b 100644
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
@@ -276,6 +278,8 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	struct clk_init_data *init = NULL;
 	const char **parent_names = NULL;
 	struct dpll_data *dd = NULL;
+	u32 ssc_modfreq = 0;
+	u32 ssc_deltam = 0;
 	int ssc_clk_index;
 	u8 dpll_mode = 0;
 	u32 min_div;
@@ -349,11 +353,18 @@ static void __init of_ti_dpll_setup(struct device_node *node,
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
+		if (ssc_modfreq && ssc_deltam && ssc_deltam <= 1000) {
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
index 8c51b988a04f..052233f2e12b 100644
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
@@ -682,6 +685,35 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
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
+	/* Up-spread is not supported by the hardware */
+	if (ss_conf->method == CLK_SPREAD_UP)
+		return -EINVAL;
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
index 61c4abf19995..8b29cd7db15c 100644
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

