Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C52B3126B9
	for <linux-clk@vger.kernel.org>; Fri,  6 Mar 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804557; cv=none; b=uOfr/k8/ZXu0WFQQ0l3Opi8TrJg/vkNFissDkE0IU9KK+XXjfPwBj8ho8YVhsWt8fMhRR4iB6hRCLYshnMW5zjQjKdj50CtnGOy0ZtYo0XI4w+VhFK3cpkulUrlrZd6BCuK5T27mpFijgY5O42mrbqK9PiDkuGGekDGIvK1U3pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804557; c=relaxed/simple;
	bh=nzB4vn1IjWBHrbgZS/e94Dund4pW6w6VdfFOAfcUVCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ia3jKmNXgHowEEg0kDnkfal4T9NCTR19OScWFTxiScitXC29wxUHAjI2EjgF/WVdcwkqZrUYgD6YQ0reyhiGSDzsCbqlYeBdaz1rDNY2u/F9dws5deyecxVrYomDlLOf7QjnCeTsFSnEssrXK+3jy9i1M44JOKzXZ9ec7k6bsrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YC9Oq7/h; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YC9Oq7/h"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b78b638eso6064408f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2026 05:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772804554; x=1773409354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o6IrVxXy7CXsl37mE9WFjkK5uiaupuO7eK2CML6ou7w=;
        b=YC9Oq7/hSZsqpVQhhEJcMFvm2hsDb4UFGUcs1Sc5g3V+aK4VkC4bVkV2FISeLXr2Q+
         PN73/ROnpud4snalhBychcaQkjQrX4Ew9jlEDHY/OMH7puONU9YpDqslWSCe6hmbK8fh
         6uNkdWO2Kak/lMqA/cMwTzdPuJSmwrzJHdb9AkgnfAbVZ4RKA5vk30HQQN0v8ViGnwfs
         5rNl4d38UtlKqOun5HqF0Hjp+Jr5WDsmAH7OjCbIzOuzru16dnZcWakUS65bkmwe/qDd
         VFAe6Zb7mb75WItvqhvj3Q9bGQFxiQemG3XjGCRp5y1sfO222xXNZIsGwzmz9+278Irz
         7Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804554; x=1773409354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o6IrVxXy7CXsl37mE9WFjkK5uiaupuO7eK2CML6ou7w=;
        b=pJsbUdP1zzLIvWf1BSXlRLAos6I8BgWdekLoKeuEsrfEWZM29nn8vBMw5utzyRouwS
         ezFk2pqKBVwqyMjVt22nsStJVR/sVqxXQw15fj04FQvBC8d0jtfaVX3AH/QQc7SG1q+w
         QLvg5a+ogd7mLAqMmhFCXKhrmbrEJ14GzooBT7D3q7s0W27guxRLR1D57P2dwgwxcjLj
         z6Lprvv3+ii5liSPWzS/kjqovfzZejDFDe8t9Twl3RoHknOOqgIcRonCnrKXH0gBM5yM
         86heZ/pocq14EnNgL+85vZt9/jwZ++K6UV4wtpU90PRVwrjzAp/3loebXlntY4voD0Yu
         hZ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMlquuNZK3jPzD9bAN7P2Ro4LQ/Br1A2GKrWD13EJ1bvG/m016t9F5YrlxkO3HTI3JRcPhfJUs2Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzroTVBujQlCfitlmzdN91a7AUpq1x8LMcIvEUKm9S3UmebdmFq
	MzU71XzVJmeqRked36JeFTyqTNE+cO7pZcknAnYHaNv7OtsfPbrQNoAI
X-Gm-Gg: ATEYQzwbB69CqohBOs3Ab+wBeCl70zahRg37dx+yr6oPBoD6So7E6lFKjTdrvf3BjaB
	uQG7Tgd172Tc3p4kfv2nZZZuC5HVPJ3WeMnslu+CkAp01EuCUlz4oVu26Gn6g0I3qHvOPa6EaNv
	tDdlfjaUXZ5FssUZOtGcqaTrmvt46dexixp3xAgDd/h+t/GPe2APJnARd0YAA6m9yzR6EcAp2A7
	dNBybGeaKqGGGJJN3iGPt4rgJhFNHwPAzrm3/HvfQPIgOgaecy4Yp+ffECXCW7E53e2SNvKGI5z
	DkMSn6abZr9EoK7wg+uFe6VBXzKtTBS2ENfX1rdRPuDD5dGJy3kBvc55B+Ui6WZUw0IGcMGPUZ6
	59LXzVyW8K+uV19PUl1t3XdXxTdeeCYtDgvfofhMO1kpHeaqB9rVS+au6AhVz7Cw0hq6+N4Gd4T
	aEfE4C/XWMDu3rUznu7v9fYqIlLeQeWEHwifdnp/61J0XJ5xg=
X-Received: by 2002:a05:6000:430d:b0:439:b82d:3b97 with SMTP id ffacd0b85a97d-439da662378mr3547221f8f.17.1772804553685;
        Fri, 06 Mar 2026 05:42:33 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:d0f3:534:36a3:523a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dadb85b8sm4223790f8f.17.2026.03.06.05.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:42:33 -0800 (PST)
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
Subject: [PATCH 2/3] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add critical reset entries
Date: Fri,  6 Mar 2026 13:42:24 +0000
Message-ID: <20260306134228.871815-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
References: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
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
r9a08g045, preventing __rzg2l_cpg_assert() from driving them active and
ensuring they are deasserted on probe and resume.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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

