Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B57C28B2B
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:52:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235147AbiHPLwW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:52:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbiHPLwA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:52:00 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718FE74E28
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:26:51 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 9EFE63200914;
        Tue, 16 Aug 2022 07:26:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 16 Aug 2022 07:26:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649209; x=1660735609; bh=Pr
        D4uOESGAYmaK0obkJrSQUd0IBaIdhKtFP/tBgn7L0=; b=YE8IuaXAph4dxmu5HU
        hHHL+GtDFHOr96lINZyWt9hAaR0uIovrUbj80yFUJ7z5s1nB/ss8EOHuoeByPE5/
        zzJ/f75rc8nT4b75skkKcmf/Ton1Vt1aMSIJR/KOj85MngylNlEZVn/LoxSWPj3m
        w0mAIg1cpwOcCOOSO25YYIQUazRuMe2/WL6QW+rVdHPXP/gkG4lxM04ZOf33uCyv
        4+1Qlx8p0otfsMFNJEh1LxxzGp1efLD6sQ1lCpemr4ea8HzqgfoT/EVMX0Mg+iNA
        3x8SMU21ooaxDsVMm1jmSvemx+IW58nhCEHGPbe3pdG3L7UjHgXf/qsTTFqqtTn1
        lkig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649209; x=1660735609; bh=PrD4uOESGAYma
        K0obkJrSQUd0IBaIdhKtFP/tBgn7L0=; b=zEAtxY/5I/Yw2I3OhHgkD68O1xCNs
        5XaJ0VXzjxqOJHoq8b4DKktqPGVV4ebJIK/DVHxEoAglVn1hrHao5qVw97TlMbW2
        iWl38yCQxNjnlnt/gqaOIjP9FdkfYmMV1DGtEJYAtv9CCCElTMbc3k1vDoOOI4ax
        LPP98Tftreyho5LtzIqwbA15tB2Og/sdzJ1GDRU0F8FbRJquP8j9f9hiwQG4Gg0F
        AXk2rNkY0ktb+3McfcyRzY+yuSI8HrX3dWsY1KQ+Lj5l9Dz/TFBgAE0W5gPJYKCG
        f/ZvJmeYpyfTsXskiQ5Eknsn59jhKTZVyfKoOdHDHD5P1/5SrRfKf8f6A==
X-ME-Sender: <xms:-H77Yjo7RKRc8Lf6tiw7yDalVKz3VMyZp_tFxQCla5YTWFhTZHQpxA>
    <xme:-H77YtpvsWscHyoM8UWSa3XwXE0SXki8ks-PXEIrotgs6xhSGWNOrG-kuqo_kF7Pu
    SgGJrHFQar7sN-vyLw>
X-ME-Received: <xmr:-H77YgPUYmXzZj950Uc7fITxK0He4zAWzDc_RRq1ZVuNpFfXlin26j9Kt0Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:-X77Ym5jNkcKxtsd2RT094710MHaM0BiMlt3SWssx33_mi2iE1RhZg>
    <xmx:-X77Yi7uKHkjthBsdZARuMz8QHDOYOh0E9a8D-4dMv0HYW9esG13Iw>
    <xmx:-X77YuhZuVP32aBdk-m0yl4-ouAkpMsmOyj99tz1-E197Tss3FYNWQ>
    <xmx:-X77Yvxnf9IUDXQYwH-FhvEdlqwzwIQWErOnkY3sjIG-e4LRAUCFzg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:26:48 -0400 (EDT)
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
Subject: [PATCH v9 16/25] clk: Introduce clk_hw_init_rate_request()
Date:   Tue, 16 Aug 2022 13:25:21 +0200
Message-Id: <20220816112530.1837489-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk-divider instantiates clk_rate_request internally for its round_rate
implementations to share the code with its determine_rate
implementations.

However, it's missing a few fields (min_rate, max_rate) that would be
initialized properly if it was using clk_core_init_rate_req().

Let's create the clk_hw_init_rate_request() function for clock providers
to be able to share the code to instation clk_rate_requests with the
framework. This will also be useful for some tests introduced in later
patches.

Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-divider.c    | 20 ++++++++++----------
 drivers/clk/clk.c            | 20 ++++++++++++++++++++
 include/linux/clk-provider.h |  6 ++++++
 3 files changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index f6b2bf558486..a2c2b5203b0a 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -386,13 +386,13 @@ long divider_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 			       const struct clk_div_table *table,
 			       u8 width, unsigned long flags)
 {
-	struct clk_rate_request req = {
-		.rate = rate,
-		.best_parent_rate = *prate,
-		.best_parent_hw = parent,
-	};
+	struct clk_rate_request req;
 	int ret;
 
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
 	ret = divider_determine_rate(hw, &req, table, width, flags);
 	if (ret)
 		return ret;
@@ -408,13 +408,13 @@ long divider_ro_round_rate_parent(struct clk_hw *hw, struct clk_hw *parent,
 				  const struct clk_div_table *table, u8 width,
 				  unsigned long flags, unsigned int val)
 {
-	struct clk_rate_request req = {
-		.rate = rate,
-		.best_parent_rate = *prate,
-		.best_parent_hw = parent,
-	};
+	struct clk_rate_request req;
 	int ret;
 
+	clk_hw_init_rate_request(hw, &req, rate);
+	req.best_parent_rate = *prate;
+	req.best_parent_hw = parent;
+
 	ret = divider_ro_determine_rate(hw, &req, table, width, flags, val);
 	if (ret)
 		return ret;
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 553e1e9eb300..96b372ff23c2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1400,6 +1400,26 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 	}
 }
 
+/**
+ * clk_hw_init_rate_request - Initializes a clk_rate_request
+ * @hw: the clk for which we want to submit a rate request
+ * @req: the clk_rate_request structure we want to initialise
+ * @rate: the rate which is to be requested
+ *
+ * Initializes a clk_rate_request structure to submit to
+ * __clk_determine_rate() or similar functions.
+ */
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate)
+{
+	if (WARN_ON(!hw || !req))
+		return;
+
+	clk_core_init_rate_req(hw->core, req, rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
+
 static bool clk_core_can_round(struct clk_core * const core)
 {
 	return core->ops->determine_rate || core->ops->round_rate;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 9a14cfa0d201..d857717aa386 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -42,6 +42,8 @@ struct dentry;
  * struct clk_rate_request - Structure encoding the clk constraints that
  * a clock user might require.
  *
+ * Should be initialized by calling clk_hw_init_rate_request().
+ *
  * @rate:		Requested clock rate. This field will be adjusted by
  *			clock drivers according to hardware capabilities.
  * @min_rate:		Minimum rate imposed by clk users.
@@ -60,6 +62,10 @@ struct clk_rate_request {
 	struct clk_hw *best_parent_hw;
 };
 
+void clk_hw_init_rate_request(const struct clk_hw *hw,
+			      struct clk_rate_request *req,
+			      unsigned long rate);
+
 /**
  * struct clk_duty - Struture encoding the duty cycle ratio of a clock
  *
-- 
2.37.1

