Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C5FEC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiGKPZV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiGKPZU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:20 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 103982D1F8
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:20 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 6AC375C01A1;
        Mon, 11 Jul 2022 11:25:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553119; x=1657639519; bh=h2
        Fl3vSMcRu20SwFKzmHS9Q6gvuP02p9iCYZ1kTPdtQ=; b=Qzbj76lFVXfGknEi/M
        cz2NQ7HmGI3zRSTtzP3unOToWppG3n/Bq5sYDTRzB/05yAckTl00/P3eJ9zFPa6X
        bgtQeninP0o1WLZp0ceJ+4YXLUwfn1pWCpp9BqRKIfjJKurdbQyvEoeSrhHATfzp
        7xrH6nbPCKT4yeygyXP4Bl8OZbO+A+bgMo8Mbb0DKS+eEBTAmReSklKbooNgjcU8
        8EqCCVH1GsJlZ7xTRrU1j7a2zYg2zzOrcu9FzRfMEIY3yQFys2FUYjLkIcBY9mNW
        WBSQreoQw5BotTSdXjz9RVtslIAuFll0MfZkOvPA7CbNFNHmnuIb0ySmTmo4tNhm
        ZJ1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553119; x=1657639519; bh=h2Fl3vSMcRu20
        SwFKzmHS9Q6gvuP02p9iCYZ1kTPdtQ=; b=E/uB0PBgNNMut79uosQoah054yjkX
        1rdTvzBUejH3NAfQurZxDWjVcXES3Avp4bCBIZrO2UGBueqagd5I8V7PgHaA//8m
        zaVlRf33ivJLlIoFn/+0L6uh0hulL7MGpoAvcaKr9pZq79AteheKp5EZ7oVc/O8U
        5h/hzH4+JsAR+5dWUyJalHbIpYAw6wTgBlfuuH1jmnDnZFr4dCx/NAiN0vMEPvOn
        umJ0nWMGxh+SBoj8Cy9uHej5di2ll9VSTC/vnkmOoNahdFefOfmbtghJAzU50QfH
        NfucyhSAc2eskeOfPJ5P/MFHwHzWn8THRuUew40J7pFAmVggLk7zLTN1Q==
X-ME-Sender: <xms:30DMYmYsRf-JMlVfWNhcEvqHRrXii5aUtksjl1dG9fZh4houI07vBw>
    <xme:30DMYpanVYAl3QhQVuca6DtyviSgXSdtMukGRxr-MeHhZ3i6vTHD3k2Rqk2MfVEpK
    sdY8cE4-8_IjjPyyL4>
X-ME-Received: <xmr:30DMYg93sSJUoWazTZ99vomFF0qAXodwcGFXf02GXsLu0v8RdcReZVrUeaZLlzVJCgr8i8u2PJYtnISEvUc5QBFHlJFIo392UfSH2gE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:30DMYoqXPj9C5bJxHIg5HRYsg2933gBA4wMTiBLeN3SFIC_LK_SwFw>
    <xmx:30DMYhpGSMWis2FgOpnEb29xhDlbOrvrNPtKNzJ_P1NVcBLg9xJk6w>
    <xmx:30DMYmTRn5uWpR5gYhd06K6y2Dwj_jzh48Quh4yYZpBgpnLpCxqBzw>
    <xmx:30DMYuiSFLwW1zflhqRpCRV70a4Vbo8Q_6RNIx7h9i84IZ83z_7Spg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:18 -0400 (EDT)
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
Subject: [PATCH v6 28/28] clk: tests: Add missing test case for ranges
Date:   Mon, 11 Jul 2022 17:24:24 +0200
Message-Id: <20220711152424.701311-29-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
 drivers/clk/clk_test.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 5a5b7a8baba2..8e0c76ab1a6d 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -514,9 +514,62 @@ clk_test_multiple_parents_mux_has_parent(struct kunit *test)
 	clk_put(clk);
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
+	struct clk *clk = clk_hw_get_clk(hw, NULL);
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
+	clk_put(clk);
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

