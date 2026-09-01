Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4A0477295
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 09:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253778; cv=none; b=EP7a7AegPuEZXUQTFDZpxJ/i8C3hQZihfaDRzxhD3ICF71mzuOq9RxSL2hlf/JUxyssVSVzlpciHmSUZDLJ4WM06CWzLqCwmY6d4Y/oPXRZzIn42RES8T5x3aAy74Vz0dHXK6+HBImHNk0gtxIuLiqRWZ9D+cuvuqdvk/H3+75Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253778; c=relaxed/simple;
	bh=5CTW8T/SpDQx4JzZBtps7+Yl+CTAibFCz311cgv/i+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnN2f9b1ZbghBcEFSIkcwzwBPrOxZ4VgKYIdjp4fXFQnhTuZ6v7Yj4JktjW6nFohOf2QttmPEV6ME14vodqWwLAMIaDjibrIQyG/D4itIp6eNQ8z7+3QAeMe8eAnl38QYR8pGKfD0uMDzgM5AGj7W7XDj8xvQXVQz7UVy2xs/yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Qs77gbQj; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Qs77gbQj"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441a2ba14so869964f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 02:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788253769; x=1788858569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=Qs77gbQjzrU0BsvTzTzf9mNjalnGkzbClUFQVBBidj+3ay3koDqn+5DpNWbNe0wUfH
         mQjGnz9921N8EP9aKtz/xjvXkXq+k9IzHWvoD1omVsXMH1HZzjMG82bq2PTxodj67NDH
         AG9ikpKjNIPYtJL3rkMl0DmCPI5SNXXX6C5kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253769; x=1788858569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=h7TUiI8D0BaoLGufOz7kqgfwd7IpZR9gbViWzXYTTYeTuv2Cco6HCai0PlM/fIfj4X
         y92pk+yDA2dPpFinwqTGljcpBRhEzqzs5Fxz8B/mB9f4Nag+eYfbS4jbfIV6AVCojFxW
         JT7figOTrLhtSgaehK6oysNo72A8hGHTMFLEA5YRDhn07LO4gBBXcpld1fEqy20qQF1+
         rCrskawWKXvy63QPBDaY7Dzc64zGSdwHeg/6A46mtRr6c7OOBQWmlg70LZRSpLtHq3UZ
         WHCrppuNB0hrgMVKwlgthL/oIpS6Ad+Z8sP0MFzUjfCyF1IPyFXZKtyOhgNrUYriX4YI
         iJsA==
X-Forwarded-Encrypted: i=1; AKwUvBwDnHvtJ6FLrX0fG6aMJGecGJHDRSAND/dW5jPK5YfOm5AbE2TBxQtvIzzb32TohN/jVleN684Qxok=@vger.kernel.org
X-Gm-Message-State: AFuF++mhyomsJRMETrTvfxryGfpBTchkqqrvBs+N5IbEhUoXePy8R2Vl
	YAS74qMtUHNbSS/bsxj+5gYcyOqs+zhT6OfcukQZtw5oXLfAPZLjU644hSy+jfmXd2s=
X-Gm-Gg: AYBFou334UUqd+4SvAUY8x159JSLZn3dn7m4lfaX1/84igBaMmhisbIDrAsKIOqgLMe
	cHnv31bdPNxUZefcQrEijC3t54jJIlqYRrrDZmBan55D+Nk/sPBgYe3UHdp5lzaZpv75Y/pL3U5
	86MYeVKUh9WfcOcNmmyNdD8vgKohkp8vOQu9+9okTjCmbS+hm6txTNvDWjJjxKBUgx0DtGeutoM
	78QkFtdt2ysHzqH4MbnmvNLQLxEvgX5PG8VbWLMtjgcV2f9N0mCR/weMbUal0AcdJzwg6jxohVH
	6arANbgyxbjZpTTHRWE8clWeNMrD3PpzkCoRo6UlykYNKkApn9LSLrfOqd1qPYqp1Mrp/d7VwXD
	W8Lw/2t+ibdZhevQRwh3QzI3d6Pwn5tWi/JV+/e/VzO4jKyCGIdM2eVnY26P3d2SD96Ka6mfrEg
	t1C6z03+4cOUkTLLSZ9pEHjyPu2M60ynAPrY4ZtOytx7lSTYLMKGXvwRSRlM9LMhiKQtNKkPLrz
	8O15txriGtz+rPjSedKpN0mH4Pj+2wyfVvfx3smRf8rSODql90BbT01lFlIvxvnEzW6+Ga894pb
	U2KTc9De1rm/YAEJL44bPTitJ/ehN5Q1Yrcg/188/sJKW412z03Nnc45F0CtP76Skg==
X-Received: by 2002:a5d:4702:0:b0:481:bb82:3f31 with SMTP id ffacd0b85a97d-482f79db522mr40181489f8f.10.1788253769303;
        Tue, 01 Sep 2026 02:09:29 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442c425cesm3825273f8f.6.2026.09.01.02.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:09:28 -0700 (PDT)
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
Subject: [PATCH v11 1/2] clk: validate spread spectrum configuration
Date: Tue,  1 Sep 2026 11:05:17 +0200
Message-ID: <20260901090912.585681-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
References: <20260901090912.585681-1-dario.binacchi@amarulasolutions.com>
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

