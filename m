Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A11C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356192AbiELQEq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356231AbiELQE1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:27 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799EB2655FE
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:25 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id DDF6B5C0166;
        Thu, 12 May 2022 12:04:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 12 May 2022 12:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652371464; x=1652457864; bh=Fn
        INeXDpqfZQvnpUMeGwCH8/C3Q8pUUmHAC9Sd1qMJg=; b=QciwLz5zCOab7sOaSF
        IYjHgT+Ims4+xxRWmo4OZdxL2uRQSaCbT4WGsl1j+IsHxKusmoYdtFuh4peulLis
        SpeoiFadx4a8OAq+BU3sdhSXPEcRs6K9Iq7s5SOluiocgygJz4h30jziUUoBqKV9
        i/rf7M0ZaHwSuAvqFr/OUxLoRttBd2eaFY21aeYIX10rswIYG9CjczeEzBTZZ4cY
        RF8Uagonjrl1ZSrM/smyt1qqic/naoV0o3CNl0kMgFBQms1AnujXIDrc+nQwa90Y
        L3Qyj6RcOKtVSe3otqC8kb+DeBp/UbJZOInaQWZzDlR4d2pt5kpYnflPRjYVLHZ5
        UERw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371464; x=1652457864; bh=FnINeXDpqfZQvnpUMeGwCH8/C3Q8pUUmHAC
        9Sd1qMJg=; b=pSK5iC+oX65JzfhciFpj4QFTLgeITme/jDNcsbuOZ+VIabqQqPj
        Pz9fWQKgRwZEmAnAB5VHwH9LqQ0LuTssfAL9TYa5aDmSZ9g/RACaTt9L+2gZrjzK
        GVolthbOr1qY/Dj+XdLwhKzJRgnE9v12VEEHrp6Ev0AnW0kRVEinoZTVo/4qXfYO
        Y6RKUM3GI4GzHEmTuTgPdA2JLoEAo2YFjJcdULdkagrjcLrgI2ZWfkHGR6kPuvcr
        J3snrgtQX8vlvW3mvDGm7/ZXOy1pKUAS/upGE1wuKUYtu7Kt0Q+BKd2tSFpm6cnm
        6g0Q3otE33aI1fOKOS8mbBRv/zRT6ZBTETg==
X-ME-Sender: <xms:CDB9Ysd_7dtXXabTozOe-kANUpv80hVzaQe0vOGa48yg2JPSc1wZ7A>
    <xme:CDB9YuNNVqoWRLz-tVwZx2_ziOuOwXJEaEU0sSAZdcfY3ewppXcci5hBVXzAbn9-w
    tPVDF_LxGwOFKw397Y>
X-ME-Received: <xmr:CDB9YthzXa-Ya50xlNC9M1bysdIWAZKikV7ZCHiaCyXkmflx8oRxZTtnfMVnV5xNwmqSLJ45p8IpB33nSoQpBaopiJ7S8vIzz-ilYPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CDB9Yh_P4QAShi7_V9zPdpPHLHDnxJTaFGgvHywUJusMpgxpiRKt1Q>
    <xmx:CDB9YovOEk_DSttKeJ5UWKP3rzKmber08gELggJm5jygKb3RpWWAsg>
    <xmx:CDB9YoFvnQOvmP4_SleQFnrq5NLR0XlDkiz0ByaXvwR7huGij1umjw>
    <xmx:CDB9YpkZxoCcyoEP-Ka7gR0vmTqwPxC6ysPi-chLfAsjuEkAq5yVbA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:24 -0400 (EDT)
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
Subject: [PATCH v4 03/28] clk: Introduce clk_get_rate_range()
Date:   Thu, 12 May 2022 18:03:47 +0200
Message-Id: <20220512160412.1317123-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220512160412.1317123-1-maxime@cerno.tech>
References: <20220512160412.1317123-1-maxime@cerno.tech>
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

