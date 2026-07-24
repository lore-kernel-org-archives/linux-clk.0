Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD0B3164D8
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 01:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784857308; cv=none; b=aDk6vJCIWQZq4mjsd5MCy0Q7ruk9HcjjxP7XBTB9RoKEMIKelo5FwbKSaPIlDrCnVkEYvsQBhO5G0PpRP3L0SnniJaR8g6rRYtgkIb/55SmiZzkVWaGOrIYvHvoM5B5Atrlfmw7qMf33NaPA10j0kU22vbeCirD39H81kz7xjdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784857308; c=relaxed/simple;
	bh=KuG8MDBTpthoJNnM9iON1DWMOZcezFRIP9XzzRbktA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQDDTlYlIajbpXViJjGKshi5tfImbl1wJGDekCW+DUtPPHdZM21xgljg9aEwNQWk2MgxY9YnJ8NgaUZzL7EEBS/5NxXR8ncSRet+QOHtHEapqq6eaUhQQqbxZzxZxQ3lS9Rr4ndZyzyOFLCFlTOFD0myzCy44e58KtcrY+T2bJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SB/MNQiH; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SB/MNQiH"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1229294a91.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 18:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784857306; x=1785462106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LauzpK5k+m8ljBN6uorqAHomRi6T7VJzQA2WK3Zl7bA=;
        b=SB/MNQiHrryOG20/DQMXrR1+/7fyXTq96ieTXEDOFr5fZrWtJwr2XC0b/xzOza16Yw
         Ayfqh77vYh2dDRHj6l0gQLhebmmwHW78J2cd1khpxnULdrp4dG4mQUd4KaWs+DdvUvU0
         QjX4BXgtG5QludvYMFviMNR/Sn1EtBGMnGnFr0+wXqSH7sbYqy1iL0YCPThhwkIA9or3
         H38rbKm/IxmiFfXuIZLlF1jRTueFwwcgSRo2p3GZdwFleGjjnLhtHRuUGteXSveaSKFC
         EQg1VT/CyLizWImT/wKqRu4FxIMgY/YdVsn35+qoNjgvVa1oL7Oz6zQHRBNdZtnO5YxQ
         6MmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784857306; x=1785462106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LauzpK5k+m8ljBN6uorqAHomRi6T7VJzQA2WK3Zl7bA=;
        b=YmM4kiUULKVRSjDjht/T8YYDWS3I+fcmYnZXro07Z3UaNKGyAH5l6R8I5i8MG1mNgs
         hQfxD7hSOR9pdNb61VeKfdEEMpwvNn4odZd0cbVCido6rHL4+qopMWS1ZXjuR3PQYufE
         4eLhdVlbpFq5A4WZ5/KDZ4gns/4cCyXmX6DsF6OPJAK0s0RwXTVZZ4RleWw5eFa+bzt7
         ywLsCtlh+ZLdy9BZioUhlaHEipwudqwawElUXoWAD4i5zpehgUewQ+lAEGLoRuW1F+P8
         xFJw0obubpUBAf3ZyZ04JB7Hol/i6lFWA1XKjLhtArVvcDrwlzmV4/060eZIdVQMPPap
         5bRA==
X-Forwarded-Encrypted: i=1; AHgh+RpLAPHjo/B+S5FVSX1MZDdSg7e+z8O2elWzTtPPohjeJbM9YULAQGEHMBXgeS7+Lm/q6OGuc2zd2Vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsP/Ya/NzAWXgQ+AWmza6qiaGSZupUPOhNIy2NLsd6pPOLeFq1
	D64uOi2DvYYXoFZACSBO9BpX4gHr791KJqJ8h2X94cAjIPd1ajhIc6ag
X-Gm-Gg: AR+sD100PCc+tgPXPDjQjlgzqOunH+3s0MPYMveZ/PaBiIUfApJ0/6ROfBmdGlHtkn4
	RyCMZOb3vYZgxnvgYMLcnki6FCVSXj+uRUI7L918fISpAykC87ZpNwJf2nwrRaSRJBPKk4a0XcA
	YfLTfTpaT0MUL8S/xxwjjdGvnrmms17LXPE6usVumOZJzpSHsCXUSRxUCM+ZVocMOAw+OcyQpYQ
	36Th3s1s76CwLez+NEdU0Ri2HL0nqKyGG0l0TgPxHtZO34FJXKQuDmlkV1dXOQ1l6873AT04v2l
	mvsiPOe8dcGN8UwlbgpcOHaohKaqRT0zKpkerSfuNPniRW0QwIZMSNiHGXnIsbzvWur2ZAOfcny
	xPu9CseBx6mzfi2j11wfscfDpnGfb8YCzcxWx1VAV33F74vlIQcuciSyry+7AiJP3od1dbCkm78
	LYSv/HnkIcJf9DfLIIUS4ZyCBFhaa+LdQjL7alkEwnNLg5sfGSVO4k7LdNfrSQQD0=
X-Received: by 2002:a17:90b:57e4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38ec694a6a2mr4903557a91.7.1784857306433;
        Thu, 23 Jul 2026 18:41:46 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f03b0e976sm647015a91.5.2026.07.23.18.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:41:46 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v5 3/3] clk: nuvoton: ma35d1: fix ma35d1_clk_pll_determine_rate logic
Date: Fri, 24 Jul 2026 09:40:39 +0800
Message-ID: <20260724014039.1239552-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724014039.1239552-1-a0987203069@gmail.com>
References: <20260724014039.1239552-1-a0987203069@gmail.com>
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
branch where it belongs.  Split CAPLL and DDRPLL into separate case
labels mirroring ma35d1_clk_pll_recalc_rate(), with a shared
req->rate = pll_freq tail after the switch and an explicit default
label for unknown PLL IDs.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/clk/nuvoton/clk-ma35d1-pll.c | 31 ++++++++++++++--------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
index eb9d69d2077b..878b23bb5918 100644
--- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
+++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
@@ -255,32 +255,33 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
 	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
 		return -EINVAL;
 
-	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
-				      reg_ctl, &pll_freq);
-	if (ret < 0)
-		return ret;
-
 	switch (pll->id) {
 	case CAPLL:
+		/* SMIC design: single control register */
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
 		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
-		req->rate = pll_freq;
-
-		return 0;
+		break;
 	case DDRPLL:
-	case APLL:
-	case EPLL:
-	case VPLL:
+		/* Standard design: read current rate, not configurable */
 		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
 		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
 		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
-		req->rate = pll_freq;
-
+		break;
+	case APLL:
+	case EPLL:
+	case VPLL:
+		/* Configurable PLLs: find closest achievable rate */
+		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
+					      reg_ctl, &pll_freq);
+		if (ret < 0)
+			return ret;
+		break;
+	default:
+		req->rate = 0;
 		return 0;
 	}
 
-	req->rate = 0;
-
+	req->rate = pll_freq;
 	return 0;
 }
 
-- 
2.43.0

