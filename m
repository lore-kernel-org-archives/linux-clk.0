Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767365;
	b=riEQo7LGHcqmv36Ko1kc5T+X6KP5AptvE5yhNfidtl5Yno2I7JzL4DEokIT3BdKE0S6b
	 W6/di/1Sx+WQZ8I2Uuf/ZRpi5EUqmaBgSstF6oJ6PZibbWYT6OH2NnNhzJ+j833LViXsg
	 5Pt417Z4HjAhwU0TkWc6/0j5Fv8NfpABP6OfPAhlhpXNkH+ezRM3mMJ+ew2Px70XNpYdx
	 3ejmir+UCpm3o5iFDL/mocrXI520zkR9snD1aeL5oDTfLpWFDN7kIboGqlWcAq9j97hIE
	 FcJ7dvx3jUF81gzR/X2rup6JCLqWW8tOINHCk4bNxm9C6u5s2L39TWcXj7dprzdu45w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767365;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VHijqk7R7nkxNtNy7fBcVFoPcvT4XkjuXZl2ndqUfI4=;
	b=abS/lzaOlbcazGD4oy01y9zpXVL3lOduwjogpTyvySWEMiObAGYENVUi0PprY4vE2Yu2
	 pk89FlFn9aWJTC89Hr0j0SbCXBN3+DOPr7vYg7S902T2wCki6F3FtlaUM2OxNvGpAfXNo
	 9dsUDpCuxYXChJdRZ1Zcp9vABNHF04bDk9IA7+hgXS2yBwk3kjNphAQHZL8I8XaPBiKvf
	 NUbG6rUBG1bgFDQjAUze5feXURV+BSTgEsALs4AVWvAQc8A0rGbgmDY4exP/5CcMmJIZJ
	 8qtVgM6I93PgybpXzuViTbayzxlYQTBBGMMtf81kem0RV/Y5Zo34sWEd8XydZ9bcg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=n3OYrdy9;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032C3606A328
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 14:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032C3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=n3OYrdy9
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so693019f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792767363; x=1793372163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHijqk7R7nkxNtNy7fBcVFoPcvT4XkjuXZl2ndqUfI4=;
        b=n3OYrdy9FM9nwj1ieI5oDX86AMR8SCt9xiUwa9f3q+/Oc03cZR3gfFU7OovUXsceRX
         WO/SuzO8VAEo65jxC2XS4kZaIbpZgw2HvNSwty/6lRf7iD0X5b5PmmmxzEeUYX91OxUH
         okzpOJ81Xk7LIzokWNF/elUjFI1/WnPnkY3iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767363; x=1793372163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VHijqk7R7nkxNtNy7fBcVFoPcvT4XkjuXZl2ndqUfI4=;
        b=vJ64imG45Z9NcKDJelD3ml28b3DR0mCo4hb800ROWav3+6UJmOPz1e5m1Vjw0YNCJz
         3Qz5yV4ZHjtw8sOw2Z8c76jMnMRotNWioJ98z8bUxFxB0gb1sozkaBk+ZM4rYFtt1Zyt
         mcvzfHp6Aps4B/TYOy+i1pvfJZrV/87LA4vkjSvLIMxpk04w091lQm5BWnrKvsOikuQx
         Wb0l3NcFLwN2Ax2GAN3Sy0JosyMuFKpYdNaVPVh3H2Bb1lwxj/kcPypR666LU77Yr3Mw
         EjvWrHu42YqaQXxXG8Yq+OufM0QmL26SjSrMLqfUoqdb+cQqqKtzaSnttdxk9+I6G/1f
         TnjA==
X-Forwarded-Encrypted: i=1; AKwUvBxo/eZ3v/gfaE3+7OfJtNa1NLlJ2sFrAVA/JTwehQNPAcvHRtcWP+kTyGTU/CdIIUmInhX/cPMp9/I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO+RbQseTKokS6qJ7IQGLpWrSHEjdx+V9l7o1nMMi4qFNbUX6z
	rJyHshmKojK8x0OdM7hB6XslXsobk+1rjuEe4YojESTtIspPN1mWrNMf6eTvSZ7BdWA=
