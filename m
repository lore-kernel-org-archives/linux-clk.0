Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000B8438011
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344151; cv=none; b=W4g4sdBQijrV8jHBCO5UZZfGxsUDBQh4/GiaTtZQi3nZLx5Ofonk2c48dPOStYDlmfvfELHxVD1+6UJvvWfYwyHnBluATfmLZfZ46EQBJhhOs3lLozPlHWz0A9Kt6I8nu5s7trLNgHlUZlqyp8vBUzFdCGEEDeElDg6eKS+pWuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344151; c=relaxed/simple;
	bh=5CTW8T/SpDQx4JzZBtps7+Yl+CTAibFCz311cgv/i+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYHs53x5nur509hMP5cErU546dooOS4IIKFXnF9FQYIY5NNaoHWaQpHNoWZ65omPO7WSkHh54opUPxjr2aVWp0eE8vziMjdtMJHApBrrtIFbmQeRmdasrEFkmdLmmJoZ6WrzmqcaMCFEeBEd0ehrKDvFHsUoH+tsX0Z656BoJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rF9Y5M6J; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rF9Y5M6J"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso9121545e9.1
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344148; x=1788948948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=rF9Y5M6JnKrnyW8p0Hy3G6T3mCDyv8xrhvBWVQ8kZ7kGRrfu5DrChaDVnWIlpfHZT+
         Rxebz334JhNfmPkz2dUzJz1xUwPiBO5a8XOTwGgdeY9cLd2k9dObPHgbVPgZQ+M6hcJ2
         oCWwJvJ4Qfm+lH6PpJvnLKyIhM5cKnQCy3A74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344148; x=1788948948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=pPoc7H2jisNvash9KYnysuLG8LGAXSDZHKku6CzAqSl2E936q28JrUeaPZoosbGdGL
         /b933uJVyGBCGWMe7Bp+JzadiRi/6abiDi2ma0H34bajMTsHlV+6Gkv40DklCxosikxT
         DMS1MIrCp0MmfZlAvNMLkBK3Ea+i+imTIMfY/pnGLUF32GYZoW63MPiOz9owqT4iAg+j
         QY/eK0VQqplX8uJ0qK2xTm8DCa1g7iSCC6DhafWpX/OVZuz4fLpHjTSJzAW1KmZ0BoiN
         Jto/JT2aPckCBneaU60wfBqt6oZGfgUKMfraCXrwwJOtmqZoNG6WyYHRpp5A/5qm6Def
         kYvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoB7ky5xOuysClFYDAJX6SKOEvS1YV2diO/BvSLoYYvz0M5nRpNoA6BXFA8ronqB+vbQZ64cB/OLqo=@vger.kernel.org
X-Gm-Message-State: AFuF++mFlaDslK+cxY3LyHcf7LWQtVWIsH0VDrqPDN8l7xjPvHd2v0Ua
	jUgmRC2LC7DwCoxs7SB8y48Zb4NRNuZ8MYlEBeth4to7nwNVaM3p0I4bbwf6vdu/+NY=
X-Gm-Gg: AR+sD10p5G1566Af4kCqyRs+w6S6B+PQTOJ1x3NCIumzdb7gSVDrdgBtHpoeQpbveQ6
	zYktA8352dqlIhmSetzLNwTWm7g65xIWXNfC4L0iJKN5Moxi1MfbQWsK5RAu4d4jKTIjfn4uGn9
	XRDcuqbBc7c411p/MAo6zXvwuJQOqg6JA9eKKVlhAkUM+6UWDZOYhOPyStfLql4yItSfmwSPkKD
	49cZCsIjVVwcxEDqqZQJIlJLjrGypM77Vbkt/w09eCgEn4aOMOct47WSMzu6j+LFnNeWdURGtiG
	VjZPZBp5G9qtHw13Cm1vJfkc2b3tOGdrHQdtySN67JNjHJtYuTgEl5xmUwB2A1dAf3yZNKRSgLw
	u+7YxkUU53QJsxJBR/0Xu+vGUpbGPrHHVcmucIJZgqxpnnf2qPTreD+qucKiGQYnEC5hRc8Sgy2
	vXtI9RvA17JhgHaHRxSq1fj+vxDdmaGpwwe9JisyOGXNFJKw9fcKNaQxnwWgkolxP2ty9SxUMgX
	cmYWuC1jbaF65+ASllr6Bj6fnFw3MlJkm6+uO3Y+y8XOsyhzPAMwwdfCqgr55pZptP7/Tw2XRbT
	IHssgVPaOaYzF8GdDvbiGQjyJZ83WNOor9jroE5EkQrW1JVXmnCpaEGcFt0V
X-Received: by 2002:a05:600c:8b88:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49ce584b899mr65032275e9.12.1788344134629;
        Wed, 02 Sep 2026 03:15:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm139618475e9.12.2026.09.02.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:15:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 2/3] clk: validate spread spectrum configuration
Date: Wed,  2 Sep 2026 12:07:34 +0200
Message-ID: <20260902101515.167819-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
References: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spread spectrum configuration is passed to the provider's
set_spread_spectrum() callback without any validation, as clk-conf.c
only skips all-zero triplets from "assigned-clock-sscs". An invalid
device tree can hand providers a zero modulation frequency or a spread
ratio above 100%, and each provider would have to add the same checks
to protect e.g. divisions in its rate computations.

Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/clk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..208caf60eeb5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectr
 	if (!hw)
 		return 0;
 
+	switch (ss_conf->method) {
+	case CLK_SPREAD_NO:
+		break;
+	case CLK_SPREAD_CENTER:
+	case CLK_SPREAD_UP:
+	case CLK_SPREAD_DOWN:
+		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
+		    ss_conf->spread_bp > 10000)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	core = hw->core;
 
 	clk_prepare_lock();
-- 
2.43.0

