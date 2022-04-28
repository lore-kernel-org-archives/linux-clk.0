Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814A5C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:43:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350243AbiD1QrG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbiD1QrF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:47:05 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5BE6E8DF
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:43:50 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id F2B865C013B;
        Thu, 28 Apr 2022 12:43:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 28 Apr 2022 12:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1651164229; x=1651250629; bh=cc
        o1p93iuWXh141F48HAfbAvajc2ZkhWjFP+Y8gMf8c=; b=UwM3CVvPCkuQLfUq3K
        BNfQe85fCNCnl69ziCqIHHpcmox5i2z4esD3k0fS7GnEOtgDNRe8kyJwSFJ7xZbR
        Aoc5F0pmDtwz4GG0ERf4hwUkf8sF6BX06M2V77J6qaJS8etkkNnqJ8RyKlTO+r0Z
        5HOI4IHQ7f7bQUE5VjLp5+WwY2qRoI9Q3sJ8mvLcaiUeys3daeFhdAVHch4rrhAA
        /QB2pFtzsPpFT05onuJCwQXsSKK+ttE6V8FUiJ+RLx3e7EuEZ3CAUpUUUAS6HcGD
        pNqErHrNzigDnLNdAimFr7PoLFnhnqg+18CmYY+dWZ4ccY1j22ANAAo1Pcg5x01h
        9Llg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164229; x=1651250629; bh=cco1p93iuWXh141F48HAfbAvajc2ZkhWjFP
        +Y8gMf8c=; b=vvp1yn6y5NMvZiGQpehzktCTQ0HiwBtxxMkbqhAD57eKf6DU3y+
        ZZsup4Sb6f6orKizkCmrorHc08WUdBTO3gb2xmzE3lCQqvznqwW2QAMEegEKitLY
        CnLZMC9SL4VlBFvM1c/OA4EdETitdy/n93BenJzOxjCXLwXb3yDLWiv7z8+iqYrE
        q7OBqVwSb8lJmr//r514IVTcpFYEzamZCAwEc/JCkHbWpbAduouZPofjqpMysTwq
        RbxEBJNG66fl5U1iLpveLeYaCrwMQYTGsS9OXQVRdjEyPiaidF5FGBBkFLw/K86S
        Yi1EKBPfIHXxnG5DdYN5h8TuqsIYwoMzPrQ==
X-ME-Sender: <xms:RcRqYtH9nLZPOvz5yPSqewThmQoeoUk_mM-fHidd3HtUvPGyRXvC2A>
    <xme:RcRqYiX0g0_58RXjibYXUDaAKKF6HU0G1rx6S6Eo4d2ZD9LsC02INNWshscLbb4uq
    PDfwE2NzWpylL6px-Y>
X-ME-Received: <xmr:RcRqYvKJBIjP5EkYiN_uEbC-8VFMMdIfWmxRuspWT9JdbIE_6pCEihoQnRMhW-ubhB1PIgjsTWz3saSvjCHx2AlHd2qcxdd7AM7lQLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RcRqYjGU2Und5TPPSv7AQ1nRUoWd2NonA6J7QZQ3UEH6EELEkXsBmA>
    <xmx:RcRqYjXjN0TbZKunMvAcwuiucVlkjSYXENYPw1f5g0rpD3uw85LoxA>
    <xmx:RcRqYuP3ry04Z__KjYjwx1AC6jdk6730zwMlINIUP5q6ZT_d8uup4w>
    <xmx:RcRqYsOsYSb1dgrnjCpljQERIN7pYEkGCQtzQ7SEbGUhjtGQ9ZjbIg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:49 -0400 (EDT)
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
Subject: [PATCH v2 03/28] clk: Introduce clk_get_rate_range()
Date:   Thu, 28 Apr 2022 18:43:13 +0200
Message-Id: <20220428164338.717443-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428164338.717443-1-maxime@cerno.tech>
References: <20220428164338.717443-1-maxime@cerno.tech>
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
 drivers/clk/clk.c   | 18 ++++++++++++++
 include/linux/clk.h | 59 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d46c00bbedea..d228f96dfb0f 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2465,6 +2465,24 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
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
+	clk_core_get_boundaries(clk->core, min, max);
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
2.35.1

