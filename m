Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1810EC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbiGKPYr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbiGKPYq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:46 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAD7E252A3
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:45 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 39C795C0196;
        Mon, 11 Jul 2022 11:24:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 11 Jul 2022 11:24:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553085; x=1657639485; bh=0C
        Od+myCi6YNPxPiEB5EEfiL9iegAZ8BdXTc5W0Cnmg=; b=vq1jASYKRXyBreU3kM
        J02fjCUZoGZCCleTr+gFL0IVWwqWInEyqjSW4T1LpwTnRRjRADpiiBU0PUI0XcjP
        qHNzkGwe8KG4tGOfrqyWvByxgrXr8wV/uoUaODeHLVNhq6DR7PvCZ8XKQFOiCzbm
        L/j4fh3nQfA4gj8aYoKH1rg4Smtc98bsHyJn6HDTlkW5mCftxw2N8vC/0rA4ym/i
        ZA2Uh1zIwEH1gRykSrMHzK+6TrqZuI8VJUz2iKl+sdniBQ9ah0N+eOJRgEtg+Xao
        7sS4oU+rem8qPyu7bP0euj3e25Z0cha35esYxFNQZQnfzOogKvGvxTSHFuAyWPrF
        rsAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553085; x=1657639485; bh=0COd+myCi6YNP
        xPiEB5EEfiL9iegAZ8BdXTc5W0Cnmg=; b=Dwbo2wTwmWrqkr5os1fWX9sUAAjKN
        Snd/FWB1AtAFyB7gfrGbmdJKM/BP0n+TZQp1ecjsXGMGbq1zi/4QIEK+jpYBVxC5
        nXefNIs17ThgMLy2dI5H2b0McSs/Gst1QtKKHEza8Rkf50+q1s99GYeJStAxvoVD
        VRqVZ8K2h1GLSqBV1jsdu9H0qu0XU5s/pg8iLuv7k0VW1wwn2N22FweVjFE0+Rzz
        1y0bG1jumbcMtrkddJZn5xDq4LKRMXya4M+4KEkxlzGCK59SAkEqNRcIgTUVnVBt
        Dr0FDNfXXTwwRd5rKRExaK87hTwF7FBnkxlZ3cKn5CBgbfDO3ENgPYyTQ==
X-ME-Sender: <xms:vUDMYvBTWcdoYmc6WylQfKuAshplxCF6FI0CaPif1UfhEHQ0eQzH7Q>
    <xme:vUDMYlh5qOtn3-J2pLxXzV5UiJ95f634dOD3O8FSbEeaJZ5g2HPQBmJL4-DbcTASR
    SOIKC5f8vR_fOiuO2o>
X-ME-Received: <xmr:vUDMYqkSQdjmMtbAn8ji1sB1zCxefzxxqJOJW32EyW7YZ4iab2lQKRF5lnOmk2QOdw7twrRlTKAlmV0kY9nGdJGqUyxYm_KCscgQx3I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vUDMYhw0KJFuxRlZ9bhsNr3BpP0e6HB4x-CGyazYU5ZlA0bREBqDHA>
    <xmx:vUDMYkQcA3tdJSyxg9hekXYtKJ0XZG-CAn8KE2sk9ULqz0KRflwK0g>
    <xmx:vUDMYka9TrNnLMAdm3CF37P0dnNlJ7WG4VE5zND-2OVzRnB4vDVQSQ>
    <xmx:vUDMYpJHOSEFxmMMGKAY0Ni1nWsh8dE5Ct1CbzqF6xEdusFoG3tZLQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:44 -0400 (EDT)
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
Subject: [PATCH v6 09/28] clk: tests: Add test suites description
Date:   Mon, 11 Jul 2022 17:24:05 +0200
Message-Id: <20220711152424.701311-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
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
2.36.1

