Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB2EC25B0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbiHOPme (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbiHOPmV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:42:21 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6D118390
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:42:20 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id B0FB13200902;
        Mon, 15 Aug 2022 11:42:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 11:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578138; x=1660664538; bh=LX
        vB2jq6MwccAlAMpMLozRtwBQO+PLl0qYhsk/XlH78=; b=Dli2ke1HvDNjYZg6je
        D45APsmuZO8N5Qrimq74456FMhCQl87xnsYgB1iYmNZLALFq9owbrB1NVFQHtiW1
        9aS/wbqJvkIdOgkSG+IDmKkd8uCYlOFcSGHprHx9Dkrli9GaLKigxIq/jtuHr4no
        Z18fCCgApAVZbBhBtWfgyKFa2XCTQvkEVsFZpUIYFKLKqMV7uzc5/ay6tI8OsK+2
        IdW72UfdyqmQHdyxNn0X25fW829KrPT4FjQvO05C1UiGlGLrhKZOZQAWmqdyh531
        ICenBIxQWWWuCp2n4g7Utj9XwxjHQX+D6Z+TLPRSK/SS/OLXPlUqSptO7WKPlDbA
        XY5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578138; x=1660664538; bh=LXvB2jq6MwccA
        lAMpMLozRtwBQO+PLl0qYhsk/XlH78=; b=yE20xyx7nho+a3eukZsJ+FJz6QdMh
        lPUDtKltnntR6xKVqSgwZCWa9ZQPBPyVnEym5faWV5cH2TMNIhCKIU+Nzhwl5O5A
        R2tr9RcrqTJM6hyTD0IgSmEJD5vGXYVYmKFnn2wXP8/cdJGu7/g5c1GZAxj9aw8O
        fgcvb/q7p6bxjNc1ncz9VWa/LFYS8ei7j68otezOq2R2o+Y5U+KQg5h7+l2/TRPU
        w/6CoagRZ+XySkO4cNgV/5YE5X5pM3iPk10Kp7NswDaw5wo8qSVHjgBM2YjGehD+
        Uyg6sE29aUtqXneUjdBXp+K3gwnS5VWnl2ijlY5QTA6Qvc9q2jaMQfmow==
X-ME-Sender: <xms:Wmn6YtQ7VKmZ_juHDhIq6hEVrmGnSo8SAOrtveDRjkwbrZ3b9ofojg>
    <xme:Wmn6YmwNBA6mvXuQ1LNpmPPXHjFwyBJLmEPO-EznzSEyV2Yvx3LQxgSODD5dviF8t
    JG7bfifxcXO4gB7xXM>
X-ME-Received: <xmr:Wmn6Yi0XuZohKgWiUQdwNfhBzI-G5e8SCY0r46adzYR-VQ1gWXRx94vdWtXF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Wmn6YlC4ANSQJpBPETJWAKM1wIZsCJf2IOUgPmFtejMNuamsUwVrYQ>
    <xmx:Wmn6Ymge6m8FB5648uSzURD-sNOCIs5zdkR_ujWyO0iN1f1345igZw>
    <xmx:Wmn6Ypr-xrbPGmP4KnPP5Wb0pVAq8vQccHHUS-JUALxzkE1KAcdgFQ>
    <xmx:Wmn6YrYaNZYml2J_g8U_gklpilZ5acwzZsALPXC6k5GgpVZzskTbXA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:42:17 -0400 (EDT)
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
Subject: [PATCH v8 06/25] clk: tests: Add test suites description
Date:   Mon, 15 Aug 2022 17:41:28 +0200
Message-Id: <20220815154147.1631441-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

We start to have a few test suites, and we'll add more, so it will get
pretty confusing to figure out what is supposed to be tested in what
suite.

Let's add some comments to explain what setup they create, and what we
should be testing in every suite.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 7d9da88c39ee..1a7cb482ec58 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -258,6 +258,11 @@ static struct kunit_case clk_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests exercise the rate API with simple scenarios
+ */
 static struct kunit_suite clk_test_suite = {
 	.name = "clk-test",
 	.init = clk_test_init,
@@ -346,6 +351,14 @@ static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] =
 	{}
 };
 
+/*
+ * Test suite for a basic mux clock with one parent. The parent is
+ * registered after its child. The clock will thus be an orphan when
+ * registered, but will no longer be when the tests run.
+ *
+ * These tests make sure a clock that used to be orphan has a sane,
+ * consistent, behaviour.
+ */
 static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
 	.name = "clk-orphan-transparent-single-parent-test",
 	.init = clk_orphan_transparent_single_parent_mux_test_init,
@@ -675,6 +688,12 @@ static struct kunit_case clk_range_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests exercise the rate range API: clk_set_rate_range(),
+ * clk_set_min_rate(), clk_set_max_rate(), clk_drop_range().
+ */
 static struct kunit_suite clk_range_test_suite = {
 	.name = "clk-range-test",
 	.init = clk_test_init,
@@ -856,6 +875,13 @@ static struct kunit_case clk_range_maximize_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests exercise the rate range API: clk_set_rate_range(),
+ * clk_set_min_rate(), clk_set_max_rate(), clk_drop_range(), with a
+ * driver that will always try to run at the highest possible rate.
+ */
 static struct kunit_suite clk_range_maximize_test_suite = {
 	.name = "clk-range-maximize-test",
 	.init = clk_maximize_test_init,
@@ -1029,6 +1055,13 @@ static struct kunit_case clk_range_minimize_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests exercise the rate range API: clk_set_rate_range(),
+ * clk_set_min_rate(), clk_set_max_rate(), clk_drop_range(), with a
+ * driver that will always try to run at the lowest possible rate.
+ */
 static struct kunit_suite clk_range_minimize_test_suite = {
 	.name = "clk-range-minimize-test",
 	.init = clk_minimize_test_init,
-- 
2.37.1

