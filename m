Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92EAC43217
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356194AbiELQEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356165AbiELQEf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:35 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502EB266C8D
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:34 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B59925C01D2;
        Thu, 12 May 2022 12:04:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 12 May 2022 12:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371473; x=1652457873; bh=Q6
        M68wJkcJDBe0EZnpmVoD5xzpL/pgI11JYEhvGpUgY=; b=CRpQ2dKvJNE9oyR6tU
        NLjl/wvodgqWqKHYKSc1IPDON5w+GP1NG3aKFcr/Gs+7qphrB8XkobjL6BXLMEi/
        eOEHmUzYznQ2g0qv1C0ZAT/rDFXuZnXYS9theZV9bb9hyJd2zW0GE2dXPapLJpQx
        PQNxUQqhrF1QbUllTlEGIVjl2/Wre6VZtpSAWa5HnFVp8z19gPJ3aUdf48MfeOIQ
        I0ymhoIQHYVxs1QB6EblQYnXyKtXT2Z5OeW3EVoKjDc+sDj2kMsd6Hr8oo8rvwCX
        Qh8b5VTxcxhDtAw6T4ic1KUQDI/yJ2VKd0tl2VEymdD1ZE0Ma/mAouSw1h/7hC83
        Y6OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371473; x=1652457873; bh=Q6M68wJkcJDBe0EZnpmVoD5xzpL/pgI11JY
        EhvGpUgY=; b=wqCHFqdYbnxqfJSuSXAG2yT0eLaQav9I3S9E3/jNW34QfTlCPGN
        pMsNzR4LjheA9bFuCjjILG8D9F0Nrn2AaNlaaN/xZIjLuFB8ATBnAVZ7ohYHEVKE
        qtBBwznLNSWMcbYPP3VqCmbeR73XNjqVkECoPdrs6nSIleqeWzHLE/NCmI0Ae5Gh
        L3r4zcpf1+PFrFEhIl5tEZO6r5Q8atkL88r0IF7AcnNBvEwfpw+ikQYy4KkUiEdP
        ijqnV8gT7zniFHEMI5meiEr4C/0wLd2JeJ8RXqr10pxSuO2YxJ2+Wrxe22LWdNE3
        Og7NDppz6mMzbHEFXPxGCRZHdYAQ02zUSDA==
X-ME-Sender: <xms:ETB9YqUu0xdC7RzeHhVTBlWWTMayrxnRk2rw7dz8p_qwcQszWvOwjw>
    <xme:ETB9Ymk25T7ub4ViYbEVdvxWrOcZnvHrdNwFb7ismG_HXc-Qy0ET7g1x-yRt1vzgn
    kNgoZtHJhEu0PKT-_4>
X-ME-Received: <xmr:ETB9YubYpuRYUjRkurAH1U2dV7FKd5NgcU4BCP0yiBjS-a2KHl_ik3H5E__OQ0fkuvMpl0jpixgLs6x4ze_VQPOh9RxFsL9fYmbdNdo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ETB9YhVq1O7LliLWktzKeJnQnmv29mwc3C7XheS0Hho0ybUvavXqaw>
    <xmx:ETB9YknNX8VCMRrQ6R5H5L8KdHlbUW3lpMmS98vqGf-mh-sW86AcTw>
    <xmx:ETB9YmeabCrLkc17MxnEib6XsdY87KPXqWEgCDQu6jMpUnaoHdsgQg>
    <xmx:ETB9YtdDaNL5HrzMf29EY2B5sCEwbAhPctoM8sUn7vYIhuIqmeNOkg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:33 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 07/28] clk: tests: Add test suites description
Date:   Thu, 12 May 2022 18:03:51 +0200
Message-Id: <20220512160412.1317123-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

