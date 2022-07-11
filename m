Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6A7C43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbiGKPY7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiGKPY5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:57 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDBB28701
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id CBCAE5C01A2;
        Mon, 11 Jul 2022 11:24:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 11 Jul 2022 11:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553095; x=1657639495; bh=vo
        wefVW4p4QjRT8xVKxwEoKnAC9Tn3Q6jOgQdJT++Pg=; b=juncaR6tm+52zxV+0L
        ZHPBpW4WYEy1DnMBnCVzgQCcHAzOJrMERFtiDEDZko7WvU//IdvO4XK3vP6IR5lx
        EWcO7DSZXgvBP6AAm8vNS4sQ/gNtutrO5fRGOLwKSK5JgeaUaiW4qNTmfoxb03hs
        KVh9ozAF6DsSnHuPKYR1CzgJytg9HOuy0YYl6sVZcU6jtXtg8eQKjjiRfeIflNkO
        6DSD25LTx4hhGeWq2mddIiV5x+hACiMGEJ6t4rcJTDtaHvNgLbJazunXy1kqHBX3
        DW5cyAeYtZtj1ydi2NsfpLTa+lxcnX0P1fOs9K3nSi4Zou42kVh3RvimWMulEbWE
        ggdQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553095; x=1657639495; bh=vowefVW4p4QjR
        T8xVKxwEoKnAC9Tn3Q6jOgQdJT++Pg=; b=TtmoPzVDNSrtmNnPHItjTxOBnsb4e
        TfkRnHtSpWPpQHMejkT9o/RrC39efdtI/pMoxk/XO8ZY8pSVBmAHEzS8aSLhfxRF
        poSsuSrqLJGC7MC0ptVWFu12X7sCvZeDh31s/0E/7UbFcQ/tKHuUFOR4CBpigyaP
        U1VLz7qHbHqO1TDkDLSGmIG2GVBxLj6dNLe2FVyMcgR8zAYCPrfo2TbAnuWZwHM8
        rZ9VgxNn2lLnuvaqXBVcWdfdeY23mgzDiLxYdqkmQSEk4FPqOOoLFAtJwLM2lxnX
        vE2wZ25GGLzvPJBUreYR1oefUcWR5sQV2jcEpoau5VffUZyGSvzgvnnzw==
X-ME-Sender: <xms:x0DMYhmfHDy2Ady8jpNXh-qYx2c0pL5tarFyqc52UsFB7hyr3SuW3Q>
    <xme:x0DMYs1PIvBURE4KGgA9qWT4rE7iXNFZo1vfNZ95HvOshfLrN3Z7b2qmaJaMl83mr
    iS0Dws2ifxDxVJkkOY>
X-ME-Received: <xmr:x0DMYnqAqmAuvu7xJWI21aSaXZNwzk1VzwEPEAcVvPSxK6tL34sfXuS3y-bvYbD8j5SEULWLtI55_OFYbs4XoCdIFxMJc5kEPtibcMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:x0DMYhm8Ydl3V88L_9nUIoxwnGPov_u1sMmgaelQPteO3SsSKx4q3Q>
    <xmx:x0DMYv1Q664-hHdM-1T_I3TYWj-E6lqFZx_Eb9Xth2q2YCq26LkNlw>
    <xmx:x0DMYgtmF3VuOb31lJVzDjXbyW5rYLL5jyWUXtfiljRK4-IZV74HsA>
    <xmx:x0DMYoscbGNNpq02Oqc818RX56fo50Zy36pbAX9ZYtXtmDPKLW0QxA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:55 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 15/28] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Mon, 11 Jul 2022 17:24:11 +0200
Message-Id: <20220711152424.701311-16-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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