X-Gm-Gg: AYBFou1N71JEoj1I7FXPFWSZL9mcEYtKhmVcQh6zEk524ox5ZiiDy/MLTNgYZ4hXsKw
	yRGta2niX+9HBlKuQQ6p59mMY3fPt+Nb+CHn9sY4greVkHsrNXLHnUmccNvv89mG1ZygI1iBAaK
	qVDsJRZ8dx8bd4aS2+7RdxB+ivXEsjJLUowQms0EwE8kN9NARM2UJscEpFeEzOo3aiDip+n7fT1
	sFnfw5dLXkEnjWBIifEe7qfMO2UlZgJd802vKZoEETu5gejky/nap0J5IW6dSX5t8Vlxu+OyMNo
	EHxfnpVHvn3gvDixQxKop85jYv7JXBzp+GQuJy2LJZFIeQ6DV0OFIVUIxWRDf5G6GKEUAX8DaQO
	5ifI7656fuogiMvbjGjWx8Tdx7v+z1M7IYjtttbOHBRGm2L2BGqiJBM7vBnZ42SfNO4x9npLXak
	bHlGEW0/39cPYuoAWu1+FoMI36bEFNGuN1IsxP4fXVMnMjTKmj36OKDfAoteStQD9pzB4s8lgCr
	KyXyj6hKUm8nvk88sgMwGc+EVXktauxskMXQpe4sEzp6cVK7+D0pJmrBYukYRL6AAWS/DK3Hdyy
	kFc6RUyp9NCQgSComJlExxD9IL6bV/mpaNpbyHk/S16wiZV65WYzDPh5n9OSWisuno1FmYKuJJm
	doniObwGpikWygDASKmVfYQuevXHJfI8X2aQ6RSPl21RxvsuQtz8f
X-Received: by 2002:a05:6000:29d5:b0:48d:f025:110d with SMTP id ffacd0b85a97d-48e385a0752mr3000782f8f.43.1792767363456;
        Fri, 23 Oct 2026 07:56:03 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d42f884sm226760f8f.57.2026.10.23.07.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:56:02 -0700 (PDT)
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
Subject: [PATCH 3/3] clk: ti: dpll: apply the spread spectrum configuration right away
Date: Fri, 23 Oct 2026 16:55:32 +0200
Message-ID: <20261023145555.3578469-4-dario.binacchi@amarulasolutions.com>
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

The spread spectrum clocking (SSC) registers are only programmed by
set_rate(), which the clock core skips when the requested rate is
already the current one, e.g. when the bootloader has set it up.
As a result, the SSC configuration is not applied, as it was with the
vendor specific properties.

Apply it from set_spread_spectrum() instead, reprogramming the DPLL
at its current rate.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/ti/dpll3xxx.c | 49 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ti/dpll3xxx.c b/drivers/clk/ti/dpll3xxx.c
index 634fe0a1f9fd..c181bba2792d 100644
--- a/drivers/clk/ti/dpll3xxx.c
+++ b/drivers/clk/ti/dpll3xxx.c
@@ -690,17 +690,26 @@ int omap3_noncore_dpll_set_rate(struct clk_hw *hw, unsigned long rate,
  * @hw: pointer to the clock to set the spread spectrum configuration for
  * @ss_conf: spread spectrum configuration
  *
- * Stores the spread spectrum clocking (SSC) configuration of the DPLL. The
- * configuration is programmed along with the DPLL multiplier and divider
- * at the next rate change. The hardware supports center-spread and
- * down-spread only. Returns 0 on success, or a negative error value on
- * failure.
+ * Stores the spread spectrum clocking (SSC) configuration of the DPLL and
+ * applies it right away. The clock framework does not call set_rate()
+ * when the rate is unchanged, so the current rate is rounded again and
+ * the DPLL is reprogrammed. If the DPLL is in bypass the configuration is
+ * applied at the next rate change. Setting again the current
+ * configuration is a no-op, so that the DPLL is not relocked for nothing
+ * (e.g. of_clk_set_defaults() runs twice for CLK_OF_DECLARE providers
+ * that register themselves with of_clk_add_provider()). The hardware
+ * supports center-spread and down-spread only. Returns 0 on success, or a
+ * negative error value on failure.
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
 
 	if (!dd || !dd->ssc_enable_mask)
 		return -EOPNOTSUPP;
@@ -718,9 +727,37 @@ int omap3_noncore_dpll_set_spread_spectrum(struct clk_hw *hw,
 		return -EINVAL;
 	}
 
+	if (!memcmp(ss_conf, &dd->ssc_conf, sizeof(*ss_conf)))
+		return 0;
+
+	old_conf = dd->ssc_conf;
 	dd->ssc_conf = *ss_conf;
 
-	return 0;
+	/* In bypass: SSC is programmed along with the next rate change */
+	if (clk_hw_get_parent(hw) != dd->clk_ref)
+		return 0;
+
+	/* Disabling SSC does not need to reprogram the DPLL */
+	if (ss_conf->method == CLK_SPREAD_NO) {
+		omap3_noncore_dpll_ssc_program(clk);
+		return 0;
+	}
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

