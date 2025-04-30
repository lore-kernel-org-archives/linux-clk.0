Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1696F236445
	for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746007105; cv=none; b=R1LuNSBPOpLjzJ+wzEJxBMOOGSg8BZt6djYlvM0iMcZL0U8ncjMWNF0PPypXHdnPuHDMcJHOKN+KzP0onTnGCWHiZvy5isxoyQMorvmauHHM+PNpbcaoIjgnUYDEjne7KBYQeWjUvMF5CrS9m++Z3S1p49PlagIOFomFUFhx9Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746007105; c=relaxed/simple;
	bh=WT01wGVMtz26jsQthh5ks0GmmRwDkfRQsTIGumy+IKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBvbTXcalmIhsOrnBhOCuwW2YZ2Qf2ttoHpETA3pqTKNze267nfLr2Ajai8TgicLYfoWJ+Ut5kRTdsr1htu5Q4OdFmJ2JD/PusPtJBClNg1VCNZxYnwg60a7VVzYiwcNvVmMDZGsBceaRc8n1r/RgBlzU/WyzdS3vnLIxUNpXBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V/obQBcE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V/obQBcE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so5217615e9.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Apr 2025 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746007102; x=1746611902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm719CaCs0841zOLo7ju4gU62GZo7ZjXGxw9gltgKiY=;
        b=V/obQBcE/VOZcf/uEv3YFrpamD3lW6iN92vZygo+8WP+EI0pNOJuUoDcfd6KxizkEB
         t97i06M5ThTTscjBNcZ7r3FcoDONADsZvrkAcmd3T6cvK3oqae0vDIyG0meZdOf7CFoX
         VKLSGoqrpyduWFhgMXPJKArPgGOx4BmjueUazirOJ/hNpAN1TTOevKBDBIizUDyOZlT2
         0LJNolwpqvu/alHoLI7w5qhZp9FPmn5b18C6nw5daUKyZb/AVy1Y2Fuf16p0AXNWKuGh
         l+MJsWTnVzNG/aY9JYrU1jBXRPURaLxeb1RIXv7cKni4Y7NLW0TfXhp+vSDxsWjopvcz
         oo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746007102; x=1746611902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qm719CaCs0841zOLo7ju4gU62GZo7ZjXGxw9gltgKiY=;
        b=u/tlOH9ialyiQWOEsmurR116Hmduag85JiF2OY2YnAXl85ErK6EgTsfKc+iZyKqkAT
         le1FSgp4QumJnFSWigH/QVce8nMVeMzNHji+kpUAZnCtT+30yIPKsud3Mz32sdNgdCdz
         SDM1p/WDLRk6D2nKesV0v2gQp354RiE+QyPsQdMVKasRZT4wrSxC8iMSjgD1Bv5z83kc
         ZGw+lNZrD33w0/Tr++tFMSXw6oKPEF8pkS37crcdVSjHQylRcRxKnU2tM+PLT+8F54Mn
         RMVYab+A/VWVt5aqlvQ93Q/MwuSOicwuy5o9sT60Fr12dV0iPL+saB5MXXSqbBKwkkPn
         NU1w==
X-Gm-Message-State: AOJu0YzxmT67H8nO1r4zDOPPW6b2003lqQzG5YKVr+wiSvQNBmWwB/1u
	p8QZTE3CrOyeB6AVIu9QSneVHiAHkIE5J6+bDYonNQxIc5Gi2DldrzBbhFkhK2wGRc8OD9WSLnS
	O
X-Gm-Gg: ASbGncsWgCP7a8vXmDDYWx76vh5GmK2OOVKc1iba5PG6U0daQzR0rsOdR/2+J9fKbSQ
	Zujr9EUfzT4kzRvtsxrRGwXrD6g1NQTRllsqW8p3CjOlOQ+he38tGiF+0sNpV/wWFPJqvYhB5gU
	Hn6KpQ4FNVmt8LsxQArEJWlK983qQuGMMebQgDPvhX4N0vKLsjAFq2ExPyBTMRXO0SWk2IGT4kq
	m3bfcqK+8lNI+KaSKqaoq5CCMyn0DWQQNaCpZ2h8WZCntkxXep7hfjrjrC0aiZ+/h93tBO380Ho
	jsNxE3YGTIZv2NHQTAV1NcQE+j0ap/x2GdEr620UoV9IYRD16tzcWFK8IAU18xt/B455ZKbfw8b
	HF6TrAmM=
X-Google-Smtp-Source: AGHT+IGqrjOo2DQKHc0O1IVZBpNMHo4FYWVqhFXgFonOACFW+GhUkms3OO44TpMe3c2btTrkrmk+jg==
X-Received: by 2002:a05:600c:4e52:b0:439:5f04:4f8d with SMTP id 5b1f17b1804b1-441b23fdef4mr17217465e9.12.1746007102235;
        Wed, 30 Apr 2025 02:58:22 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aecb54sm19004205e9.10.2025.04.30.02.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 02:58:20 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: [PATCH 3/4] clk: pwm: Don't reconfigure running PWM at probe time
Date: Wed, 30 Apr 2025 11:57:48 +0200
Message-ID:  <a974f1147e1a080bf5ad7f1752c92b24516df284.1746006578.git.ukleinek@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WT01wGVMtz26jsQthh5ks0GmmRwDkfRQsTIGumy+IKQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoEfQiMMw/YDnA6nKRMEGdxoNFoVrglTzMIIT9N 7CshPyqkBuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaBH0IgAKCRCPgPtYfRL+ Tu9BB/9yVq7eI0wUxz+2JWrLoF+6wpoMsck0nLquvDzP0wMOHuwgs0107owzS/JfcTlg4bbQCce jXoQLQInMibU7BYIjdLcmGzNDvwv7o0MwQNdSsEd1T+i/OdeujJEHAeyrUVFfwlCjh3S6ueGLBc 5ZtlWvsEFAL46WqbDkxKAiGoCJTPKgK1qaxlSz5DmHxB9du/AI3cvXT0U9xphPVeD1rRFn0YW9e ixEFs4G+YQmlfsWV5kf32+HoHnQh3EzyHekdB7pe/ZFbRgkw7UZVAUQgVIVf5s4s3JEvO5KXkeF cz7wUFRggsQmHXCQJYc/2eSgmQYTetpUiR5Am9h6j3CroWr2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

If the PWM is enabled already when .probe() is entered, period and
duty_cycle are updated which essentially corresponds to a clock frequency
change. This is unusual and surprising. So update the settings only when
the clock gets prepared.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/clk/clk-pwm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/clk-pwm.c b/drivers/clk/clk-pwm.c
index f5e6fef3f4d5..856828d5f58c 100644
--- a/drivers/clk/clk-pwm.c
+++ b/drivers/clk/clk-pwm.c
@@ -109,12 +109,6 @@ static int clk_pwm_probe(struct platform_device *pdev)
 
 	pwm_init_state(pwm, &clk_pwm->state);
 	pwm_set_relative_duty_cycle(&clk_pwm->state, 1, 2);
-
-	ret = pwm_apply_might_sleep(pwm, &clk_pwm->state);
-	if (ret < 0)
-		return ret;
-
-	/* set enabled only now to not enable output above */
 	clk_pwm->state.enabled = true;
 
 	clk_name = node->name;
-- 
2.47.2

