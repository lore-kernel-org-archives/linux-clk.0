Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA0DC43217
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237956AbiEPN03 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243955AbiEPN0W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:22 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A298925C1
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:20 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id D5024320097F;
        Mon, 16 May 2022 09:26:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 16 May 2022 09:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707578; x=1652793978; bh=Dx
        yJkcxCAII238/8lzOhfhjaqUkXNzmfa3UFGyc1L9Q=; b=ljXq0rzpRIhnSzC+nl
        OIhqVRl0JYDOFiiKvO0IsuYInWZYU/ZWYYhBMVG9sKJJGFil4U+7Hevf06SEIq8H
        TY7pGXkzm7TugWSMYA8OW9O4vcQl/i/p9EeO9BreYeqqSMQDyP97W1yfTHObpIHz
        G8oeME6qaPd4vUMlYlF4fuls444HlSOinxdyUguXJ1KhqjMRGhYIUpzqgk2IiBqG
        /YIktkhF9BjLhUOtiqbPGskoGq4SW8xv9dVJbqPKjuxG5N9L7aIeH9TiWR5mJ+jb
        +TvT1KJEQK0lYNp7NH09ZSUfp/N8OmKEi0ptkZWX26Kuw2VwZT//5DXvDYL31wEV
        rWVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707578; x=1652793978; bh=DxyJkcxCAII238/8lzOhfhjaqUkXNzmfa3U
        FGyc1L9Q=; b=WklJP6DTMnly6PeSSqMPbLtw56QIq+NpMWDdKdJJEdTxiUwsItk
        ieNqwiwXmiPpVTiS9tdSQ+W0ua9jA+GvaRHz7ZaXG3l2Els4/KWxAyoSm9xzuuGh
        TI0I7sLtSejSm6P9MzmvWOCyZ1fflZs+1OYupWYaseiM8QjPkegypsew7T4kN+fr
        I0fVjL45x7GW2sP5jMqGPOlMAwTr2mVzkleebCfq5ezzPbRqQUUWhMNpThn4zn+9
        4fxZDWO+Qdfom15her2YxNUbJ2dm9+5eqBkr/vmsxTL3YW9wNaa/tOx6i/95KNJZ
        G6jCcQEJUlg/oSvKZOG+C4vQMIjAUvf0sbg==
X-ME-Sender: <xms:-lCCYq05HaHdX_Td7RrWia7c2ha-PQ4gG4E4I0XPzsrqYv7vPGe0qA>
    <xme:-lCCYtEYtVRCz7hO3un4Nq20ClugI9o7tQZ3GyrQGIvYuhHBjcK2enoTEyyTyik0O
    fB9u1WnbbmsMRLQAuc>
X-ME-Received: <xmr:-lCCYi6vc9tSlWuZ-Jggnz8JEy6mtaVnUJlcvtHDaeD9q4zZQmmbKjLlzj9EQfY6KUFwxlwZBJ1L0hx8fci750VAb2T9SxrC7y3qkFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-lCCYr1W8AZW4iv4IQ587Y4_OBxasEwSXpkd7_WTw9X2ck34Ygu_MQ>
    <xmx:-lCCYtGAwvqjWZocjKVn2x_ohoqdA-M-5G9QuS1SpJ4ApnsUC5WuBQ>
    <xmx:-lCCYk87HwRRGutonkGE0axY6Ed3ezvaD7oOxmF7_Lg4S7_XVrbJ5w>
    <xmx:-lCCYl_pfn8ggQCL_2A-MD8uphvdnIC3cMS25f6j1h3UgpLjNKxjNw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:17 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 13/28] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Mon, 16 May 2022 15:25:12 +0200
Message-Id: <20220516132527.328190-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 95be72f9373e..09849453047c 100644
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
index 8de6339f4f8d..9aa5b946f324 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -362,9 +362,37 @@ static void clk_test_uncached_set_range(struct kunit *test)
 	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
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
+	struct clk *clk = hw->clk;
+	unsigned long rate;
+
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

