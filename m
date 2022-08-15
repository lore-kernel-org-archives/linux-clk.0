Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43CFC3F6B0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiHOPnH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232196AbiHOPmr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:47 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E857164E6
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:46 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 69214320095A;
        Mon, 15 Aug 2022 11:42:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 15 Aug 2022 11:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578164; x=1660664564; bh=M1
        Km//lWkEL1RRhUgrFdjc2Rs6psHO4Hu+nQGIxUr+M=; b=eMaWXdeOzPZpGWX+ft
        b6Otq7gBYB2+4mEJ5El0FScNuD/sAl8BrqQ4dE+BNx0uq5xzWUeWtJRXMzTeAgUs
        xAV3aAMpL/6J9NYeRNnN6AgMmmd4vLqR2u5XFRX7GeuR3jb//WAk4NQ3ViQbd3x+
        WqjjpyGsMrTEdK7Wn5Cje2Vfvj4zOgzyEyw8SuF+5Ie5G80UCbI1FWaja6Th6c9S
        BA7P3kqJL5tYj7ZPe2kpXm6LKQYpR2nuSJLra88u6EqKvbBQ87OdAGMcvDXMsjFU
        FeB0Mw2Q18kx2Z/R6phFIeNGScq2WXRYoOE3g0VTfdhSkltsQpPZIZC7S3uu/Ghx
        X2uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578164; x=1660664564; bh=M1Km//lWkEL1R
        RhUgrFdjc2Rs6psHO4Hu+nQGIxUr+M=; b=L5Knl5i4F8ZnRch+gsKnSbnwtUNc/
        Y/t5CCTDVcJp0+lwCcdzMmFfL3RkzPBXrC9oprFMPerFArH2TptZuTw3wJxnQq6f
        2qWWn5X4L89fi8w5QQywMF+8KOkzpbtt/4YZxbHkdWyWrxA8Wes/RqSFiy75N7xF
        McsU0H1ToYJCLwid21jt5hh6pb82LoJ0z+HSLcf1wlgitlxlG8cbIi7WnabW15ev
        gwgF2u2FE9921jlhN5wrMi81FicXeQjDyPSItFf2Q5Q41ZpFJVM5x5dI1xAf28Vp
        O7F6ivaxuDXAbn/W9GiOEzht4Prdsogvs+Zseksqg8YybPyBz3F3jo6bA==
X-ME-Sender: <xms:dGn6Yohyiv8_ifC3ZFdI5XPVJjlLcyyvfdexXP38ChOzqBFrWcxWkQ>
    <xme:dGn6YhAQL_4gM9KuvYFbcZSq4rkekyQzOiGiuFddFL3ZzvvNBZXLhfomPdFuBBiUv
    9JdlW844oMJJX4Kwo8>
X-ME-Received: <xmr:dGn6YgGPmCj5gicyxmnDov-JiAewVyFBSZwxAx3MiVhUfpkdFC4eoPhOhytq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dGn6YpQ1P1FAK_mE3PycJn3ticlHH_5J4aGMm8LerWZ3qFIFz0AVpg>
    <xmx:dGn6YlyMwFoZdz7EfoR9bIqPDpWQfa4Shct3F4DEKXFj25Hn_AOW9Q>
    <xmx:dGn6Yn4HzU91p5oJ40mmZdjFr17omKAYXH0w2rY6JmiHE_XuRdQueQ>
    <xmx:dGn6YqrtEjY24qKuUeQ0dFMgnczRBOXzb57VmYu4o5j5VUyV1Lx_XQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:44 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 12/25] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Mon, 15 Aug 2022 17:41:34 +0200
Message-Id: <20220815154147.1631441-13-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_set_rate_range() will use the last requested rate for the clock when
it calls into the driver set_rate hook.

However, if CLK_GET_RATE_NOCACHE is set on that clock, the last
requested rate might not be matching the current rate of the clock. In
such a case, let's read out the rate from the hardware and use that in
our set_rate instead.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  6 +++++-
 drivers/clk/clk_test.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index caa2eb640441..53b28e63deae 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2373,6 +2373,10 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 		goto out;
 	}
 
+	rate = clk->core->req_rate;
+	if (clk->core->flags & CLK_GET_RATE_NOCACHE)
+		rate = clk_core_get_rate_recalc(clk->core);
+
 	/*
 	 * Since the boundaries have been changed, let's give the
 	 * opportunity to the provider to adjust the clock rate based on
@@ -2390,7 +2394,7 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	 * - the determine_rate() callback does not really check for
 	 *   this corner case when determining the rate
 	 */
-	rate = clamp(clk->core->req_rate, min, max);
+	rate = clamp(rate, min, max);
 	ret = clk_core_set_rate_nolock(clk->core, rate);
 	if (ret) {
 		/* rollback the changes */
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index ceed49c5a88b..d3e121f21ae2 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -375,9 +375,40 @@ static void clk_test_uncached_set_range(struct kunit *test)
 	clk_put(clk);
 }
 
+/*
+ * Test that for an uncached clock, clk_set_rate_range() will work
+ * properly if the rate has changed in hardware.
+ *
+ * In this case, it means that if the rate wasn't initially in the range
+ * we're trying to set, but got changed at some point into the range
+ * without the kernel knowing about it, its rate shouldn't be affected.
+ */
+static void clk_test_uncached_updated_rate_set_range(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
+	unsigned long rate;
+
+	/* We change the rate behind the clock framework's back */
+	ctx->rate = DUMMY_CLOCK_RATE_1 + 1000;
+	KUNIT_ASSERT_EQ(test,
+			clk_set_rate_range(clk,
+					   DUMMY_CLOCK_RATE_1,
+					   DUMMY_CLOCK_RATE_2),
+			0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+
+	clk_put(clk);
+}
+
 static struct kunit_case clk_uncached_test_cases[] = {
 	KUNIT_CASE(clk_test_uncached_get_rate),
 	KUNIT_CASE(clk_test_uncached_set_range),
+	KUNIT_CASE(clk_test_uncached_updated_rate_set_range),
 	{}
 };
 
-- 
2.37.1

