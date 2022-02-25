Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B96C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241820AbiBYOg0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:36:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241840AbiBYOgX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:23 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F19D727991E
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:35:50 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 4AE285C0138;
        Fri, 25 Feb 2022 09:35:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 25 Feb 2022 09:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=51gGaDVGGj6fUeWdNNnt3yc05Mm3Vg
        2wbHZzZUo3Xvk=; b=o9HIDNGq+g+K5dri+oQClK/r9+dS7/UOeMCU59K87UExQZ
        D1F7Za8+SKC0FDl59LW9S9VifQbOae2FnQWQJ5JydGtl6k2JgRXYJHm5OK5JjQYy
        n2AWAbBG2lI1ClzdCnvw7fLCgWpbegXgEW8HzAgyXQPnauqj9/SjszVadKR+GiDH
        hpJZ52ZpSLHedUMssslExmI9Rf0AFK/Ewob1oPkgzzVFbx7k2GJTWhfDJoSrW4id
        t3l0Y6QORp4hkqADTIAne5btuFrE5yCTgETBYbWT/fY0lEionrf1HtgBzpiM+7EB
        lAncaWHdW82LUsLCmUWQdzx0b40T8vlXkjB9cNDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=51gGaD
        VGGj6fUeWdNNnt3yc05Mm3Vg2wbHZzZUo3Xvk=; b=d78Ec4sSRlFSNAWneAwtaR
        D5+mrR74S6oe3fCT+qS/gEDpW3qngJPxvnK9sFcyJNgMypqhyAUmI0JxkUhM8dRm
        mG8g5fkPYlX3wDbQfgwqs029T+38CxbG7pOJLpOnf6z9px6TCSgj7r81ntLwjpwA
        wccxIQSMX6rLUwa1M47FCAUJDoXlIscTO57YUV+Kl4j6cxms3kUuVNZzShGnT8EX
        3d5XnHRwt4oTy08hnetkXy+bhuFhG1WRTwJzI5u3UgRFVSE/2NOU2nk34PdOQQ9o
        uWs9hgx75a0e3ygOWzK6IQ/HowWCMfz4nnxZu5hV8UYk8nJKULOEDA73qkErHJIw
        ==
X-ME-Sender: <xms:RukYYt11d_OwB0FxAyVvAEw0LWwZo3kxAsqBxH86ulEKpBFdX_WBbQ>
    <xme:RukYYkHZc5NwhTWnpWKxf4eA4Fj81q-4MfXZFIPq3vAsVnF_g1gBUYueuce02-fvA
    r86bXRamheXoJ07QEI>
X-ME-Received: <xmr:RukYYt4-0HqpPK44BPNfwvv1SY7wjQuLxCMajnaRBrnlMJTX8FC1JCl2lKQyA3kI17oy5BzzD9M9ZFbsKTukfvRfY6uJYw_NHM9MJ3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RukYYq2ksSBlW2YfrsCibkuvB8gDXPJFn_cyM4uWpFbvtlflJSVIIA>
    <xmx:RukYYgFQVpeTh_3g4KSU_2VRB8YXehlxAXNjaDCsruUaVWuPfyzjaA>
    <xmx:RukYYr-ScxtYdd7yWuRTWnP4K3NiYdtj9indM03wQTbYE7MKwfWEJQ>
    <xmx:RukYYr01-htI7ggEeDFEy80z9UYBXXHsPnupqlekqVzJJUZ9EA1Tng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:49 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 07/12] clk: Add clk_drop_range
Date:   Fri, 25 Feb 2022 15:35:29 +0100
Message-Id: <20220225143534.405820-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
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
index 2c5d30a9372e..a92600311506 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -645,7 +645,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 
 	KUNIT_ASSERT_EQ(test,
-			clk_set_rate_range(user2, 0, ULONG_MAX),
+			clk_drop_range(user2),
 			0);
 
 	rate = clk_get_rate(clk);
@@ -762,7 +762,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
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

