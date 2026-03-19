Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C03C3C01
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924714; cv=none; b=LeRBC6bUpJHqx0QddQCYNHppjvFzoTw1bphdIWa6a2DVX+G0SYX0zGF1r95G55ULaEFr5D7JkORhjhFPfE7MzS1AIKPFWQUtSVuZ5bposzrn5V9wA8uBkgb8lbQG42gC6EMjxw8zy1csQRrRpEYM4GE0deTi9SCW1bOpzbJSVyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924714; c=relaxed/simple;
	bh=39hByDfnJCYJ6oNajHKlGBkMVQZYZzfguxphvzS36s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SLMjpdDoYJm4CsLeJyE7OvdoTf/Qw4snvejN3sGZaJVMV3cD2ZghYBFJZng819F9zsoS7tBYtGUJnWBhT2Cph8urQcWaYlVcmofNAyR5haNlakIhIemuZ+7x7hF07gKm2zSAL4MMbX7s2n3iZImgdaT6Z9bjtlkA6jcbnoypp0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO1iv2ep; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO1iv2ep"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so12068865e9.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 05:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773924709; x=1774529509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKjoORFNgZSvdSOmuonOe/FlsQBgRaSi4rKz8f+gvh4=;
        b=iO1iv2epCo6+8VGGDoINogEyl+XmF0DC9ZC+VK+aXhvP/M3KKYU/lE0vXORef3SJhs
         dxJ66qRGJ/RB0g176mb35BazgEkzychnbq46Pi7vlFhh6M6GsuCZQRrXp2ZBjzCZUkAx
         ngUkO+8qAR+YcL0DkmccbxbiHOAlewpTnk+rDJ1MHwMH8JMrtvE3NH9Wtvv+BXa5WfDg
         aY1VB0R2Bm+NckK8Xd6GpdCfCfA78/GnXqIQ+GUnpWa49mSouIn8RV29HCgEcXIVNnU/
         dYgNc16/t9684XeZ+E+neW0LWkaPADWv0YVxk5+iqFK++6I+KMT2dCQnRg0tQTwJtQag
         XzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924709; x=1774529509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uKjoORFNgZSvdSOmuonOe/FlsQBgRaSi4rKz8f+gvh4=;
        b=qgMAVzjkSi7irgkuy86oGiqTvmNPY+k2wng3iPA4QsaID6Xk9SfLOUuA/jlzwuQgkA
         p+6WkIjunJlWwb7/ZOczjqOl5GEvTNUH9YrFLWGm7U0KZQQk6hf12j6CKBl62HGCvAEp
         UrYIrv+roBclSEVKV9xgzMcrIkz12NBiVEeMny7J07DIXelOIP9Z5io4UGEFhaOepoSM
         CWeeytIvT8kgfq5QV1AtCwVyv5YocWeGQgS3hP77D5UQHXXOW8T4c4TJzsDRqpm/NZUq
         SrdvDRkP2fIurxAlK20Yt7tRkR3ePlT+jkaY5Hv3xGRnRI4uuSDyAsum9CTEekBZBamw
         vvXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfwJ6JK830Gwo1mqChhp69NTX/0t5H1Oj+RAYsOmW1hmbMd+7mjrehUoHo87woUKP8o/t1gIPATO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh4e/MGCzlZ0Lq1xP/lRgURld/oKPoFoB+jo0F0386gmO66/dH
	jmgtDLtg84lhyk3rZy/dRzFkpjVNDV6Frc95lCsijfIXtHRYUhaVYOAm
X-Gm-Gg: ATEYQzxsDsHdyjUlnUINHaLcblS6bDkTO7YtF3L58Y/tcLVBUlzDJgyfEyAI3lMA9Zz
	2lYAuNpc4d28D6NMqdBpJgYqP7hzLvszzIsvkg8tPfY/mcQlLyzrUXwV/PTWSKA5HLYEVpAy9xt
	2PLaOG3hL5mWN+vvkBgNjghsMtLBBD5AoLkOgRz6DSDvBEpRpPBcpoj9diPNA9zo/7YG1KSW0RE
	U0wjJ/2U6oBRlMmW4iEk46TTj6en+XjedJbY54/vTvxAdk/lkbYoO0XR7whyLr8vq835cfjowYf
	kzJyoQdvUz8cavkxdzOu2l4/ktM1PZN3C+u+GiHhoCoBe6GHR5Pqxl7kvZB2OY3snUnmMesgZ31
	coNZdUSRtZra6hsSRXQiRt67m89ddYIuYwClleezqMzYgWY66K1nVh4IMe0r4UEmF9XC0KxA98+
	lpzhqW7jUNj/D6cGbpsCI5RzpZdHjPZgI=
X-Received: by 2002:a05:600c:1c2a:b0:485:34b3:8587 with SMTP id 5b1f17b1804b1-486f443756cmr115583065e9.10.1773924708677;
        Thu, 19 Mar 2026 05:51:48 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4bc96c6sm72382035e9.5.2026.03.19.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:51:48 -0700 (PDT)
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
Subject: [PATCH v6 03/10] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Thu, 19 Mar 2026 12:51:27 +0000
Message-ID: <20260319125143.230377-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Replaced r9a07g043_critical_resets[] -> r9a07g043_crit_resets[] for
   consistency
 * Collected tag
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
index 33e9a1223c72..99864c5a4cc8 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -379,6 +379,11 @@ static const unsigned int r9a07g043_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G043_DMAC_ACLK,
 };
 
+static const unsigned int r9a07g043_crit_resets[] = {
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
+	.crit_resets = r9a07g043_crit_resets,
+	.num_crit_resets = ARRAY_SIZE(r9a07g043_crit_resets),
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

