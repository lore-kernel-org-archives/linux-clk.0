Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080A5C32789
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:51:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbiHPLvk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235201AbiHPLu3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:29 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25CC4D633F
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:05 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 8682F320091C;
        Tue, 16 Aug 2022 07:26:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 16 Aug 2022 07:26:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649163; x=1660735563; bh=LX
        vB2jq6MwccAlAMpMLozRtwBQO+PLl0qYhsk/XlH78=; b=gWXqem83/CRj64mnqU
        tPWWG378tFSIkqfa2pmjyndirFAvKjml5CsqDailkP0Ohx9PvgW69FIhERrSXoyU
        /B7natU0aSqktRGUBltKZvYo22RDvIR+9ckZIo1Nlb1bay+W2Mywq7B7z0piJ23+
        NsoUvT5nROn+awEcchNTLykqjo0u6YFzVP8YFHEQY+mHPFav+3ievio0By9OUGbb
        2JwotCdmQbVycgVUobdreLYiKcCxCdzqHLxzDLp9/hyUaoLXFYF16I391YTw5qzo
        7aN8s5GVI4jm59Yup3IaEolHv9EtoFOOQmFSg8aBw34RNl5jATGULsxSfsP7p9Ma
        2SYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649163; x=1660735563; bh=LXvB2jq6MwccA
        lAMpMLozRtwBQO+PLl0qYhsk/XlH78=; b=toNzRIdeZzRcEV5RB2tfZLLVsV5ii
        vyxOY4zLihR05aNALaxFcsfykj9PyMDAmGLudY8yUyrv6j2xoMicG9Cc6pVkBp0X
        lb/Ie0rtFOzXBuU40F6mv1RwOAc+AcQGljgDx3K4SfLveATfw7md7H8qMa0jNsrH
        66NWlBTtj+E0qto6sFtxDMimRz2FzWRfPk/0m9Wob2B7qp+dp/idSZYhmxJM4+R3
        VDTrKGtVeRShZ7umOSDoHtG+L+uUp79qes3gcm9PPrFrOybFMckjfVpbGWzvS+Wi
        hxtqSijBSJEnKGeGRz9R48sO9gGQNgbxQVcxuBlo5Du85Zf8RxUlfIHKg==
X-ME-Sender: <xms:yn77Yrb4sxB0vSpb9sMLSrFWR_kbMcT7S-Uzkv-TGOHmWXBPPC1MVw>
    <xme:yn77YqaF0jH9sUx5-mOxt-tXeKMU_K8bkKYrrNKFDCPWa0CCBuL4qPXjGPzMKEJcm
    swoEv9Gm54GQbc0WZg>
X-ME-Received: <xmr:yn77Yt9jHnvNy1WRZd_Laze7CV3mieBQk219KgbR1I08P_D90tSIhGOLvyc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:yn77YhpMInIZ_DfEiJIvTCX1vtOPDdZxdFPuTAxirO3vQsngb2tfug>
    <xmx:yn77YmqHNVmmUxFMO-CKaY9tgPAidlXnjM9ao03gC1nblrDaCtPl-Q>
    <xmx:yn77YnSAElaWB56ZEPaUfY2vUyKVMmrxm_swQSomzIVjU3d_Fs0-rg>
    <xmx:y377YjjIFL6aGSxLuhf2aHbA08n0xESU72K2Ik4lTfPVMy1h9Cq10A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:02 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 06/25] clk: tests: Add test suites description
Date:   Tue, 16 Aug 2022 13:25:11 +0200
Message-Id: <20220816112530.1837489-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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

