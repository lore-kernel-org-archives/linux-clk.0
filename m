Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000826;
	b=VdoDX2PZgm+5tJEyrTD/LM6CarZqvctdlP+p1ODQ6oxa1/Sv7NeDG5WhVJSkFaadCyC6
	 qwUoU/6Y5alQHF7oKZ3SK2CltoCCuMKvI8cugBVaRA50/YcuNkESzLO7PJCGPZRGQZ5SY
	 gr+eaTM20gb8N2E4Oui8IEx/FDbmDXpIy7NRe7i87RGAYVajDMZXMknCRSM4Y2ceXYvv/
	 veK7fAp2OVii/NQz1mrqWK4we0brq1f8pU3VHobvmhj4YmZkFi8urSmf38N2LUnb2K9AK
	 Akskwh44mUvsQQDpM1/vlfctMfGmNpbfRU8a2qhdpVWLhO6Pt4sK3BioKdIJxA9ANpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AyUGw9y+lTYy33bkDqkQyHAnwgp3s7+TGmPupaPsrss=;
	b=EABrZ5EEIUdjL9u1+aTk2oKJ8p/pjRx3mQNN6iS4fIDBVBOHOa0f0uC9C5G5TwhZE+ib
	 rv1sYt0ePbe1RyHHNWkzudIg0mRzgOzMez8+StYLQUzynP/NErieaqXCaZlf4b/E5Kn6B
	 x/SrMXqEAvjWue6jHxBXsdEeQtCXI2dhRJ0dO91zSLOgRCTD/gIEuW42y0OLTRahH4LGe
	 d3Ddv1iXTwCbtu4PNBbEaLe4MtIKmdH3RIOaR4OPg/Gz++gbEBC8CS4+73+PyxVsWIUKS
	 G1znn0nxO5zgm0j5CwT+yt4O7LQHggpmvGjFBXF2LTShC8rkE/Edssol/QFzqwU7LUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=bX3kRMW2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC160A2601
	for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 07:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDC160A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=bX3kRMW2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso20167345e9.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Oct 2026 00:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793000822; x=1793605622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyUGw9y+lTYy33bkDqkQyHAnwgp3s7+TGmPupaPsrss=;
        b=bX3kRMW24nMkF8yrKW/om/f/NwBbOa/rUD2be/zPmv5Lr2Yk+iYDXcSX7m9YZDgmFZ
         aTK2CfZtoOdqJZfuvahIAiflRMMG8qR8v78mk8+EMKOC19aAZ3xKoGuMFl37/gdgEqwn
         Rmj9gWdnAp+IYSjOHiw2l9CjUCZFmi/BOg7n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000822; x=1793605622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyUGw9y+lTYy33bkDqkQyHAnwgp3s7+TGmPupaPsrss=;
        b=cDZP9RiUJpjHaWrvIhLOpsfX6gJwLeQLKONU1T1FfvrKftO0R/KwOvElfAW+j3Gb2Y
         3jKX50Y4WGYuKWiS/gbVKrdWj91uoZlXdnVlQVPwxWoen/hI3QaK9TAzZFBcq2u1dTcO
         MCFNV4iYFjKras8hc5OlD369McgNF5ZH8gsGjzz5A3kkxkw3Sdjzc581rl/tsga3lcar
         SVDBRlWlZrw8saraFthk7RWGAyxiC7+EVSuOaBRl5PnI+hl/Gbmh7kuCbdy2dMhrv31x
         Tm6G2FjmQ8K3Z3KY7iAvPEIJ6yNFibzUXt1216eDkjz8ZbPc/XaPnOauuk0A1mGHNnmg
         ddGQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9Ib/SsCbQNGadbLmNlMZi4zL2aZ2lReLFd+H5wJpRgeqOIilq7XxMAA/Vb8dXZiuMNu3xb+oa7/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqeKDHKcB4cya0lsPOKkGVhIHiomWCT2Z96B1nAaSQf39pQacn
	1CS4Fn9W3TIfIExK9r1ScZWtPKa1mUJb8WAPjvhWTC8/2t9w7gTiXKhFlc5Q2OvfrpY=
