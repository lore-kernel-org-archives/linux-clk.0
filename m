Return-Path: <SRS0=mYc5=R4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4BCC43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F33C520863
	for <linux-clk@archiver.kernel.org>; Mon, 25 Mar 2019 11:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ob4wr/p7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfCYLM2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Mar 2019 07:12:28 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39992 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730896AbfCYLML (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Mar 2019 07:12:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id t5so9571941wri.7
        for <linux-clk@vger.kernel.org>; Mon, 25 Mar 2019 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ni9wuRQYti+VN96MUqmtZken5FIKCN6vt8HcbUKOpXk=;
        b=Ob4wr/p7CWJ0/0rb9BiX/8sfRVwR/RvMNb1rQR4KEx5nw/PtNynhStx9LaWhSq0GIP
         xR+C5qFlH4eONwWVhTSqBRlO5OzIDe11Xop0RGfFTLs/8fMOUKuIXIbK1ciFfnkhs0iN
         V6RXmZbqDSOg6MeWgSp6ICBq9mmNE5q8pgR2Zv72oiXpvVphSuXMbBQoZWlTMAQ3gfIm
         xi8bDZS2bD3NZuCZWfJiS95K96NVuddvWL3LoNaAmKDR9lbmL+y7hA2n1TTPBStgBuTw
         YuM/hqcL6Jc7VKb6YlJT4Qfmq6jh8gakcKYYua1swt8xgKWBqIJ9DC2cXnfb/HQyvDin
         XO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ni9wuRQYti+VN96MUqmtZken5FIKCN6vt8HcbUKOpXk=;
        b=FtEKNhLCF8xaDfZuianRNb5RnXkynTvshhsNwxKx/x8NKmag9R9DnAtizd0nsknI1K
         XHAMiNhRuccuvKaGhjwc0BGT6YGBKiRM8cBxont47GVAuU6W0mD5cKTHuZFLo22Fny0w
         yJQPKzF29qzLwgFo/xU58YH7vNdDy8UGbrb5YczT1SqslFNtr08adhuOHZif5fytQfx3
         djhJRSt2+hJEyF8dz1JNeUoq/me+Gh6Jqz0Q+bMkVnBKzCAPr0EnJz4D/4nYhRE9kv5r
         dA2LF02Yr7a3nHDke96nGhOx8m9INZu/WAb+QoXGWJnArXZi/mrti3gEM1EsZ4d6/I6o
         LJ3g==
X-Gm-Message-State: APjAAAXzJ1yuQIjr+xK5uWeIqLqHY4TrIldbn46/D+rvFiHlJXNTPSYK
        tuBKqMu78qHGjMwDlrzf/OZLlg==
X-Google-Smtp-Source: APXvYqwcFxJqyNOkSqAjk6X+AhxICLKJQREHSLxv7WELpuv38fpDdjQoI7dcc0hb9DhLMJnBEaY8XQ==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr11536669wrw.301.1553512329569;
        Mon, 25 Mar 2019 04:12:09 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id n188sm15134301wme.13.2019.03.25.04.12.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 04:12:08 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] clk: meson: mpll: add init callback and regs
Date:   Mon, 25 Mar 2019 12:11:57 +0100
Message-Id: <20190325111200.15940-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190325111200.15940-1-jbrunet@baylibre.com>
References: <20190325111200.15940-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Until now (gx and axg), the mpll setting on boot (whatever the
bootloader) was good enough generate a clean fractional division.

It is not the case on the g12a. While moving away from the vendor u-boot,
it was noticed the fractional part of the divider was no longer applied.
Like on the pll, some magic settings need to applied on the mpll
register.

This change adds the ability to do that on the mpll driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 33 +++++++++++++++++++++++----------
 drivers/clk/meson/clk-mpll.h |  2 ++
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index f76850d99e59..64d31c8ba3d0 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -115,21 +115,12 @@ static int mpll_set_rate(struct clk_hw *hw,
 	else
 		__acquire(mpll->lock);
 
-	/* Enable and set the fractional part */
+	/* Set the fractional part */
 	meson_parm_write(clk->map, &mpll->sdm, sdm);
-	meson_parm_write(clk->map, &mpll->sdm_en, 1);
-
-	/* Set additional fractional part enable if required */
-	if (MESON_PARM_APPLICABLE(&mpll->ssen))
-		meson_parm_write(clk->map, &mpll->ssen, 1);
 
 	/* Set the integer divider part */
 	meson_parm_write(clk->map, &mpll->n2, n2);
 
-	/* Set the magic misc bit if required */
-	if (MESON_PARM_APPLICABLE(&mpll->misc))
-		meson_parm_write(clk->map, &mpll->misc, 1);
-
 	if (mpll->lock)
 		spin_unlock_irqrestore(mpll->lock, flags);
 	else
@@ -138,6 +129,27 @@ static int mpll_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
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
+	meson_parm_write(clk->map, &mpll->sdm_en, 1);
+
+	/* Set additional fractional part enable if required */
+	if (MESON_PARM_APPLICABLE(&mpll->ssen))
+		meson_parm_write(clk->map, &mpll->ssen, 1);
+
+	/* Set the magic misc bit if required */
+	if (MESON_PARM_APPLICABLE(&mpll->misc))
+		meson_parm_write(clk->map, &mpll->misc, 1);
+}
+
 const struct clk_ops meson_clk_mpll_ro_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
@@ -148,6 +160,7 @@ const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.round_rate	= mpll_round_rate,
 	.set_rate	= mpll_set_rate,
+	.init		= mpll_init,
 };
 EXPORT_SYMBOL_GPL(meson_clk_mpll_ops);
 
diff --git a/drivers/clk/meson/clk-mpll.h b/drivers/clk/meson/clk-mpll.h
index cf79340006dd..2925fb939fdd 100644
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

