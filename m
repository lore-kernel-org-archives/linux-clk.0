Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2ED9C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiGOQBj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiGOQBX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:23 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C24D735AB
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:01:23 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 3D5BE5C00AE;
        Fri, 15 Jul 2022 12:01:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900882; x=1657987282; bh=vo
        wefVW4p4QjRT8xVKxwEoKnAC9Tn3Q6jOgQdJT++Pg=; b=u9nMkxyiWhBa5GWTcv
        cM8qQZ68SkbC1T0UgZlWsuoJLcLs0Z2N1i30KMwGqQghA2hCe4YWPz4YFwaNYVTX
        SVZ+GZ5SHRtZg+V4lxKvjvgaNFl6RmQvurV2MtF8bXz0M361D7Nr6TvqE0xX/xdd
        /5Ygt7aQRPRxO4KgHn7ai6iUW+AktmdoCgzxoeR5O4hw6O/LYpy81O9bYc5RUQEl
        zqdQ+C4ps9Z1XUtI6/vOWtXWBT/vnpQoHVz4904ZnmW/1KV6jrBuNdOJO4NMiRF7
        3b4LZTX7ALFayvjwTMKQBLwiUb8RGSwwG7I9zZqX5sSuQ8gEPveN66s+IxkvEkLM
        Z6zA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900882; x=1657987282; bh=vowefVW4p4QjR
        T8xVKxwEoKnAC9Tn3Q6jOgQdJT++Pg=; b=QD8LwEXzl2yBjWsSno7qifGPGHbhO
        Z2jM4N2M45MbpNJ9u3NU26SW0mirfSq4QZ0UcFnNifrlrkoSZNetiwU24KRxInJu
        3noDp7TmZtvqcQayls8K1tbBp1Qj9fnRHg3xlW2OvIChM3/pcWdTFUra7HXmBXmC
        oqxZyC52EOMafRIKHvt2Ys8HwNij0wklostFOXUHxHY5Q/G2miVi5T5JazzlunZq
        P/0xSEZUiL+EftdBka1s2Jjiz0aDg/dMWr+82ZS7ddZ9wBQUCINy7Hf4Rc+coRX1
        nkyEMES8pUhprJd7xNIxNtXpYUmk7fsfvvFtn/Ifsuz6eu+YVBD+gfUgw==
X-ME-Sender: <xms:UI_RYgxJVlmeZpEW4BSGIRpyLVl4OPRQuOzu9vTDe9JTLUBrc2Rw9Q>
    <xme:UI_RYkT-Y5awDeb7Upir8h7LcRcMITVQm_EuQlyIxCvc8KyURdk0o0ldd6Pfjwx60
    o9M7OAbbv65C4e8nJk>
X-ME-Received: <xmr:UI_RYiWzFDXMMgXNTtixD_W2yzWgyE8yYr1oiLGGwQnItdcKzBB_HFfxoNyDAm7WOTrKZmO76BOW8V-RkgIn20eupKez27HW-p0Gjrk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UI_RYujwwrM-CNzvhBy94UNcphJz8pIbwInnjD--HcdgQreyTjMRwg>
    <xmx:UI_RYiDHlDC7rHNCdpskO5bL0JyocI_ZHsd8hZEIUSYHEPuffTbrTg>
    <xmx:UI_RYvIkpiw-OQY_w4IOOYGyY1JY15H8I9rdmEEoWtR4AsN2ZMRe-w>
    <xmx:Uo_RYm5hO0qyEAVlJJT2JSSL4SqCZqU1558lUsdCgoEo4NNfh4oxAQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:01:20 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 15/28] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Fri, 15 Jul 2022 18:00:01 +0200
Message-Id: <20220715160014.2623107-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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
2.36.1

