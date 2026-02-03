Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38983318B8F
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 11:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116547; cv=none; b=e1TsY95g96JgsesH8d59K+bz48tm9E1xQOuz2P9wAExaj6OBXzm+kixL6xXPaaTGkqeZVY+vfottUksV2jAMt2ugN8VhUMy+JVF0UxifaGsIzjO8BiGzCCQUjYnchxBAoCwnZtECqc9YouitdigWTMQgNtCLZ3171NIfQfQybmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116547; c=relaxed/simple;
	bh=vOflt+atRten/Nqst1jjUTFAZH6JuJBciL+/IDQ7kto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=siaAjosd0AOI9mP+RUx6wK7JBu1bVWrBBF+9SqAPz0LmvsxXqbpJ5QnY+CBDFJMtAQo/kI0kEddJKcBJZ1oW61zgOKmqSJDl6Kc9YDde0GS+QDh8Q03Jjq+HM0oW1+OlkCKhZTIH6QrTeWDPq9yVahoCJo//Mv8UrzvxK2k7qZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3Fx09ia; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3Fx09ia"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso32520645e9.3
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 03:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770116544; x=1770721344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTOB99JSWbdOr4Zx2FpEkBOJM3Ss0Vn+3hSwsBCxk+E=;
        b=E3Fx09iah366lXACKYr5/Z4PFlHVFCFRtki11D+uj7pSPtWyz8FXgr0h1jg5sxtyl7
         MQ+4NIv+G5wGR/8GPDtg42xeS5/3kfCCcSRsqVJI5sBpVhsUkIR6+xg58Dtm+0Wo0RWJ
         qcit3rPPXbAmJmDqs3wLxrFa9WEuPh6MONII/2oz1u7M1cbPtlbpdfRm4a0KBOh9sk4t
         vYnCGSj6crVE60gCLh4mCsxgs5TaU7L7k/f2VBJvo1E2KuUvntDGnAWYBMBg6ZB46WHa
         05bsGCRPXb2L9sC/s7VfDmnxh5OMyl2/FNAAKskv73QPNEbkkZyE0cLtlgE8qFgs7CH5
         ehzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116544; x=1770721344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTOB99JSWbdOr4Zx2FpEkBOJM3Ss0Vn+3hSwsBCxk+E=;
        b=FFUUlkOpWPETLmkXLRzjT0fA58e2OXhxmNl8/R7+XCdHpdiAHLmt1uWH5Kx9+HDzZx
         URBmLNCumgo4+ILG/wbm2fAkmXPoodgzU7vUYdEoMWXj71B0nqfgTKAu8X0x9bLWB11g
         76alslv8bb/qlBv8PYxjkobK0oZjmunOXBaITNfluCND05XLK+gvGRPgWA1LrlwRSTGM
         0pF0c68eiAzInDZHaL02RrdMZn67v9HJ8jUKmJGn0Md2RAt6HV6JEr5f13vRc5tc7kUZ
         ILGSlaZxmNyCGzIgbajEp+wrY8siXweaawtfTQNTVNVwYOTR00numb+McLgiAg4w1r0m
         FeKw==
X-Forwarded-Encrypted: i=1; AJvYcCX9254HoMg+6uKMbvRlxT+Jw38TXkTr3zJkBaZJ9hzdBrV0b8yvUzKJrM8XssLkRcZDcz8TEstf3Xs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4NyvtzlZuCF/Kkv6zWuqAB8s6TeS+1p3j2+havDK+suZpoyyg
	TbKWWpRRYhgtNFrTqu9wljwzUXmerKHO+pVxuGkYgbIu+qz76JNw0N1/
X-Gm-Gg: AZuq6aJg5f+G8355sqtA/osYrAMLQtAZ/f/imyE9E4WWB+Qt/ZYGx672QEB04rj1rfs
	uWmr3JbKBhviemB0Amgr72NOnh3GvEhQ1nHaOfYpsKculEOOwtU2JuL4pHspsmSjFGNR5P7W81L
	A0NpSqemRyr0vRilC9H5YldMHknuNDrkAzoqiOWVYGdK5nak29AL2KHn4WW7gpgwZZrucjdtRT/
	K1PzWorfR2INlu0F4v37s31Lyt/SgfImy4zK9D+mpaN0Gr+b57qzF4fMzY+wCVkFhDwXu+u1kiw
	Flp2zT2RfaQ5104Gp7N7pWoVr341NSSINFytvO00fGmk654drU8VWjjj+b8WmR4gFokaiO3BXeY
	6z7eIz8XS5KhcC1CaKVtErrX2HJnE59U2oYYIVNapVO9X3OpOysVyc1EGDILr/lfOJf6DL7OiWG
	eU+q0oAkMrFuSAMDCk1g==
X-Received: by 2002:a05:600c:474f:b0:480:6ab1:ed0d with SMTP id 5b1f17b1804b1-482db452587mr188088265e9.9.1770116544355;
        Tue, 03 Feb 2026 03:02:24 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm54110495f8f.33.2026.02.03.03.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 03:02:23 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/4] clk: renesas: rzg2l: Drop a check in rzg3s_cpg_pll_clk_recalc_rate()
Date: Tue,  3 Feb 2026 11:02:12 +0000
Message-ID: <20260203110220.265748-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
References: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
is SoC specific.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
v2->v3:
 * Collected tag
v1->v2:
 * No change
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index f4deb5d3b837..945e31c8f161 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1107,9 +1107,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
 	u32 nir, nfr, mr, pr, val, setting;
 	u64 rate;
 
-	if (pll_clk->type != CLK_TYPE_G3S_PLL)
-		return parent_rate;
-
 	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
 	if (setting) {
 		val = readl(priv->base + setting);
-- 
2.43.0

