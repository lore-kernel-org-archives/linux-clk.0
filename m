Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9852EC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233221AbiDHJQC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233028AbiDHJOC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:02 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C20211F7B5
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:11:01 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 72DF75C0150;
        Fri,  8 Apr 2022 05:11:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 08 Apr 2022 05:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=maaLIQUn5IZDUVnYZhfLKmx8Wf/FAY
        uQGfSmF8keZxc=; b=EmsZa50tR0uuwyo61dkHhIL6mWDRpwzgtz1bn/AJcmDgtK
        yls2d4enxPPyhXW48fQ6lUcrEha+RzVPJoNNamuNZa+np/82yoX64hr12Y3+rrS0
        oRmIdrcj3D+yvG1/alWEEJwsm64WthZLjOn40sO/yocDW2xkbHdba6JfirwYFcOA
        3ayYiik7PmgEs6HdkVdR6HrVjUQYOhVjzWgTI5S4EKwwzT3pO4uEwMS1pNGbOHeN
        8ZJ6ncyN4QjDZKdW8V/SJjkGuBUqHnnMSxEcOIGwOPRIFbQ3SDynjvoT6ejU8UBp
        QApy/KvHfDJURpBUN4dOqgNjstWhK5VKLoFIEQ6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=maaLIQ
        Un5IZDUVnYZhfLKmx8Wf/FAYuQGfSmF8keZxc=; b=Nc0HKIcDVgzd3FY3MrVMNN
        hc7AW3vGGy0JQOt6Raap1d+wYPjHFYLnuuwarSJBQYkwB717mNPsxT23Zz0mqYL1
        xM9x6hpch8K81UZe1q1AhGPw43C1o6DAgFrgUdm4YTXNhTHUYbYtOryzeslinn0g
        6U9H+sroqAi369O9JDw/WRUY4KYkX7RE2+lNIiQGFyVry4ddTfQAjSD3a1ClIi65
        9MLkfWp5w9kK4vFwLg8PunJcYCgtsAPm2ve/eUzWZlWLhDGkQ2R45VXuNWxcfBSo
        Kan7rLlx5dTTWXDEvsgOYro+u036R6Nr0ZQExyyJjXwe+wmwaXxHYXwMYRJfNKqg
        ==
X-ME-Sender: <xms:JPxPYszsDba8rAKr2Dw-Vre5ngwmVaBLGj8dL-o36Z3GdsL1te9n7A>
    <xme:JPxPYgQ3s4K1kWYvE2Qmi_BU2ncL5fjjgEmoDGMrBZukXPg_AjPcZhntgbqd-Nwj3
    PWUd0LPLnKwA7JBUrw>
X-ME-Received: <xmr:JPxPYuVczNCH-jkQE-91U9xiQQME1yTRZPx2H4kUEap8upZfsNn2P7P3PIBMDXrQ_j7u_DA87196-9iQFwlruXvB89cs8wQznhvEYTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:JPxPYqi3eAD8tAKSN5e2SxP5bO8qrtWjdvc3bvm04sQuyHIOfMPFeg>
    <xmx:JPxPYuDmiuOqsmg-dLk9XXLkJ7WwbDythK3FhCIFDMv3zao0RvdfJw>
    <xmx:JPxPYrIp-ERd-hIEZ91ie4Qla3VfCn0HvqiYNXbm7n32JIPy1srGog>
    <xmx:JPxPYmsSS2XzOnY8-CNhGAP79T_vmqMFKGYEe8wXc7NKYxBVohlP5g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:59 -0400 (EDT)
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
Subject: [PATCH 09/22] clk: Fix clk_get_parent() documentation
Date:   Fri,  8 Apr 2022 11:10:24 +0200
Message-Id: <20220408091037.2041955-10-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
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

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c | 17 +++++++++++++++++
 include/linux/clk.h    |  5 +++--
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 70fee35c43c6..0f2d52d3a25d 100644
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
@@ -642,6 +658,7 @@ clk_test_orphan_transparent_multiple_parent_mux_set_range_round_rate(struct kuni
 }
 
 static struct kunit_case clk_orphan_transparent_multiple_parent_mux_test_cases[] = {
+	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_get_parent),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_get_rate),
 	KUNIT_CASE(clk_test_orphan_transparent_multiple_parent_mux_set_parent_set_range_modified),
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 39faa54efe88..3b8cf492ff1a 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -744,8 +744,9 @@ int clk_set_parent(struct clk *clk, struct clk *parent);
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

