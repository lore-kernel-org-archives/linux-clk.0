Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141E3F929E
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534407; cv=none; b=f81LsE2olqsu7bglcOCEKrO7bzxwuTO+8L/Ng8Rqj0dGQTg5bFqjuMgDHlf9K9DoTDPBO7P+vs7rudS3ZAsg0Ny/rGpDOPFl7PtrYUosWtir6Yp6qxZwb1Wa7OcvFWNUHiYFy4IwCmJKl6uH6yphKKmHIeMG0sGGvhY7i/WZEb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534407; c=relaxed/simple;
	bh=m66F2sL25SNBJsCp1T2HIzM0RPg0EP/lLtzkItOGeTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOrZYeUFyhzR3sttMICQ5UJtHfMqmTWAsRURQpK0Rc4hObY7f+OkFFGHYV25bmIR0US8R8sNB3a2YyyoT4u0Hrqwf8znOAU8M5SOcl2KcddyLG6nOAHJzCdDcGjvj62D4tVueQnuSodqLreMm8b6wtunjBjf4vQE/IAi5Z4OGKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9Y5BAEC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9Y5BAEC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20685355e9.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781534403; x=1782139203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZU/52Hsil9tk4JLlHlSaydCvbsd+hTRfmIz26QTpIbs=;
        b=H9Y5BAECGBOY2rbXHVx/Ncm+oMUbsHX6DeIkcju8psO5UMzVbfTzn0mVFtNI/M+2SM
         fTfxRjEcRQsN/vLyEhtYhDulpBatU4M2xOUqa0GOaXy+PWt4bfcwOvPyxo9Xug3sKTe5
         yN67/3Vy23shGqNf4+xbaJAvTKXzgaLVb3++o2z9OLvve+5Gbi3z5GtKZi8KRyQPJJP/
         YK7NVxxBUU6JDxXEOvjt9nqwB0T+o9ZG2xOPK7O1PJgvxDaR1FJKmxlemW7cXta+bDVW
         OxqbZ5MgMAa607Qhyl/EoWPm5cYWpF9i4sGINfc3MmSPWP5LX1QGXdV75DWvrnblHgT+
         kcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534403; x=1782139203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZU/52Hsil9tk4JLlHlSaydCvbsd+hTRfmIz26QTpIbs=;
        b=ozUO2Jt8dU1U+XpjfwMY5hegYupp5/OXKa2pu1vDStGmFhkG9y81kVbTl2izANW1ZB
         GKOQ20m0maeG35tiVHjZAlcy7PKMtX5x34wEHqfFs2hWFdiojbfKRbmRbTXC4O+adMmX
         CDnZ8+l/hzmK01E4ThPVGJXaRlWrdtxS5TF9h4GAZM+tgGpjFU49PfTl2C5VDKNGVAkO
         KmPndAndc6N3SRpCv0vp6HYvF266BF/y5j1YlA0FaHmUk5Q9gx3hHK+qjkb0agRMpsFG
         yzAEmMaMIXDJoEYhPalvNHOCGXSm+IetlHma2L/hbYMQhL+ajKFucaSS9uHvoM9nfo9Z
         FEwA==
X-Forwarded-Encrypted: i=1; AFNElJ++LrbXPrGMREe/IHIy4VDbxfi91l+udC0zEe1lJCJOpuipG+gjwiWDboSGoPBty+Sh9t2jqoO/zwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKH1avDyhCrxuf5krKvXxfVMHlubvuTLbNR4Tw4Kde3zDrWRsx
	l9mFRt7AW69IjVsVwJRFkrXI3VxGaGs0qFOg4KgUWHKH3N+V9YOYE639
X-Gm-Gg: Acq92OGb288wrizkS1Pujp3DCzcyeiEW4b4l6Lp7YhonQdIs+c0L2c8X18LP7g5D1HA
	pOBq3aQq0KYJrwPxu8DD4vBGrHHKcP5GFJpE+IWyF9VDfqf4zDVI2lXM773LvEMaAvYgjD7aVUc
	W2Y37qp4WqDwiLkFu+3iwLNrxaRd+gBqWKhuzkkyIkKHNGjYGA0mAFn2KKy+/6AU7y2Evbu7OR1
	LHXt/r5HTvE6Eu4MowJOqy9+Rh7dZysyz5niJu4eWX2RjW5gjKyRvSEqqbdl+QhA6rFg7uwLCJs
	5U8t5gIU4l7uIB8+92N18hL30NZbCWCZ+fr3XnqfNWsmqqFRgeqr8P4NKH78kbexjhTjHDl1hU2
	ashvl7sN9260aTlneaDhApWSTz0Wi1l0IMAW74Epleb5C8KlCi39iHmmlZET1/+jdIw1tGbwBGJ
	zVrHcxPJQ1/1D5wYKi3YbzB1Jm3Gnu0V/nF76sHdecNknaLA2RqRU/5XxM7Xkw7/2IRN4lLkJcQ
	Mv1lmSS1xjKkGDT0GncbkoepEDhmBilH/qT
X-Received: by 2002:a05:600c:8b56:b0:490:e60b:5fb5 with SMTP id 5b1f17b1804b1-490ec527e4emr178094045e9.34.1781534402500;
        Mon, 15 Jun 2026 07:40:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c05ebsm256627915e9.9.2026.06.15.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:40:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: r9a09g077: Add RTC clocks
Date: Mon, 15 Jun 2026 15:39:43 +0100
Message-ID: <20260615143943.1610095-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615143943.1610095-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the core and module clock definitions for the Real-Time Clock (RTC)
peripheral on the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 873c41ae5606..5640c2035e5a 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -149,7 +149,7 @@ static const struct rzv2h_pll_limits r9a09g077_cpg_pll3_limits = {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
+	LAST_DT_CORE_CLK = R9A09G077_PCLKRTC,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -337,6 +337,7 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 		sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_div10_div20), 0),
 	DEF_DIV_LCDC("LCDC_CLKD", R9A09G077_LCDC_CLKD, CLK_SEL_CLK_PLL3, LCDCDIVSEL,
 		     dtable_2_32),
+	DEF_FIXED("PCLKRTC", R9A09G077_PCLKRTC, CLK_EXTAL, 128, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
@@ -367,6 +368,7 @@ static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
 	DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
 	DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
 	DEF_MOD("spi3", 602, CLK_SPI3ASYNC),
+	DEF_MOD("rtc", 605, R9A09G077_CLK_PCLKL),
 	DEF_MOD("lcdc", 1204, R9A09G077_CLK_PCLKAL),
 	DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
 	DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
-- 
2.54.0

