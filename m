Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCA1C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238891AbiEKOnL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244928AbiEKOnJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:09 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FBC67D01
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:43:08 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 37FE032009BE;
        Wed, 11 May 2022 10:43:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 11 May 2022 10:43:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652280185; x=1652366585; bh=Fn
        INeXDpqfZQvnpUMeGwCH8/C3Q8pUUmHAC9Sd1qMJg=; b=Smja7y1GhKKmZ/rbFb
        7iQsbTQT1tLx79cM3+nCSQVNm8Wt5gvzqQ1S6BezrLZ89SAr4qYoGegbfGP62/cz
        fSl6dYGB28DVU8y+q6zlk5gI2OIuRrccBL7EAqgntcO9XFdEgAnVD/7ANWMk+bbQ
        PmLL3DoNj7hoEAYddVijf+BQ4zvQ5LzOLKaEuH+QKY7NwRnOOOQd49oqSNuBjpDv
        YKY8bm2IFdR8UX3q7nIEUIk4vc+tUWno9iws+hfHmA+c/P566URbgP+Ng4tEEJwo
        c9OeXTUhKU5L41YOJlVC5iygcfYyL87gRnetkJx030vl6tdlJGVcVP9uL6PDKt9c
        zyVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280185; x=1652366585; bh=FnINeXDpqfZQvnpUMeGwCH8/C3Q8pUUmHAC
        9Sd1qMJg=; b=BDz090bLr+c0D2HcBeBBs2cpHyNa9wZL68iS1KDzYlLdU68D8rf
        zOaJx4tM4i0tV8/RjVXPLTpHTV4Hl1JrpF7034XUCgmPEB94NKfmQqZq63LGyFpk
        llYedfQ1CygSq76LZ9PUoEE+0u9ibitsbgwSeEATZPaGN/UQpHoyVduF02f+dWJw
        KUdgtBUIFpAiyyJTPXpQ9SeB/h6f9CpQ8d+NFimQFcaIRYYmU1v6g0asBQgYo28I
        dIbEsB2fnE3CYM3mvr7pJhtqcPEfXmQeoXW+qFyMjBOyYnpQieYLsFNhoPsljize
        DwW0z8BJFV/E2OXboZyynhYp6qe90l+Lefw==
X-ME-Sender: <xms:ect7YkXMFBUapFU56fD1az8pWqUxzId-tYz2kRq3XBxNcW_t_zSbqA>
    <xme:ect7YokT8xYKixKii2zCgISVPvriem3sZWdMGMwt21uYJVJAOUllw8S5Yz5b1Q-_x
    cmWtWcV7YnCZLRBw1E>
X-ME-Received: <xmr:ect7Yoa_uPCtEDxHonTm6ukEgkO_z-I6QhMGLbq6bhqFgxTzVy4oAELJuJRqsHYyW3cthmqvKGe1pSHk-rnzMCiH021Zb3OnXRvI-lk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ect7YjVcJ4OM9kL2trdbv4Mh57N10TH9N2o4yWPtz_pUkKpofIWmvQ>
    <xmx:ect7YumkuWeF-FbaN7VhRGHroqQ2TGsckgfZAdpl92nmBWG_vUMHcA>
    <xmx:ect7Yocp54mCcYAhQIESqt1E1RJkCjVZz-n0B1O60rC7MNEP2KPbpw>
    <xmx:ect7YndDZ3PKwgIeg0DV4OZg-v9IVN12bTeoriOZggWO0ZtptP2Zcw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:43:05 -0400 (EDT)
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
Subject: [PATCH v3 03/28] clk: Introduce clk_get_rate_range()
Date:   Wed, 11 May 2022 16:42:24 +0200
Message-Id: <20220511144249.354775-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220511144249.354775-1-maxime@cerno.tech>
References: <20220511144249.354775-1-maxime@cerno.tech>
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

