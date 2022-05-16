Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BCAC4167B
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238444AbiEPN1y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243826AbiEPN0A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:00 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F703B12
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:59 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 4CEB43200993;
        Mon, 16 May 2022 09:25:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 16 May 2022 09:25:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707556; x=1652793956; bh=Q6
        M68wJkcJDBe0EZnpmVoD5xzpL/pgI11JYEhvGpUgY=; b=tTyV5FLwFLusZwB5Dr
        wnfZiVwL5QBn7cXJwC4/uygiCAVK4H4OK3q9IRrSbOCjIofUjwA7GafioLp7q6qN
        iLk7PShZmiIrl2srqYX00cipZtThNePGXHZV7JNf2+Y6hR2DnDPYEVXoedHl4rrd
        T063PDMurLGh0Y46Pu58sTViFlYvdmbGJXwQvPJ2gLUmQKiwgWELi0VlFIKmVFqc
        gtTEMpahvbywBQmZ2GjcDHtCtvavKxykfaimKqadEmvjV9O2ozSjkr4if37Smhrh
        gKOy5uh6iuTNELLplwWjwEAgilBpK7eL/ne1XHcGDqGxMat8WTB1PBOEoP173/Mr
        eRhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707556; x=1652793956; bh=Q6M68wJkcJDBe0EZnpmVoD5xzpL/pgI11JY
        EhvGpUgY=; b=zSwjdW89NVt3XbC9etG7LrFA2rNEAaU4sCHq6M4bSmkEHoQh6Xt
        qdDEnEh2jozmPpC0eu9F+Y3d+XD0IrA9/pd0tcJxi7R+je5+mxFoUVSb5WEFOmMY
        9RsvyKKngiAnWEA9DsaS8gCxxP3Rczkk7qvK4pGF8iPuMdY+aEgo5c5kBmx1VfDm
        Ifs2t+GIVfqOeQLMIBPMdRfRNL4Q+9jmP9rw1ny1M01AvEkm8kMmtyKjJkcIGqlB
        CvFiNfJw9cGqsLa2h6DEDLk2nIxLpNihmOhbz2BZ5optihF8nxtZYvPAo+QjMf9k
        TGaN62iu9OxK3X2OQwo15cCa8rZInZufNdQ==
X-ME-Sender: <xms:5FCCYn-M1HYg9uADFiCB7TwsKu2ubuYUudE8cDeZEITyLeSRag0qQQ>
    <xme:5FCCYjsIxH3--Y6r_dDN-H9JRhFO7SsxS4R0D-Ayz8kDpG4DdUdZ2HT9ziAnNx32C
    OO8OWt9gGbskReKaEY>
X-ME-Received: <xmr:5FCCYlDboGOfc082ZD_-wmDmX-xitip5nBtA6C5rAxFm4EVA1RKh7SC8vK3u54UphkqIYIkCWlYS23npuP_VvmkkvHNuZbUbT-YiBvU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5FCCYjetKsPUuZ2JD_gf4rvImNad0TQHl056LIOYm-Lxz6r4Crt7rg>
    <xmx:5FCCYsPuwg0ryLVrTbQurIam5IpPUoWEluUA7Ubdq4qprFurrer4bQ>
    <xmx:5FCCYll3LbU5069tEJL2lZ11NsaOvJEKoQQ6bhDcbARoN9-KzmDhug>
    <xmx:5FCCYtG3HuUxlIAbjLhfiYWvtECYs7Q2I2lftGwxVUXX3_c2qL620A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:56 -0400 (EDT)
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
Subject: [PATCH v5 07/28] clk: tests: Add test suites description
Date:   Mon, 16 May 2022 15:25:06 +0200
Message-Id: <20220516132527.328190-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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
2.36.1

