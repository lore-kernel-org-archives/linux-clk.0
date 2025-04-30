Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096F237162
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007102; cv=none; b=WPKP29cjhUanT1jWlGIpy+u+/u4sMMbMO27rqISHX/RKV20Y5xVtAhZirso7aBEFomsb9mv6phn2yM5/kpYezRuTfL4kBZUfLF2bwzos/ayCTYcImJszHROERKy0ICcdp0jQXtLHZkzKAFcxPGq+ZpL5Y4OkTk9RFDJqNLLzymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007102; c=relaxed/simple;
	bh=3eSx1C/GX8hyp6Ceh2NJJp3pJchNIsGHq2rT98Fdnqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IG0vk9FTwTqbbBK5nSDA4Ike1t6eVaJx5EVtNia+y3qqWV6fOMAVWYcJpbJd8rNhYoCMXo0Kmx9oSZggQGXgiVdMIg2jUVYdOIJrsJn/fI8fUlF8umb5O6Z1qGzowonln/0RdRxlwhTtcv0e4Lj52ymcDHz4gGgfNqoDPYEHqIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hivxOt1J; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hivxOt1J"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so62581975e9.3
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746007099; x=1746611899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7tY0nC24oyGSd/sL5Ai+/WNM2n2l6u/H1QH4845/ow=;
        b=hivxOt1JUnWWo54w/yEp7P5Sd6GFMlUZI6vyfKYxAvy9L1dYyvF9/TJ4jm0Ie3BLt4
         o5Aua1BUi6cU6+VBsKyhfu57Nwawqtt1/TptSw37DHxX13UhqSEsnJ67s87j+WKnq6gO
         +6bV9YHu8Za6TK4mjEI/KD3b/1/p3LbkRue5A8NHdAj/e2SBWdWocLZagCGMstn19LJR
         hpfBELUa4FQgBinpfYcL8f8StdhC7udDoOZPfDSG7Ky4KK1YzjwcrKn1Hi7tqvSZI1l3
         tFTjDkatVL5LhnD5uJ5o54niyTVHTngk8aYhxozmSPvH50nEA7Re5RWIJquC7nsjYLbg
         rdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007099; x=1746611899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7tY0nC24oyGSd/sL5Ai+/WNM2n2l6u/H1QH4845/ow=;
        b=pVUelsPhuGwqqkPfLiMHD0vyk0QsbOlG7q2p1nrpRcHnduSHbbOyqV2XoiwAmzcptf
         Th3DcJpv1rwRIAfeFcregXBomwAIk1hqMho6aaHuqGDjoAiRKV1cFU2uOPEGDK2K5Z2r
         GlKmRpbXKJKSdvAsfUzXF7r/NjkKWDjRET1Pjo13oWgWm3F/spE9ZxN4olbpxQii+lZI
         gMoS0pcjxsX7petYAmbpRUSE3yaaiLDwphWkw7Y0aX0oBAitYYvC3N25oPT38Znjgo0O
         deDn5rI8nJ4o1rz+TTXyINQS/Gf9nI4WuXbcT+tijP9qjjKQI+f2Oj/b7+iLFAN69FWQ
         QGUg==
X-Gm-Message-State: AOJu0YzloRJGyyYa/FZ1imS8uUuP3OL8LJMudwa2TL/+9opTJIeZvi7+
	94T7yqfq4hs5pvM3Yy9N44cxoj5KZcqCH2QQUtNqo031LW/jSZXs5DTvITcjy8Q=
X-Gm-Gg: ASbGncthLc5O53u9O3Ig91EmiTniUGkxJ7E/JxQHGeDHhIQuofo8UeziBOTUVKeBUpg
	IYZWtyBZSaa2zp4FB3yR86rqAlErYpkBz4cnL3zdf1cMyXppHZRN086Pd0X8312BC5e0c8nPvCm
	V8z2gIBwC/BugAmq5XhFbDkunC5X1Z9voT07MtsW3rvHwn10Taidk9OfUNAFk/WdAGfUyqLICNS
	4Xz7C+uOEiBVit2Yl0rmeihVxCP/T2hWErtN8zit3jVtifUMz8LOq64V/XDE6+nJnE9dpaC+q/J
	XKMFPXYgVtRNeSBdE563uiUsGxayMWN9yGem/VzJPGO2l3fG4v1eWN8bOyxp00edppGjuP7QA7x
	bmIDRbcM=
