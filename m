Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C75A5C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 14:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1578533AbiAYOUJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 09:20:09 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:55975 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1578308AbiAYOSC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 09:18:02 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id ED19A5C00F0;
        Tue, 25 Jan 2022 09:16:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 25 Jan 2022 09:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; bh=9jJdL+0Pu8nsb+wnPfEn4hIk1OxELj
        cduV6lXrgkE4A=; b=k4pmB5ZC2di8mNDo8feM82bbwYs+3DJ6p83Csd53SbRGfS
        qG3MZNh/KnWrkVzpVsAVsC5dN2ZKfVjiw3HLLjCJsCKZFPMunHqlsLvwAvDICuOM
        huZVTE8Fw8qnfWu8+A/nAviNq+iWtTYGViw7U+fuC8VM8AmlYrUwJA0Cx53OG75o
        rdbPAzpjKLj5JtW0jgn5MwQ8lohQ1WgDmA8rX8e/Kgm7w/N7A7TWKhBrDe17zsRU
        qd+YAj0l0bKF/azNfe1mHjixa1exPX3KSUWa/KQxsnsN4hBKk0FLB7UgbRj9IGtG
        sG9CASJ8/ll97Mj7vt4JvQQMGVAMW+C03JBLI5wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9jJdL+
        0Pu8nsb+wnPfEn4hIk1OxELjcduV6lXrgkE4A=; b=ibTexJ3LojxmAutazSej+C
        +W1udJ22GFttZmhRSm2nGpcd5SbR+6gSNv3DwZlUpZIrk0CRK2QLkTMiIF1Vn4M4
        FYxkk8+VNzay2SQERxNfHi8i1Eu/IAqadMGkoCcd/QoyWFQfIOjHUA52fb0qL5Lp
        xaHpOGWvGw0ddiqJBskazePQK2f+WotisDd4L/0UyGXEQcFdE/3uvpnH0+taDRSc
        kaHO5MdBzgTzKCj1CdjhmML2JGkS3+lr4jUV18wOPKarGkFwdMtW7LVg7ESTTDSJ
        +NFSX/EEXlbWcWXcnUeVd8JFgQZn55GjVwuDpkhEP3K/Jym3Xu8gicP50eqea0nQ
        ==
X-ME-Sender: <xms:IwbwYZ99XkgXibyE0Owah0Bw46vkhNrKsHogAsanBTRG5Uyeee_vRw>
    <xme:IwbwYdtyoq1wMVDYJ-FHxeCptul_DDxSmlipplpoWBduPBAJvrRa8CYx_oEbtts1_
    LlnhGkRi0_Oq0E_kHY>
X-ME-Received: <xmr:IwbwYXABoKQEFwktDsUuiYVosIXmx4PGw2Ti94rLo8j77322qzy75dXRUPIrvBaKDe-BIletZEus61f4b6-0QavqW2poqLELaoHTsA8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgdeitdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:IwbwYdeojpGFREli62sGgZXvzFgPpV_ofpMP_OPmAXpewVMzx4j4hQ>
    <xmx:IwbwYePR5nnKolDCSJXOn27wjH0a2drik4TXA07w8k7HOEA0NvdqGw>
    <xmx:IwbwYfnrAyCP7XbD0gnt_YbK12ttkSqQlO-EW0KJUoLmfIY7iwlhVw>
    <xmx:IwbwYddpyniWZybExjUo1dpm1V41DJtPHApLjxIt13YlQ1zZ3LsmDQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 09:16:03 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 05/10] clk: Add clk_drop_range
Date:   Tue, 25 Jan 2022 15:15:44 +0100
Message-Id: <20220125141549.747889-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125141549.747889-1-maxime@cerno.tech>
References: <20220125141549.747889-1-maxime@cerno.tech>
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
 drivers/clk/clk-test.c |  4 ++--
 include/linux/clk.h    | 11 +++++++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-test.c b/drivers/clk/clk-test.c
index cb749515837b..d1ce8879eb97 100644
--- a/drivers/clk/clk-test.c
+++ b/drivers/clk/clk-test.c
@@ -471,7 +471,7 @@ static void clk_range_test_multiple_set_range_rate_maximized(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1);
 
 	KUNIT_ASSERT_EQ(test,
-			clk_set_rate_range(user2, 0, ULONG_MAX),
+			clk_drop_range(user2),
 			0);
 
 	rate = clk_get_rate(clk);
@@ -588,7 +588,7 @@ static void clk_range_test_multiple_set_range_rate_minimized(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_2);
 
 	KUNIT_ASSERT_EQ(test,
-			clk_set_rate_range(user2, 0, ULONG_MAX),
+			clk_drop_range(user2),
 			0);
 
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

