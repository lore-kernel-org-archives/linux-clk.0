Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A2CCCA482
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:01:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232691AbiGOQBE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:01:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbiGOQBA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:01:00 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5294972EE8
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:58 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id CE4AB32000F9;
        Fri, 15 Jul 2022 12:00:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 15 Jul 2022 12:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657900856; x=1657987256; bh=0C
        Od+myCi6YNPxPiEB5EEfiL9iegAZ8BdXTc5W0Cnmg=; b=vGjOq5+lgc4gtN6qaM
        TzSrTUk3xi4rnvaMXDQc9SboJKyws6NaNTD/uGScglXciTuUIzi/CXsjk+et9xtK
        QLcgYkOqMvm4KDVb00gEEkvObQ8QjFYW8Yh4ogEqqUK+PT1KHm5DvQpxzJzskd9p
        dj4Jep2GzovZzy25oBNEmHLCZxy/Dxhfe1w2THfjGCjxENf0gKOHJ25dkzWnVzxQ
        KTleeqTX9ZSkEXbbo2QP/bKcP3DWp7gpMBelBMORb2d7O4qCoIk127nDor+gTxhD
        szOdT/fI7bIY0T04pJq4Dojm+3TO1lLRMNJ26j5sYZ/PF1Q6gCrE1leUZ4U0Zp+7
        O3FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900856; x=1657987256; bh=0COd+myCi6YNP
        xPiEB5EEfiL9iegAZ8BdXTc5W0Cnmg=; b=tJYBOWygj2rEvwNz7Y5+LNFh839Rd
        n3xqHgVPQUGq+iVCuPCtbM7/nk7tEKWWY5WXfHAhXAeazYdU1hzQoa14wnCozVWX
        NrJ6BJO/5JSV7+EmmI/MeDS5mF/NpAtX0hUFApA+MayZfxLgCM33m3sKUuNp6Gub
        pZrj9N47+MhQiaWdmOvuzDqMzzbPumzF097b/r2pDhOiIGdOcNbDMDRfdzzDCWg2
        H9mGKI+vY/Id7k+3fUFFKf8HGoxiuANzHlMmrMjjc47UhbKwPh/4cdcRv9guzQzN
        0EBCa8uzCSeG8mWKg+6pOJaYVzuWPdQJOPga7s2LkYYM2rCblcAFNWiKg==
X-ME-Sender: <xms:N4_RYmKsgahfcbQyec-Picip_B7-p2tWajl-UxQ6LCfoLdoy6FkVZg>
    <xme:N4_RYuKNZG4qCVRdAPxAx3lDTKOans4jrnQIG8dIl_xQu0PIvBnprTdmW03oYqtIn
    OuHaV2o5UfL2pp08-E>
X-ME-Received: <xmr:N4_RYmvNARgQpzs-0x6n0_LDYSQrn0z8eNlIQ0ERhITdbudjGNSaEuDGSXxq01CjLkiPtMMXfPxaNDlfx3etVWxSMY_5-goNdTXZXg8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:N4_RYrYE2kSNzFb9-FBnjjvhp73VdgffD_88jI3NjTOJ_VA7VCJelw>
    <xmx:N4_RYtZJG5mqBPKwxqvX_Nm3UQ0XFSQ6wiyX5tZ5WIhNPzyENcuKew>
    <xmx:N4_RYnBQI9sPdFLFbdDLrZU06JKh-FWdDffvy-ZmI06HAyIqdQGHMQ>
    <xmx:OI_RYqT931vpqLOnLPvmyx5K84trgtmumcz1BmGT5IJVmotmwTSzGQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:55 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 09/28] clk: tests: Add test suites description
Date:   Fri, 15 Jul 2022 17:59:55 +0200
Message-Id: <20220715160014.2623107-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715160014.2623107-1-maxime@cerno.tech>
References: <20220715160014.2623107-1-maxime@cerno.tech>
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

