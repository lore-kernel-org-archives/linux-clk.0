Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2471EC4332F
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 13:19:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbiBVNTg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbiBVNTg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:19:36 -0500
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23E4FC3307
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:19:11 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 7BD215C02A4;
        Tue, 22 Feb 2022 08:19:10 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 22 Feb 2022 08:19:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=jJJc4AycVMTF2yKcldiWreslv5GY3X
        EGxv7b2Svk5rk=; b=gPPM5ftHLfscyB9uBP6lZXukbdXriKjACoa937PgdCbsQu
        6CE5Ae5wUKd7iFZYEjw9xx3pGTMNrO6L6IKxxIKQxG4mv2H+uY9ZcABC8lYNvWOL
        ww1CldzCbPSGUdov4Ua70bMCKni3uBsTnJPvm3cFJbEqqr8NAdcIJFIXrS7RTBww
        JPl8Ox6ogaaBvJIwHS0cgHcpauOFJIOQ1HW0ylG52cKyMXElzlHfKgdc6tpDoSCY
        8Yx2R7FEhtc09YiXF0nVA92aA6HbWTQHoXwenMiHzZDKdIiTIAp4Hzp++nDpCu73
        9sM+hHGkEg9NGkDgHoFze/DLJA7ueqoozwYF3IHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=jJJc4A
        ycVMTF2yKcldiWreslv5GY3XEGxv7b2Svk5rk=; b=b7fQS6QCCC3xwUNwWLELIF
        tyJka/Qw+WCKcmIR6VNUBi5XTcUiExv2zc000S3j1V7AAcAQY8VrWi2+YC1PezFG
        rbbsxN+LFgfvEDpowo/blyeufePJliB/YEFvjygy0/Zwgr+j8HPnxLEcNlrgNob5
        wxvIOMl/XNPABMmH5laVj1mw7ryU9MS4CwgI9k/wjDKon5X1ozpAKlRx9/VY3zwE
        oyEL6vVKzGfEaEGwHrfOlMPAlbhgjPOJDEbePBE/JJpiDI4U9sfUT0VvCz93+MQi
        IcPvSivcdEwArn+U0EPPYXcxkZDqGiUrUb1Yp2jwjWGJI21OrjYHLlSXZiM7E1GA
        ==
X-ME-Sender: <xms:zuIUYkZkFViBd7PtSmbkXjYripgWZgtSGt-wqvkBN0ys2MIcAzrfBA>
    <xme:zuIUYvaxsCVJJ1XgYe8xoLBNhK98Isw4PmbyygyW4OlfZSVSRGfiquPpxU4QOCncE
    a9IyXzgvdOv4k1wPP4>
X-ME-Received: <xmr:zuIUYu8hRyYc0oV8bLf5k3gACk6meOC3O1dhDGiXqcWcrmNpzg_GugbcG0K-Ek4wM51FSMP1-6xddm8LaxPH5rWCSxBVpI-Kx1tki5w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zuIUYuqY_QPtG0Y-oZ4Ps1a4TS6RNf9qBQFovqDZJb7ZCGlcZRWeWQ>
    <xmx:zuIUYvobWKqZ-ksAVBQn61rOZvUOwKOs0odnO44qujmNBn2CYK4l5g>
    <xmx:zuIUYsQhBcgVRQ1jSJJB-peQEff0HvfGABEgasp46E65xSX6bTHgNA>
    <xmx:zuIUYrKlIskJGVucGsllWGB8UktR3tqMn76bfSZxi-cVAokahHJisQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 08:19:09 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 06/11] clk: Add clk_drop_range
Date:   Tue, 22 Feb 2022 14:18:48 +0100
Message-Id: <20220222131853.198625-7-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222131853.198625-1-maxime@cerno.tech>
References: <20220222131853.198625-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In order to reset the range on a clock, we need to call
clk_set_rate_range with a minimum of 0 and a maximum of ULONG_MAX. Since
it's fairly inconvenient, let's introduce a clk_drop_range() function
that will do just this.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk_test.c |  4 ++--
 include/linux/clk.h    | 11 +++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index b23859d1b460..f108e2dcc351 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -640,7 +640,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 
 	KUNIT_ASSERT_EQ(test,
-			clk_set_rate_range(user2, 0, ULONG_MAX),
+			clk_drop_range(user2),
 			0);
 
 	rate = clk_get_rate(clk);
@@ -757,7 +757,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
 
 	KUNIT_ASSERT_EQ(test,
-			clk_set_rate_range(user2, 0, ULONG_MAX),
+			clk_drop_range(user2),
 			0);
 
 	rate = clk_get_rate(clk);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..39faa54efe88 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -986,6 +986,17 @@ static inline void clk_bulk_disable_unprepare(int num_clks,
 	clk_bulk_unprepare(num_clks, clks);
 }
 
+/**
+ * clk_drop_range - Reset any range set on that clock
+ * @clk: clock source
+ *
+ * Returns success (0) or negative errno.
+ */
+static inline int clk_drop_range(struct clk *clk)
+{
+	return clk_set_rate_range(clk, 0, ULONG_MAX);
+}
+
 /**
  * clk_get_optional - lookup and obtain a reference to an optional clock
  *		      producer.
-- 
2.35.1

