Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D983CC25B0D
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbiHOPnJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232712AbiHOPnF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:43:05 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDA7B1DC
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:43:04 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id D17DD3200902;
        Mon, 15 Aug 2022 11:43:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 11:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660578182; x=1660664582; bh=lx
        /mgCzYxfrwE6nIQsK9DB8PlqOA19sTMVXj/zolu9w=; b=p83xwRECUJbY8v63gG
        2gylIng5/SzHQa91smvNcdm8dm3/Q+mmdGbuoCZ1W8eB8j/y50vAZ550BPzBBrNA
        +QiZwYqQubVfpl4fx2aC3i5gvt/WnT7HnOQDOeM9Tu6r1XhNqzzQzLLP85MsgoPi
        6xHg/XpZGQQe7iuZDbZ5jKrxdMMMhHR/gU9UJFBxv7QQal8qDzvNZjpMjcgxMyBx
        cO+0iCGzRHf3s9qYfk+bOlGaSRRveSfPcWVRyyDmlZzQxJRHBxPIDkDqkipgR/GL
        6a95vyOJq5GRn9D3Cc8L+rBxzmZ4Tnpaf5e198Sjb9aghjHEikZG2sjja9jaazUb
        Ctrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578182; x=1660664582; bh=lx/mgCzYxfrwE
        6nIQsK9DB8PlqOA19sTMVXj/zolu9w=; b=qFT7qKtulm7v6EZTQT3B5KLLDKF62
        d7rnO4BjzF1BGKRJ9bK7i6+hDIXJOjyV2VyC6KK/EHFERQupvAsx5V/+cQ1Qbs/s
        WROt7/Jwdw6rWKhaR/tZ/TL1vn6/XwaQw8HUNUuLwtOEvZVFO2xKQrV50Lbdy5eo
        9xe5CaqWgcrVPi7dcVJo510ZMF8JToZEf9YPD7dVbX+DMXgsA4hrd0diZZstK//g
        ZC2GbvEnJhV4ftKZ0eDU8a0Q1XzxoGgr4K+dxdGPsX7UHx2adsmakpWEsMXCPU+G
        B1YbGPCc+AC6P2xFBrdMgVrrNeSuQLb+4I1Yzim1JW5rlHV7OjEHcFXJw==
X-ME-Sender: <xms:hmn6YvYknw8x0F3pm8jfmQ1-yJMwfQslkA_lmdXsoPeEzradrlpCJw>
    <xme:hmn6YubctVAC8mYaCFdH_fbbumxhpMlewa-g5-VvWMMXLJMQVJJzf86-fh41NoZNJ
    mtMl9FGFfQzMtdJmt0>
X-ME-Received: <xmr:hmn6Yh8KTtGf_3Z5-biZbXlMHc91Vh64sO0xvLrCoz1Rlpl36qeXu_Ol3qNK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:hmn6YlqVybbjqrLsj2lq7Ti99bD87cwY0HaeVLoT9Q0WzDqAA3MIbQ>
    <xmx:hmn6Yqo3P-d8a8vg5o2m-9VHw6OgQYkIxagaxBpdGbR_MN2gy7C4nw>
    <xmx:hmn6YrQLjH9FbCgCqI1V2fVpYPItw6g9ByBhLT15M6xZpcRLrz5bNA>
    <xmx:hmn6YngI675Oc1bcI0UMCQ6XWPRiQQcy1Ii6xKWgkITOmd3mDs72OA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:43:01 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 16/25] clk: Introduce clk_hw_init_rate_request()
Date:   Mon, 15 Aug 2022 17:41:38 +0200
Message-Id: <20220815154147.1631441-17-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220815154147.1631441-1-maxime@cerno.tech>
References: <20220815154147.1631441-1-maxime@cerno.tech>
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
index 7a071c567800..195f051ee536 100644
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

