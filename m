Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51594C43217
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356176AbiELQEt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356193AbiELQEs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:48 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8135A62205
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:47 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id E7D325C0184;
        Thu, 12 May 2022 12:04:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 12 May 2022 12:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371486; x=1652457886; bh=Dx
        yJkcxCAII238/8lzOhfhjaqUkXNzmfa3UFGyc1L9Q=; b=sC4klm3BT05HCmpv+h
        fKgWKDjCfLvevx0vh0CJl01giOfmnKz6AEFlfa9juGieHV7UnZY1EVkSFmxT9Gl4
        zTN5GMNXs8S5qCPdNrPq53FfGBhFXNUhv0IsrxuT9UQkvzoPHNSWr74eQywQ/elg
        aTpQoAogw3FIzQgfrh49hSoINIwgf8++s+YFVQYz6afW8tak/Cz8prwugQ5Sqlk8
        x0QwcEpM8VFFd+zl/CtiElyKoHrgG0xqm16XnRhLf8q0eSAmArexEFfgbVGku1oZ
        5rQGixbk8MVarRh3ur00MB82cUl6QQOf/e1QSRXBNbI8Ufhg9jswDb3auYpylsSD
        NXaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371486; x=1652457886; bh=DxyJkcxCAII238/8lzOhfhjaqUkXNzmfa3U
        FGyc1L9Q=; b=vL5I6GOl4isyxS+1PX4MRIF+c6ThDeGPVU74imCIfvn2P615btm
        qTiAsouVpY8S5qlTE1fln5/xpWzx/AFKbV3qew5VNgJFu7s9U22A/lB9ZxVEs+58
        Y0jRgN+9aejHAeTZd4axBz3AMh76ACxDgowZrnNE5K1uq8GCUbbl6GDeP/wLW6Ku
        xB8rMs7pGbdkpYtleW+igJA8Mzs93xY+3NzT5R8azHy8gMn4353Gyj3y2ybaNOi5
        BYF93xuEJeW+ksALHabDQbQ6D1lwvhpuane5YXHkQG0FIgdcasinwjGyo51L//bF
        rdVvKB2fGnQUPwjarwrxeGpUxrVf71W/49A==
X-ME-Sender: <xms:HjB9YoJOcbfmPOiZexWCAPsJvLA4Cjac4YxUdm5Y5ilCP8YscZ5mrw>
    <xme:HjB9YoJVlUsATa-_edreDBTV2im1Td9cqfs1uPWdeKFyM8Xk613ma2MMsRA-c-fkj
    VYCbG4ph8L1ox6YW7s>
X-ME-Received: <xmr:HjB9YouMoOAKPfxzmwCi2-gzse-ngIv2krJkw9xgBWcpcQ-5-j7L9scQnuM457Z_219fYnQ5dEz4ugO_AcblvBWvANghgUynev6YfgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HjB9YlYlqEHpTU5aGfHD6psOR2noOcjEzXNUkyWY15uR_7zfqted_w>
    <xmx:HjB9YvbtrkGzoVKxZbV6TKR5vdiQ76NNtco1t5tiOYOYOL5Fxu0nfQ>
    <xmx:HjB9YhDy9FQBxXq29Gb9Y7zEBJiprpjHscfEz986c550nXmth48fHg>
    <xmx:HjB9YsTpJK8v0dQvCxafed2diEAvln-4MzezLWbD2oM4SF3Vbrbl-g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:45 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 13/28] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Thu, 12 May 2022 18:03:57 +0200
Message-Id: <20220512160412.1317123-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

