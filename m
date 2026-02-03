Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22F134F484
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 13:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770124257; cv=none; b=Pab3/7n985QxDDEZZJtNo9GZo8sEicDJ3oJFSdDC1Kj98DiNvG7aLnFKsUQrp2jTehWk8czk9gaP899fW4Wvl+grkJ6TRU3PG2lbVzeL03eyEUNmaZJ/jFXACWxqRZj1OuLTrNoxuWFMO6EAO/K2Gf1zRB/H1CiBiPEpIp4zDdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770124257; c=relaxed/simple;
	bh=GtD/9l/D42UM8AefeKF0lZttZ6YGxQt4M7P3WCXGqKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9m5XS49sHRH94WWcshedryVe2yvkhRNkGiOkuUF8MmO+3YhJUTbhutTyDpRPl3o8UHiQ+sIYJiqInzMMIr1Kv1kAMsBKMvYrXAYj9yu08XpJqmsFODj+5fE1TqdrLn2n519GOdBBqtMMJWYGxf9Bw8gSRWfuSnjgmF49nXuTEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgDIrgkU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgDIrgkU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48069a48629so58200265e9.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 05:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770124254; x=1770729054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3okOClBXUJoLFyNSUEoNAcCjGRrkRSkTJX+qEfn7Ojg=;
        b=lgDIrgkUIJbruFyH6BvfUTcYDFBSLlbXgLcnk0upCyeMIbGPFRP95jLsVXbl4P+IQ+
         +bIeEI0NTNGrqVqSPSundF5N0td4NorGpquc9hzj7MRAHJxTo38iS5MgVPR9Y1AbnQMS
         SBARfrHo+YqN2JK8UwG/h+0/ywyV91s7rZfMH+COdLx0jQOYwOxDKy+unCAwPUH+9rrr
         q8yvWLi+158qkHR4VhbS1qlvEx7uxtsoivmdfAgX13igeo0V2ph/GaXnzYE9sjjisorE
         ZXdl+a7t87pcDgHOdglhNTd+vV7ZsLxPz64ptrORXF2PMxcINKsec5DA9kmQtrc9ILK3
         nYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770124254; x=1770729054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3okOClBXUJoLFyNSUEoNAcCjGRrkRSkTJX+qEfn7Ojg=;
        b=bK/7ogYmtlFhZO3FpW96SUhbeAcOuy9oTH4Pb89sK18vXTgHy627Q6/UbBNSY6DhIZ
         rlyxpU+GYjlLbkFNzjdOkBulqfbqVcDNgQk7I5EnWZn61dsXTLo0vMEm1jAWlmOGus4V
         +SyzOpXBtI6IZmdzF/ock34d61qUrzmpuSBrBWOXgsLUZVxsZOGmmjCziMaQv33786Up
         4zXFNdxZ4c/UN7iMHvqqKF+9UMZlQ+kuUSfrMlDoLPo21uY/td0EUkMtems40C0M+rYE
         v26Fb2LbqZswZcRj0RwS/v3iHqvDIvcuAWlV9E0y1glTbuJLhpj7nBshH2huvm+pu92z
         0j4w==
X-Forwarded-Encrypted: i=1; AJvYcCWTRfQaJmIND5lk2QXBrPhMXkgEiI+2yoR5f5SxQCyTRIqpklnddr6nDNMtFqP8jc/rnzXZbmOfmBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG7rmbJe5ojY1GczvD1L5XL+dZ/tzhSpgUNuoaDYsdK6Q+wbBH
	MqVmh9YNqo7TQjjG14tZlonHT01VGrv4hGvWW1U83DgwodeTrJEb+2Fg
X-Gm-Gg: AZuq6aLLn4l1pSiHNnXvfKwT90k5+4Ipy1vt8309yQtBgUJxDLw+61P8E23WJwuUZbQ
	oPIum+dXP5SfSVlzEfx/aNJKn/m7uOlKcohkdaBHBO9gl1NL2c0YdF/imBDpBs8n1D1mCR+z7re
	l4V2J2MX6IkMkejeRIvywyKZTKUh8LCN6rO90vc1RoweojjhhV0yHhQ1389nYKWgEVkIImj5aH1
	wbsoILzc2CFt2DpKrqwpEFYIjitZ/53rxGYA87pI7oLzgayiKwBBZUU594PeilU6n/zkUFm2O1J
	zPC0FXtQga04+F9mVnRJacYHcJurUjYY8tEPTPaxhqx53sdq58+je/eIPR/3HNANhZp/M7SOaB3
	Ds39YqTjLc0GwXuUCUf1wUus+u0KYWlFzPsrMiKTuPC3tLNMsNcRTgXzPUsAFucVoOG5iCG2nGr
	IUE3k/GjxzjqWjK8x29w==
X-Received: by 2002:a05:600c:138a:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-482db48e4a7mr232127365e9.25.1770124253800;
        Tue, 03 Feb 2026 05:10:53 -0800 (PST)
Received: from biju.lan ([2a00:23c4:a758:8a01:9cd9:f748:166d:55fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830512ddd0sm63662185e9.9.2026.02.03.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 05:10:53 -0800 (PST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 03/10] clk: renesas: r9a08g046: Add GPIO clocks/resets
Date: Tue,  3 Feb 2026 13:10:26 +0000
Message-ID: <20260203131048.421708-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
References: <20260203131048.421708-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add GPIO clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index a2856d8fa95b..795dc700bdaa 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -174,6 +174,7 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	DEF_FIXED("ETHRM1", R9A08G046_CLK_ETHRM1, CLK_ETH1_RM, 1, 1),
 	DEF_FIXED("ETHTX12", R9A08G046_CLK_ETHTX12, CLK_SEL_ETH1_TX, 1, 1),
 	DEF_FIXED("ETHRX12", R9A08G046_CLK_ETHRX12, CLK_SEL_ETH1_RX, 1, 1),
+	DEF_FIXED("OSCCLK", R9A08G046_OSCCLK, CLK_EXTAL, 1, 1),
 };
 
 static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
@@ -229,6 +230,8 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 					MSTOP(BUS_PERI_COM, BIT(3))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
+	DEF_MOD("gpio_hclk",		R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
+					MSTOP(BUS_PERI_CPU, BIT(6))),
 };
 
 static const struct rzg2l_reset r9a08g046_resets[] = {
@@ -240,6 +243,9 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A08G046_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A08G046_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A08G046_GPIO_SPARE_RESETN, 0x898, 2),
 };
 
 static const unsigned int r9a08g046_crit_mod_clks[] __initconst = {
-- 
2.43.0

