Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787471;
	b=Toh7td9lGAvUW92Uh7JWXOY+NfMAqYYncQpGLIKjXnuLXe2r3pvzOvkztJmFx6PSNWDf
	 PptLTqHLdE6BhcC23CBYQvp9Zm8lolzSzMqXfpYDw3PczZYRSoZklIazS15mbWGHJLEak
	 nbSdDr6jKmQF1zEcNIhPWxrk1HpD+B0PpDn74z5yK3joiOTMJGsWdp25X0zqsCk26+Ls2
	 /XUSX/tdAVXwDW0iq0OvxvfZZ4yYhCqrmTrs60ANbLjScCRTTwI1lXaRshUW5l5Jm0rX8
	 yj1OI4I/SQg4S6tHl+uaufbEPBWahFyi1jOuPEWEoPZimHWJSLRYb4VV7Y9KiYypnYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jbuhfSlfgFZ1tnBuSoCDBMKfZMfXYTX6enIbhL3dWk8=;
	b=IjJDhy0FLknnmZmHJTG8tc6ujnvwlcBEYUKr/+iGm4AKxNfSEBbjviqBJORXikS2Peex
	 7jR7mtlPiwZaFB7cGqEfnF5+SKOvVBo4CPzXcztiqDbQkF3l4E2SpZpteT++kqPNHeYTS
	 VCDvKLooI8fJyp7DqMTfVyNoQWW2t4drNencJQLKGn5apZfK6cx6PHX+uLMl2CzGqW9Zu
	 SrOJAdesTIomcNl3qgNbW1Q7nNPkfkR4/l9AcNIUOgu6wWlNxHB7ye2HMR0YS+U3BcaAP
	 5OAog3B8/ZoSPHEsJ2f83PumHiTZoQt87wMZXuBybFnYWE4eOAwoZT7tOuUxf8ChKOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CyNEMifS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F8606A32D
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 10:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A02F8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=CyNEMifS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3425025e9.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793787469; x=1794392269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbuhfSlfgFZ1tnBuSoCDBMKfZMfXYTX6enIbhL3dWk8=;
        b=CyNEMifSVUvkTiaf6KkOAei9iz6weszH54eAirXWayP4n7wL9TezYOigHf5joDbBja
         S8wK3tnIvZ92VTIq1L9pyaHv2pKagv+UCZZ7nZkVKoW5RvgTdmPteRu/OxZrHiL9upkY
         VhCzMqfWkaHnZgpb+uJjSCGYWdmBxAPIldN3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787469; x=1794392269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbuhfSlfgFZ1tnBuSoCDBMKfZMfXYTX6enIbhL3dWk8=;
        b=00MLfPaBSd4Z9H6cEpyRhhBgXuqKneUpsDhYi7DfpCd4hBeCLLKdLCGXB6pYl5bx4L
         RmZK1oNN9coXMYQzhcP/XawtjuD6LwRG/1h9X3J91urIvvSkZbGMJQXsy8EJqGTQMmHU
         1BZWJ5uaqbFkCV+sTLMdnac1ulDH9OYRyvFyraJC7teN75YY1T/jXcCZaArro6iPzWaV
         FHJ1cjU/Yx8C6sfB8ssyJnS8fgAHuIJNqcw6/irWc3o4/7w8CZS42nlXZ2WhRocQnODj
         Bs4phMFOABhLsJ4l3BYcix8WVvYfK/WAx25kIJ/pMZV4IjljDkKzDTolfMSZMBwqwpmk
         hl8A==
X-Forwarded-Encrypted: i=1; AKwUvBxdx5ONwnRTaiQPpqDQZardzcUi23ny/6ZRwNu6JAyngYs1YMVYxUDf4/hJ1q1mj521YUooFhmfeyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YJxLxQ0IuAIK7mAyDcE7N9pJlDgsrAtiIkncXN/C4d7hycqwx
	e67ZGDZzyLQVbEQ9XWWVMALDTFhcvaEBMXogurfGklTWRRdM8ryDAplEZA7AyNhtgeU=
