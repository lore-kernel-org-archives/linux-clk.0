Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFD8C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349980AbiD1QrO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350249AbiD1QrO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:14 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9DCB2467
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:43:58 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 1D5425C0061;
        Thu, 28 Apr 2022 12:43:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:43:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164238; x=1651250638; bh=bV
        GgT1npjwiyHh18vI7XjyjssWK7tjT/5VvPCXqwt9g=; b=a32ybiDDPTW3ORcV8T
        z4FmtlvPRKjTxIiwaqMgGuAMwgo9UKO1IffCq4czQQF8A/zsLH8Rbf0LU7uS1y9F
        ChfnsRZNYfbgAXi/alBUvF6hDtRa4fKAJXtEU9ttIfbbk1tBz3a1x+5ke0M8aqNV
        a4cazrMLqbo0U+0PRnFL2zJuVpdzCoE4C2DbyUvWR8AXyQQBiLbLIsYu4oyeUIi0
        90/WAQKnVVylVvtCSZUYkAR3HE7M9tZZpYNI+87xKvAi4AVc2dQPWEyagXLrWwLq
        aLV4XUsFkpk4RY95VV8v4KVBBo0AKxCSHQK7SmBDgUEXR0KeLBwDDBW7GI+GaFUS
        CVWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164238; x=1651250638; bh=bVGgT1npjwiyHh18vI7XjyjssWK7tjT/5Vv
        PCXqwt9g=; b=VC0C0NtM/+B415NKy1mt5y2oKp50lfSs68A4io0Vg8BWuLgFnRC
        J39TvUB9ISkmsjrvey1IiuYPEWVA13YbUWa3yWc7miEMESFhCiUJur7vPt1/sv/W
        MK27Eu4G0J9e5OFHrRU9nTGBe4e3ahZwdzkX/mcY8zJ3U2Q2lu4afDuxiCLTd1MY
        AoqCLY5aSw0H1eYUMDeuhMJlMuhNhWn/3ID/LcXXzOClwzoNVYieVUDHlLLqxEcT
        2PbFeYaMCUcRV5lTzY024GHWXJgcDBfM0oMrECpZg2UOaJN+rCI9/ryhRiXm9KaL
        Y4+7gUk4brsZzpoKQVT6Q1jUUYA0eym37Pw==
X-ME-Sender: <xms:TsRqYkpEZeaGHHEXblZLdu-1OAbf3LWtqpjwM82mHsl9gMesXs7QWw>
    <xme:TsRqYqqrpnyojmHTZZQbp29NQpF_HXbTpMtOSUepJkqMr6_gF8Snst82U23CsYCrc
    Mm6MsVsx6YAT-Rkl1Y>
X-ME-Received: <xmr:TsRqYpMrSnV3ctORYh-GLeFTKFlsQBGzVbCugGkBBEAxWY6aZ0oZnXQLgmLV7U4dj82tF77mBb7iJ743kaWvG2J2ZUANMznk-VEb_DQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:TsRqYr4LIn5eoHY12UHUwZLAmUzD77oI0KT7dQ7kLLH036ZxDY6FGQ>
    <xmx:TsRqYj54dx47rY7bmshHFhrB0gzO0hzZVy0R2zkDyR5oXfKd0yavmw>
    <xmx:TsRqYriC9GwBG9wtH84QLPExT6Biislq7wun4SOdH5d-xxcz1NiPdw>
    <xmx:TsRqYgyWxPeS3sMtYR3ao0h3_qAYkXMtASIZlWefK07nGOUAc_T3eQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:57 -0400 (EDT)
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
Subject: [PATCH v2 07/28] clk: tests: Add test suites description
Date:   Thu, 28 Apr 2022 18:43:17 +0200
Message-Id: <20220428164338.717443-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
index fd2339cc5898..64ae7e210e78 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -250,6 +250,11 @@ static struct kunit_case clk_test_cases[] = {
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
@@ -336,6 +341,14 @@ static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] =
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
@@ -645,6 +658,12 @@ static struct kunit_case clk_range_test_cases[] = {
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
@@ -822,6 +841,13 @@ static struct kunit_case clk_range_maximize_test_cases[] = {
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
@@ -991,6 +1017,13 @@ static struct kunit_case clk_range_minimize_test_cases[] = {
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
2.35.1

