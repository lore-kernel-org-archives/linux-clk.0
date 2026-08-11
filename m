Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD09385D7E
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 18:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786472864; cv=none; b=nhvlouiiWSIidKJrgbDnnYUeQaTQF0udnkZAZ1nzxqAyxIHe+CTrvFo4UqHpHHGycQ3F3eYq5pPoIgweA/RjxA3+otX+CbZswChda3cf83ce6Ld4tbQKXM6Z3tvnfcHmlRrQc5M4aYBcyNIh2wdpQPlqtpx6MqrSW7kfIiOt72w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786472864; c=relaxed/simple;
	bh=KqOrvF0Ngr2YHJvCxNMWfSlQ1XC20shxMBAkR/0xrFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2b6rr/T+S6J6TbsGlLS3eCyYI/XZCURahcStzZytbfR2mvob+xuxywdJyaoD586mTDRVOxmgWLV/X0fWoi2X8uy660sAle+KfULyg8XG0Ox1oGJVOpDrbdPQcNbILeN4HCUz+5pW7PKKIuAHHXAn74f30pBzzvwMvtwcj0LABE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pq9bORNX; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pq9bORNX"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4997581cdc1so756095e9.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 11:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786472860; x=1787077660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K5Ct9lgEPKcweahYIxO09gEuDKprw03jCz4J9g4FiMM=;
        b=pq9bORNXRQgEEuyCood874aQ3z65JPxTS8ByG7w+c4I/LqZ1Yaam255vw7lPo7VdLG
         OTqj0BQgAsLVZ6OITs5J5P5xosfVMkQgM/P7rebH0PSNQKOq8VS9ADu0LzfU1xwqFe21
         rp+0T3pJxHSumRZ23YCgmUyzTGWAAios5Yf5TYL6sooWXVX4XcyzhPYens7eDlNiY2GU
         CWy/wkw3fJMvhZLY66BA7puZB+5D8SgIZpdyZeZZjNF3PkRA5x9R2Motk5m39dQ2Bt28
         Xvf4ZBzXCRKdlptJ4s4XVyxEo6R2G2g1PU8h2qcwjjojf0hzgc4A1T7cPhJ0PF7RYzas
         jRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786472860; x=1787077660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K5Ct9lgEPKcweahYIxO09gEuDKprw03jCz4J9g4FiMM=;
        b=gEN9Xmv+yZi52AWN/4Ymw8CGzyR6ioNazgm2L3g5FkDDz2ExgT1eBLu/U+cgnHEvfi
         0Uvqqq+O0DZE9IZIVU32tBK7zna9XIgEcWYZC7O2KeUHSy3jcTN2rzyo3w9qGNQwU5/L
         1H+GhY/kQDtURXnTiYQqHlB+qn57chwJou9NIuVA7JehLSOdsLwlMLt3EN11vhfo2U1T
         2SgxswFXFr8ytKtnng8BGKvgErynZojiq8JbrdL0WKDQERDAvgnte0FdhXl/ZjLLfQi2
         YwSxzmlEnl2p4peMT5g0TUUkkhuNvwmfd8qye5ltWa1rbmAQHitdTQbjGFRcFFusFqiH
         R4Gg==
X-Forwarded-Encrypted: i=1; AHgh+RpCT8ryH8TL5vU901r9trPVtmcP/HJB/lr+G1lNsfojmgvl0VCW3zRN8K3pks87xObQyF5qRvVc3p4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeqTIUnV/4XPwduw+MLIdZPYRcV16r7hWUnuQff/eBJvQ/eHX3
	SV1k3t5P8Rloh0Voe8Y+0SGcTii18QDoOaFLTRuaFKlCE2jlRFIGaDyn
X-Gm-Gg: AR+sD13JxfL3eVEkATwjf5q7b/C7kCKdZVBP56v1O5y3HR2gLUsXaepIyX2wduSnHr1
	Uorrvwtj+1qzj93LikWc/3Zd1cn2fkHHClq92Mlztb99VXb2lCsCiEtnhV97P7xLXkfLnwFWJW6
	3iAj4Q1h1/AR04KPaFzGHm/V75wRCfUbgeSQSWTmAWrJTYwSlymugi428mahxB2/95pe7qEe/Wh
	XnCU3qycOT/pxKf7H2a7NcbvK3rpZQRY/56M3RRKL9/iV3eHO5T/NZFAI0GKqO2UXXqiKZBsvAS
	OikGU+KA80GOVnlH4TW1KWRSw193ns+kLKhdtviAsbwJp+WU977ZKhbHaH2vZIdzffgHfgzfv8e
	pHb4qkUD6KpjkK3eq6bKAb9N9a2ILYRWfJURV3ZVOicEBikPeFtpoD4eMtdksdcTp6JuBMoIcJ6
	diNIH/BFrK6lCeGMv5HbncWOfWRuykXxXasP2ZywizHmqCjypdT8vnLqrlMNpvUHFivneOsV2dG
	7Vt6t5cWjKT
X-Received: by 2002:a05:600c:4693:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-49978468befmr57738645e9.10.1786472860294;
        Tue, 11 Aug 2026 11:27:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:935c:3ee:d543:9da1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997aac8c47sm12499385e9.15.2026.08.11.11.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:27:40 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 9/9] clk: renesas: r9a08g046: Add clock and reset entries for LVDS
Date: Tue, 11 Aug 2026 19:27:22 +0100
Message-ID: <20260811182729.360959-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
References: <20260811182729.360959-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for LVDS.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected the tag.
---
 drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index bd3ae08e626b..5878423db151 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -574,6 +574,10 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_MCPU3, BIT(11))),
 	DEF_MOD("rsci3_tclk",		R9A08G046_RSCI3_TCLK, R9A08G046_CLK_P16, 0x618, 11,
 					MSTOP(BUS_MCPU3, BIT(12))),
+	DEF_MOD("lvds_pllclk",		R9A08G046_LVDS_PLLCLK, R9A08G046_CLK_M2, 0x61c, 0,
+					MSTOP(BUS_PERI_VIDEO, BIT(11))),
+	DEF_MOD("lvds_clk_dot0",	R9A08G046_LVDS_CLK_DOT0, R9A08G046_CLK_M3, 0x61c, 1,
+					MSTOP(BUS_PERI_VIDEO, BIT(11))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -637,6 +641,7 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_RSCI1_TRESETN, 0x918, 9),
 	DEF_RST(R9A08G046_RSCI2_TRESETN, 0x918, 10),
 	DEF_RST(R9A08G046_RSCI3_TRESETN, 0x918, 11),
+	DEF_RST(R9A08G046_LVDS_RESET_N, 0x91c, 0),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0

