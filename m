Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103BC350D4B
	for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 12:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769605142; cv=none; b=lh3dUc7R8akYLaoz9wDhTsalrD3tNkxX3KJHb3L7rWzKwL/fMlNNbU0900xeJq5lnk/tu9CiuvQ7Tx3y5aYaptugL/nRYE6yPN1AbIqhrJigLhhIAIczcMGrwYxOMejrbvIHg8m45TYLehkWRtNCDpXa6ZRv9qZ9+JAds7EwrPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769605142; c=relaxed/simple;
	bh=ZMSEbUn2rNHG3ChfjzjL8mmy+jPIA8ebIl6kc+le1vE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D6oqCyTbwX13IRBlBCPDUKjUsVLKZI2L9iHRhsS6aBsgkzYAH09GXVDtLjX/WzLqY2LydWLG/ayRdowhXf3r1UjHuWmdxkcxeRNMzu2j5GTGWADHtL7JA6ubRBPlBlR0YgLWhWZoTnmKSYKwQTzyKnaJhnehdAueU/hts2XERyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=an79Vu+B; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="an79Vu+B"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b884ad1026cso1108405166b.2
        for <linux-clk@vger.kernel.org>; Wed, 28 Jan 2026 04:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769605138; x=1770209938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGAUwDv+lL3+4dwuDknORmpSBzHg4WpRaIurkPYiIOM=;
        b=an79Vu+Bieigsu9apodcTzGeZHWyRnqf9DR2I05llkHM6bV+D65vhkWQSI1Bj37/t2
         zg/dMxvN2kixQcvIuxxYctPQX0g5OKrWCCWeA0KOxN2LuVaCk8cfaVnTyoEJj61lMUlI
         zE3JqAnX/gmma8DQiZR5w2zaRTONCk3SpZD0nP0RYnfLMvDU+bcq2VGctu1FSVUsX78o
         tYlCiE+3KXCcm5AFBgmhKyUUsZ02pj4UxJSCMO92UZLeFafUL2XY+AtW+5nXsoclVlWJ
         VpG8fyZQcLJr3GZddfNAyb8ho7EB8W/aE3Wm/mvyrWYzSYJMO4/6fW9KhcmYfH0TTFif
         a1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769605138; x=1770209938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGAUwDv+lL3+4dwuDknORmpSBzHg4WpRaIurkPYiIOM=;
        b=uaNVYkCshR4NjR99/awqYaIYjaHdUX/f6d28mQ1Sm/kNRklWVaC5g3wYpgr9deygZi
         mEN0H6RQ1oom6WbRw5dQGQuXdAvsnXWK0CpJt1GBpcTOZSRBe2eCCDyiuui0uQlYj2kc
         s5P2RSEIsLyo2zvQ2Fq/B2ppVjAO7TmN+gtntrbCCHMJVs5Qg3ixow4GTB6YhAN9lWPc
         XoKfQmPU1ShsIffwD3vhTsrPuOGUBjDxjmhIcBuUB/aFHgc9Zdmz+im041W5xuPptheJ
         N1e/mI5g0y4mlvssr9w3M0NIOUp4sbpbce5pPzC/omkL+3rxvSLv7ouG/OmkrScXiGTz
         0Fuw==
X-Forwarded-Encrypted: i=1; AJvYcCXRFVlgk0kefvwjqJcVKErebFSXBNfUWWZonpyU2N+1/qs1WB/GZe8Vr/YAAPLGX3uYjt1IABKjtx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGJQjmhXPGPfC0LQ2SBTTZs4Er1gK81Ar6kzcqqS7pXGLfbG7V
	TF3q51spav3Ds0oteb4rb1S2FUfo3KkOMEQ5HdlzcSV/PY9k5J1Y+lrY
X-Gm-Gg: AZuq6aJqwpJU2kIidhrhfiQ++E6N0M6BmxenPPgyAitRkzUWXvx/vq0Chd5JlwHAYA9
	l82oHfEwGXYPRhtbJSZtJXy7D7jModdH5GF7v89kQkA8oTQLvK2Htdrs+iNrCRNHjMdlHpWGLz1
	PsuF5DdRQYvIy5z6GDFs/tF+0F8+Zgc3/uPEHvizj9vw+uJX3uTYL23Y6gz1GRX609wa959q7QC
	XFcq7CN95RtO7AGjBAK+R5O+e1VFPRlsXo6SzHDCx2nZX7lS/eZ4qI8AGKRoRpfi0NmRoFg4he8
	Ru/Y+zI2kr0WlAXcm9RRpeecomV7RCnhV4Z9AYU02HOwysO7B4FL1qjb/P8QtRXHtP8lpb0H0YJ
	86iC+/ajeHqVBBICTh9AwNMdL+ptNnAJCwHyGxPR9O5FguEZ+ero8TfljX+rAOOLsQC3Gkgfdak
	dQqoovrY0CyZno91/MyahJbRrGpuWNNs/rFkI=
X-Received: by 2002:a17:907:3e90:b0:b88:31c1:c770 with SMTP id a640c23a62f3a-b8dab130a35mr365619266b.5.1769605138264;
        Wed, 28 Jan 2026 04:58:58 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:e29d:6e0e:72c1:d15d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2f3e26sm123344966b.67.2026.01.28.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 04:58:58 -0800 (PST)
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
Subject: [PATCH net-next 5/8] clk: renesas: r8a08g046: Add support for PLL6 clk
Date: Wed, 28 Jan 2026 12:58:42 +0000
Message-ID: <20260128125850.425264-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
References: <20260128125850.425264-1-biju.das.jz@bp.renesas.com>
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
---
 drivers/clk/renesas/r9a08g046-cpg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index d77934872cf4..cc7d3872e9e4 100644
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
 	LAST_DT_CORE_CLK = R9A08G046_CLK_P4_DIV2,
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

