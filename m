Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4ADFC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:26:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237834AbiEPNZv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238444AbiEPNZu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:25:50 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 121C7A9
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:45 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 7B6DF3200993;
        Mon, 16 May 2022 09:25:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 16 May 2022 09:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707542; x=1652793942; bh=Fn
        INeXDpqfZQvnpUMeGwCH8/C3Q8pUUmHAC9Sd1qMJg=; b=WYh1+6qb5ug0QMdi5s
        B5MdFaF7McRG69+LFWEmJUa8/hLq+HYNDfsQRhncZ3Aq2YI34+c6SEM3SvKXKLNq
        jMirvcnQjEPT9dm69uRTS2tIm9kY/5qAt1WiLhOXgF7bQrjt4BkRKaiG/xstBSsh
        bOzSnO6iAMLgVkwF5CwN77/eBDuHk3u81QuL7VFXj9bZ4DIq+AAP7VlYCddb8/+T
        7TVqHapIazh5pksZ0pGPzbNyzuDlcr5x/VBljLLUZc+QcB8y3vBeBrGAdLN8VMf6
        32FDgnBsa2hJoCIlPDSWDO7nZY+SKkxs6aNxCe8ytQv7q7i8dOPSaIoeG/Q0V39H
        qJIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707542; x=1652793942; bh=FnINeXDpqfZQvnpUMeGwCH8/C3Q8pUUmHAC
        9Sd1qMJg=; b=MJwbwz3tcwbsetCdIFq35qHfui2UDbbpi+YcUvkYq1T6J/wFzaa
        J6wPIU4AQjWQvBCUs2Vplwu4aTIS/LarlyuDkNPONSdE1f2u5VrRZPZp6gHKkUY7
        05nB4H2BhOdZkZlGY5mAcQ0c0MdtB/Y0STon6j2RDsF7fzIQlw5KGRiVGjEsflCu
        1VIZMtbyMO4wcRUlSpetCAOJvybN48xeGDlUN/qyIOAY5nnBnZ8Nkfg0hOf9hceJ
        Sb7AmORy0IOuimimnuzXND/IpMJ4qVEJXP/O8UmTLvnL80lIUq8CykYMLuhgKPL/
        3Pgq5RqC5CG6oaTDHNPw87tXJ9YT1w5bYyg==
X-ME-Sender: <xms:1lCCYnTq2a0Qf9JXQWhipZ6XCFbi7xKcKJS82O3h_C47EaNsuTCgdA>
    <xme:1lCCYownU9FCAD0AdAX--tBAzaoIkYk9GTiKoIb_fwHH3iaiJilq1qmMs2f72wGPf
    xHNMFLTYMji0PHabNM>
X-ME-Received: <xmr:1lCCYs32X6qrWKiRipXtZowuEqbFl1RTwTWnQVKh3qzHmiHgyt56m7v2sv0lU61REpQj_bA2NSovtrRgU-tJqkYO33JD5VfHHJG0I9w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1lCCYnCvd1IkTqLzL1vcJaCvqvi9ckXsUuyLSNeMtQvWIuqX8NBNjA>
    <xmx:1lCCYggXGLxbMRqmo49T-1EkmUl7GQEiV-Vm4s31KPNo1czkLv7RnQ>
    <xmx:1lCCYrqaOWfOj1q-1YJS8WGt-Jr1P7Picz5PPEz_DU4QzHlj3qQSyA>
    <xmx:1lCCYlZ7UvIpL8LxPYwo2-VVk-wrbO3MVqAPqplgxlrJcwB9qnoETg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:42 -0400 (EDT)
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
Subject: [PATCH v5 03/28] clk: Introduce clk_get_rate_range()
Date:   Mon, 16 May 2022 15:25:02 +0200
Message-Id: <20220516132527.328190-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

With the recent introduction of clock drivers that will force their
clock rate to either the minimum or maximum boundaries, it becomes
harder for clock users to discover either boundary of their clock.

