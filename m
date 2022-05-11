Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B5A4C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244919AbiEKOnY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbiEKOnY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:24 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4536487A14
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:23 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 735FD32009BC;
        Wed, 11 May 2022 10:43:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 11 May 2022 10:43:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280200; x=1652366600; bh=Q6
        M68wJkcJDBe0EZnpmVoD5xzpL/pgI11JYEhvGpUgY=; b=InFeuQE1v68VO4pXFg
        sA91IiXYzfi2Iug0ua+8ZcJChw31xcsd8LOtUl3t7B9oJ6AXy5/pwjzTM/5CCFBb
        ONLbI6y9YuBgLFUA5+PuJbcyIZdqXHA6DyaTUaL8VbiCt1bI2tIYAnCXqjNJ4u7F
        VYUczLIT+LgwI25S8MwUk84x210jhil5AnaVAxJDXSyfNuNv9zdfyh+l2f/z6RiN
        belaB8aXV6BXUDJgjFMvljqVae60Ic/6+byidW2siwhDREn2A8tq8pjQ0/0/Vmg+
        RC/2E4y93R2oL9MXH1eWUbDSCgGZgMOsPNGgG3h+q9xPCiPeqMY2KZdMIPQhCw3e
        WlAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280200; x=1652366600; bh=Q6M68wJkcJDBe0EZnpmVoD5xzpL/pgI11JY
        EhvGpUgY=; b=cOvysSCV9ZUEyiftWuWuXhW2HRU00dWoZW95IE/8YzcXt8IeMWx
        rwTXidkqouLu8LciVErzBj68a4xqvWiQ8Re36WNyfJszKtkAl4nlZuO2ZkwY1Z9V
        kA+2Is3ShnxJEseDZqlhfLNr6SvflZTjCxLDpbbH7fLKOXuKecPkNMiAOarh9NQI
        iPZCI1ks6iTRgNFfKS5TwCCySHCdNQH53uGXQv3buoXy1Dz10NpcCY2FYk0cn6Wz
        wlNx9Digcq/POP2lg2rOGpHlOfM612fn15Qbhh0oT33HhhetExeUZ5iV8iIHIkov
        skD5yXIr6b7QfjYfst552rPzx3BcelSSEhg==
X-ME-Sender: <xms:iMt7YpxEr0MKm9n6GZJJoUsU99xjPFiGjRoy2M31Z2TETfY-EAasjQ>
    <xme:iMt7YpR6ChkYaGyLNrTyXoA3nW_HhPwLrzni8Z8GAxWRqPlXdNPSDFaoz-lQksGst
    DGrTB-k0EPtcZyhA-U>
X-ME-Received: <xmr:iMt7YjWBZ2NUzEVurCMyS8Uzmqlhtco_tnRuOShQE90LRgWsnF_4JhRhzcnjaxbLxwa9Zm3ubKkz3sBB32UE6v78ah1cuGo-7LVnQTE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iMt7YrgN56iU9r0-yUq4Qqzf8gG3Zc99Mr6risP6eEb6XJNKCA0yXg>
    <xmx:iMt7YrDrl_JmPm_xbZ8IiP_hc8LbazsVSzKJdbVeJM8yEFyv89htJA>
    <xmx:iMt7YkIWli_fMhlwFg_STrl9Q27JdK3taD7wRlwnodL2N756cIOrAQ>
    <xmx:iMt7Yv7JkCSeVx4iBeu1SHLlTCJFWzywTZbdGLjVgkaZpDscGwGDSg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:20 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 07/28] clk: tests: Add test suites description
Date:   Wed, 11 May 2022 16:42:28 +0200
Message-Id: <20220511144249.354775-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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

