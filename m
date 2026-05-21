Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188983033DE
	for <linux-clk@vger.kernel.org>; Thu, 21 May 2026 01:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327762; cv=none; b=YE94GgIx1erMDxIR6yWqIxlYffcCVsXV1p3YMejPSPVk873ghz76HRDRRr09wmEFFDO8UA+EKUIxx/aMSJegqso8eMa7Qd9huOiaxwcGPhmCor2hZDeHVQAu19PXfdcaWMF+F5TsEC62h2/UzP0SL1sgWu0ZiKpYZbPf2+H1XuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327762; c=relaxed/simple;
	bh=3QjoFwvYtFGSj7HucuLDgEEIU1vwshWyt15pjIaKNU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXJ239WzBbI98ouryEp8TqmRm5HfccJqFy2FH1UD5KaTIt4N/8j13WUED6yJfphIJgEpIvRKa0zWENHe1dyeezPs4vPKhLEcEEGQtQ1r1ZyTsFZftybGDZmu3e9UjP0pKCNcAxMTsBT567fAKrEB2nuQZkCcwnvF1K4g4qdJrPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irKk8JrO; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irKk8JrO"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-835386ff122so5686224b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 18:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327753; x=1779932553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=irKk8JrO0IjqURTeLF/UrOvY4U8X/hWJHG/39evelLl8UUYcrkPCC/UA6WU/pKh+pO
         qmE0P5EoeJtKCrlibuIqDdxwP9DhzVC6v+jTI+vSBX4+A9TVrKSh1S6T5yl/Jfv8jNcN
         f5SCBoKqKlKu2Hmb7DZaiJGiUesRaPB5bFV75uYvp0MV4MzId5bQJ/T38u7jVBFXeUT/
         VQ/j+yF/K7MaWJazBSFjgqD56vuTyCrnSgp4KiLcK5J7ZCgdjlP7267Cn/iBqFT3uwZS
         kqbMMdzzhsYCkas7vQ+xok0bjgfNI9aOlGr1KSgb3gRvIm8DCetGHNJyeSlzIjh5JTYs
         WGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327753; x=1779932553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xBzG8ZBOhqwEqdTqOTAwTbc1kw7Fn4SE9BojLVsipUQ=;
        b=T5QxYdzr5ICCq2FlkaDt3zyMMJW+Gty+mTB16P7T7b3eD7oGAa0EH8DFGeqTP0Y/VG
         ML2yahtoto62aKlRFKCm9AmoMujDTtumNXq39PYa86Ed4ORfAi0YDHcjxncXItMDmuli
         ILCmxn//9RSVtRm6SKWlbDraqtweEuKbZ9GZtHOcdS1FupmgFBwP+drfpmOWShZtzEE3
         ShcaZOm1Kr0CmdP/igXpxK3HpU7uTpF90dyqVMhcSFfsqSu1gVP5G6li3b0SmRd24ENb
         eWzRQuZAVzr8cMXy3/E4qUnZQCHctWrKHBp9T/uAikW07FnnYxOcTndySNh2zhPaAduA
         UMdw==
X-Forwarded-Encrypted: i=1; AFNElJ+BBjiI6c9fabjLLTACT9W8sUcN1dbJTqlSeq04s/fLI7stZLyb1X1ZwPwvRVG9d0KnSfMTISk5/yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPaTigmCXLvCeX4bh9OX4hkBFRnx1QF7wqu9qn1TFL6QNx0jm9
	uwcAKgwMyBkFdA+V75fNGg16MzN7VVgn+3HyKAVrLyu1leAd1PmtZG8i
X-Gm-Gg: Acq92OHaIZX2YbKa7u3MInXjSRiNzmhFeM5DItt5yeSEBJLu/1wRl+asSNcGE/dcr8k
	NCxBzOrH749hup/+XWtdbE9sCAO3Cn133bHm2NU7WJoy2XX4Kv+en8s0ttZWxpD6xU6juEWBa2r
	TWsFHXzMUIpM93w69sbZNxD8/Ch3+g6P8Cu8Wrw8HilwcpUjIOnKTY2avPjP1xvDMGZki7Ljl6R
	wk4/cSvK7HOOtFHIYfI2QsfKCoC9QfJjEfzlXF+/YJFInXjGBSFXGxS4KLOWLjGy6d888be2mcT
	gJ6glZbuWpC1nOyRCL29RnT1J+w75QtQeLoIKHpNawWBY2gM3ah0Z7IyhlwHOc5goFJfBwSyaNU
	pWgoIbYeoggjvrqHeBp9R6N3YhTsFmguOpuLY5pb2myTaNywKZN50yWMzxgk87gAklYHEiuYDOw
	AXF7ZFXWOtsxBgJL9upLgcggpv807f7nYd9mGqNhcCFavEJoH046HE/THEPwgAwonDK6na2iS4C
	C5TYnVkLR5I
X-Received: by 2002:a05:6a00:94fe:b0:83e:d996:92fa with SMTP id d2e1a72fcca58-8414acbacc9mr918900b3a.11.1779327752983;
        Wed, 20 May 2026 18:42:32 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19fa869esm26411475b3a.61.2026.05.20.18.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:42:32 -0700 (PDT)
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
Subject: [PATCH v3 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Thu, 21 May 2026 09:42:20 +0800
Message-ID: <20260521014220.77955-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521014220.77955-1-a0987203069@gmail.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
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

