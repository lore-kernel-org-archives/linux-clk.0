Return-Path: <SRS0=NIgS=TN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D60DDC04AA7
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A8A8D208C3
	for <linux-clk@archiver.kernel.org>; Mon, 13 May 2019 12:32:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b8POFUNt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbfEMMcN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 May 2019 08:32:13 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33548 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729849AbfEMMb3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 May 2019 08:31:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id d9so6690778wrx.0
        for <linux-clk@vger.kernel.org>; Mon, 13 May 2019 05:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4iwsD3U3np8IEFD+xTq9Et1jrPwGjexYK1TesQwMIZ0=;
        b=b8POFUNthuvdlpyMAvkz/XPAZYSPESkYHVHrRsGD/I32mzJ09+S9i3Ktn/Iqf0CN5e
         eXNw9ANuWYo8/i8SL0pEagFcNTCv93/n0ORqEmb5I2K2xaCNEU/d2yjQks/B/8wSDyAW
         /r18vTn6m5K+nQoLd5zViswByZF48gxxHIgU5HBH6NH1amFjBFP1R9vqLwMaM/oIVYyg
         10xxLLdLF0O/ejD3lGhw/7YDhCE9sKJviaNDyJaxML+EgtQH5MJwIOkMAv1JljUI9q2b
         LzuvBa77ygJMnX/ZnUmOeXkHAU9bXme+N9/WDu9099QCMnn6M9DzKZnT4kR5OWheER7j
         WfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4iwsD3U3np8IEFD+xTq9Et1jrPwGjexYK1TesQwMIZ0=;
        b=sX5/IfXuuPy5L4SK342lKHsI7+FeqCYHtI0+sp6jjgpuyq/gXdBjWFR31iW9g0L67o
         hJER/xE3wF6j3WNQ3GqA9YGi6WOPnCDhSlleTFfDgBaHZC9Jz86rSdXgeKyRJHMQ7WQ4
         v9y0aYJdKT/0PZoyBhu+/E8PEGx2vl9KL2XRCj9xp2dcHrcunjCQJwAUlWO7k2L/1SZ1
         UTVpf4Q0klcFX4q7Ih9zO0Jnb+7e7h1LlY+Z5vQhWql4zYxjjMH3pH9de6c8oV9SAbOk
         N14uUlEM6sRM23NNDzKV9qPqgqFo7BC+ft8UXFTLZJU7j9XuRxts8og/9cCf62Qz6hxV
         T0fw==
X-Gm-Message-State: APjAAAXR3g9oc0/rGhkwLmiJNIqXAnC5GAVr4KifIRVyMcvBvTDHp36J
        m+a4cJguFL47fMJ5fv+75xVMLQ==
X-Google-Smtp-Source: APXvYqzbRgH8TxkyaTtXi+U2BxwbBAXcKGSfcjnlnf1UOwMIO+s/0Olaj1fC2ez7G+vkB7d/5d63Ng==
X-Received: by 2002:adf:dece:: with SMTP id i14mr18177889wrn.138.1557750687429;
        Mon, 13 May 2019 05:31:27 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id t13sm16175584wra.81.2019.05.13.05.31.26
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 May 2019 05:31:26 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] clk: meson: mpll: add init callback and regs
Date:   Mon, 13 May 2019 14:31:12 +0200
Message-Id: <20190513123115.18145-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Until now (gx and axg), the mpll setting on boot (whatever the
bootloader) was good enough to generate a clean fractional division.

It is not the case on the g12a. While moving away from the vendor u-boot,
it was noticed the fractional part of the divider was no longer applied.
Like on the pll, some magic settings need to applied on the mpll
register.

This change adds the ability to do that on the mpll driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 35 ++++++++++++++++++++++++-----------
 drivers/clk/meson/clk-mpll.h |  2 ++
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index d3f42e086431..2d39a8bc367c 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -115,8 +115,30 @@ static int mpll_set_rate(struct clk_hw *hw,
 	else
 		__acquire(mpll->lock);
 
-	/* Enable and set the fractional part */
+	/* Set the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm, sdm);
+
+	/* Set the integer divider part */
+	meson_parm_write(clk->map, &mpll->n2, n2);
+
+	if (mpll->lock)
+		spin_unlock_irqrestore(mpll->lock, flags);
+	else
+		__release(mpll->lock);
+
+	return 0;
+}
+
+static void mpll_init(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
+
+	if (mpll->init_count)
+		regmap_multi_reg_write(clk->map, mpll->init_regs,
+				       mpll->init_count);
+
+	/* Enable the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm_en, 1);
 
 	/* Set spread spectrum if possible */
@@ -126,19 +148,9 @@ static int mpll_set_rate(struct clk_hw *hw,
 		meson_parm_write(clk->map, &mpll->ssen, ss);
 	}
 
-	/* Set the integer divider part */
-	meson_parm_write(clk->map, &mpll->n2, n2);
-
 	/* Set the magic misc bit if required */
 	if (MESON_PARM_APPLICABLE(&mpll->misc))
 		meson_parm_write(clk->map, &mpll->misc, 1);
-
-	if (mpll->lock)
-		spin_unlock_irqrestore(mpll->lock, flags);
-	else
-		__release(mpll->lock);
-
-	return 0;
 }
 
 const struct clk_ops meson_clk_mpll_ro_ops = {
@@ -151,6 +163,7 @@ const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
 	.set_rate	= mpll_set_rate,
+	.init		= mpll_init,
 };
 EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
 
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
index 0f948430fed4..a991d568c43a 100644
--- a/drivers/clk/meson/clk-mpll.h
+++ b/drivers/clk/meson/clk-mpll.h
@@ -18,6 +18,8 @@ struct meson_clk_mpll_data {
 	struct parm n2;
 	struct parm ssen;
 	struct parm misc;
+	const struct reg_sequence *init_regs;
+	unsigned int init_count;
 	spinlock_t *lock;
 	u8 flags;
 };
-- 
2.20.1

