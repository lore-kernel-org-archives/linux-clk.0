Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173500;
	b=fwUVPDeDOmfG0ZIlrTfI3L1jA+3Et9Wyxe687XVJPGXdbKQJzYZm50EdNWmjkLDW/+5R
	 INUdvr46r8ceXKhIHvu0MaZ5YxGKoEFFR2SfFl3kTn3EnxK5VEoG8Ne1iVfHgwQZTHoGK
	 y6m11lEsSyyaAWl7bVK3UOp2sMyXsAX+Omu/3kcuBbgu6Wdx0ammgk91283qXn/NroWhn
	 XvXWGu9V+H6QugWjNmPhWAzFcjKsayu5PQ3GTj4eYqjI+JiccPjk9lVzjaxfSo4GiFiPC
	 ytu2+kCWkqlNjjw0k7j/ZXPMREn0GRWvhalBAqhIdunIbafdePmdD40QIcNgnO2oByw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QgCBPMZCOQV3dhf3hMT8g1VGDheFKuoWsIpy3UHh9yk=;
	b=ckx41TmVEPgBNEPt4mdsNcHbWdLUy/V7Rv/Vy7wXUvQZskg7NJf7B5d5xq2/2BalpOKZ
	 zrkdAy0f8DWTWSy14+jqHxIWfuQfCIWtodTfJga2XFGivQjUaRy9JzZrbNfSqXD9mt3NL
	 cLVpjCqhUmGXSikxQ8Nl4dwxMW7vDheLzYFAVNmhW5Ayiq198WWqyapte4NTra/EeB8wq
	 Vfhg0k0bD4BLoUXTJ7d1zxEj5mGv6BfZn2UDMR9YMQ/p48CSN+7IgC9O/NW+HJ7y3gRmB
	 R0hdMslUfrXChZTTXh+dYGgTL3BJ0Do/jAdM7iUgC4ZsgdelfchX02lnXLMCt41EmGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b="eN1+/EYN";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF3C606A332
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 07:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF3C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=eN1+/EYN
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48bbb06e746so285467f8f.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793173485; x=1793778285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgCBPMZCOQV3dhf3hMT8g1VGDheFKuoWsIpy3UHh9yk=;
        b=eN1+/EYNYIDktRuxOw3uNO+DZhgK1GWfGibNOD5IQI0n647iKIz1uwnOAUiKB+IaUU
         RGmtoSAUHPd9KTANMfgITpg8Mc3y89eyII0bdCh6frOc6UEOPfv6mhFQ8haF5svShK9E
         9KZXLr3JaUq2J+MR8hBkWNAmj+iRGkD2iXYtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173485; x=1793778285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgCBPMZCOQV3dhf3hMT8g1VGDheFKuoWsIpy3UHh9yk=;
        b=VXFh85i9iGzBUq8X8zCNBLa0T9byQZfTpjKst7AU9fNnzP7RkR6hXS9rTLZCvaxgzf
         SCZkNL4SPnLX3H7cUTKnwzizd15I6Tyopv7pVb7/J02s96p04AZMhld+kpCg4r2PzYRU
         QXQMQi6Kv3awaquT9Ul81/h/4bgg4Fr4w1uSThK66GrZzeEPoJaqbcqeqN0JbpdoPtwB
         A342cqXn43+wzVflqdBJM4+3y54KuaNGSd8zmIydlmng5YwlpMmpnwpUPOoaovlRmE3r
         E8s2wKQbnt1XiuOjFwvPVUqqvUMgfG/Q7z5+p4oWTLTt2wXr0CeDaXYcoSXK7fC383ro
         ix+g==
X-Forwarded-Encrypted: i=1; AKwUvBwDxqXJ2zmARG4sU4hDYqMs7vB+la2PgZnPiw+WU+a4sXi+S0ChHHYc6pHAxnZsygjqlG+1rSi8i+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRXT92XOPpDD+23fTbLNDTSTwp9RsryInhygbHuAVFX8GLtXyT
	vEmkLHNgPk1VKQF9zrHhMRKhIZOQ2r54cvd+CX/+A+nq/XxuR2dkLKFTfE09YcN5+oQ=
