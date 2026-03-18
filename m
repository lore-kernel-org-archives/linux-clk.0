Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5B538B7DB
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 08:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823326; cv=none; b=Gdsbexa1Ld64k215zT/NJrk38RTPvwyIy6r5e209OeVbqzMuaLryEf8LRAIVd141VAV+ttkQpJGcrd4sAsVj3wok0oFw0GGFhKUXKykuPa2A6RUaDoEOxdC9/wD6X612szQ2cTNAUr9hzzxLUFmymyJWHUl/4KNppDbzqNl7JEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823326; c=relaxed/simple;
	bh=pV1aqnTgRdbkKR3+cxXrxVzX6kD09lif4yanDAiAM3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J1Br5Q7WIhGubXgpxkBKeW1KRm8/zeOeNW5Qk29UwIpR8n5iT3VRPiXyfwrtDpNgUOf9E16kL2bLROgKuzOtLNiRl7gkM/TRzXPbnBYE0Z9b3I4tr91y5KYpccYI1CsYdBoGCUzLftJpcl6UEqX7q55yBk1GPZAeJJHy7/apg5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGDNOVRo; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGDNOVRo"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4327790c4e9so4799619f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 01:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773823318; x=1774428118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pDGj1POSySNjxI79/aFiLpzdpr0qxiPd0OJ5v0IIHTc=;
        b=AGDNOVRo8So0iTkhw/YxSuqpbyVd7dd/RnJIH8hXqCmWXneIVqnK9pUCz1MZrUfRSE
         aSSpwPR9a0Wzv3zMxiBkKdGEn0rOPNDkaOvnJTSA0DPRr6kUyEvrGWiMl8ex7Xt545cF
         OBS1S8adToIwcpF1e+YTGOveLkhVY9xCVmA2e2VlCaVsPClJ0mzhSiGWM2s6bWQHmym3
         9JWq7ApxxN5XhveIYxpWyMYLkJStCvINEN5yi5zkcrLPDOFFHpO9IO8HLplyiTbfQfEr
         YNAGN695FcFzNAiTZ8mExKYGXtG+tb+8CLWqaHDk99wk7y6vXDkNQOWnGPotHaref5Iu
         Aheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773823318; x=1774428118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pDGj1POSySNjxI79/aFiLpzdpr0qxiPd0OJ5v0IIHTc=;
        b=fpTBJfBwCIImTzMz+kwLBAi6XEUR98dIgy1ebNS8F4bbw1QgBytP/fE8jzwl7/k0ea
         VxqAlU+tZDBgPXBs8xLqDyr3sAk4rQVwzh3UBjhLOIBR5hNzcjgpN72vL6bnYcYF+Es2
         W6FGq+bbwpWuDxb4JMJVkIwDXMCxzze2NZjsMiej0TLzAbvJU++nBiq8Bw1LFaE/K2tt
         Qt81W9V/BBrFWLs3Q5skZ0h2oegKqA0I5zZv98mClZx3miMG4irbve4oSBrQfN+Qenhy
         XYxaomJLYFg8pwa4pQGEtUv1NsF7JWKt3Uc8pZB3u42jHuTBX3D5+5CCsRaHmAxOHJPG
         VANg==
X-Forwarded-Encrypted: i=1; AJvYcCUP9CScGA5Y7JRO4Rdh80VVu/y5IURi3Tz+Ax9Qq4KJ/rF+ZgIHBkncY3vAqZAiI45hi4ecnF0NeCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmM92QZ1u+2xMxeoveWirpR/QHA6+/Pne1VPE/LVt4bjfbBk/l
	JJWyr9KgVLyNyqRXpof43gNjpxDZaXafd0x2NbtKpkKMZNvcChVFQxFTUVhosw==
X-Gm-Gg: ATEYQzzA10RqFMWP+oEUKEHXtNSj1TgnZM/nfdPlgC1KD0U7dwXqL2mR9K7SOtC/hI3
	YRCSJgNqz90dM6G2ZmksyEgGoi2eudC9adGQ85k/9JVinbSyR1rMCWOrniZ4q7H69/oQqfVCgKQ
	iLuTJO+ZTVgVn3gA4hdNHXzy6ohnewK8s08ObwRJ0cp0ciEisctvZho1LjFsX4Q30Ank9aka8lI
	qCK+3it3CLjmd9yyzzU/7gI12y4wDPRE3K7jn4F02NEmMNa6Q3pInFTDuOCkcjL1GZ7JV84NEHx
	oiR47RyP8PZ/LAOIFXKJ5Ng9+BJIqVwMcc9aqvc4L4L0IqXSsA5GKV3I1HxzRLf95Aoynm+wXLk
	lt2tDhLi835qLqhEsPOoksq6n5CK287LF49rYiCI49u0LyOFz+H9upPzf+XzZdHxGxqqxGm2vie
	yz7BW3c9kmwE1vE8G2+j5bii82YgQ+RCpUV1/1+c03YMpHqAn8
X-Received: by 2002:a05:6000:184f:b0:439:b636:1fa4 with SMTP id ffacd0b85a97d-43b527c9ea5mr3822720f8f.48.1773823317930;
        Wed, 18 Mar 2026 01:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d643:4385:f93a:2085])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm6389350f8f.6.2026.03.18.01.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 01:41:57 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 3/9] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Wed, 18 Mar 2026 08:41:38 +0000
Message-ID: <20260318084151.122674-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
References: <20260318084151.122674-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L SoC family requires DMA resets to be deasserted for routing
some peripheral interrupts to the CPU. Asserting these resets after boot
would silently break interrupt delivery with no driver to restore them.

Mark the DMA resets as critical by adding them to the crit_resets table
in the SoC-specific rzg2l_cpg_info for r9a07g043, r9a07g044, and
r9a08g045, preventing __rzg2l_cpg_assert() from asserting them and
ensuring they are deasserted during probe and resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change
v4:
 * Moved this patch from [1] as it is boot-dependent
 [1] https://lore.kernel.org/all/20260306134228.871815-1-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/r9a07g043-cpg.c |  8 ++++++++
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 drivers/clk/renesas/r9a08g045-cpg.c |  9 +++++++++
 3 files changed, 30 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 33e9a1223c72..01d741ed8dc5 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g043_critical_resets[] = {
+	R9A07G043_DMAC_ARESETN,
+	R9A07G043_DMAC_RST_ASYNC,
+};
+
 #ifdef CONFIG_ARM64
 static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G043_CRU_SYSCLK,
@@ -420,5 +425,8 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Critical Resets */
+	.crit_resets = r9a07g043_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g043_critical_resets),
 	.has_clk_mon_regs = true,
 };
diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 0dd264877b9a..7f1405cab9c3 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -489,6 +489,11 @@ static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g044_critical_resets[] = {
+	R9A07G044_DMAC_ARESETN,
+	R9A07G044_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a07g044_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G044_CRU_SYSCLK,
 	MOD_CLK_BASE + R9A07G044_CRU_VCLK,
@@ -519,6 +524,10 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -548,6 +557,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a07g044_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g044_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
 #endif
diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index 79e7b19c7882..87ee43f9fe18 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -361,6 +361,11 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
 };
 
+static const unsigned int r9a08g045_critical_resets[] = {
+	R9A08G045_DMAC_ARESETN,
+	R9A08G045_DMAC_RST_ASYNC,
+};
+
 static const unsigned int r9a08g045_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A08G045_PCI_CLKL1PM,
 };
@@ -389,5 +394,9 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
 
+	/* Critical Resets */
+	.crit_resets = r9a08g045_critical_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a08g045_critical_resets),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.43.0