X-Gm-Gg: AYBFou0PP4/l0jMcegKs8tqwQ6m0HpZSpW7nnMABtsDZBOaPh0J6SKLy4FRD5Nl9z3h
	+1R2tHO820LgGr2aJSlLSxNSemDuzP0BF9RKOIPsA1cc2MWP1S5LLxWL8dDMsPd4WWMKYwcy/ky
	Wzl08apiQEQwzIyyGxIW22nfHOatH7nATcW/vcQJ+PnMARwGZzS3yfdCCrVrhdpHtCwvIb1kVKp
	Cf6y8yKi21P4p+xHw134qIr9lFPBeiP0hLzLuBzd/l7lxa5Fe4LhMxcTkiD3LoE4rgDcCzmOgxy
	dGblTjAsqHH2GOuxBllY935higjUCF9qHU8n0HnyuUDI7gknzkN2Q21eIofbeNyqu34j6JDtp1e
	FodbVjXFF0kGUrs7tf92AR5vuK+Conv32RQeGQfFDxb7rYotQxBNYfi7gfmX499ULr83MonSpmR
	G0ny+RhcXOw1KYKUA1c6PVwUJtujkqz7WlFsynu9qRhdSFe9sP+5LplPHcJn8ZfUC1uebu2CsWk
	rKqnQuXtFV9BW0kNcRN4qSuhgbbg7yNlyHwFA9x8uNLK5MQQFW80GBt7WozreJDSX6BbjtW89eY
	tXhsk6JyQyk3uO1oAYvLKWJU6oh0YyIW4Ffq5t9kiEh3Tq0tAOk2A0GWRbGbTolJVm91uymm+7Q
	WyfvjsP7IN+Dd/Jg0M9nsIU4cJ56LVTyORYEotMv++KIt6KnUsBdQjo4D5bFHhreXgz1ZDZ2ngJ
	8=
X-Received: by 2002:a05:600c:4746:b0:4a3:59c9:a744 with SMTP id 5b1f17b1804b1-4a35ac8bb3fmr114614925e9.7.1793000821809;
        Mon, 26 Oct 2026 00:47:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm13731353f8f.7.2026.10.26.00.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:47:01 -0700 (PDT)
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
Subject: [PATCH v2 2/3] clk: ti: dpll: use the generic spread spectrum configuration
Date: Mon, 26 Oct 2026 08:46:28 +0100
Message-ID: <20261026074654.3997494-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
References: <20261026074654.3997494-1-dario.binacchi@amarulasolutions.com>
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
and drop the vendor specific properties.

The SSC registers are programmed at the next rate change, as with the
vendor specific properties. The generic framework expresses the spread
in permyriad rather than permille, hence the change in the deltaM step
computation, and also supports up-spread, which is rejected as the
hardware does not support it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/ti/clock.h    |  2 ++
 drivers/clk/ti/dpll.c     |  8 ++---
 drivers/clk/ti/dpll3xxx.c | 61 ++++++++++++++++++++++++++++++++-------
 include/linux/clk/ti.h    |  9 ++----
 4 files changed, 57 insertions(+), 23 deletions(-)

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
index e01272cd628d..626b44297e42 100644
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
@@ -348,12 +350,6 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 		if (ti_clk_get_reg_addr(node, ssc_clk_index++,
 					&dd->ssc_modfreq_reg))
 			goto cleanup;
-
-		of_property_read_u32(node, "ti,ssc-modfreq-hz",
-				     &dd->ssc_modfreq);
-		of_property_read_u32(node, "ti,ssc-deltam", &dd->ssc_deltam);
-		dd->ssc_downspread =
-			of_property_read_bool(node, "ti,ssc-downspread");
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
index 54a3fa370004..81ac070551f9 100644
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
+ * @ssc_conf: the DPLL SSC configuration, as set by clk_hw_set_spread_spectrum()
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

