Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B901C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350255AbiD1Qr0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350254AbiD1Qr0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:26 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB74DB2467
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 5AFC75C015C;
        Thu, 28 Apr 2022 12:44:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164250; x=1651250650; bh=03
        aCWn5RkrNMLKkEFY5TiMrhTfA/zjOiIvX9DffOyos=; b=dGBul0rQNROuvK/3E9
        nMDYx/4rCzrm26bpUK/iyOV8Hs53MEKsmkF2z6uGNvErRTqwDFxVCRth0caIL4CV
        +MwZne9y8LDBQC/fHojSwdVIlRqulwbCGZButrvv9OBV0JLVdAmOB0gpQ/1sXFoW
        6Ag8tJQoL0IMDBOOO5qX2ehEoel69YXcEhAt2yjazMg2AH13egnlahPSAAED6NGj
        Xt2aiiyo2pHJdRa9s1/8Nq3AWHUMhaeuangigFEdNWf1y0CkEgsqxMEJOCDWr3XQ
        hkP4I8LcA4kK4K9zTfsunClc/b11GPSdSbp1fBvv8orPxraaEtKbc0dLirhPXUvI
        XNvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164250; x=1651250650; bh=03aCWn5RkrNMLKkEFY5TiMrhTfA/zjOiIvX
        9DffOyos=; b=BECbgUZVs3sErtzYl9hkc+GvUkw4whEDfF8+Kl1JaUwUi/XuGiv
        0xEy5ovKnV8m8ucE4EEH6jIbZax/36iv5W7jkNrTb0hzrJTvFcICmSjMlRGi9mLE
        MTwT5m/763nEnToJ5T02OyAdyRDMgLjJvYXuTCt9flsjVDY3iQm7RxAoXgfxc7tj
        Z40/LDW1EOOyuG7sO7/uld3TMSjLfTFSSg2DSnkVJy14wvkOO/PKSS6g0YDidqm+
        H9M8nZkEGxnV1Vqc3gl/Y66708RFO/cbxHxCkDxXEaPSKclDOhYinasyS+UIPWNT
        zywzjPVT2XGisoctUGGg+xZzFjpnwIyQP/w==
X-ME-Sender: <xms:WsRqYq4s3BTBr43mXnlU7gZGb4tuFhviJJ7vyYUgKb6skHiH2U6OFg>
    <xme:WsRqYj52QQ5P_W4CgNSU8pOvJzJxrdZP9SDJ0cUtWjrKNnmuLTJpdOkA05yC_DrU0
    EwQnNWN64hvHMfuHSI>
X-ME-Received: <xmr:WsRqYpdko579wsXMIZO0-jD_HYbU6gv3f70KiWvfJC64Dl64XIfG6K2of3g8VahmYeFQiJf1Rfj0JHKM17A-svWSiGdI58UYqRIEij8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WsRqYnLqCEoF1uh8XoL5WDQchQVZSfI9pVwq7XOBm0KGygGbVaywxw>
    <xmx:WsRqYuICysHUOehqo42UhAryMngNWJ-XQO6GbuIFVA5vFHHPo3s6JA>
    <xmx:WsRqYozi2CZSkDZR3C0FEshhtgY746JUoYbCbW8QUOkhEJblGxTxDg>
    <xmx:WsRqYrARH2et1TJA5_UrGgD4LKGi0SJJewPgZCncj9MX-Sqmd_NZww>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:09 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 13/28] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Thu, 28 Apr 2022 18:43:23 +0200
Message-Id: <20220428164338.717443-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index a1699f4a3d52..604faa156817 100644
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
2.35.1

