Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE54C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244989AbiEKOn6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245006AbiEKOn4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:56 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD172FD376
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:50 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 09EC9320076F;
        Wed, 11 May 2022 10:43:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 11 May 2022 10:43:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280228; x=1652366628; bh=WI
        btfN6QN3QACpaSXCtqEP9OCzN0b/rwRnYojT6Am34=; b=nauDAQxGEOr98iSXMN
        9uVuX7w8KH9FWIiYE3gBWwi2Ayizmc8ls/dQQqn3BhgM49ITLbKve31VQQ60BheK
        mD5KDW6363EAtPzROgRjLfT1UVE4fFsVsZDxUMfr51bxJRCnKhbLwv2C2sdTOmL0
        fB+6sU7rjVJXk2yRGpZKBL1+aKImcy3S8w5M97y4zjZmD9FLiz2ezDEjhHloVxKK
        E5N7nHraMgZ82ulzLtVYB1GWRwuFxSHSFa3zeEuerxiBVEuURMR/pVOnjKOP2NwY
        GDPMxe4RG4rdrtdBbDmqU9nK4qvpXyRCFXlCZmHNUb6luNLTMEAsG4TCRW+HYn0X
        6ZEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280228; x=1652366628; bh=WIbtfN6QN3QACpaSXCtqEP9OCzN0b/rwRnY
        ojT6Am34=; b=LlEpflDvNpR7h89+uaq1xpBVRwaxikQfTzylzXWtbkwpm5B+ti0
        rl26Gh2pbW0EmNmUP31xotlreeyOD5+DWoLboEWZSLBTYlTiWoZvYaRhJjctLvte
        mZRqAzMVvAfgwmPqjPfGsOyGH2eXJuuDuBibXY20t1pDCkjUu6iRqQ5ApKXjRLFk
        4tjrukFfZOGTUmGkxlt/2E5BO0/+Ggvtn4uQ/OAGJK4U6giX3Ds22bmMW9DGxyLH
        emD/rWLK/AjIvH/m23Q0Qu2dnIdwQcwsZetsMEk1eVoirRiWk1iCN3yCB9nAsLjU
        EeIjnA4lC8gJZ/rkYMcQfrMw3ADASCwBvSA==
X-ME-Sender: <xms:pMt7Yriq6Yh0O3ugI0gxvs-uCXjeKzhTLSOEkyvf9F9GheuMAzfKBw>
    <xme:pMt7YoAcdXQiOnU4Y5AhEa2Szx0ZkSmz_L-IiBQdomFUbEkEcIsmw0YJE8UWtAwMt
    cVW1kgKenm3T-kZCYg>
X-ME-Received: <xmr:pMt7YrF62Aou_Rdwuh2d5evrL1rcnK_C31MkyqXI44pGhIq2xgOTilm09I_CKCzpyrdbXnkfXcAd9EIEaWgYzjYKEtkwj0TP8tjrHC4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:pMt7YoSvdvpL7Q6T-jD71p3sDbWE3cy15PxeNIMc0L7uwXJoI5wnEw>
    <xmx:pMt7YowXLch0CP3h1lYngFxvqnRXqTgig6X8MMku6RzdDLYYA4Ai7Q>
    <xmx:pMt7Yu5qUVzJxm1id5B_r6XLqZetoGv2uDCqmsqbSlup3qmcPXkRxg>
    <xmx:pMt7YtqkeOkLEDpK5Q0YTAxLvUE2u59Y-fnTjz4iV_PF7gAGdsTbDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:47 -0400 (EDT)
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
Subject: [PATCH v3 14/28] clk: Fix clk_get_parent() documentation
Date:   Wed, 11 May 2022 16:42:35 +0200
Message-Id: <20220511144249.354775-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_get_parent() documentation in the header states that it will
return a valid pointer, or an error pointer on failure.

However, the documentation in the source file, and the code itself, will
return also return NULL if there isn't any parent for that clock. Let's
mention it.

An orphan clock should return NULL too, so let's add a test for it.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 17 +++++++++++++++++
 include/linux/clk.h    |  5 +++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 9aa5b946f324..c52098e463d3 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -532,6 +532,22 @@ clk_orphan_transparent_multiple_parent_mux_test_exit(struct kunit *test)
 	clk_hw_unregister(&ctx->parents_ctx[1].hw);
 }
 
+/*
+ * Test that, for a mux whose current parent hasn't been registered yet,
+ * clk_get_parent() will return NULL.
+ */
+static void
+clk_test_orphan_transparent_multiple_parent_mux_get_parent(struct kunit *test)
+{
+	struct clk_multiple_parent_ctx *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	struct clk *clk = hw->clk;
+	struct clk *parent;
+
+	parent = clk_get_parent(clk);
+	KUNIT_EXPECT_PTR_EQ(test, parent, NULL);
+}
+
 /*
  * Test that, for a mux whose current parent hasn't been registered yet,
  * calling clk_set_parent() to a valid parent will properly update the
@@ -678,6 +694,7 @@ clk_test_orphan_transparent_multiple_parent_mux_set_range_set_parent_get_rate(st
 }
 
 static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified),
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 1507d5147898..39710b8453fa 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -755,8 +755,9 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
  * clk_get_parent - get the parent clock source for this clock
  * @clk: clock source
  *
- * Returns struct clk corresponding to parent clock source, or
- * valid IS_ERR() condition containing errno.
+ * Returns struct clk corresponding to parent clock source, a NULL
+ * pointer if it doesn't have a parent, or a valid IS_ERR() condition
+ * containing errno.
  */
 struct clk *clk_get_parent(struct clk *clk);
 
-- 
2.36.1

