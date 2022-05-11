Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB33C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244938AbiEKOoA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244976AbiEKOns (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:48 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F75EAB99
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:47 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 3B9B13200994;
        Wed, 11 May 2022 10:43:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 11 May 2022 10:43:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280223; x=1652366623; bh=Dx
        yJkcxCAII238/8lzOhfhjaqUkXNzmfa3UFGyc1L9Q=; b=mwn1etDLVFK/sfv3AJ
        tcn9jSEL8MXhQ40iEFQ7f6InLzd2HTiRY73ZS5lh+ZgyHkagmSU22VP69iFtU6cM
        U9xxHKdGr9V1dj1ATrFnzqo8SHkAWQnmNjWxWtuHhulu8mXwBy0dHtJXr0ATl5jp
        yTQigZrQ2y2qrx+TnkUVy9PRhp4qFo8K2jKn4OigExQxuC7v0yWWoEm0g1a6sE0c
        wAsJ/jSPCEhP6ihJNCvpRYV9c5dzwHvPy0kvRuJLPeAXAdRsGCyCUZb4DT5fBYcR
        j+UiSow/Ja2YHo4Ym6I2v4tXrdMt2aMfgLjlwQ1rGKL4yrlyGMfbSBSqB3RLoVnp
        YUKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280223; x=1652366623; bh=DxyJkcxCAII238/8lzOhfhjaqUkXNzmfa3U
        FGyc1L9Q=; b=de2DY5ac/lmUZN4X0gARQJTUZQmCEog9/V85YAihK5ZcPAU6Trk
        4U3cmp9JqZ+yziV/4C1XTAIh483DZpZhCrX/jJNtCBAM44zzwxIs14+fdvGyDNs/
        xAaElYne/jg5dmaA1n7hmVBg3S3IXouXHX3MydI1Qd2wVuP16eVkKlQV9k6wAfkc
        6knLHNz9EDS2546MXBwaysWqL/oRPUFn0xsglqauC8pWLHeKDdtfDpP8Af/wkj+r
        ztsG7/oi5bdzuBb+ZCnizEedH84TXXrLuE6tOlQkVmufpoGw2qylBcnia3Tg8uqw
        wsoAyCJbJPMLbGuM6mvroKS9m6z78Fra8Lw==
X-ME-Sender: <xms:n8t7YltJepS-AouAq-Y2bJww5_3FHcQtAla7SEmFZyY_Ux94EIF5-A>
    <xme:n8t7YucZ0-d41H88_rIUt-B_LW8rsUxVjWJtrnACp4I9owux5zWweyxw6HOA3AMZm
    YiTNTdyPZCxiHbDX0I>
X-ME-Received: <xmr:n8t7Yozpe4iJsbdFM6RE7APw4PC5avX1115MpfArIqJ9Y8uIr_Iy2wRjVA1HcK3yKm6RBXAvnXzEvOR4n_CovCOgzUOJcHPccGJilaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:n8t7YsOkiWp_FT8fo675iPUtlbHsJKKYV7VcJVelyNc_KpBem-Whzw>
    <xmx:n8t7Yl8dqkAyipIrOTu_YW9-ETplGXJQfQVWlq_I5EIU5-XwHX-Z7w>
    <xmx:n8t7YsV3TFXpHkcomqMDRBJXpbcSi_y5vHBqtbzSZhpquJFh9D8n3w>
    <xmx:n8t7Ym3F3j6T8AFBl11_lmzc3UBXc1u5_5Yql6Mcb7jKYtJ-Pu_OSQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:43 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 13/28] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Wed, 11 May 2022 16:42:34 +0200
Message-Id: <20220511144249.354775-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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

