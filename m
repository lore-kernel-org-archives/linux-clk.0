Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273103C108D
	for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781887242; cv=none; b=qdeB781cY6c8X3CSIsOwq8YsjeOso1ELD+TTX0yi2LE0YwktmHSE0i+PHOdwe1H1ZhRqCIM8EBFx3CMW8eC02IuEk4q6CJC1ISf+oNsJkq4j+MxlVpHo9B3n1B9PgSebPL/L6VBmEU5coaYqGFMpIj8szvDODoAOvESslZ9G42M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781887242; c=relaxed/simple;
	bh=0gmxz/Y8S+o2mudhnBl6h9k33D+/sgQi5gZaswPrxek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOlWHS/Rv5hQAVQBTDWPURSznPOUfabaDQ3rmXuuhRo1Lq1/lQ6AiznOsrH7+pNZMeIiEyIKfbJLgGIUHNSeFTVafMGSXMiosujnPYcXmP2JWWXf1IRjM/9j6FFDCpdU0H6ZBgjqgEzyAnezN6JcCwZ0Ev7ogwNEbSFJyLPQmGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSOCxIlN; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSOCxIlN"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-463b2f6fc9dso2352905f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Jun 2026 09:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781887238; x=1782492038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pTb+5+kbbizTuU47bb6+ksFE4ZEvnOopOR0YTizKV0=;
        b=qSOCxIlNCv6SQbkqeBnKzrix6GJHHZ1yY+fyF7/8tLzQPAr3lrEAJczbTb6Yi4aCjl
         fCoOwDktf/saicqfOE4Ea2JJqqXKAPNWV4kbGGJSAG2wLZ/sCf2MZc5k+s//+FzWax/m
         RASuRM3wUC9JCB+jdGvg9DkGCCWngLOrOy4QR1/T7yZCZIqAfjV4WBlVjjPj5qX/5858
         fXPielvAR8LGGDsKUkz9F+pAMrrzyi87BJuv9esm8ypBRc4vEpjsa0RfrB1D3bCou98R
         U5WixDYdJkwCc4TYyXQ8YEKlkCbNw/rx1LzbPZFNJaIIAZJKtcpqnVijZpUdbB6j++3q
         IX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781887238; x=1782492038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8pTb+5+kbbizTuU47bb6+ksFE4ZEvnOopOR0YTizKV0=;
        b=Z7mRzySNQQkgLaR+TEyuna9+uN5VyAWXiXNJke9jJva3HzIUeCd4RFrYm5a1aXaVIC
         YKyzYiU5AZs37vnNbG7FfrGblLSXAkm1LrigWD1XdbuhsZLNs13g9Hh4uvjTBmVvoS7e
         E9xy8G574f+IXTPegDcJnaAXryHG0v3/eKAPbJWuH8GSwq2iv6eeOCuik4+08oUF4BLJ
         hv4sP8/QNgGywhh4DQtaudcn3m8tTREGELbkfcxlLCh+LbdvwFNcgbyLEhBWBPkEJwnM
         fE7RnjcQ2L8VYsVJZHb7D4At9htM1oXUwzWD1wFD/SUhy70qI9rZgyQc4HqvZdiktDcJ
         t30w==
X-Forwarded-Encrypted: i=1; AFNElJ/xk27+zDToe94DH2wDmFqesJ+J1KWO5WtJiHzySJrePr91o27KeYrO8VKD3++iQ/54cuxB8ORjX+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6NynjKD0Kvbg42y5yoqROwAHOcN7DHyXYQJ+7IQldqrwe4PB
	MKJRGosTl7yaudVrFw7c32ZAPnwQ/QJDoZWrIBOOo11E1gvjwIGYI5Nk
X-Gm-Gg: AfdE7cls4vVYyedDn3fqLJs1MYUlXEwPt1WvlwMXxw8vULfplAbjDOhowpOHBsxO+uW
	NMRaNTmdNtMWkBzw0O5RT+cvntxndTBztm0g0dxtiNCsz0/oQgKk4xt2v2UMHCc3STGHQ8rZZL6
	wvoBHV5/i8RSsT8oOOnDMzVqKfIIyaCFf1Hn4zvVTA7sAoUL0dWDBNky7kmjhbMGMt32ydtSB2q
	58k2FcCPs9S0kK4FdCR0zmrR+2QAIQcW7WdC3Dn4Y5PNdT2wOlyR8OvYf3bAUiRMFrYoVg8cS7V
	9gqhjif/YZcM4sCt+RlFAYfXNg6bkTI6WE+uqAXBSI60XuYPQ6GXrcdMFtofPaXf3qvfWYqYuUM
	DO8Yzqlx/PKAALd3pMx1rTqx2hcpu6rs09R0EwH9XrBuUigfPQWIv2pvY3wzkDtVhZzF90/5Uij
	A5EyG9v013rM9rsATqp76n9YkjWX0aBlchEDTb+Q==
X-Received: by 2002:a5d:4d49:0:b0:45e:73b4:85cc with SMTP id ffacd0b85a97d-465091bbde1mr5722144f8f.35.1781887238492;
        Fri, 19 Jun 2026 09:40:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:b387:a6c7:e8fd:bca5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46667221de7sm261621f8f.33.2026.06.19.09.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 09:40:38 -0700 (PDT)
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
Subject: [PATCH 6/6] clk: renesas: r9a08g046: Add clock and reset entries for LVDS
Date: Fri, 19 Jun 2026 17:40:26 +0100
Message-ID: <20260619164030.380098-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
References: <20260619164030.380098-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add clock and reset entries for LVDS.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 7cea2c6d2c42..273e147dca7a 100644
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

