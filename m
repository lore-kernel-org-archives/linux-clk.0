Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7798BC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:44:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350257AbiD1Qr2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350251AbiD1Qr1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:27 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE18B1AB0
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:44:12 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 4C0D45C0058;
        Thu, 28 Apr 2022 12:44:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 28 Apr 2022 12:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164252; x=1651250652; bh=rZ
        SKYn6Brh9DZuKkCQgzGckDzhL9llyczqdfbaWlTXE=; b=GmHv0+l6zmhpJwyGva
        JQqb/C4E/XocBHQJrWbhDdyQvLXS68FjfUdK6yiRFXzIBzyIetTmyaMUtkPAGdWp
        sTHJx09dXhXZUaHa4XPghnr5d6fNRGz+64C/0G79UQHkx7NaaOOpjlFxjYyA69qA
        QO5/egv5wLOoSS3PMWw6geC84cL1uUnW0zUU4OuI5WS4gvnrcGj+r7XoYW7q3Sw8
        Xly5DCfmEkHHrpF1ni+MhEycB7whTV/rnHAKQA3sGlas4VVCVIl16aI+vJHx/U7J
        n2O4cixEFxTbItqRF3kAlH5W3mw0uvWCF6cTgdguKbBIRInbbrbdhaAoHl+UjLTA
        vM3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164252; x=1651250652; bh=rZSKYn6Brh9DZuKkCQgzGckDzhL9llyczqd
        fbaWlTXE=; b=GnWsmJG8DHJR/l6UErVbTDxBraO6bMTcbOKOx8KvRwAxeSnv1+6
        fAmAnwdGwYjLwRUS5R0PSzdRPV0SjrBr7d9W+Ju1JZ8OGxhH4UPydAbQahcwl6Hg
        +12BlMnAdtZVBLqB5oxH4kiZ4JMD8essLZ23mX5BnVKrUEjeKM37lbEjVpsx5fkh
        /QvUFCy5QId5Aa13tBT+H7MhBr9b9fWqzQNVET52FSfTb5hlahXYgDwe9r2T8DFa
        wS8qIJTEQR1tEXQb28EYp7qh5aTduke995Z2Y1qAWJwU77Jlrk1pe95x5E75jcbe
        BLti8e7wI6IWQL5lWvoQJdsZB5MmFhxoDZw==
X-ME-Sender: <xms:XMRqYg1UP_MfB7mHPLL02x7ZxfWmIDNkukolCNgwDp3-YS89chzDRw>
    <xme:XMRqYrGTbIFR6Gr57R5R-H_pUBHLUYMkNNP9kmk-AdIrULaKZ0ypBT6yDFN98mDgI
    c4KnpPdKBuDvn82zPA>
X-ME-Received: <xmr:XMRqYo5AeEQHFmdxnZ5XdAF0Qk5agW-STM9dw2X8QLiCZXXETze1My3j_bSQE-0CRM3RP1X3rMI-7IcjgTxK9moiPUFqsKeCYSEVGQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XMRqYp18_hyiJuDTE92l1lmqEP6eQ1Zb_tU_m1asotJaq1Pzz8RpoQ>
    <xmx:XMRqYjHhTz8lubC9fNMb6uGoHC2Ax-FwW8s85AcsBFMXdhQ5FNSTDw>
    <xmx:XMRqYi-EZ1G7zvkBbjggU8g8Lo47KQjeS49HxxfzfOVg0CF-DAYwNg>
    <xmx:XMRqYr8hpa2UYBRj61yK-xzwHA_4zlNk5phUnJXKMCUbqe9OkI-_cw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:44:11 -0400 (EDT)
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
Subject: [PATCH v2 14/28] clk: Fix clk_get_parent() documentation
Date:   Thu, 28 Apr 2022 18:43:24 +0200
Message-Id: <20220428164338.717443-15-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
2.35.1

