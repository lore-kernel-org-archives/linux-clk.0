Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FB401494
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 02:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784600100; cv=none; b=uxckqIhVRS8UoBpW1JQTVe6/t7pPAL3pJyEKxvmhf7ab86tw1e7GUKZgg+j0mV6RSfnnDI3ROgA4lXC2sXGqn8smWLhbgZb3BcFOgHIFEgTJd/TbJ0gtM1nqzi1FfCXOZFeuwkQteErm/GAZLAOr9bqgOPOXTEvATunmhQKQleA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784600100; c=relaxed/simple;
	bh=3QjoFwvYtFGSj7HucuLDgEEIU1vwshWyt15pjIaKNU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGzamnw8aRrzvpMPf106WIjbiHFRo9dqmfMf9tE02dGYBZOaoHWQyr/xalQu9qKQe2TbZB0bL4wLYQP3WopoSJ4knKtPfRiCyi/w2IK6fef/255Rhr9TZjU/gmtjMNRAqAjuu1T3Zeu+BwfZZSoLMWJ7lFfhIxwko5TxdgOqfbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KLqP5wDX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KLqP5wDX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so10206398a91.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 19:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784600098; x=1785204898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=KLqP5wDXxmuvUbIndpcls6m/QQBkeFrRW/25RM1qMw7z1ZXP/Q6mhS4cw+8OEFjgKG
         o3AtyPNyvboJHgmytbjYIuq1+6V/c7kDVqh5JIY00CJ+l6ixShohLKjw5EukLVfEZ6cu
         TIRpM9uZeeoWzKF0M7FnvFbN9nCbN9vUc9JeL90QphhZFaixjKDuv7CT2bhsV3CvtK0M
         dgmVhmAKgyru2plPncyR/PULsD3NJx1qTr9L865groRP/J/bHnmBCPP3qkygdZz1NHz4
         rZRJ+eXb25G9hapmQHX/R8P/hUBJb7UWhN8gSjSRqReDcmjdY+v0SdmFXpPf9tvWeKnU
         4fbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784600098; x=1785204898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=q3qZSkTSOdZBoR3dlIi+Bx07eI4H98AfuW1J3Yc6AP6WLpwOOaZIspmYoMFtvv10XK
         5EvxcWWyNO0uUy8T01T+vDQ0+DcIn8xyQ6gpgziHe5Xt1nG2u8/oLoY4667nt9E5Uvu2
         L5H32pK+WaBPlOFPTkouvbeefvGrQQ2QYcH/UXZ+Nmhcv4IbqHpOWO+w2o9l6eUE87/a
         v7MdJjI9EtadM95pdtA2JgOt9bEKNwD6lqrml9TGjtob0kLk56JlvmHQtG0f2xHvtN5W
         Ur5eNE0fg6YLlNqNwQgXoy0j1j81t1oeW74AG5UXG1M3HPO3CBSVyLLm1g74IIU9rluU
         +qOg==
X-Forwarded-Encrypted: i=1; AHgh+RrynUhWkRSz48KR6Ufdu1+dHTANsEJS5lPEbvwsYvJDZHZr6Vmawvriwtey67gj7Fya3MjJeWIbqzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjTcwGN7sHBfY9sOT3vtxv3fZmiP6d5HJS5eDBz4N5oq0wIkZb
	OP43l1+4pApmRjNHzER4EjpBimnsPMLuFvb8PyJ38jCVE+Qo3FwNanfu
X-Gm-Gg: AR+sD13tgq4ErqJwAJes6NqyXYl2u6nx4fdT+48+68Yn4D0ZhB7AEBQby3G0M1rjlwg
	0QMJ45LjR4y3XlVkkO9T5XxUd3SR/gZ599JOKifRiapGID1Syugq9ZtpDTEquDRFY+YjEN2N8/e
	ngbI3BqFVUrccDS4xlwwplE8c9y5QJIAAOPSsPAbwgsH07ODKJsj5mWdTOgoleGvMgpxGEHM6UF
	DxrUr1ZogFrtCJIvxyP/7wVbitT4e/eRto2wQ/2fZ7+8W74zMJ2BtyrVsjt0Ry5w6KdgyOp/Jx/
	eRa+e3vPIjY4E30AwlYd2eyn63lzTMgzH5iXU1N8DQwIQcuU3A6tPGQJoVCgF/BXICRfH5jfj0+
	0cXHaFtMMVnGCxhRRe7XR3+1OG4aYrNJLPhX+MtgW7aDjArGZ4UI73F04MQnVS5U/cYY24oES57
	q9cDKb3cO8KvuZ7YeLrH6oqlnd90TNRJO+Bs1HcEPRaHtB6mRZr+9WJmzdbMs7seA=
X-Received: by 2002:a17:90a:c104:b0:38e:679f:3b2a with SMTP id 98e67ed59e1d1-38e679f4dc9mr7825253a91.30.1784600098282;
        Mon, 20 Jul 2026 19:14:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9235a4dcsm586241a91.12.2026.07.20.19.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:14:57 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Tue, 21 Jul 2026 10:13:56 +0800
Message-ID: <20260721021356.288506-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721021356.288506-1-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
unconditionally before the switch statement, and then every case
branch overwrote pll_freq by reading the current hardware registers.
For CAPLL and DDRPLL this means find_closest() ran unnecessarily
(and incorrectly, since those PLLs are read-only) and its result
was silently discarded.

Fix by moving the find_closest() call inside the APLL/EPLL/VPLL
branch where it belongs.  Group CAPLL and DDRPLL together as
read-only PLLs that simply report their current rate; handle them
with an explicit if/else to keep the CAPLL (SMIC design) and DDRPLL
(standard design) paths distinct.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index eb9d69d2077b..c7c0dc91a012 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
 	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
 		return -EINVAL;
 
-	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
-				      reg_ctl, &pll_freq);
-	if (ret < 0)
-		return ret;
-
 	switch (pll->id) {
 	case CAPLL:
+	case DDRPLL:
+		/* Read-only PLLs: return current rate */
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
-		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
+		if (pll->id == CAPLL) {
+			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
+		} else {
+			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
+			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
+		}
 		req->rate = pll_freq;
-
 		return 0;
-	case DDRPLL:
 	case APLL:
 	case EPLL:
 	case VPLL:
-		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
-		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
-		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
+		/* Configurable PLLs: find closest achievable rate */
+		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
+					      reg_ctl, &pll_freq);
+		if (ret < 0)
+			return ret;
 		req->rate = pll_freq;
-
 		return 0;
 	}
 
 	req->rate = 0;
-
 	return 0;
 }
 
-- 
2.43.0