X-Gm-Gg: AYBFou2B0mL/uTdKKuT+amEymzKy1P0DSNDQkbkE6bBj9ddeWQQuxzBTMWtN9pCt3tX
	jEvD3NnfdRr+VVGXcqOFLG2KXACMKBjb9ln87i2Nq/+wkRBjJe9fmpLnNX+Y0fsOu1HT3X5lgIn
	YYVpDnpyI++TPqydX1y+08DlRIzE6nLcgf5/xOl2x6dFHr5cJBWDMjGnRbm8MPQ2WaIU2CB62yK
	9yqHh68nLbhWkn+rQjDnLRmxTuqzMCoqGiBxvoIZGTr7bbmiy7rmGPL9Siddangp6PbvSvCEQAP
	eqz6RsBBn90H0j1gwSznPySjh2Bddo0N1hSDSbe4Ovqz2li62RvnjZmxIVAxlX39iL6JTwmj/HG
	ybkX2TV0YbsCOi48X3j35OGGAd0duMZ0+chNMzSHIgIiCM8B4ksv4HZk3vzRQtI/bQPZyXM6rsz
	hgFW/krqD4zIdnvVDleISO6tPNRnqB6+v7Z88tAR1HpqaO8ME9aPj5IGLgY1lbND6PD/LmGBfvF
	j+Ve5DM2LOuni8K9krHacrChiUaG6SIme45gt8N8zDuqMNyHlQsR2YMQNDVxgBdxAh9czn5NRAj
	Yt+dFoPsGtBk/C+ykFPjgPbbdRnf3tfgubxhpc8tLFccs8r4pC4CGl5cGJ4YJwWnM1t3RPt2bdP
	keW9dT8rpCwZdjZHuse4ykJ2XDsnqzTQusWjW434RG1tS6siIC5tspkaUk6HDCKFjut81ZIQMKZ
	LtnJ30XzJK6NZ8tGLQ3gSyatu/tw==
X-Received: by 2002:a05:6000:29d7:b0:48d:f6d2:9c88 with SMTP id ffacd0b85a97d-48e5d5cb889mr2331992f8f.47.1793173484835;
        Wed, 28 Oct 2026 00:44:44 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e412cc164sm25324882f8f.7.2026.10.28.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 00:44:44 -0700 (PDT)
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
Subject: [PATCH v3 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Wed, 28 Oct 2026 08:44:09 +0100
Message-ID: <20261028074436.1958132-4-dario.binacchi@amarulasolutions.com>
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

The spread spectrum clocking (SSC) registers are only programmed by
set_rate(), which the clock core skips when the requested rate is
already the current one, e.g. when the bootloader has set it up.
As a result, the SSC configuration is not applied, as it was with the
vendor specific properties.

Apply it from set_spread_spectrum() instead, reprogramming the DPLL
at its current rate.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Skip reprogramming only if the configuration is already applied
  to the hardware

Changes in v2:
- Check the DPLL lock state instead of its parent, as the reference
  and bypass clocks can be the same clock

 drivers/clk/ti/dpll3xxx.c | 49 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 634fe0a1f9fd..d32d81a27bfe 100644
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
+	int ret;
+	u32 ctrl;
 
 	if (!dd || !dd->ssc_enable_mask)
 		return -EOPNOTSUPP;
@@ -718,9 +723,41 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 		return -EINVAL;
 	}
 
+	ctrl = ti_clk_ll_ops->clk_readl(&dd->control_reg);
+
+	/* Already applied */
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)) &&
+	    !!(ctrl & dd->ssc_enable_mask) == (ss_conf->method != CLK_SPREAD_NO))
+		return 0;
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

