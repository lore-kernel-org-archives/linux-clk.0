Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43481C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbiDHJQB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8D71210AC
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:59 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 9F2E65C013A;
        Fri,  8 Apr 2022 05:10:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=/jQET2C1V2NdgUKRMglUI0XFeoS78p
        KkPpkiclgqmrk=; b=ouyYyzniiQH5YP+dSA/u4FDBYD/pwaOYRHgYHEEoxg+nd5
        UU0Q3oEM/oNzcTINSPskpG9Pdrmn829ZkzYcFQqCiLIUEmvBvc9GQxNp98waQ3fk
        0L5JUvA7aWbhIcwwgnBWU8PyUUrwCkHz4JZFWTlx8gsyQDsVacIs2yqp1BLNbMJ3
        BcWnUzH9RLo8u+zodZ9/2d76A7IpX1fLt4TJV/pGnusaf3QdBvQR22OE3Mb2rTbD
        14TWf+KoLA2n8rFSdFS/teoGF7/OKBOoB2gGtL8B+DM7NnLGHEIL7eTx7YntgxWh
        QZXecqOYTiDse1v7e/cuHp+uGJRey/uVjD4ET8Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/jQET2
        C1V2NdgUKRMglUI0XFeoS78pKkPpkiclgqmrk=; b=FxZT0bO6fajDuMuxx+9Kws
        JbRQZ7uBlV4/Z1NYSPPqDfLj2kP6H2ndUAVXGWXLjHNdfDr1YjiC0Fpj5tZCoR/c
        9Umxgb1pb57L48XUOBZS1EYVxyQkbWXjkX3wMEvE+CE8PfnDepwqVPHcJoNyxEhq
        DtbJIMQiRm4kjPqRO6ZyNsTaaERR2iEZXpWc28A8Vx2RIpyjWA3owLXNJD+fXSeT
        XLJsTd8XmiYvr0wAy36SjOyQ3JMYffQ3xXIq6q6kbKVvVw+ehtWkffCJqUQUKepM
        h711Yzvvjkj7jgbd0WeZPIej1BYRGc0qXIP+4r1E0n6idm8i9QMR7deB7YNDbOUg
        ==
X-ME-Sender: <xms:IvxPYleCjmV2f3Qx0uw4uxai4BohRCbq5DYwO4kAYs-2EeoDNpQbYA>
    <xme:IvxPYjPF8ShT61g4uryty0ECTfWCYaxn4y061ZacUcH3FlE27E7AwWGlc3-BPcG0q
    MlMhcy1y9npNpO_LfY>
X-ME-Received: <xmr:IvxPYugggaLmukMF6l_ElKGy07vhb_zZyRu-nKjqD2s8XOSwx3J-jKMOaBxgkW_OLor9oCxmHyxBJSfV6Oq_6STvs-eDKiw-LpYMPF4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IvxPYu_eTv85S_mDmIkhNC_COBwLd2n-RIkHemG4OIBFcf8F8h9MqA>
    <xmx:IvxPYhtqd5PGGHVtDuIJtaDlrmCHHTHEfwiU440_5sa7iX5qJ6iWXw>
    <xmx:IvxPYtEL987abVOFgzcBrG3FQtEidAQ2z_zdFwGnLqPLZvgZL_Vxtw>
    <xmx:IvxPYnKZJTJes7Yx9gY8wS7jZ3nSTwTL8pXa_SKZEsvzSW8U9gWleQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:58 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 08/22] clk: Take into account uncached clocks in clk_set_rate_range()
Date:   Fri,  8 Apr 2022 11:10:23 +0200
Message-Id: <20220408091037.2041955-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c      |  6 +++++-
 drivers/clk/clk_test.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 4ccf52d31a21..80eebf62d1f3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2367,6 +2367,10 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 		goto out;
 	}
 
+	rate = clk->core->req_rate;
+	if (clk->core->flags & CLK_GET_RATE_NOCACHE)
+		rate = clk_core_get_rate_recalc(clk->core);
+
 	/*
 	 * Since the boundaries have been changed, let's give the
 	 * opportunity to the provider to adjust the clock rate based on
@@ -2384,7 +2388,7 @@ static int clk_set_rate_range_nolock(struct clk *clk,
 	 * - the determine_rate() callback does not really check for
 	 *   this corner case when determining the rate
 	 */
-	rate = clamp(clk->core->req_rate, min, max);
+	rate = clamp(rate, min, max);
 	ret = clk_core_set_rate_nolock(clk->core, rate);
 	if (ret) {
 		/* rollback the changes */
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f51a9ec3e452..70fee35c43c6 100644
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

