Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5143B27C9
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 05:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778651814; cv=none; b=HKuOhHDgVOIEjOuyeBxTltvdtgTJW+mEPefpRu7Lfj6Oq3AlF3Y3K86yry6IIpfUjTAcOHBkMrmC50rzdWOsLLAY2mPCq2SkNCvJpG5m2nZE3fdaKcM1+/oMzPjycoigIpR7SNEvLvz2EfdA1Am5QGuSEKInk+uiZ4WM7ryOxis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778651814; c=relaxed/simple;
	bh=YMtucbXIteMIObBrm6ZdzFaVCfRFseNhK8oZ7Xxy9f4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qq0WZLPdZWAlgQE+ZjK9kloUZe25r9tqzoJYr+C2qxYv3JJIX442ye4xRa4ej7EQhmW/x30dcnvFxS40IQs3t150pXjm3qdeSh0VPowwLwaCRmvFQZb8y8uNw3bnC4P9SIqwhkqO4GEfIB1ACrZAxn+2HqDhnvh3uCH4Z4BFixc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BmrLiY/R; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BmrLiY/R"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so4128305a91.3
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 22:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778651810; x=1779256610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6lsTS2bThXFNqKtA/Z8FkqMfRb5iPzxNdnamFjvzQg=;
        b=BmrLiY/Rnn3dzVZHQVnWfVu4+rQmuDkz1EE/4QsYu6VAOEPprgf3co23sHDA2YGbnh
         GaWnONLAMOnqujbjOjhxlsMmlC7BBuIhuwa97b5CPDGzGsfs2ZYtStZaDGc/nt86uXeg
         /0Xr4YOOwDfNdAKWuB0q1+1I5MsqgWU89QduZbE/CiCJDFnlK9MtUEwC5dWb2/nLcFPq
         SR1hhbl569zCoAjxfy430yIDrQ1CoGlV6UTgMysSFPK7aAab5fPu5DtI0ivxOJuy2kuC
         v8EJyOsIxNtQXO6U6RC3NOdAz6a0HUmKYhykvLvZ2MM2b1kL/2+WnuIeoOqkGwUowzVw
         rjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778651810; x=1779256610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E6lsTS2bThXFNqKtA/Z8FkqMfRb5iPzxNdnamFjvzQg=;
        b=Wfe4VlXam4o68cdH4Sk2KGWflnHLbmbsx2B+VnkfOc+u5lvPb8BN88yzXVWX8Rtr+g
         /YKuzxeIxw87zWR1dOK50JtJeuXifDOHbkIAOCL+ACckLFGKMpx26DPr/IKHbi3Qs48j
         ZwAdSpUfruev+M1uxns1e3AZi1cn7UpNTvrYcswwbE3dv1LST1q1+wZNyecenX4a0JR6
         s/TGa6eyr3rNt00dirQN3IfCyZ5/oeUlfd2Knp0V/klGMo31AF/rKtNNgnrihtVGDRjN
         cFZmGFBSONxFdQhRd74f8qOCi9HuUpkLB7KMMOYIxsGI8alU4Zw1KQF027reqIGOyFDn
         Todg==
X-Forwarded-Encrypted: i=1; AFNElJ9wM2rz5KMv2vJcqs1AHjH+MZJvBDuEZqPXHfwihlJWFpNyK0lPBs2VtsB237R8Fl7Y4OdC19V9p2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgsXeLB/LW46y2UwQFab3ZKz7MAB+dp+IOXZ/T8PBeK5zq8QfX
	CtvjlEAafb3brwLe/e1+FJsh2f4QW1aUmYtYdy8kzVICSu8douBC/r3y
X-Gm-Gg: Acq92OHg6ELisffGS5+qifwxOZcIO5XAaiLxx0HZYD7VQGhpud5HHXd6icigKoFa57r
	7OmMcDbK5dKigIYyVqnZPHIiyakonVjnjSy1VzUQanFQDnD0g8p+KlbchGeiA7qm7N+FIeXflNq
	EgTT+WKVDgSFx9ptrRMsDpQwVH02B0zwId+4iF6Y3F0zvG8AFpz4RLKXs/A5E9/LhgTSzq0PEGF
	ohnBOWTnTI1vHFYaU6I+SB76Qdnxxlc+6zmKcNQ1ArZS2KiYLG6MiUCe7iv92kx+O75d8GWHVLn
	Kuz3FWV6CazGgL/NwERqISCWQveLF0X9jaSCThPKlQYnK/V6K8ivTmI7o7ZvUkhjEtNXnm131e8
	TJC83ESu6U/CeabUCv+R6OsslZNWXKZfa4CyYZy3KviIvyCy69pgIxsE797g4opAhQPJU9gAmeA
	uA7i9VRWur7XPdrBu1ixJY98aC4yuXJkkPACSEtIzROZH4UulBeyDroZLlc+3EMOn8EOMGeABwP
	O13UbAprQSm
X-Received: by 2002:a17:90b:524f:b0:366:469d:98ec with SMTP id 98e67ed59e1d1-368f799454bmr1558490a91.13.1778651810384;
        Tue, 12 May 2026 22:56:50 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee32822asm1785492a91.12.2026.05.12.22.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:56:50 -0700 (PDT)
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
Subject: [PATCH v2 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Wed, 13 May 2026 13:56:26 +0800
Message-ID: <20260513055626.1070533-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513055626.1070533-1-a0987203069@gmail.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
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
index 7e6b30d20c01..314b81e7727c 100644
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

