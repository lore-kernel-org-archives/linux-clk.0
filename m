Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3919BC43334
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:25:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbiGKPZS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232257AbiGKPZR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:25:17 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D40252A3
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:25:16 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id A89E55C01B6;
        Mon, 11 Jul 2022 11:25:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1657553115; x=1657639515; bh=3E
        H5v5McC3jEi65SSBa5R6U9TYEoq9N0vbsDoTx8KvQ=; b=l3JDu9eehNy2TNgjHb
        C3XC60xxr9R7exUbbu01kJtb11+c8xRS/uP/gtOBvbBaANRhxTWHFNU8efCi2Mk/
        KA4rxpUAYOZg6DLNyT5i5hfDI2Vd3eSCwlfDUMquaCqV3vkl6pno0J4BR9HsKvsj
        7nrk3KLpfSaE6SWhniaUoYvQ7/Dqj3FhHSbJ7E8cH0caM/AKxBwxFY07cfXkKXL6
        ObjQeqPH3xPl5p/rXQ2EzdzLt+Febjhu3QRRfS1CgS7ABw3jgfZgvymum6W5rHoE
        Sf08k3+JZTWl1uHY/a84iBe3pLYWNiaG4Z8z0VlHuHuoUvuaKGUdfihpv9K9BTaE
        uoFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553115; x=1657639515; bh=3EH5v5McC3jEi
        65SSBa5R6U9TYEoq9N0vbsDoTx8KvQ=; b=FK7biBLTHoDd/XKqtLgeYZBkfNd3A
        yLMR9LfYw9fudyzM9YU9BiJZw0pxAi92Mysos2q+h54SC3BrnxtYJK4JZsl7FipD
        /1IRArNEY1lPpoLQTt09eg993MDEXrMx2CqHwQt/L7fwgzZR80uVsFZXuYhDDRbh
        FGBcT38Uhqrq0dLUUD/YkL2HBBkZXf8LVv/SyFs4khRBSN0T3gCr8YLOXw/tVux4
        WGnDu7NC5/oURW1ZZmY2HzXEEvUhbNKkwIoKGQMZYXkvh6mvQqRWiDh0pKWZ4JDF
        k1yMAvf4EyCHZ5StKr4cqhWL4UZzrnSezryz49tFee//fCJVcByIefjFw==
X-ME-Sender: <xms:20DMYjkWPT2JmPRDnKFU2TAiVyrDVPyhyi364GuhU15vmhF4hTeD-A>
    <xme:20DMYm3IeyfeHG7867ZeK7UorstczP1P2AB5BbPRJ2pAAuhRSVRHvQUj8mlbneHLo
    sLKhUAeXGba1MHK9xQ>
X-ME-Received: <xmr:20DMYpqcokf4bPQ1COJXCGzwWnEZlW-q_mxDVWyrN7Ldy6-MmmndDTK8DAGETzKB9LIJtNs1r-tWzL9cCklvz-at806JnN8yt2GweVo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:20DMYrl1ysd9icAcpN--mHgQyZGPKbhtGg05eEUokUThxkqiJbQXkg>
    <xmx:20DMYh0ayCd3ChBFbdOQgzcBtfnW4bkeSWkA28GemllBCgaCaBoPwA>
    <xmx:20DMYqvIS3Gf-nfIykSzsUwO6PwY4GeoZbLz6AaiyE94SHBW-aIDKQ>
    <xmx:20DMYqttje_6OsoCWOB3QvPkEkuuYKrGyEYD-sIGOmCFoxZG58I47Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:25:15 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 26/28] clk: Introduce the clk_hw_get_rate_range function
Date:   Mon, 11 Jul 2022 17:24:22 +0200
Message-Id: <20220711152424.701311-27-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152424.701311-1-maxime@cerno.tech>
References: <20220711152424.701311-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some clock providers are hand-crafting their clk_rate_request, and need
to figure out the current boundaries of their clk_hw to fill it
properly.

Let's create such a function for clock providers.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c            | 16 ++++++++++++++++
 include/linux/clk-provider.h |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 77601f435f12..5bdfd645f1dc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -683,6 +683,22 @@ static void clk_core_get_boundaries(struct clk_core *core,
 		*max_rate = min(*max_rate, clk_user->max_rate);
 }
 
+/*
+ * clk_hw_get_rate_range() - returns the clock rate range for a hw clk
+ * @hw: the hw clk we want to get the range from
+ * @min_rate: pointer to the variable that will hold the minimum
+ * @max_rate: pointer to the variable that will hold the maximum
+ *
+ * Fills the @min_rate and @max_rate variables with the minimum and
+ * maximum that clock can reach.
+ */
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate)
+{
+	clk_core_get_boundaries(hw->core, min_rate, max_rate);
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_rate_range);
+
 static bool clk_core_check_boundaries(struct clk_core *core,
 				      unsigned long min_rate,
 				      unsigned long max_rate)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0bfebea2a50a..1e38886a2916 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1233,6 +1233,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
 				 struct clk_rate_request *req,
 				 unsigned long flags);
 void clk_hw_reparent(struct clk_hw *hw, struct clk_hw *new_parent);
+void clk_hw_get_rate_range(struct clk_hw *hw, unsigned long *min_rate,
+			   unsigned long *max_rate);
 void clk_hw_set_rate_range(struct clk_hw *hw, unsigned long min_rate,
 			   unsigned long max_rate);
 
-- 
2.36.1

