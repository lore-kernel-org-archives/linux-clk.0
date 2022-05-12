Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172E4C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356193AbiELQEv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356180AbiELQEu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:50 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABB055F26F
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:49 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 1B3DA5C024E;
        Thu, 12 May 2022 12:04:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 12 May 2022 12:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371489; x=1652457889; bh=WI
        btfN6QN3QACpaSXCtqEP9OCzN0b/rwRnYojT6Am34=; b=CzcxVGZW1aTiGffAmi
        TqrZWnESs1cfb7L6S8JtznYTtGR5D96qnv033B2pCCmWpqUu5mZQWFjAf4bypep4
        YpEDHKrHwbhLAMSra5rQNQS6STiruSIh3tEaahA23EfV1brNzyvql0N3sBTY3cb9
        9Kw0HP3Ho8YMZwZIb8l4ViCBQMGjzcqWJ9y+bR6ZcwXH74DcqCJXlOMQGG5iz5nf
        SvpG6TFxmPJOuzwZDAgWgnElQJVUyR3CoPLg0Qbf3G01W9W0nI5r4zlkDm9r3bJF
        tIvJ2N8s+YvWY6YXwtproceWrd6ywQDYtxsDEsxvmaaA92kStmTZ9F5dAyGGNAmW
        cOqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371489; x=1652457889; bh=WIbtfN6QN3QACpaSXCtqEP9OCzN0b/rwRnY
        ojT6Am34=; b=B+Rn4FO1RESENzcLBPzHKmBe2riwMhRG9Cz1zKzf6wlnHcfDwlZ
        hh/H/glueBjrMz4zNPRKMRdni+mhD1lCougG7t01aL4XCyWnzeaqgYgcbc0tk9D6
        xwoX8NylX9O3CSoK0iJPmrfz4stbjLUD/getlc3wv43Qv2sUYE6pCCwv0FzviJP+
        3rAChCt05hxWpIQeUf39d81QPeLMdrejK8BvGhkMU73xXupXe593ctwUIPGULX8z
        7YMzETRA5CEBycZVV6/qghZZOihLHa1yyaVftg8aQHlOiAiOfoX++gqaeKhO0c6o
        X3DRfdVWT3k8gBkw35jEe/Wz4SDeGvEHaDQ==
X-ME-Sender: <xms:IDB9Yvw6nonhT5V2O6Abztx0NPVWwdczvdm54zdHkCrHS64HUcHIiA>
    <xme:IDB9YnSho_E-52O2RZwdqp4rcunxPeIX_dRgIzy11wijhZc4lNI_AQZwgCR-V-Rys
    Toj8lAx-K3lWVMVfJg>
X-ME-Received: <xmr:IDB9YpVOCkzsiBlLpXNl_1yIl1G6q3NUGnxxsf7dDFZjWhjHdStQ77tlZJ_PCmtQtTnunzKMEo0DSv9yb2CxAIiUdX0EwjXAiByDlPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IDB9Ypi_PI-RVqltpHclOdsdmu6gDfm9achFwxuNknQRsjlcRsnriQ>
    <xmx:IDB9YhDoYz3qlJK_iBiXBiRUUiVQtZvd2VbU9r8sIv8RYaq7B7dWRw>
    <xmx:IDB9YiLLrjW0R57outCu4md98JRDHDk95m4GdCrzXxGfhxiW-D0_yA>
    <xmx:ITB9Yl6e1BW4NWNfvODhQ8f-WzNNDm21YnpK2AhNJOoUUfohMApHZw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:48 -0400 (EDT)
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
Subject: [PATCH v4 14/28] clk: Fix clk_get_parent() documentation
Date:   Thu, 12 May 2022 18:03:58 +0200
Message-Id: <20220512160412.1317123-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

