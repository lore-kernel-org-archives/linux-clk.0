Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2320FC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 10:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239536AbiBWK4t (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 05:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239609AbiBWK4s (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 05:56:48 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 109B58D6B8
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 02:56:20 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 254925C0226;
        Wed, 23 Feb 2022 05:56:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 23 Feb 2022 05:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=7gnNnbl9dTPU+HAxdT2BR3d4/1EDKH
        rqYDDPQxBl/tM=; b=jOJ5JDNAQGU0B8nhgN1rRaXpe0ii8DHAcwwElAbgcF9rnu
        sBs8syaIVFCoxc+ilI9isB03HyuxauooiRyjfaxfo25+Te9tQTxEO2Zcpxa0LhuB
        SycVSoI3/mqYhA7FDYosyoJP9ouKiuTfl01aQdHq2CgQ7yZBCiWc3k0iyiD1lFog
        ghGPVKB8We4zzCmrkGBBzXFycYW6Gt+OubUR4FTHoR9ST2ahdC/tGhChI2TAIMxi
        +ubSDLJSwjvCGsHs7GE0EbKVQMxbPaRDkZADtXtdrMLoZYiHe/I7SszOWwYptFtP
        Kf84wX5bVi65PqWE+uYk3sTC7V4gn5Co9tRQUW2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=7gnNnb
        l9dTPU+HAxdT2BR3d4/1EDKHrqYDDPQxBl/tM=; b=Jk8Snr1DoJG++ERAKYugO6
        aaXFME+X5MX9QhIJLREJ2pW7nqwUMxQIQg7LntbXg0Ss0epk/QhZOGJONcMFVtXL
        mkim7KXke9HKh/EyVg+X82aRPX2WbcBsQg5hroE031/FUoFN0CJAC3muZSjeqPQz
        DhOAPqfbtN/wk6kSfvPXC7Rub96BdtYvdRb4w/uBT58jETfR8d56N+II1/ohKe8d
        Gj8Ern7g8+J/gdSDhTn84P1y4GpdmkE9NPUMjAb2FWN5Mdnu04QUv/Y29RKy4M10
        +QN+h+dOzVdt/K8fuR4FPcG28W3yPM31SbYZ/z4XKA6SaWC4ltd6AJX2TQ7Vo7JA
        ==
X-ME-Sender: <xms:0xIWYkJZvDI82HA8zZRDLfenvGnJ4tcV9McevrCvvOj4on_e8pDA5g>
    <xme:0xIWYkJpMZ_CK7Lg0JXBavz6QoZCNHxVyMZe6z8L3i1LrCzm-QWevQHY5k6DGUWq1
    81_Wfq28WLvh9_rirM>
X-ME-Received: <xmr:0xIWYkt102iv_-YbxYVL_i8fGpLXBzbjafnm-p5g1guUtaFvm7SsSK5eHASd8BrdVz9QWdjBtGH9NA3C1LJtcbJhxHY0_rzd8pEfJtM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrledtgddvtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:1BIWYha_cQ1-YuOEGGNLS1ZbKaQp6tngby1yfaVWHJEuC8V82HUSmQ>
    <xmx:1BIWYrbkp2N--58Km9mdr88RUm0JY-BX8kyK31KYR6woJHODkW8rug>
    <xmx:1BIWYtCBpnKMrXSpxVPNsCFirLf4zhc8lz-vpyL2DUJeU7WtzNRKXA>
    <xmx:1BIWYv7HrzLLrMhDJiQY0zlqvh4r0vwTYHD0qIsEFzB0yUjvsW6DMw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Feb 2022 05:56:19 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 07/12] clk: Add clk_drop_range
Date:   Wed, 23 Feb 2022 11:55:55 +0100
Message-Id: <20220223105600.1132593-8-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220223105600.1132593-1-maxime@cerno.tech>
References: <20220223105600.1132593-1-maxime@cerno.tech>
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
index 60c206d1bcb0..490d364642b6 100644
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

