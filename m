Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F486C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243196AbiEPN2E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234746AbiEPN1O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:27:14 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D2DF2AE2F
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:27:13 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id B6AC232009A7;
        Mon, 16 May 2022 09:27:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 16 May 2022 09:27:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707631; x=1652794031; bh=sq
        RfGdeQAqJMPxO9VUcDlzAvt058Yt2DTJa/DUBaKS0=; b=SYqVF1tUcN5Iassn9/
        2DIUpxc9H7zyQENlejfaIlsIhcE3UzORdssTF9hL1VtSPSdcFimKJQxpSETZ/lsL
        7zx4+nqLJolWAhXjI+lCXGKFUb8hiMhZ4UZzY68IdoZ3jtBVwLpZTxEJ5OdCxCac
        fHVNC/Lnd5S3NRkta0Y7hAXjPRBpPfUO+Foq0wp8YRwEx25HpCy5K8a+7PU5pT+p
        BYGWXpo/bQyvbuirs21IJDyHMazyoUUY1wQ3swA1i2IFThN8a7uCoSBHmSTB9nPF
        JtEnHQ26a+2kiyvkjrKdfVZK/R7692QmRwzXUZnHPd2QT4j+dVaY5dUaCAtrwRGg
        qdLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707631; x=1652794031; bh=sqRfGdeQAqJMPxO9VUcDlzAvt058Yt2DTJa
        /DUBaKS0=; b=YnrSicldZkrjYwJPbc6TEVXyWcWdyltIpP+MXH5kSTxjGoS6f3U
        pq5ia7bqh/255hcKrbicR2vg/skhVbwIB5+RUk472CHnDkJbbN8NRUdpKHcyqt0C
        aKrKcuWHjPgIB426wgosbGCvPgG147pO2EeMHH/XkGOC+tE0BifdqTL7wGwebEeo
        RgPsQglLCh4bvmpWsLxd9gMZAbBVHkn/uzVoV8cG8J8vVdAY3Egx7CSqO6WdxNLK
        l3ogTHBVQpXIgmO6LBHgeJDbMXoUdBsTBFdwnAAG79KHXZx6ss0ANO7ImjNn/yjf
        RBTtByq+U3b1bP2C0gnR4PXvDaNG778zYGA==
X-ME-Sender: <xms:L1GCYggtVrDpf6iGaAatuFGNWMaAaz1NnjTe399iuYOZaZA3SfoJ4Q>
    <xme:L1GCYpB4fDx_s5y-htDyNvyTfnNjKXB-ChMpNWFJo3e3nq2OeYyD-80gmkdAB-6yC
    0Evu5hi3UeFU1P2fSc>
X-ME-Received: <xmr:L1GCYoENcZFsBqALO1HkXcbd82K6ymi2Sl0MfgAb0AAv5J-JoQDcKQeZyquL-b3zpZMz51rXNguW79-vp6lk1NZPM68DifcJ5BoSmrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L1GCYhQSFBUex0fwJij_67hIwC_GeEDeCvbvdYMhDniauCQ1bIzXKw>
    <xmx:L1GCYtxufUDqgsk2WYJi6_cBNRlTOGUpg3q1BJHoTkF5uovBuOJJEg>
    <xmx:L1GCYv53uKIDxU6qPCkGi8VO1Fh3akQ0UWK5de57A_eqWPNMa6Auww>
    <xmx:L1GCYipwzaZ567f-jbhbKe723gzsZ1LVJjMbZc1J9H1zGkBkrQKggA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:27:10 -0400 (EDT)
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
Subject: [PATCH v5 28/28] clk: tests: Add missing test case for ranges
Date:   Mon, 16 May 2022 15:25:27 +0200
Message-Id: <20220516132527.328190-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Let's add a test on the rate range after a reparenting. This fails for
now, but it's worth having it to document the corner cases we don't
support yet.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 52 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b4ae6eec7758..8226f2c6c8a3 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -488,9 +488,61 @@ clk_test_multiple_parents_mux_has_parent(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, clk_has_parent(clk, ctx->parents_ctx[1].hw.clk));
 }
 
+/*
+ * Test that for a clock with a multiple parents, if we set a range on
+ * that clock and the parent is changed, its rate after the reparenting
+ * is still within the range we asked for.
+ *
+ * FIXME: clk_set_parent() only does the reparenting but doesn't
+ * reevaluate whether the new clock rate is within its boundaries or
+ * not.
+ */
+static void
+clk_test_multiple_parents_mux_set_range_set_parent_get_rate(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent1, *parent2;
+	unsigned long rate;
+	int ret;
+
+	kunit_skip(test, "This needs to be fixed in the core.");
+
+	parent1 = clk_hw_get_clk(&ctx->parents_ctx[0].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent1);
+	KUNIT_ASSERT_TRUE(test, clk_is_match(clk_get_parent(clk), parent1));
+
+	parent2 = clk_hw_get_clk(&ctx->parents_ctx[1].hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent2);
+
+	ret = clk_set_rate(parent1, DUMMY_CLOCK_RATE_1);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate(parent2, DUMMY_CLOCK_RATE_2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_rate_range(clk,
+				 DUMMY_CLOCK_RATE_1 - 1000,
+				 DUMMY_CLOCK_RATE_1 + 1000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = clk_set_parent(clk, parent2);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	rate = clk_get_rate(clk);
+	KUNIT_ASSERT_GT(test, rate, 0);
+	KUNIT_EXPECT_GE(test, rate, DUMMY_CLOCK_RATE_1 - 1000);
+	KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
+
+	clk_put(parent2);
+	clk_put(parent1);
+}
+
 static struct kunit_case clk_multiple_parents_mux_test_cases[] = {
 	KUNIT_CASE(clk_test_multiple_parents_mux_get_parent),
 	KUNIT_CASE(clk_test_multiple_parents_mux_has_parent),
+	KUNIT_CASE(clk_test_multiple_parents_mux_set_range_set_parent_get_rate),
 	{}
 };
 
-- 
2.36.1

