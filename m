Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9222F3C37
	for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776952260; cv=none; b=LnuY6yGLyttYvuzTdInuaYdASRoCtiY1ITb6TVc1YkZJXchMdknrfEosrT4wXTRS4d200IvLXds8jk+4a/EjXX7opAE6jjNbMjPZDAXdOM2aPBnokg5EPSmczWDiuiO9QYjzLmdNZNqjYH/j6JACb38XMWFoOIB/1vZSBql0MMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776952260; c=relaxed/simple;
	bh=5wTnhObAgPuPoQVvH1SJarmU20nNvDLvu1wr42afUuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmoRUpe2as/D3mNXUWgscxbGtjNPJ3JF0c6DxZvxz9Ki0MuRH3iCrhWfZ6kQBCD3uMe13m4KX2hlxS37TVKycjVXGcPhiCJa4FxuIbkfbE8QNYnUszHRUl1mFZTW0/4L5TOPqoc61DURzY8QMmAi/WE8DQTqyLW0JHy+2KACqv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blV0tnyl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blV0tnyl"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso62447435e9.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Apr 2026 06:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776952256; x=1777557056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClbUnDx7cL/cY/tkUoHImXX4Jy/87lG9dAwUJcgMD1k=;
        b=blV0tnylRHPZk4Drz4TFOTmZW3y3UJ60IezaXiM0xRIJ6JIdm5bCr3PrcwLiRNvTcq
         4VryLojRdxgdrFnLVDC7Uf5fzXYY/icmZiJJMV9srDUvod8sgCkKaqQedrBCoku2s5b/
         RxAJPBBSJyzZWmKVy8KUr1ai0C7gVKEp0pJM8sdLsbR76FxtCI0n3M8T1uQV8f2UqVqW
         R3p9Hkwc69jOt+Y7VwRBcFULOQiAp4/cT/P4mgz3VOztTHdG6KFXbL/38mB1SBS9uUbf
         8sTEoCaqDAd/OT/VRDBo4f4/GF7TJja6Y+unsfdIxB4V4jJX1UXaWaRe+163Hs49svcx
         WDfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776952256; x=1777557056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ClbUnDx7cL/cY/tkUoHImXX4Jy/87lG9dAwUJcgMD1k=;
        b=PjavRiLVLU0Yfl2TXakk3s5wXeAOYsFuktCsupqhD6fh3aSr8i4tTuh7eAbWyRUzm6
         PK4pN0rucTfi/towYw5QljtzPEiH6JZ6jPPnaAZNuLuVYYzNFUk6YsMSPIU2Q2XO49We
         TXvu4Tdtg/90FdXMAPTYvctg/eVkQBLUbioGZtP1XZdth+8bRKWbS/HbfIxz6Z63ewHi
         y59Pps1S5gYmzhM2qQ4hwv8sWDoeWB/AcYS/UbH0aOcdEUyI9HfhL4nCjliDUQf2HFc6
         aGlzBiZ5Ix09TM+6HIrOWwYY5vP9h8px6bS0xqQeIB5RfLOfdYc51+FnSidRxnB6Wd4M
         fTGw==
X-Forwarded-Encrypted: i=1; AFNElJ/NyLPeHKRjq0vjsQIqUX4Ie0ffJMykYY+BLCAfoB9nz1BXrnSFRG2/NgXGhEUMhsnejOKGlkWpX1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvupXDPNEFB79muoDqNcsy8vu1e4t7kXy/imTlzwzWXJFGkFtX
	pASDWcU09lvdROxyxKW8F3uwfXBjOugTdH/RXmvxaLjHChkFugWPfjcn
X-Gm-Gg: AeBDiev0I450Fgt1A44xC83Lq2IZ3TMluPWOKrUjNJ9/tY5NVAipGI1ZRpmE8p2V8Ki
	+AgKMN0TN72X2P5owYCDc6zLhe97UnZEM/hIpDbHax3rFxrukhv/RBZ77CCrgu3Z4M087jSEEma
	xhi8YOLMT9Dbqt3orXot+TIF2KdBlSfPXJpu9ddj38KKCpYQc46rGjLDOJhzS+/hnqm9AsBHUmP
	GcKq3wuBz9Lrtu+hqpmfekuLlEmYsVjXVt/uigusrlRGikXSQGwb7Tukw2+A+lWwHEPP5yNDQHa
	Cvg8/P7IMtT6ugzM/h8QVph1ae4yrk+ydswINN5t9d9huO+MIho8xSZBrI9Ye1nI4v8azUy/8R/
	HEF+qw44g2Y9hStGwSfXEjnXXhG7QIXrfElhRn7U+CuFvtZfWGq50LK3Q2wwY5F402qMVgSB3Ub
	yha+Wv+rh+VeLueLBfDtLei0Q7hj4ogNsHH2elrQ8ezChjXwPKgir+5iSrFNE=
X-Received: by 2002:a05:600c:5246:b0:487:219e:42d with SMTP id 5b1f17b1804b1-488fb750a1dmr383325315e9.11.1776952255969;
        Thu, 23 Apr 2026 06:50:55 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:c2c5:eec8:9509:382e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a52583fe7sm228134335e9.13.2026.04.23.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:50:55 -0700 (PDT)
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
Subject: [PATCH v6 2/3] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Thu, 23 Apr 2026 14:50:46 +0100
Message-ID: <20260423135050.238400-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
References: <20260423135050.238400-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for PLL6 clk by registering with rzg2l-cpg driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5->v6:
 * Collected the tag.
v4->v5:
 * Rebased to boot series.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 6759957980f2..fed9607af216 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -29,6 +29,9 @@
 #define G3L_DIVPL2B_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 5, 1)
 #define G3L_DIVPL3A_STS		DDIV_PACK(G3L_CLKDIVSTATUS, 8, 1)
 
+/* PLL 1/4/6/7 configuration registers macro. */
+#define G3L_PLL1467_CONF(clk1, clk2, setting)	((clk1) << 22 | (clk2) << 12 | (setting))
+
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
 	LAST_DT_CORE_CLK = R9A08G046_USB_SCLK,
@@ -45,6 +48,7 @@ enum clk_ids {
 	CLK_PLL2_DIV2,
 	CLK_PLL3,
 	CLK_PLL3_DIV2,
+	CLK_PLL6,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -78,6 +82,8 @@ static const struct cpg_core_clk r9a08g046_core_clks[] __initconst = {
 	/* Internal Core Clocks */
 	DEF_FIXED(".pll2", CLK_PLL2, CLK_EXTAL, 200, 3),
 	DEF_FIXED(".pll3", CLK_PLL3, CLK_EXTAL, 200, 3),
+	DEF_G3L_PLL(".pll6", CLK_PLL6, CLK_EXTAL, G3L_PLL1467_CONF(0x54, 0x58, 0),
+		    500000000UL),
 	DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
 	DEF_FIXED(".pll3_div2", CLK_PLL3_DIV2, CLK_PLL3, 1, 2),
 
-- 
2.43.0