X-Google-Smtp-Source: AGHT+IGmVTMNri5Sm8wcqpeF8VIVZrJ/Zu3eKJXhtydgdXvYik6fTjiDVeRubZGj+D7bbCVYLRosrQ==
X-Received: by 2002:a05:600c:1546:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-441b1f5bfeemr16819265e9.23.1746007099232;
        Wed, 30 Apr 2025 02:58:19 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b972d6sm19343455e9.1.2025.04.30.02.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:58:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH 2/4] clk: pwm: Convert to use pwm_apply_might_sleep()
Date: Wed, 30 Apr 2025 11:57:47 +0200
Message-ID:  <f194fad5ee8bdd3fda6159324524979729683653.1746006578.git.ukleinek@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746006578.git.ukleinek@baylibre.com>
References: <cover.1746006578.git.ukleinek@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=3eSx1C/GX8hyp6Ceh2NJJp3pJchNIsGHq2rT98Fdnqo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoEfQf/27S9h+HoK7cxoF/90bC0GRDe3ryXpqFk xQxVM3sJEKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBH0HwAKCRCPgPtYfRL+ TmQ3B/9Tmd33dF6R8m+knOn2zYUKu80d78lpu6Ojb4Muk3IbkC7sjIyqVVrOAy+6x3Hj6+FPAxn y53Yd+TZoZryiEEy/w0ChtbaE5VYAYx7tT3XPyw8yJOH0bgYZij+ujSrjhvHee+2Y3R+iBAjnnP G/ej/i+21MXkV1qQhRhdAuiowd/OVXZv8hKQWT14h2sw12EVAE7ja0NWfvId/02AuVA1KrwXSdz ts9kZAJWS4rDkbk+xNRxezmxXPihfoveGAeDP3avnRM88lbXf4qVWN5bz3DCFDUi4erHHlKPZ4V taELV252HV8pAtVVCqMZeS72ynZSPdReu8EXGOECK8Lxkzar
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

pwm_config() is an old function that I'd like to remove. So convert this
driver to use pwm_apply_might_sleep().

There is a minor change in behaviour as the explicitly calculated
duty_cycle used an uprounding division while pwm_set_relative_duty_cycle()
rounds down. I don't expect that difference to matter in practice though.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/clk-pwm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index 429150bba8cf..f5e6fef3f4d5 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -14,6 +14,7 @@
 struct clk_pwm {
 	struct clk_hw hw;
 	struct pwm_device *pwm;
+	struct pwm_state state;
 	u32 fixed_rate;
 };
 
@@ -26,7 +27,7 @@ static int clk_pwm_prepare(struct clk_hw *hw)
 {
 	struct clk_pwm *clk_pwm = to_clk_pwm(hw);
 
-	return pwm_enable(clk_pwm->pwm);
+	return pwm_apply_might_sleep(clk_pwm->pwm, &clk_pwm->state);
 }
 
 static void clk_pwm_unprepare(struct clk_hw *hw)
@@ -106,15 +107,16 @@ static int clk_pwm_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	/*
-	 * FIXME: pwm_apply_args() should be removed when switching to the
-	 * atomic PWM API.
-	 */
-	pwm_apply_args(pwm);
-	ret = pwm_config(pwm, (pargs.period + 1) >> 1, pargs.period);
+	pwm_init_state(pwm, &clk_pwm->state);
+	pwm_set_relative_duty_cycle(&clk_pwm->state, 1, 2);
+
+	ret = pwm_apply_might_sleep(pwm, &clk_pwm->state);
 	if (ret < 0)
 		return ret;
 
+	/* set enabled only now to not enable output above */
+	clk_pwm->state.enabled = true;
+
 	clk_name = node->name;
 	of_property_read_string(node, "clock-output-names", &clk_name);
 
-- 
2.47.2

