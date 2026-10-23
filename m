Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767364;
	b=UYHpFyPsLPMSjIgCYIS5aesIYD6O6GtKHyfBUIgQ0fcOuDkrvcGt2g3iuBU1lNiSVWXo
	 zyYj3FzGZftRmH7hnSf/Y5FIJ2+ZsWxCbHC1hqtC9etVGz/EohWkWADc7HWVPEynI+5LJ
	 28ekTES63b6cYAiBkfjCy7x/VwTm7BhXDPVO16Xcb6Oeb2orQ17pUX44+DtZiETp2mM9N
	 p/6SovB6rYTk2u7r5GiZpXUva+bJACf8xyghNTpADs/qMTNbU60bwHgmmt5/lKHYnZ1lP
	 zIO6tAc7kzPGMWkl8VKoDntY2hn1l5K4uVS5ysEtHOrKVSIq8BeGBA8bGDpukjzxOUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=80oQFk83gUm5oUkUtGxTmSCfXu9EgvcllbggxNBcnbY=;
	b=j2qBe6rLgQr8yyP/zSPOHyB4t4xt5XLw20HxAIokQhG6kfdCleX6evNxOhtYRgm4OJOa
	 jX18sSQn2RNroehgBN3OCmuJ8hMyKagV5l/1XDojxxVnedHzsHPovcV7NLujr7xagWt+E
	 g0er7QK7hju0HtquB30jIKd6WTGE6l7rKMQ1bVZ3J1vxpr2vtZzjHUAIS+5QPyhoMU6yt
	 CxGWb52k6o92PxUeCn/iaAKg6L1P4OiQuFa92KOlKC0+2wTSU4yKwBYttf0OiyRjGirNr
	 1dpSwpGEWoY9NndLeXgoxBYw5F9gVXanlg+ybFHA/WbtvKv2yB9YDEvPjTjcAJIGZjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PvBALgAA;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9559A60A2606
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 14:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9559A60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=PvBALgAA
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso1464541f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767362; x=1793372162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80oQFk83gUm5oUkUtGxTmSCfXu9EgvcllbggxNBcnbY=;
        b=PvBALgAAP7XgEy+JeWS7jSJ8oN15TObVPVrkdh2Ho+aV84B7yw/9CZnlKDygebCd7U
         lx9QjMG26HSs7LwSdiogMUvSe87GuGzoirZdgjNzeoBbHFEmyQi/cgbGmR02+B/kVULD
         NNg4OGBBKwk46lrzgeKv9pNOKlQwE1tv2Wje4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767362; x=1793372162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=80oQFk83gUm5oUkUtGxTmSCfXu9EgvcllbggxNBcnbY=;
        b=XpYOBiBOKXYmuCFuYtE6Uh9oq2jXv/KJ/tlitcM6sjqwkHbeSH0YMoXLylwcr2w6tr
         +hR1IiYzhQCyRcJHvRe4fF5RayaJ4zuQDq/BVAwSahNeVwC1ES6B44ZkyeV34CLQV1j5
         o6W6OCGCPID8psvRwY+MTVPi5pqdlSM8P/+w+va+jmJ28LPAVgUrbMHn/c6KeIOFTNLs
         KwY26bgXw4JPAKx0HJZlBqdqtm+iGglsfZWRXnEHo0ScUsUSzBUrd+YNhVfTnj0KhU2q
         O0UUJfoaIkp7rGx2tzkC6xXPhT8ss9lqRFGCP/s/4+5vZWx6oqZT9iSJWaoeaWE7yx7i
         /OeQ==
X-Forwarded-Encrypted: i=1; AKwUvBymk/LTjG7AFIOtkmGmJZ1aDtfAFvIjmLyTa/9tBbS2gRpt4V/HN4kCT2rvSv2ze3damFygjjh7ElM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1JTDH9SHAYeR/qfIHl5YKTT0lH8jVx7eq0SSq87JrBtI593/Z
	+yeLtl3hM7QlABJubz26nAaAntEhv0SypWoRyFOPrUHICbrgkMVFr3TZbjIk69UdaP4=
X-Gm-Gg: AYBFou20z5yfHK2XTeNVqIFauFYXBhBAvIaYZdpDSZ+eXThWgkJe27PS/LEvHSwzImR
	0cXI+8FcBNHnLrgGwQOs1YqZRxpWEEVSU/Hx24jndtQ8aeWLpx+6qYHmJb7aO+W+MXthDzXj9vP
	hqQV7UuTW/bUb//9FGdQmIUyn8jT7D+4AB6wozP/IxLRy5xD2GG5swZmnBLjma2/G7oJis/+Zns
	aTx/VpIKWCnauvxg0FQlrF0346eapkt6Mawdy7NAB8fxz9tbnlOd0FklYOI0mC+zpKAWJFngplM
	m+F220oyJfSeSeQVfSzQetiAb3ANuVo/QZntU3y1q/yPU4sK6qg2yK/eTJ1pD5CBcnSfELteMUE
	J4qvZ8PlJdrEUHg0DpUNSLdYXb3HR9Yr59R5lJnLdVhFLsyOSTaGuRKT1aABa5eQ8qP1gUlmX6G
	tGzBHlcbraJcRDYsg/3YqVBYCgCGS1HBMCzubMmqPO5jOSR/2gxYm3xhIXtXQVX/ntlqSEPJT44
	3w67UOVdFrxZOiWIvlKZ0c0SKjSJ5Eg+QT+uTCzfiOhOmmY0k1MY2XvYt/CrP/87lqmI0KWiM3Q
	R+/MtiLEqezBfDqZ3F6ACqNCvbuGnLGJrgHsJav0+ox85yriEqlaC+Vkz4cFgGvSCKcT9An+vrX
	E1hl3/SupgkHBFt9ML/SzplIBYzcnRk4Ho9ixC7AmXAfF5OwcZbUT
X-Received: by 2002:a05:6000:4a0a:b0:48e:22fd:1ea3 with SMTP id ffacd0b85a97d-48e2d279e8fmr11095010f8f.28.1792767361919;
        Fri, 23 Oct 2026 07:56:01 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:56:01 -0700 (PDT)
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
Subject: [PATCH 2/3] clk: ti: dpll: use the generic spread spectrum configuration
Date: Fri, 23 Oct 2026 16:55:31 +0200
Message-ID: <20261023145555.3578469-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
References: <20261023145555.3578469-1-dario.binacchi@amarulasolutions.com>
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

