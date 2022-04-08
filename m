Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E033C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbiDHJPZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbiDHJOB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:01 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA691252B6
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:46 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 0AB475C0240;
        Fri,  8 Apr 2022 05:10:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=RnrpVa9RHyBpW5a8Cb3GcpIWdXiWec
        ynZfaW9omCOic=; b=YX+I5lSzVEYTURfC2MlDVMwQ2fQbjliybULv9uI+kpzDjG
        7dSoAz8XpcWko3qdX9iB6cK38fyKyzjV8HAE1qMIdGGTSTugc++3QzTF/IftAv2/
        lZ5N1tWHEjuxTF8QgNxn6fFQW6ayDusE2aVP/n6Q/BJpng5ar5vHDQDmyIWIewdR
        O4FaVT+a924IhevKWRYOjfrtbvpSnF3m+g7VxYhb9Dp58ucTpEY2H6JHyO1vlc9h
        Jpa1JBSwWyoGRqTgzlTePlGrvCfQIGbkSxT9bEznQYawP+JhGufw2MubFpuZAvka
        KCm+uW/ZAy5wzpQyTePAwOdv8aTiUAsNA2Ef0bsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RnrpVa
        9RHyBpW5a8Cb3GcpIWdXiWecynZfaW9omCOic=; b=ERKJnzc7T67wJ6wUikXjre
        RIvWgr/jN1w63M/nm+wPgSXCJEB/f5EXCHSyggIzsMEd0e8xOI3z9VdtQ3R4pc+6
        CNkIuKO9U0zgXtBzbm20idAEF4IH0cIlowX1EHIk36LShcRiolD/SCOGeqvMTj9L
        EgC2DOhxyccGFG3iXboe+UzhuDvSra8tbj76e1RUzea85eDobOKtVttb7NxKhvcv
        x7nXUXWnbiDr/yzSmVFfMA4u11vzmxm95U7EkI8I3CnvpqFtLvEfYtts36nWfI/z
        GcequowhhrUBzAjeTpu9/+5AjtT233A7D3S98CnY7egllm2/I2/n4zbfNFKvcKoA
        ==
X-ME-Sender: <xms:FfxPYlwfm7b3xbqjbVSL3kdFBFyJEQmAx9VGSxSwwNbEU1wk5D5KoA>
    <xme:FfxPYlQe_xbSgj6_YTnGlOZ-MpaqpOhZnuDc7RnYL8FCV_ZqSvuw-9SFdvgXmQZln
    IpXxZaVUrqq2iXOts0>
X-ME-Received: <xmr:FfxPYvW5r8SkFY9DM62f5906yDZFXBbzre8ea8XpMu9yoR_mSv0fN-NkjKy7eZjfXmTmi-kEHuXiea0pG3Zkk8rI3aTRJrtHjM4Bwfs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FfxPYni3o8iXvN7OoZ74CvJ17kvDniN6Bjw6r9MKx3HFTqSHN7anbg>
    <xmx:FfxPYnCybvP4oGIOjycrK-4SQwAc-j7vVNezzbYC8-Evm2XZzBYoAw>
    <xmx:FfxPYgI2mTqdpF1fqvqZQ6nA2twTTBeylKKqT7Nunk6EQ5YQSMR2sA>
    <xmx:FvxPYjumdXhZpQyQerl07q_5PHY6cphLfZYW2P8vbUFYP4mCbLdSFg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:45 -0400 (EDT)
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
Subject: [PATCH 02/22] clk: tests: Add test suites description
Date:   Fri,  8 Apr 2022 11:10:17 +0200
Message-Id: <20220408091037.2041955-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index fd2339cc5898..663b3dd388f7 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -250,6 +250,11 @@ static struct kunit_case clk_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests are supposed to exercise the rate API with simple scenarios
+ */
 static struct kunit_suite clk_test_suite = {
 	.name = "clk-test",
 	.init = clk_test_init,
@@ -336,6 +341,14 @@ static struct kunit_case clk_orphan_transparent_single_parent_mux_test_cases[] =
 	{}
 };
 
+/*
+ * Test suite for a basic mux clock with one parent. The parent is
+ * registered after its child. The clock will thus be orphan when
+ * registered, but will no longer be when the tests run.
+ *
+ * These tests are supposed to make sure a clock that used to be orphan
+ * has a sane, consistent, behaviour.
+ */
 static struct kunit_suite clk_orphan_transparent_single_parent_test_suite = {
 	.name = "clk-orphan-transparent-single-parent-test",
 	.init = clk_orphan_transparent_single_parent_mux_test_init,
@@ -645,6 +658,13 @@ static struct kunit_case clk_range_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests are supposed to exercise the rate range API
+ * (clk_set_rate_range, clk_set_min_rate, clk_set_max_rate,
+ * clk_drop_range).
+ */
 static struct kunit_suite clk_range_test_suite = {
 	.name = "clk-range-test",
 	.init = clk_test_init,
@@ -822,6 +842,14 @@ static struct kunit_case clk_range_maximize_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests are supposed to exercise the rate range API
+ * (clk_set_rate_range, clk_set_min_rate, clk_set_max_rate,
+ * clk_drop_range), with a driver that will always try to run at the
+ * highest possible rate.
+ */
 static struct kunit_suite clk_range_maximize_test_suite = {
 	.name = "clk-range-maximize-test",
 	.init = clk_maximize_test_init,
@@ -991,6 +1019,14 @@ static struct kunit_case clk_range_minimize_test_cases[] = {
 	{}
 };
 
+/*
+ * Test suite for a basic rate clock, without any parent.
+ *
+ * These tests are supposed to exercise the rate range API
+ * (clk_set_rate_range, clk_set_min_rate, clk_set_max_rate,
+ * clk_drop_range), with a driver that will always try to run at the
+ * lowest possible rate.
+ */
 static struct kunit_suite clk_range_minimize_test_suite = {
 	.name = "clk-range-minimize-test",
 	.init = clk_minimize_test_init,
-- 
2.35.1

