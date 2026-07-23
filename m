Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3E748380E
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 18:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784832419; cv=none; b=DMGxbxi6MRxN/NNJLb2R2ivpZ8cvam11GvIYuSNDu1Q2e+nFYgL63hRvEdh8y6U3RKoplcNEDpgo7bQipSJ1C8rXavK8x9IkrI0u3LXXVECr0vH71OzaCXFE+29n6yStY1/TgEasdu+qiKoKmNgOmkY4ntb9e9JRKypI3UtLMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784832419; c=relaxed/simple;
	bh=Cw+Iw1oGtwEx51kVwGrw3fev8VnbppEtNmYYejqZ4k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r36+D8jX/1Y6+OAhJg5oB0RZkT5d+qxyUp9HJbMBOiEAF3OyZAJHgxWLKvDnORgUcjZ1MCD3XpmAPmxLEGJSvAuLRuqp0nA6VU85AD1SCrkgMYIi9+pZ5CN07Li99ht+978cBjtX86op85WbUYdUR1ZzFmRglsYFgErSEMOmcvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rrayn80G; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rrayn80G"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso889692a91.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 11:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784832404; x=1785437204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+53O0vXfEk/QFHYiZ5anDwDOO58yxuSoKuAHDn4vUGA=;
        b=Rrayn80GyoPbn47Awu8p0FeVSUqRihf4syZGb0mp7OMFHoSLIufvs/gTViqDgiy2+r
         m50WNTDbGGRdLwOiPPtChc/hcD/JWsMoOek13o40xvXQ0ocDCpBdr4SYU6dwcfwHorb1
         ErswQHiUI7H+aJW2IkMWIefLGH7H2SNbZdKNiRnQnJBTUSQh/6MD5STi6hG+d5YPUPsX
         3pEnW6fZ2g262BLmUNGxRDHBbFQrGBtcVgzQTw0dZfLbDGUye5ucWvWI66+P+y934mN2
         Cs/X6eDVdiGbvpwqc5fT7nJR20kGy5hz6+rTDlVXBA+rZSF7nEI2OmCGt7Ezpg7PLE9z
         5cIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784832404; x=1785437204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+53O0vXfEk/QFHYiZ5anDwDOO58yxuSoKuAHDn4vUGA=;
        b=kWHSITO5JUw2BoVK69tJonRhJTG9XFADS4AdcIDUxpARcmwQT544syxLTNF2rDnJY6
         ErjdjynLK6q1cVnzRuoAD8NQINRL4GJyfaRTISxp2O68zJYLWemxRjSuGGA/Gblk2WN7
         0L1286Fpj6KB47E59yMaL6FfGd49clXSyh2Kpz9wrtw7TfbMlQktvsgf/waLZ+WL2sBX
         1cyWXCrPVjIX7ZJ/9ixKIpSczmcUMRbwdMCRnlEDTwTQS9FHUuNgFLiAEZbjhHdqbGwg
         ynWe4E1YYK4LVP3+TFALdD8t+/alAIO846BhGYn9UhFDu8qc8mYOW3hx6BaaEa3Rz1i2
         Y1BQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnhA2tDpzerQC/w8kLPjmNNdYtNEGuYlSSgm3FaNAOK2kTirRz7jd4vqdRDkiSeQRqw9Rzgr2PtA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ9T38gDqJPPNGbhI5PnSTSR/SwXzL4Iu1Uwk7gBusvWNC+b8W
	ctwvwR2i4W0t52Jw40Y3WwxJ9UgDsGBViJdtpaGR57pn0UZ+qffFdMcM
X-Gm-Gg: AR+sD11ifCUR3XKUKbyju3kvi8tpVcXF2AgnzCJl4PtmCGdwqDznNVxJOSzj0H6GzxN
	Ql+zrb+MqJq1EKy5tT8stkuZvHeQPtx+6juazhziJGrKahTMHd1vDMtz8sEJnHQtBtUo4eW0kQg
	+Y7+3CxggwAuoZAwbibE1xTbQ0QFlGzcMT2IfuRf4TP3DDK8gtv+fbBROJPsILmlqBzHZ/zxK6S
	1DYSE2qAnjRbkkngJnoOtz73iQ+Bg/FNELjwNJtaqpQY/4YHFXNZzOmDy3SFMG2Ki6rQL7H5clJ
	W7BCQwhWOfrmhYOoP16YEjVSdst8+UX1JTb9IpAB8uWZoDB8bmt8J5saquRw9rBrdMdhHj3Q35m
	5o8XQDalwExFjDsnnoAZ4G1PxbnnJdB4C4Dz20+dQPz9FiyTvg0B9mH/zU108WXsEuLzrNeS2
X-Received: by 2002:a17:90b:2d10:b0:37f:9cdf:f03e with SMTP id 98e67ed59e1d1-38ec6632b70mr4099341a91.33.1784832403772;
        Thu, 23 Jul 2026 11:46:43 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03af8a45sm308155a91.10.2026.07.23.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 11:46:43 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Julia.Lawall@inria.fr,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: cocci@inria.fr,
	Brian Masney <bmasney@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/36] clk: remove conditional return with no effect
Date: Fri, 24 Jul 2026 03:45:19 +0900
Message-ID: <20260723184538.3888637-18-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723184538.3888637-1-ekffu200098@gmail.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both branches of the check return the same value, so the check has
no effect. Remove it and return the value directly.

In the lmk04832 driver, the hardware sequence comments are moved
above the final return by hand.

This is the result of running the Coccinelle script from
scripts/coccinelle/misc/cond_return_no_effect.cocci.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/clk/clk-cs2000-cp.c |  6 +-----
 drivers/clk/clk-lmk04832.c  | 12 ++++--------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 8800472ba63f..4de581771d7d 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -404,11 +404,7 @@ static int cs2000_enable(struct clk_hw *hw)
 	if (ret < 0)
 		return ret;
 
-	ret = cs2000_wait_pll_lock(priv);
-	if (ret < 0)
-		return ret;
-
-	return ret;
+	return cs2000_wait_pll_lock(priv);
 }
 
 static void cs2000_disable(struct clk_hw *hw)
diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index 9bf86caad829..f006401c1586 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -822,13 +822,6 @@ static int lmk04832_sclk_sync_sequence(struct lmk04832 *lmk)
 	if (ret)
 		return ret;
 
-	ret = regmap_update_bits(lmk->regmap, LMK04832_REG_SYNC,
-				 LMK04832_BIT_SYNC_MODE,
-				 FIELD_PREP(LMK04832_BIT_SYNC_MODE,
-					    lmk->sync_mode));
-	if (ret)
-		return ret;
-
 	/*
 	 * 9. (optional) if SCLKx_y_DIS_MODE was used to mute SYSREF outputs
 	 *    during the SYNC event, restore SCLKx_y_DIS_MODE=0 for active state,
@@ -843,7 +836,10 @@ static int lmk04832_sclk_sync_sequence(struct lmk04832 *lmk)
 	 *     SYNC pulse to delay the output by some number of VCO counts).
 	 */
 
-	return ret;
+	return regmap_update_bits(lmk->regmap, LMK04832_REG_SYNC,
+				  LMK04832_BIT_SYNC_MODE,
+				  FIELD_PREP(LMK04832_BIT_SYNC_MODE,
+					     lmk->sync_mode));
 }
 
 static int lmk04832_sclk_is_enabled(struct clk_hw *hw)
-- 
2.43.0