Indeed, the best way to do that previously was to call clk_round_rate()
on either 0 or ULONG_MAX and count on the driver to clamp the rate to
the current boundary, but that won't work anymore.

Since any other alternative (calling clk_set_rate_range() and looking at
the returned value, calling clk_round_rate() still, or just doing
nothing) depends on how the driver will behaves, we actually are
punching a hole through the abstraction provided by the clock framework.

In order to avoid any abstraction violation, let's create a bunch of
accessors that will return the current minimum and maximum for a given
clock.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c   | 20 +++++++++++++++
 include/linux/clk.h | 59 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d46c00bbedea..c9d7016550a2 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2465,6 +2465,26 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
 }
 EXPORT_SYMBOL_GPL(clk_set_max_rate);
 
+/**
+ * clk_get_rate_range - returns the clock rate range for a clock source
+ * @clk: clock source
+ * @min: Pointer to the variable that will hold the minimum
+ * @max: Pointer to the variable that will hold the maximum
+ *
+ * Fills the @min and @max variables with the minimum and maximum that
+ * the clock source can reach.
+ */
+void clk_get_rate_range(struct clk *clk, unsigned long *min, unsigned long *max)
+{
+	if (!clk || !min || !max)
+		return;
+
+	clk_prepare_lock();
+	clk_core_get_boundaries(clk->core, min, max);
+	clk_prepare_unlock();
+}
+EXPORT_SYMBOL_GPL(clk_get_rate_range);
+
 /**
  * clk_get_parent - return the parent of a clk
  * @clk: the clk whose parent gets returned
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 39faa54efe88..1507d5147898 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -713,6 +713,17 @@ bool clk_has_parent(struct clk *clk, struct clk *parent);
  */
 int clk_set_rate_range(struct clk *clk, unsigned long min, unsigned long max);
 
+/**
+ * clk_get_rate_range - returns the clock rate range for a clock source
+ * @clk: clock source
+ * @min: Pointer to the variable that will hold the minimum
+ * @max: Pointer to the variable that will hold the maximum
+ *
+ * Fills the @min and @max variables with the minimum and maximum that
+ * the clock source can reach.
+ */
+void clk_get_rate_range(struct clk *clk, unsigned long *min, unsigned long *max);
+
 /**
  * clk_set_min_rate - set a minimum clock rate for a clock source
  * @clk: clock source
@@ -908,6 +919,16 @@ static inline int clk_set_rate_range(struct clk *clk, unsigned long min,
 	return 0;
 }
 
+static inline void clk_get_rate_range(struct clk *clk, unsigned long *min,
+				      unsigned long *max)
+{
+	if (!min || !max)
+		return;
+
+	*min = 0;
+	*max = ULONG_MAX;
+}
+
 static inline int clk_set_min_rate(struct clk *clk, unsigned long rate)
 {
 	return 0;
@@ -997,6 +1018,44 @@ static inline int clk_drop_range(struct clk *clk)
 	return clk_set_rate_range(clk, 0, ULONG_MAX);
 }
 
+/**
+ * clk_get_min_rate - returns the minimum clock rate for a clock source
+ * @clk: clock source
+ *
+ * Returns either the minimum clock rate in Hz that clock source can
+ * reach, or 0 on error.
+ */
+static inline unsigned long clk_get_min_rate(struct clk *clk)
+{
+	unsigned long min, max;
+
+	if (!clk)
+		return 0;
+
+	clk_get_rate_range(clk, &min, &max);
+
+	return min;
+}
+
+/**
+ * clk_get_max_rate - returns the maximum clock rate for a clock source
+ * @clk: clock source
+ *
+ * Returns either the maximum clock rate in Hz that clock source can
+ * reach, or 0 on error.
+ */
+static inline unsigned long clk_get_max_rate(struct clk *clk)
+{
+	unsigned long min, max;
+
+	if (!clk)
+		return 0;
+
+	clk_get_rate_range(clk, &min, &max);
+
+	return max;
+}
+
 /**
  * clk_get_optional - lookup and obtain a reference to an optional clock
  *		      producer.
-- 
2.36.1

