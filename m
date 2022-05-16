Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3713AC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:27:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238957AbiEPN14 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238226AbiEPN0Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:26:25 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B35F25FB
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:26:24 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 3B20932009A7;
        Mon, 16 May 2022 09:26:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 16 May 2022 09:26:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707581; x=1652793981; bh=WI
        btfN6QN3QACpaSXCtqEP9OCzN0b/rwRnYojT6Am34=; b=ahcXJ7EFcP0qp8SLwa
        lsE5UfT90sAqBptWsmIQZq5Qqf2J7IOAhknewKOCw4hDO4+IV8kfCLZByFE/zsZZ
        llkTJYs5Hx0yCd1EyNCWkJkMk5B3bixmw2LuXiMBnxZXzTzRWn8SBX3qsuRi3d1s
        G7MU3+lB4tcod+6ocvlu+K+W/k7XESchuwNTh41JSnPYxi5R+PSs7+v9sgEausxY
        O7fkAx1Ga2nNnWl+3awxZsegZixmoXexb5v98NRT4NXzbxg/VXjCPsJvU4W9oHw5
        zudE6KSQeYEAdbYyRB9E9VsGpRQszsnFprbOSy9/SE3TXd19Qgo4vqVN2wE2eXoT
        xx3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707581; x=1652793981; bh=WIbtfN6QN3QACpaSXCtqEP9OCzN0b/rwRnY
        ojT6Am34=; b=JWZT3M+yZdAMwU7qe9RGVjlQdoYP9m0cuFt7ovCMCXFsMHq6sba
        a/AJ9ltj6FpPZLzGm0Yrfx3upZBGv5AQtVukMrDLdqi1hyiCRj6VnV+p1ZAfzsMb
        M+a+cn1Nr1i3YrXKPCb535fghimFd9hEVhO/pi8gptrubLDwlzuqMzi4bM9ojAG2
        n1i3/Hk+a5QbNyyvbFax+hZmJfxlw8Tl++zsVDPjUX8C7nSRbGGEeRiQ+/jIYVSf
        s73v7L0zCWt5y3I+i+xAYzAXxrB+7CTxI4iSF0ayQUjEIHIEI79qkCgvEByYODVv
        m84Vif2/ZpUHNTHuLoLyG+sP5jrjZKwKb0w==
X-ME-Sender: <xms:_VCCYjR-UEkeIizr5q1s2aWbdfZgUIHB9epkizZKK7QhYUhgTrsvmw>
    <xme:_VCCYkyQjkC9GRGIAy1oX460lTOsHXeFVZIwCjN0rAX2dnw9xpjZN5pyqIvd81bm-
    7IJNLEvFY3uHgZzCMM>
X-ME-Received: <xmr:_VCCYo0QyHcknXzmpZ1I76fcW41lKo4UAVzECbsYT9D3U3jtDaDooxms8HRNCqG9p51jOuL-IfqT9THLuNp6juAGdxJ_g4f-SiFR04o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:_VCCYjAm7YuJqlbeEZ2_PNh_54t1IoHqSOlFRau5y-8bgJAaE8YzqA>
    <xmx:_VCCYsgmzLQPpcXMrO_r4vH8MerNjklapia5j6u9MXrG_GKOv2yQOg>
    <xmx:_VCCYnrPChdYeKqk9kOGiZl7Xkxygg-GY1Yw-3M7Rwi9WWh68jvUUw>
    <xmx:_VCCYhb7KaO4wOknJzRnotAylHff2goWWjqdUx1mLp1mV1tNPqmElg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:26:21 -0400 (EDT)
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
Subject: [PATCH v5 14/28] clk: Fix clk_get_parent() documentation
Date:   Mon, 16 May 2022 15:25:13 +0200
Message-Id: <20220516132527.328190-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
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