X-Gm-Gg: AYBFou3Y/v38avpIDq2qKSXKzbxIBTWTu3SM4ANJG//02E90sWZWXmmlvLGSz/WJEPg
	Pon4bDWOsEWoHhlGDetG/7vaRqrmpFw7QOPuWlapqvlUacxoncLp0KPuh+IbV69SjKHLzkOBUjP
	Va+3tLrV4sIcqx7+LqillX7PIaadpOC24FssrQoFiVABQaynNmLQt/QDEbrGSdTM8FspsEgFIi4
	A7Xyx3MYld5Pkw/lwdBBOflcE3pO+Irg2klSNu36H/zPFpJVdEe1gQBb4NWHydhUIGG5D7NkBZe
	IeBSE4rmIgSe77nYvQQOzR0gPnN87SqcYvskZliMCv0JEUdQ1UWO0ztCRHjMnfII5B4TTOOt4wS
	timgwRcGqzt886A8pKzXDX7/EjHOHciJ0HIO3BLIcnNPjIxLvbgHXftks0Wv+t0fMijh3Z4NimN
	ACP1Azl+P+BAPlSXtypVwrLrUKIkHTuP+2cdEAgAMm3DdfHLAsNsNpvUguPUEnLCcJJUHabHMpk
	jOdnskzfRyF00WvTkyFc3gD573JXXTZScWgibJssI2UIQlfZm6OPvxchor3Kk6cik4LzlB4duLJ
	FAs2Wr/stGB8mIlOy+0U+sxeuZqBrqhYEsvFMYR1wCO7757teHkvNaiFoHa9CARmVTRt03hbWhb
	UzkgiSi8aXtNN2C4ZJ0BJ25wu3NvBSRtZEcCFZhnV/VUcoMW/oeNS
X-Received: by 2002:a05:600c:1f93:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4ac180f299emr332117065e9.14.1793787469058;
        Wed, 04 Nov 2026 02:17:49 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([217.201.213.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb51a9csm3035105f8f.59.2026.11.04.02.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:17:48 -0800 (PST)
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
Subject: [PATCH v4 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Wed,  4 Nov 2026 11:16:57 +0100
Message-ID: <20261104101732.4043372-4-dario.binacchi@amarulasolutions.com>
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

The spread spectrum clocking (SSC) registers are only programmed by
set_rate(), which the clock core skips when the requested rate is
already the current one, e.g. when the bootloader has set it up.
As a result, the SSC configuration is not applied, as it was with the
vendor specific properties.

Apply it from set_spread_spectrum() instead, reprogramming the DPLL
at its current rate.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v4:
- Split the already applied check into the disabled and enabled cases
- Keep the reverse Christmas tree order for the variables list

Changes in v3:
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

 drivers/clk/ti/dpll3xxx.c | 56 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 052233f2e12b..b48ea0492378 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -690,17 +690,22 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
  * @hw: pointer to the clock to set the spread spectrum configuration for
  * @ss_conf: spread spectrum configuration
  *
- * Stores the spread spectrum clocking (SSC) configuration of the DPLL. The
- * configuration is programmed along with the DPLL multiplier and divider
- * at the next rate change. The hardware supports center-spread and
- * down-spread only. Returns 0 on success, or a negative error value on
- * failure.
+ * Stores the spread spectrum clocking (SSC) configuration of the DPLL and,
+ * if the DPLL is locked, reprograms it at its current rate to apply it.
+ * Otherwise the configuration is applied at the next rate change. The
+ * hardware supports center-spread and down-spread only. Returns 0 on
+ * success, negative error value otherwise.
  */
 int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 					   const struct clk_spread_spectrum *ss_conf)
 {
 	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
 	struct dpll_data *dd = clk->dpll_data;
+	struct clk_spread_spectrum old_conf;
+	struct clk_rate_request req;
+	unsigned long rate;
+	u32 ctrl;
+	int ret;
 
 	if (!dd || !dd->ssc_enable_mask)
 		return -EOPNOTSUPP;
@@ -709,9 +714,48 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 	if (ss_conf->method == CLK_SPREAD_UP)
 		return -EINVAL;
 
+	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
+
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf))) {
+		/* Already disabled */
+		if (ss_conf->method == CLK_SPREAD_NO &&
+		    !(ctrl & dd->ssc_enable_mask))
+			return 0;
+
+		/* Already enabled */
+		if (ss_conf->method != CLK_SPREAD_NO &&
+		    (ctrl & dd->ssc_enable_mask))
+			return 0;
+	}
+
+	old_conf = dd->ssc_conf;
 	dd->ssc_conf = *ss_conf;
 
-	return 0;
+	/* Disabling SSC does not need to reprogram the DPLL */
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		omap3_noncore_dpll_ssc_program(clk);
+		return 0;
+	}
+
+	/* Not locked: SSC is programmed along with the next rate change */
+	if (((ctrl & dd->enable_mask) >> __ffs(dd->enable_mask)) != DPLL_LOCKED)
+		return 0;
+
+	rate = clk_hw_get_rate(hw);
+	clk_hw_init_rate_request(hw, &req, rate);
+	ret = omap2_dpll_determine_rate(hw, &req);
+	if (!ret && req.rate != rate)
+		ret = -EINVAL;
+	if (!ret)
+		ret = omap3_noncore_dpll_set_rate(hw, rate,
+						  clk_hw_get_rate(dd->clk_ref));
+	if (ret) {
+		pr_warn("clock: %s: rate %lu can't be kept with SSC enabled\n",
+			clk_hw_get_name(hw), rate);
+		dd->ssc_conf = old_conf;
+	}
+
+	return ret;
 }
 
 /**
-- 
2.43.0

