Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB9FC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 14:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242716AbiATOem (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 09:34:42 -0500
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:60449 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1354256AbiATOek (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 09:34:40 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id A7FA5320100E;
        Thu, 20 Jan 2022 09:34:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 20 Jan 2022 09:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=PkGmNK+1rh8eIQD4JxVW4ctt7AOg3D
        wmFys5phXK5+I=; b=cgM789KQ3KAhKKWa95YnzLKcvRYWlptDPg6Qp6bI22cnnz
        Ah/UdLAkfMJrDy252HCHthzyYueHiUSExontWj98I6m+7MReWowaQCUpYWECuoz7
        sIKg5CqsD2LL+2YbxFuKTmULoUCdDr8iQNIgqFCdk2zb2z9jerEYT+9KCI7n8Mnm
        x+lWXifGv+9l0OnnTYa3IdJy6zWGGrDcwJFjyoirhiZEcEupMJTGWMqiOZhfXQZb
        pk4pLLK5NfeKdqZvCA9fxncUVUatR91g2uqaas+5pkNCXQQcUgxjhzjvTAOppzAG
        g0YosiBlHAKpFI9vftq22CE/TNYbHxSe0Pmy/BpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=PkGmNK
        +1rh8eIQD4JxVW4ctt7AOg3DwmFys5phXK5+I=; b=U6VnAzT1p7oJ/5iB1IhvLw
        GCiDsF5FHxplBJ5beJZK8jw4i7luWb+IfvWBnJ+NueBoA2PW6zXUBNu3iastkPDl
        acDkFNmxAqELgtCc4md5D6D1YEcr6T6Qw0fxWd8A8Xq3Zyzuwrd8rF/y0UwZmF4C
        HccK8rD5xRhY1Nccxh/qQr/JKqSszmYNxbTc02EZ3tJKmE59YFHrxhXjpcLIoJEP
        tzPqyYkIk1MgjmKQSZXeAbXIUHgi88VdZU+1MRwOzFQVHmb5PhAl1IiGWy8UG9ec
        JCP6/ROwryFvPYbSI9G4fmKYQUwVhzspo8l13Vycy5iiC+b20Pd0nrbVzD4CnQHw
        ==
X-ME-Sender: <xms:_nLpYW6mxYvsfmktmHjEcsYKCtiOtXoWGrI0j4oLqatHuHisl7DZkw>
    <xme:_nLpYf7MDDBSBPp0Fy64Q9abElcfTonFe_qC8Zeuo6yQiqREuvqpWQ3NdFY1H5F5r
    KdWY_r_KOMQ0eSez4Q>
X-ME-Received: <xmr:_nLpYVfUJyumMG5kbZoGsucqi9X6FU3qYFR5zmfd3LEh-t529wlpEavHaLW_Oa5jVSlEOmgwPFE4IRCAUEgPsl_ctWlpBSYFC2d6Z6I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdeigecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_nLpYTL_0p_ypNa7jI5DMggFlKkoVZmlfQZyt936lvbpaJvNrvWAxw>
    <xmx:_nLpYaJYeXgNXmV5lS054QAb73vuV9i6qTkGbs5fHE6TyPjC11hhEQ>
    <xmx:_nLpYUzligMvSUNedAVVkEyeLNHWGw2i9RQGyhgTXLJXoQfPx1sX2g>
    <xmx:_nLpYbqSW2ISchVF1qmP8MarIB50PlSSNR59cBY9GcDRUZIstbmTOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 09:34:37 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 05/10] clk: Add clk_drop_range
Date:   Thu, 20 Jan 2022 15:34:12 +0100
Message-Id: <20220120143417.543744-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120143417.543744-1-maxime@cerno.tech>
References: <20220120143417.543744-1-maxime@cerno.tech>
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
 drivers/clk/clk-rate-test.c |  4 ++--
 include/linux/clk.h         | 11 +++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-rate-test.c b/drivers/clk/clk-rate-test.c
index baf0ea315322..9beed87f663c 100644
--- a/drivers/clk/clk-rate-test.c
+++ b/drivers/clk/clk-rate-test.c
@@ -458,7 +458,7 @@ static void clk_rate_range_test_multiple_set_range_rate_maximized(struct kunit *
 	KUNIT_ASSERT_TRUE(test, rate > 0);
 	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 
-	ret = clk_set_rate_range(user2, 0, ULONG_MAX);
+	ret = clk_drop_range(user2);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	rate = clk_get_rate(clk);
@@ -570,7 +570,7 @@ static void clk_rate_range_test_multiple_set_range_rate_minimized(struct kunit *
 	KUNIT_ASSERT_TRUE(test, rate > 0);
 	KUNIT_ASSERT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
 
-	ret = clk_set_rate_range(user2, 0, ULONG_MAX);
+	ret = clk_drop_range(user2);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
 	rate = clk_get_rate(clk);
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 266e8de3cb51..f365dac7be17 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -1005,6 +1005,17 @@ static inline struct clk *clk_get_optional(struct device *dev, const char *id)
 	return clk;
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
 #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
 struct clk *of_clk_get(struct device_node *np, int index);
 struct clk *of_clk_get_by_name(struct device_node *np, const char *name);
-- 
2.34.1

